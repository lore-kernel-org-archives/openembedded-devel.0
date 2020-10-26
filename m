Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11415.1603713080520757598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55378 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kX11x-0007bv-FL; Mon, 26 Oct 2020 13:51:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-luma-core: Upgrade 1.17.2 -> 1.17.3
Date: Mon, 26 Oct 2020 13:50:40 +0200
Message-Id: <20201026115041.11671-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026115041.11671-1-leon.anavi@konsulko.com>
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.17.3:

- Drop support for Python 3.5, only 3.6 or newer is supported now
- Add missing cmdline interfaces: "noop" & "gpio_cs_spi"
- Legacy proportional font wrapper raises user-friendly error
  message when character is not in the font table

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-luma-core_1.17.2.bb => python3-luma-core_1.17.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.2.bb => python3-luma-core_1.17.3.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
index 97786ff456..8301d7f77a 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
@@ -2,12 +2,12 @@ SUMMARY = "A component library to support SBC display drivers"
 DESCRIPTION = "A component library to support SBC display drivers"
 HOMEPAGE = "https://github.com/rm-hull/luma.core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "4e4a5e85ccf19eba001d11d95b33b174"
-SRC_URI[sha256sum] = "d66b98e23470f023a6423273e9632180a1a941849f1417c69a708ca51861c993"
+SRC_URI[md5sum] = "c13303a123c32c1a8dc5bc089a920822"
+SRC_URI[sha256sum] = "1c928ad8e42af5fd395260176f89eb68a8af61911971f94124fabc9c6b550689"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

