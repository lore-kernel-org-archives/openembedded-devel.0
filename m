Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D16A7E53D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:36:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9ajnY000966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:36:45 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:36:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:41 +0800
Message-ID: <10fa582ff48102bdf3380916207f636daa0f4c69.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] spice: Drop broken native
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
X-List-Received-Date: Wed, 25 Sep 2019 09:36:44 -0000
Content-Type: text/plain

$ bitbake spice-native
checking whether the C compiler works... no
configure: error: in `/path/to/spice-native/0.14.2+gitAUTOINC+7cbd70b931_4fc4c2db36-r0/build':
configure: error: C compiler cannot create executables

It's a broken native recipe which means no ones need it any more, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 552f81d..30e939a 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -39,7 +39,6 @@ export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
 CFLAGS_append = " -Wno-error=address-of-packed-member"
 
-PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
 
@@ -54,6 +53,6 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "nativesdk"
 
 EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
-- 
2.7.4


