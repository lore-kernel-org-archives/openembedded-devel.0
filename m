Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URPIs-0000lI-NC
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:57:43 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so1888882eaj.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Yyz8mW9e1OO0TRTrzfM2Tbg0t2BG2kpOJbHwT0TKs/4=;
	b=wDhGzJWZMALwgLb8e2JNrD2/d/+9SVymj30mr7F6fgLz44TjbrXosOoOj8wpyPGc2m
	oQbYe4RMyS/OXxLWak+UbTD18gRPXNNZ0dhxJ7VGcdW8R8tde4dWAIhJ7OWzySOGMYxt
	PY6/rlLjPILDBzJboSWzA4q8Ux7tpylCxzMZVNxVHbJLIYpKf2io9lBTqUIIsof5tCSr
	3yWTPjvQ+Oj2pvjoU7RFNKoNoZ1QWBH+fUYwpRu7O/OI48+IF86dIn1t5Ct9MMnglwK5
	0wBJSz2mVgbvpo4DfL/p4DmgAYYyUKjmTRAAmoGZr4vW6lX9OB68nBtj8pA4fJARNEzB
	vUzg==
X-Received: by 10.14.219.8 with SMTP id l8mr42005323eep.40.1365953991379;
	Sun, 14 Apr 2013 08:39:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bj2sm22147368eeb.1.2013.04.14.08.39.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 08:39:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2013 17:39:54 +0200
Message-Id: <1365953994-5044-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH] busybox: fix upgrade path
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
X-List-Received-Date: Sun, 14 Apr 2013 15:57:46 -0000

 * check_data_file_clashes: Package busybox-syslog wants to install file /lib/systemd/system/busybox-syslog.service
        But that file is already provided by package  * busybox-syslog-systemd
 * check_data_file_clashes: Package busybox-syslog wants to install file /lib/systemd/system/syslog.service
        But that file is already provided by package  * busybox-syslog-systemd
 * check_data_file_clashes: Package busybox-syslog wants to install file /lib/systemd/system/busybox-klogd.service
        But that file is already provided by package  * busybox-syslog-systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
index 1c21104..bdba2db 100644
--- a/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -21,3 +21,7 @@ do_install_append() {
     ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
 }
 FILES_${PN}-syslog += "${systemd_unitdir}/system/syslog.service"
+
+RPROVIDES_${PN}-syslog += "${PN}-syslog-systemd"
+RREPLACES_${PN}-syslog += "${PN}-syslog-systemd"
+RCONFLICTS_${PN}-syslog += "${PN}-syslog-systemd"
-- 
1.8.1.5



