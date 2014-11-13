Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 81B6960167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 00:24:36 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so2725906wiw.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SFXUCHrEW/SKivrIaR62K3uMZVteMOoGHOYnOrXYdp0=;
	b=L5OWYznP8B+YsZmNevUEVTu6Vnsy+40cJ4DXQpoBgryLheB7jpJAXOms7QTaJn8vg9
	8upnAnYJwmsRFDevi4BJ0LrbMPgwrQfCwaFhOKkYLQW6ImWMbnX4on4iSPNDD2jSMfyl
	ews5nZvUgl8fUnd/aOwZ46l2aFwEa5uOaAGNWkx9lEa1dafyBECkKxRHqZdeJynr9BgL
	E/yyufpveXaq9f+HYeazIBDUG/JCE9X7vgcuvXO+3G43YbRVD0bZa7/o3zARlVMF8N3a
	+Uiiw11lHFJaMbj9d5Xy+afaqDcpjxWBXBcVgL+MSc1GazFfbWBfRpN90CBJ2Dt1SL+V
	A+HQ==
X-Received: by 10.180.23.98 with SMTP id l2mr54028069wif.51.1415838277379;
	Wed, 12 Nov 2014 16:24:37 -0800 (PST)
Received: from mizar.208.67.220.220
	(host66-196-dynamic.45-79-r.retail.telecomitalia.it. [79.45.196.66])
	by mx.google.com with ESMTPSA id f6sm23569337wix.5.2014.11.12.16.24.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 16:24:36 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Nov 2014 01:24:31 +0100
Message-Id: <1415838271-26822-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] klibc: define KLIBCLIBGCC
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
X-List-Received-Date: Thu, 13 Nov 2014 00:24:39 -0000

Fix build of klibc extending the EXTRA_OEMAKE.

|   LIST    usr/klibc/klib.list
|   KLIBCAR usr/klibc/libc.a
|   KLIBCLD usr/klibc/libc.so
| arm-oe-linux-gnueabi-ld: cannot find libgcc.a: No such file or directory
| make[2]: *** [usr/klibc/libc.so] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [all] Error 2
| make: *** [klibc] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index f3e9972..9f445e1 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -24,6 +24,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
                 'KLIBCKERNELSRC=${STAGING_DIR_TARGET}${exec_prefix}' \
+                'KLIBCLIBGCC=${STAGING_DIR_TARGET}${libdir}/${TARGET_SYS}/*/libgcc.a' \
                 'prefix=${exec_prefix}' \
                 'INSTALLROOT=${D}' \
                 'SHLIBDIR=${libdir}' \
-- 
1.9.1


