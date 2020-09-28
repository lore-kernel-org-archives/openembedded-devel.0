Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.31557.1601280094309062892
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40866 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kMo6G-0001Xq-D5; Mon, 28 Sep 2020 11:01:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-luma-core: Upgrade 1.16.2 -> 1.17.1
Date: Mon, 28 Sep 2020 11:00:58 +0300
Message-Id: <20200928080059.18929-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928080059.18929-1-leon.anavi@konsulko.com>
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.17.1:

- Add cmdline opt: "pcf8574" and "bitbang_6800" interfaces
- Added --inverse option for ST7735 to cmdline opt
- Allow SPI interface to define reset duration
- Change bitmap_font to be compatible with Pillow < 7.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.16.2.bb => python3-luma-core_1.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.2.bb => python3-luma-core_1.17.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
index e8a61ad062..9246d1b3a6 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "8889ee9eb95c3441ee65b4b5f4a022eb"
-SRC_URI[sha256sum] = "518fe4e3286a4e2a75788713a58de403e6bba6d4c909fa5ce0fe14aceb05b85e"
+SRC_URI[md5sum] = "dea76a83c7130f59b7e807c3b2f1b3b5"
+SRC_URI[sha256sum] = "b4a9f934f4dbf9b1d5c74259f871b4187aaa754b139964153f7702badaaccffd"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

