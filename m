Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.40625.1589803824020044472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 05:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=efq7vOLZ;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=l5hx=7a=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49QdBQ18Grz2f
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 14:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589803822;
	bh=7IJCHfp6sGMsNSaOk+x1xZYknsPfyGhPY0UaeAPajew=;
	h=From:To:Subject:Date:From;
	b=efq7vOLZzjQLHMsdHJ9G7zfuXPXg5N4+UHNj6ZnF2dDmSrsjrquDCLdQjezqDX+ZO
	 ZzYYYkqqtM8/OJfvGPxb6Ech95ml7hR9vQ440nfOXwg02hETLfDlwNkmblj6UO7CS5
	 NMIOaMOoQGajPJYvbgNdnA2KedV1FL32AuRpp/lAC2uCCGnRpR99rzdbq0wPRnmMyf
	 sBx+ZHrR9U0fz8BRsqn6AktcCX0zkL8k9YNktGUy6X+YAdNTn6an2FwqPSqgG8L2Fh
	 FcvDh5VAWoMFggnLVUApnbRP3Wu1Uz5xhyjEowFZtu18yTyKtvi0v1AAqKEJAcCFvj
	 DuEYbsnkwPGoDD1f1qscE4w9nBCMW/GT2NZTWnXAAxqEZ1gHN+Z92fDR46utoAwc3g
	 VgUjJc/qaGZRJnAZ+5VdHyEh9Jzqia6IMo88KGXJR9kVUKMQXXFfjZ9+9jEnpIAbhV
	 HtZZYwTYk05pE/+OaiBV3Ti2DOuT26n8HMBQaYqjh6olzxYJ03rJFD8UkSq3F4GLWK
	 68rUgjWC5m8SLaBH86tXKqKFBbBJCpMbv+BpBbkhrbn7/T1y3Owi7JDP3xFL56g6YE
	 bhrFTou7k/u3XOTTCS391r/lOy1RpMQ/NooJd5k1vW0w7P+nLsr1Qx0ua2xT9ul8p8
	 WW1WNXEuvMeiPilzJoquF4Ak=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] unicode-ucd: Remove pointless license check
Date: Mon, 18 May 2020 15:10:21 +0300
Message-Id: <20200518121021.11057-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismatch for local file /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html
Cleaning and trying again.
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html to /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html_bad-checksum_e9dd7d435db23241be3be21b5fca729b5cf883c8c039a70ea093031420d06abb
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum failure encountered with download of https://www.unicode.org/license.html;name=license;subdir=unicode-ucd-12.1.0;downloadfilename=unicode.org.license.html - will attempt other sources if available

This downloaded a license file from upstream.
The upstream file did not match (copyright year changed).
A stale copy was downloaded from a mirror instead and checked.
The stale file with known contents never changes.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
index 89ab565ce..dc1251777 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
@@ -1,18 +1,15 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://unicode.org.license.html;beginline=42;endline=85;md5=67619d0c52706853c0256514e7fd04cd"
+
+ERROR_QA_remove = "license-checksum"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd \
-    https://www.unicode.org/license.html;name=license;subdir=${BP};downloadfilename=unicode.org.license.html \
 "
 SRC_URI[ucd.md5sum] = "430cbdac2615451571dd69a976dd08f6"
 SRC_URI[ucd.sha256sum] = "25ba51a0d4c6fa41047b7a5e5733068d4a734588f055f61e85f450097834a0a6"
 
-SRC_URI[license.md5sum] = "f03bafb623258f85ff2032c1ce567b7c"
-SRC_URI[license.sha256sum] = "983225207de8a707d0903a8d70fb7a4b28c5e0f64f2366e84a6192a2d618fed4"
-
 inherit allarch
 
 do_configure[noexec] = "1"
-- 
2.17.1

