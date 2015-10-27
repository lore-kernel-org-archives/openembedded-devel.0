Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id A836D75CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:42:20 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so160127205wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iUhQYnkBBf6WZasRm4II46gCFrn81jZXsNXTxBtTruE=;
	b=ylrYZals9XAsEVbf0b1I5HPYSBPI9nDI+B74vE9BZUML0Cbvl5RSQ0SMDazdSBvS4I
	l+3BFkdj5qlzN6NMreCn1+35SYvTyXM5SS1eAaUYS3B8GcEi6GGoRnb7+IV0CBIGClxe
	uumLrIJGE0SP1xgmLp78rEpGkdjgUMUBP4c25JB6z2fBADvJSv4uJZUH3hTGfD0XWwxF
	pt9BiBjNHC+yTYisQZAOTU0+b9Cb6V2Bnxj2B1njLsacoMhdjqaberPA9J/zJQfBvGz8
	5eFs8YDGY3QJeGPqmMuZS0j/ZcxeVR/8sMAu8et/dF0JTp0hWkn+evq2UjOpvr4s83y7
	SY0Q==
X-Received: by 10.194.179.33 with SMTP id dd1mr30965816wjc.79.1445953340469;
	Tue, 27 Oct 2015 06:42:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nd9sm17812181wic.0.2015.10.27.06.42.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 06:42:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Oct 2015 14:42:35 +0100
Message-Id: <1445953355-13823-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-oe] konkretcmpi: depend on swig-native
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
X-List-Received-Date: Tue, 27 Oct 2015 13:42:25 -0000

* otherwise it fails with:
  | CMake Error at sysroots/x86_64-linux/usr/share/cmake-3.3/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
  |   Could NOT find SWIG (missing: SWIG_EXECUTABLE SWIG_DIR)
* drop cmake-native, because it's already added by cmake.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index 5d016e7..1d8b0db 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -6,7 +6,7 @@ implementations for many of the provider operations."
 HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
-DEPENDS = "swig sblim-cmpi-devel python cmake-native"
+DEPENDS = "swig-native sblim-cmpi-devel python"
 
 SRC_URI = "git://github.com/rnovacek/konkretcmpi.git \
            file://konkretcmpi-0.9.2-fix-returning-instance-from-method.patch \
-- 
2.6.2


