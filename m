Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 003677C377
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 13:13:49 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1D84C218D9;
	Fri, 25 Jan 2019 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548421547;
	bh=R+PGcHNmy/IdYpbZOLabTzch+Vlwg/b9RKNZtB6mzeQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vyLF8jSJwE/6wmXQpOz/RVH245Zax0syM/Ee2NfVr7iYsbMvWazce5zGaiMvUUr/L
	or5lmFZVTNNqi41rmu768aDD5HvHtwaakEvH2wiSoK6X+mQ7Q0JvMC79x2K0OKVAG5
	wyI/LB6IumfomhwPR4xFxmhTYlvD5amYkouNpsvw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2019 14:05:16 +0100
Message-Id: <1548421517-28338-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] libkcapi: Fix missing bash (for apps) and unneeded checksums (for testapp) when building
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
X-List-Received-Date: Fri, 25 Jan 2019 13:13:50 -0000

Fix build failures:
1. with "apps" PACKAGECONFIG:

    ERROR: libkcapi-1.1.3+gitAUTOINC+1c736c43eb-r0 do_package:
    QA Issue: libkcapi: Files/directories were installed but not shipped in any package:
      /usr/bin/.sha1hmac.hmac
      /usr/lib/.libkcapi.so.1.1.3.hmac

2. with "testapp" PACKAGECONFIG:

    ERROR: libkcapi-1.1.3+gitAUTOINC+1c736c43eb-r0 do_package_qa:
    QA Issue: /usr/libexec/libkcapi/test.sh contained in package libkcapi requires /bin/bash,
    but no providers found in RDEPENDS_libkcapi? [file-rdeps]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
index a93ddc823740..f70f774bf2d6 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -16,13 +16,17 @@ SRC_URI = " \
 inherit autotools
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,"
+PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,bash"
 PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
 
 do_install_append() {
     # bindir contains testapp and apps.  However it is always created, even
     # when no binaries are installed (empty bin_PROGRAMS in Makefile.am),
     rmdir --ignore-fail-on-non-empty ${D}${bindir}
+
+    # Remove the generated binary checksum files
+    rm -f ${D}${bindir}/.*.hmac
+    rm -f ${D}${libdir}/.*.hmac
 }
 
 CPPFLAGS_append_libc-musl_toolchain-clang = " -Wno-error=sign-compare"
-- 
2.7.4


