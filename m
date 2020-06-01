Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.35021.1591012314979677939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=fz0FZlfa;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 933D360144;
	Mon,  1 Jun 2020 13:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591012312;
	bh=9aL64ekrD1Rz1x0AYhy7FTqdAqsmKOZU7rAR2w/7Eko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fz0FZlfaBH3LmLUCkvwMZ33R4Ik0DuunnjLboieENtISahMGTiZdqM9eCCt/Nh+1Y
	 BQBFSjFwNNJrTTeFkr4Q7dKt1EajJ0/fcPhRI+5d+ff3/s7hgmoixi1eFhX22fsxPr
	 /9914dAIrJzzmzgQicE+ge7Hd/Q3g2gHtvhS3YYHbyRZwsdn6+VTTLYjUYjjJKNwoa
	 tCT2W9IamJO6VD95L0DWlOGVW0fFrAbpCE8JF8wtnnVzqp8TuUmdi84q52QqDT+4hj
	 AXMfS5+RfyHLN1dyoxS3cqIpU1brHuNzGVQzKxMD7qruzHf1uGpAoIuTevCK72Ha2i
	 oGnLQrewWoH+A==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] uriparser: upgrade 0.9.3 -> 0.9.4
Date: Mon,  1 Jun 2020 13:51:15 +0200
Message-Id: <1591012275-14454-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>
References: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>

License-Update: copyright years updated

Changelog:

2020-05-31 -- 0.9.4

  * Fixed: testrunner: No longer crashes when compiled with NDEBUG (GitHub #67)
  * Fixed: CMake: Support GTest 1.8.0 (GitHub #68)
      Thanks to Ryan Schmidt for the related report!
  * Fixed: CMake: Use variable GTEST_INCLUDE_DIRS (with plural "S") rather than
      GTEST_INCLUDE_DIR (GitHub #79, #81)
      Thanks to Wouter Beek for the related report!
  * Improved: CMake: Send config summary to stdout, not stderr (GitHub #72)
      Thanks to Scott Donelan for the patch!
  * Improved: Make -DURIPARSER_BUILD_TESTS=OFF unlock compilation without
      a C++ compiler; thanks to Fabrice Fontaine for the patch! (GitHub #69)
  * Added: Functions to make UriUri[AW] instances independent of the original
      URI string (GitHub #77 and #78)
      New functions:
        uriMakeOwner[AW]
        uriMakeOwnerMm[AW]
  * Added: CMake option URIPARSER_ENABLE_INSTALL to toggle installation of
      files, defaults to "ON" (GitHub #74, #75)
      Thanks to Scott Donelan for the patch!
  * Soname: 1:26:0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../uriparser/{uriparser_0.9.3.bb => uriparser_0.9.4.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.3.bb => uriparser_0.9.4.bb} (64%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
similarity index 64%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
index da52bb5..d02cf5d 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
@@ -2,11 +2,10 @@ SUMMARY = "RFC 3986 compliant URI parsing library"
 HOMEPAGE = "https://uriparser.github.io"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fc3bbde670fc6e95392a0e23bf57bda0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "9874b64f6f4ff656f3f69598e38f12b7"
-SRC_URI[sha256sum] = "6cef39d6eaf1a48504ee0264ce85f078758057dafb1edd0a898183b55ff76014"
+SRC_URI[sha256sum] = "095e8a358a9ccbbef9d1f10d40495ca0fcb3d4490a948ba6449b213a66e08ef0"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.7.4

