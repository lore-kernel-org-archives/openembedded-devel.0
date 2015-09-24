Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5F95A73BB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 13:04:43 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so248985025wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=e+ng2rLiQ8isvfThC/wKk38+WrFnTWG3p4pSa3BFt1U=;
	b=fxoTMcSoPMJ7Erdi7pVet377Sznc3ehxnVBaByuf9cHXb/3NoSo3fNOk62tXFXESr9
	OYLdHLqRP+ScGLIkV5jlLaXDYphoW4138FjkJK3nPwXaGP9uPUrFZ2vYseYj6BgygBQD
	TcsY/794oFlb0noyOuRtwoQ2TMFBNgb4n8DuGK7CY1U6QY8WFekGCbz8LowXSnVHFj7A
	f+Qpqbtoyiiii+Hhvs7Ttd+KM9eYb7QDTDkyouhwgcVRHMUkz938WjMVB2oE3PAoMLmd
	Y2laT8zdkAwUV1aN3e+zmoV6Kd5OYDCwxHLFy98Dp/mZNj1q3kYJvs+syL9GwOJRzPr4
	vdrA==
X-Received: by 10.194.52.6 with SMTP id p6mr47913912wjo.119.1443099883897;
	Thu, 24 Sep 2015 06:04:43 -0700 (PDT)
Received: from razilix.corp.ad.wrs.com ([128.224.251.2])
	by smtp.googlemail.com with ESMTPSA id
	fz1sm13590253wic.8.2015.09.24.06.04.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 06:04:43 -0700 (PDT)
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Sep 2015 15:01:27 +0200
Message-Id: <1443099687-18299-1-git-send-email-andrei.kholodnyi@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] lvm2: add --with-systemdsystemunitdir in configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 13:04:45 -0000

Otherwise sed command for blk-availability.service may fail.
It will look for the service file in a wrong location
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index cc70246..cd7f6fd 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF = "--with-user= \
                 --enable-lvmetad \
                 --with-udev-prefix= \
                 --with-usrlibdir=${libdir} \
+                --with-systemdsystemunitdir=${systemd_system_unitdir} \
 "
 
 PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
@@ -41,7 +42,7 @@ do_install_append() {
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         oe_runmake 'DESTDIR=${D}' install install_systemd_units
-        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
+        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_system_unitdir}/blk-availability.service
     else
         oe_runmake 'DESTDIR=${D}' install install_initscripts
         mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
-- 
2.1.4


