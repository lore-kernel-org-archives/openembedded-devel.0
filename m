Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygj-0001yy-JO
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so7273998dak.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HWkTiIafnQRUjESqb+2PIazCKgKQD9etatb5bItWgyE=;
	b=E1LSpi8+pKlK+7oVxWNnJmYjNBZRazmUFvYTrPbNbC3CowymYXkeZgIcsCdasgjA6q
	6hm/oSy9DctNibr+CoEqcbQ38rOmYUGkhAX/r+TlSDArOQRB5gXRGv42dLch1sValK7h
	PVnpctVaq4plgLGfLIub5dn55LQH9MpeDC2es15ZdOZIL7NV7zgoJ3wpDYrOs6Rf4Gsd
	kCfzu19RYM746+bxX60Ga071R+jIJUQlYNZg+l2DVgB9dlyT4u8Jxr3jkmtwqitaIjZt
	wt1FfGPT/1FRfvTm9b5XfhV91mQIqlSTUUGdOQx4b/bjzezsKOtP8V6IyNTbAMFIYF0K
	0Qmg==
X-Received: by 10.68.143.100 with SMTP id sd4mr150319051pbb.107.1357272016406; 
	Thu, 03 Jan 2013 20:00:16 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:25 -0800
Message-Id: <1357271974-3317-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 03/13] at: Add systemd unit file
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
X-List-Received-Date: Fri, 04 Jan 2013 04:15:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-oe/recipes-extended/at/at/atd.service     |    9 +++++++++
 .../meta-oe/recipes-extended/at/at_3.1.13.bbappend |   12 ++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/at/at/atd.service
 create mode 100644 meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend

diff --git a/meta-systemd/meta-oe/recipes-extended/at/at/atd.service b/meta-systemd/meta-oe/recipes-extended/at/at/atd.service
new file mode 100644
index 0000000..64a9015
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/at/at/atd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Job spooling tools
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/atd -f
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
new file mode 100644
index 0000000..d80cfff
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
@@ -0,0 +1,12 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://atd.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "atd.service"
+
-- 
1.7.9.5



