Return-Path: <joe@deserted.net>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEDF6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:16 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id b123so4557609itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fxSZhUUcYL5NjmHZuY9yIWkTe0QK/e/41CBABL4IY44=;
	b=mHUQ2Fhl9VfgwXIbY3IMx0NgRd6TJPguaJ7219FocGGfuDTjmbGVCcsJggCQR4WbwH
	tQpZv77+zmpox88pYwgwAbR6CTeyEu8U4CVGlK6+bdBnyAGek++r0pxpr+7McR70Eu7A
	1qff1Tbia5GH3tjFigvujNPeG2f5gmJqxSUoSEYWZGx6BUWZ3bA5m5i4rEZFt5Q3aRKF
	B9exMg9LC+KvR6G+X9a3tUyOfgUPotfSBf6cmBtHGP7NbQ9hovUSEBeBDPD+YymiBvyZ
	hY//NS130AQwZFRSrOcB6W6mmGC1KgqM8/hGY+YckU6zP8v8DQ0cy7OPNddjJBZIKG1i
	yQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=fxSZhUUcYL5NjmHZuY9yIWkTe0QK/e/41CBABL4IY44=;
	b=BAY3+sEE7EEkcOANaOZs8VjBUsaWDQIqlG4YCYAMc5WhX8HMp+pedznCKLWIAsCa4i
	x97nHwojV9UVimalOhHdrScH7zFFm80erAYA5PxhocbR3eltjqahW7/YmNlkPYIATmGf
	6W/iCWlrYsQ57orjXzZrO7QoGnUOCPVjVOQ3+pPu+nmZplyg9fWjuxIhMJ5jAAvZh17h
	ISXNHrNmVONs02bTtrr/5fy6ihBKXo1j0hhX8hVBhhKVBftQy0L0/ceHoJRpU+5QdgeQ
	QgcurcGXzFjAtgsUBe3pt0TIbRTginivTA+l7zZjly2eQ9DLEB/AQszloL74E16FlMld
	/9Ew==
X-Gm-Message-State: AKaTC02q1rgWHumF1eTnKREbNB66r/XEeRsgZbanrCJiudVvVnKa0MgdxrL+vh2tc8etlA==
X-Received: by 10.36.67.14 with SMTP id s14mr5978341itb.87.1481940917776;
	Fri, 16 Dec 2016 18:15:17 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:17 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:13 -0500
Message-Id: <1481940923-12914-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 01/11] samba: rename initscript from 'samba.sh' to more common 'samba'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 02:15:16 -0000

From: Andreas Oberritter <obi@opendreambox.org>

This gets masked automatically by samba.service if systemd is running.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 6d62481..783a7cd 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -41,7 +41,7 @@ LDFLAGS_append_libc-musl = " -ltirpc"
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
 
-INITSCRIPT_NAME = "samba.sh"
+INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
@@ -109,16 +109,16 @@ do_install_append() {
             >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
     elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
+        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
     elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba.sh
+        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
         sed -e 's,/opt/samba/bin,${sbindir},g' \
             -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
             -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
-            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
+            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
             -e 's,/usr/bin,${base_bindir},g' \
-            -i ${D}${sysconfdir}/init.d/samba.sh
+            -i ${D}${sysconfdir}/init.d/samba
     fi
 
     install -d ${D}${sysconfdir}/samba
-- 
1.9.1


