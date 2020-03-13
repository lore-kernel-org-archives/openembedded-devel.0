Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBD161CCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:58:02 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id D10F260323;
	Fri, 13 Mar 2020 19:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584125883;
	bh=zOLnYlDBJuM26cwLTuGQLPwD3QCzU4SV0SDcJ8FqUGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PCA9DJULzDnxoCE3+BqYvmlBSOR4lRQkmmVGYoQ84kZPOAt0zd2lnIW57cpENc7Rd
	mdcOLQ31mG/Npqq+XOS6lPVnX/SCWbSq/pKY+lQcX4H2LCz05Tce1dCQ3IXaDeaCkz
	E9IRh/yfJhRt4vH2NGhZ1z1R9ZBOG89RipTJ5B7B/SSw++Ow3UfYqSh/FagjNsn2tu
	8jgou04VnIhr23CeZqQJ6S0VQ1B596yGxiTsXt9mfSnhJ4cOfrx2mqoV0lWj+KH1ia
	NL3771pjV+oYf/uR7GtYEQTp7YlsNfucjxvamIHvbEsFuFT7RyXgSyOULqJPHdve11
	XhraS/N3egOwQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2020 19:57:49 +0100
Message-Id: <1584125871-11210-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
References: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] python3-kconfiglib: upgrade 13.7.0 -> 14.1.0
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
X-List-Received-Date: Fri, 13 Mar 2020 18:58:02 -0000

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-kconfiglib.inc             | 4 ++--
 .../{python3-kconfiglib_13.7.0.bb => python3-kconfiglib_14.1.0.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kconfiglib_13.7.0.bb => python3-kconfiglib_14.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-kconfiglib.inc b/meta-python/recipes-devtools/python/python-kconfiglib.inc
index c82b26b..3dc4961 100644
--- a/meta-python/recipes-devtools/python/python-kconfiglib.inc
+++ b/meta-python/recipes-devtools/python/python-kconfiglib.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
 
-SRC_URI[md5sum] = "7879aa13d306263e95146439d3959f23"
-SRC_URI[sha256sum] = "8dbb946d41a33cec2b63432393a4920479c8c9fa8d5bbca468c4e8a673be6e36"
+SRC_URI[md5sum] = "4ad68618824d4bad1d1de1d7eb838bba"
+SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_13.7.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-kconfiglib_13.7.0.bb
rename to meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
-- 
2.7.4


