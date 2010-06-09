Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMRnA-00017g-HB
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 22:22:32 +0200
Received: by fxm9 with SMTP id 9so4041318fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=56BrofZuYNYh8OB/2kZVAnBryQaO/gwpmBgiVeLmp+4=;
	b=lrt4363Y5ei1s0YxnrC3+TovKLjTbzhbN9ieSLUJg7o+ek07YFLXkhtZ0QV8t0aGga
	ArPaXcRccwH4yhOIKrvJ2dIHulEbHOAVKhyo5bIeLOdT+k3A0mpiT/bNE173P8ZNFIT5
	QdfMQaK7waCwZuHUUCX50C51cFq9ocjjrXej0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nVmOYItqTerOBkNSJ1iHd0gJ7p3Dl1zrTMt9RkIaye3tP/68O8Hn9EyN0rcEbYe7Xp
	vD3bf37ka+Zkc+hgkaTqbJyKYacl9YxSoSGv8zWhoOF+Fz+PZtSKQy+ParqMz7kCEvJc
	i3zGD/WD6eveBznF5vCm+6YwLXNUxItfaalP8=
Received: by 10.223.19.87 with SMTP id z23mr1431444faa.7.1276114686376;
	Wed, 09 Jun 2010 13:18:06 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id 13sm5146722fad.19.2010.06.09.13.18.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 13:18:05 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMRj6-0001jG-Pb; Wed, 09 Jun 2010 22:18:16 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: martin.jansa@gmail.com
Date: Wed,  9 Jun 2010 22:18:13 +0200
Message-Id: <1276114693-6539-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] busybox: drop run-parts.in.usr-bin.patch
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
X-List-Received-Date: Wed, 09 Jun 2010 20:22:32 -0000

revert f1b326c83be0d95571b991d8d2ee239982380b6b

debianutils has /bin/run-parts as busybox does.
Busybox handles run-parts as well as other binaries via
update-alternatives, there is no /usr/bin/run-parts from debianutils
like suggested in f1b326c83be0d95571b991d8d2ee239982380b6b.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../busybox-1.15.3/run-parts.in.usr-bin.patch      |   12 ------------
 .../busybox-1.16.1/run-parts.in.usr-bin.patch      |   12 ------------
 recipes/busybox/busybox_1.15.3.bb                  |    1 -
 recipes/busybox/busybox_1.16.1.bb                  |    1 -
 4 files changed, 0 insertions(+), 26 deletions(-)
 delete mode 100644 recipes/busybox/busybox-1.15.3/run-parts.in.usr-bin.patch
 delete mode 100644 recipes/busybox/busybox-1.16.1/run-parts.in.usr-bin.patch

diff --git a/recipes/busybox/busybox-1.15.3/run-parts.in.usr-bin.patch b/recipes/busybox/busybox-1.15.3/run-parts.in.usr-bin.patch
deleted file mode 100644
index 6f209ce..0000000
--- a/recipes/busybox/busybox-1.15.3/run-parts.in.usr-bin.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr busybox-1.15.3.orig//include/applets.h busybox-1.15.3/include/applets.h
---- busybox-1.15.3.orig//include/applets.h	2009-12-12 22:13:28.000000000 +0100
-+++ busybox-1.15.3/include/applets.h	2010-04-30 15:35:40.000000000 +0200
-@@ -323,7 +323,7 @@
- IF_RPM(APPLET(rpm, _BB_DIR_BIN, _BB_SUID_DROP))
- IF_RPM2CPIO(APPLET(rpm2cpio, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RTCWAKE(APPLET(rtcwake, _BB_DIR_USR_BIN, _BB_SUID_DROP))
--IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_BIN, _BB_SUID_DROP, run_parts))
-+IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_USR_BIN, _BB_SUID_DROP, run_parts))
- IF_RUNCON(APPLET(runcon, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RUNLEVEL(APPLET(runlevel, _BB_DIR_SBIN, _BB_SUID_DROP))
- IF_RUNSV(APPLET(runsv, _BB_DIR_USR_BIN, _BB_SUID_DROP))
diff --git a/recipes/busybox/busybox-1.16.1/run-parts.in.usr-bin.patch b/recipes/busybox/busybox-1.16.1/run-parts.in.usr-bin.patch
deleted file mode 100644
index 6f209ce..0000000
--- a/recipes/busybox/busybox-1.16.1/run-parts.in.usr-bin.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr busybox-1.15.3.orig//include/applets.h busybox-1.15.3/include/applets.h
---- busybox-1.15.3.orig//include/applets.h	2009-12-12 22:13:28.000000000 +0100
-+++ busybox-1.15.3/include/applets.h	2010-04-30 15:35:40.000000000 +0200
-@@ -323,7 +323,7 @@
- IF_RPM(APPLET(rpm, _BB_DIR_BIN, _BB_SUID_DROP))
- IF_RPM2CPIO(APPLET(rpm2cpio, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RTCWAKE(APPLET(rtcwake, _BB_DIR_USR_BIN, _BB_SUID_DROP))
--IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_BIN, _BB_SUID_DROP, run_parts))
-+IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_USR_BIN, _BB_SUID_DROP, run_parts))
- IF_RUNCON(APPLET(runcon, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RUNLEVEL(APPLET(runlevel, _BB_DIR_SBIN, _BB_SUID_DROP))
- IF_RUNSV(APPLET(runsv, _BB_DIR_USR_BIN, _BB_SUID_DROP))
diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
index 07103e8..9698f99 100644
--- a/recipes/busybox/busybox_1.15.3.bb
+++ b/recipes/busybox/busybox_1.15.3.bb
@@ -10,7 +10,6 @@ SRC_URI = "\
   file://get_header_tar.patch \
   file://busybox-appletlib-dependency.patch \
   file://0000-wget-no-check-certificate.patch \
-  file://run-parts.in.usr-bin.patch \
   file://find-touchscreen.sh \
   file://busybox-cron \
   file://busybox-httpd \
diff --git a/recipes/busybox/busybox_1.16.1.bb b/recipes/busybox/busybox_1.16.1.bb
index 6013afd..28940a2 100644
--- a/recipes/busybox/busybox_1.16.1.bb
+++ b/recipes/busybox/busybox_1.16.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "\
   file://get_header_tar.patch \
   file://busybox-appletlib-dependency.patch \
 #  file://0000-wget-no-check-certificate.patch \
-  file://run-parts.in.usr-bin.patch \
   file://find-touchscreen.sh \
   file://busybox-cron \
   file://busybox-httpd \
-- 
1.7.1



