Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RiGaz-0006vD-9e
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 03:28:53 +0100
Received: by iakh37 with SMTP id h37so27928564iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2012 18:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=PKs8qojshcJxFRsoJresz7nyttnxm278JK4Kx6qTbMM=;
	b=IW3fKbCtPsh5kc4FmsENbcaOLGsx3JmPArBOwsh5/9FIs98kwELFoo9ObLD+UkDvUU
	QwVIm5JspFX3NdHJJNN7RrYmUFxOpxGN+MMO9rzSuq9HmYHSCaFMNKe6Cj73dFjQtKrh
	LP2TrTfCZ3J27JTZmKLOICF6ht3ZAujo8cbBw=
Received: by 10.50.34.233 with SMTP id c9mr52633113igj.19.1325643686858;
	Tue, 03 Jan 2012 18:21:26 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id j3sm183632174ibj.1.2012.01.03.18.21.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 18:21:25 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2012 20:21:05 -0600
Message-Id: <1325643665-5111-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [meta-oe] ntp: correct systemd EnvironmentFile, add ntpdate service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 02:28:53 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Eliminate EnvironmentFile from systemd unit descriptions.  /etc/ntp.conf
can't be sourced to set environment variables like NTPD_ARG.  Following the
rationale at http://0pointer.de/blog/projects/on-etc-sysinit.html it isn't
needed anyway; if you don't buy that, it should be:

  EnvironmentFile=-/etc/default/ntpd

Add one-shot ntpdate service which synchronizes local clock prior to
starting ntpd (which aborts if the local time is more than 1000 seconds off
of the server).  "systemctl enable ntpdate.service" not done by default
because this would be a behavior change.

Correct comment describing how to replace ntpdate (ntpdc doesn't take those
arguments).

Add comment to ntp.conf pointing out need to remove local hardware clock as
a reference when simulating ntpdate.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 meta-oe/recipes-support/ntp/files/ntp.conf        |    1 +
 meta-oe/recipes-support/ntp/files/ntpd.service    |    3 +--
 meta-oe/recipes-support/ntp/files/ntpdate.service |   11 +++++++++++
 meta-oe/recipes-support/ntp/ntp.inc               |    3 ++-
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb        |    4 +++-
 5 files changed, 18 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/ntp/files/ntpdate.service

diff --git a/meta-oe/recipes-support/ntp/files/ntp.conf b/meta-oe/recipes-support/ntp/files/ntp.conf
index 5964828..bf52440 100644
--- a/meta-oe/recipes-support/ntp/files/ntp.conf
+++ b/meta-oe/recipes-support/ntp/files/ntp.conf
@@ -7,6 +7,7 @@ driftfile /etc/ntp.drift
 # as required, or change this.
 server pool.ntp.org
 # Using local hardware clock as fallback
+# Disable this when using ntpd -q -g -x as ntpdate or it will sync to itself
 server 127.127.1.0
 fudge 127.127.1.0 stratum 14
 # Defining a default security setting
diff --git a/meta-oe/recipes-support/ntp/files/ntpd.service b/meta-oe/recipes-support/ntp/files/ntpd.service
index 420a056..bd87b1e 100644
--- a/meta-oe/recipes-support/ntp/files/ntpd.service
+++ b/meta-oe/recipes-support/ntp/files/ntpd.service
@@ -5,8 +5,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
-EnvironmentFile=/etc/ntp.conf
-ExecStart=/usr/bin/ntpd $NTPD_ARGS -p /run/ntpd.pid
+ExecStart=/usr/bin/ntpd -p /run/ntpd.pid
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/ntp/files/ntpdate.service b/meta-oe/recipes-support/ntp/files/ntpdate.service
new file mode 100644
index 0000000..b2bc632
--- /dev/null
+++ b/meta-oe/recipes-support/ntp/files/ntpdate.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Network Time Service (one-shot ntpdate mode)
+Before=ntpd.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/ntpd -q -g -x
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/ntp/ntp.inc b/meta-oe/recipes-support/ntp/ntp.inc
index b398b80..1d740f0 100644
--- a/meta-oe/recipes-support/ntp/ntp.inc
+++ b/meta-oe/recipes-support/ntp/ntp.inc
@@ -28,7 +28,8 @@ EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
 PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
-# NOTE: you don't need ntpdate, use "ntpdc -q -g -x"
+# NOTE: you don't need ntpdate, use "ntpd -q -g -x"
+# or the ntpdate systemd service
 
 # This should use rc.update
 FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index e2bb1a8..063d82a 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -1,6 +1,6 @@
 require ntp.inc
 
-PR = "r3"
+PR = "r4"
 
 inherit systemd
 
@@ -13,6 +13,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
         file://ntpd \
         file://ntp.conf \
         file://ntpdate \
+        file://ntpdate.service \
         file://ntpd.service \
 "
 
@@ -29,6 +30,7 @@ do_install_append() {
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
 
 	install -d ${D}${base_libdir}/systemd/system
+	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${base_libdir}/systemd/system/
 	install -m 0644 ${WORKDIR}/ntpd.service ${D}${base_libdir}/systemd/system/
 }
 
-- 
1.7.6.4



