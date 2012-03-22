Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAnd1-0004uf-4b
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 20:24:57 +0100
Received: by wera1 with SMTP id a1so2133095wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=0UJH7iAjhpPh6aKvaqUda4JRzSQsP5GFsgeSEHLPLIU=;
	b=Xv1WdxLjRG8wkR+6jDLX5xd90MbwTeqXHwXdutJfeY+hvosEnZaVfJzCgknnCjbMa2
	sfmpsjyXTlXHOM4JzBZQgDsCw/3uPSvCEg1/ExPxHY7tZWYbxwnWxO+UG6/s2+jIqEF8
	NBikJj/pYMoJd49O2kTC2qJ02aJl5tFB2eSktmDRccBtAbo/KZR30vFD8gSbBG1FvA5G
	CPDbecEfNP6JE/PDDc1SlMyvsUCSZbewLX3HqTpgU3kX5/IbeGcfF4q+sC5uQBUk1k8g
	alYBKDDCRuySr3x5Z3w38BPU0R+dIk36jlzH0sn3v4zkACimDOw/1aCnLQk4AUVj5f4e
	sXGA==
Received: by 10.180.96.168 with SMTP id dt8mr76687wib.18.1332443760091;
	Thu, 22 Mar 2012 12:16:00 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id gp8sm7409368wib.5.2012.03.22.12.15.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:15:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:16:00 +0100
Message-Id: <1332443760-24331-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] gtk-update-icon-cache-runonce.bbappend: make it run properly with systemd / add native support
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
X-List-Received-Date: Thu, 22 Mar 2012 19:24:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../gtk+/gtk-update-icon-cache-runonce.bbappend    |   27 ++++++++++++++++++++
 .../gtk-update-icon-cache-runonce.service.in       |   17 ++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bbappend
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.service.in

diff --git a/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bbappend b/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bbappend
new file mode 100644
index 0000000..43a1fd6
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bbappend
@@ -0,0 +1,27 @@
+# look for files in the layer first
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC = "1"
+
+SRC_URI += "file://gtk-update-icon-cache-runonce.service.in"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system/basic.target.wants
+	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	sed -e 's,@sysconfdir@,${sysconfdir},g' \
+	     < ${WORKDIR}/gtk-update-icon-cache-runonce.service.in \
+	     > ${D}${systemd_unitdir}/system/gtk-update-icon-cache-runonce.service
+
+	ln -sf ../gtk-update-icon-cache-runonce.service ${D}${systemd_unitdir}/system/basic.target.wants/
+	ln -sf ../gtk-update-icon-cache-runonce.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	echo "# remove all service traces to avoid confusing log at subsequent boots
+rm -f ${systemd_unitdir}/system/basic.target.wants/gtk-update-icon-cache-runonce.service
+rm -f ${systemd_unitdir}/system/sysinit.target.wants/gtk-update-icon-cache-runonce.service
+rm -f ${systemd_unitdir}/system/gtk-update-icon-cache-runonce.service" \
+	>> ${D}${sysconfdir}/init.d/gtk-update-icon-cache-runonce
+}
+
+FILES_${PN} += "${systemd_unitdir}/system"
+
+# native recipes inherit gtk-icon-cache which recommends me as native
+BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.service.in b/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.service.in
new file mode 100644
index 0000000..b131609
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.service.in
@@ -0,0 +1,17 @@
+[Unit]
+Description=gtk-update-icon-cache
+DefaultDependencies=no
+ConditionPathExists=|@sysconfdir@/init.d/gtk-update-icon-cache-runonce
+After=run-postinsts.service
+Before=sysinit.target
+
+[Service]
+ExecStart=@sysconfdir@/init.d/gtk-update-icon-cache-runonce
+RemainAfterExit=No
+Type=oneshot
+StandardOutput=syslog
+TimeoutSec=0
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
-- 
1.7.6.5



