Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14354.1592822176536968478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJoD-0005ty-Ll; Mon, 22 Jun 2020 13:36:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-pyperf: Upgrade 1.7.1 -> 2.0.0
Date: Mon, 22 Jun 2020 13:35:39 +0300
Message-Id: <20200622103542.27830-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- Drop Python 2 support
- Fix test_runner on PyPy3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperf_1.7.1.bb => python3-pyperf_2.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_1.7.1.bb => python3-pyperf_2.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
index 081e904e1..7ced7d017 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
@@ -13,8 +13,8 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[md5sum] = "d9e894dc843bb7f0abff109931a29895"
-SRC_URI[sha256sum] = "c37690e810116a83a244dfeec47885e2f0475b4c450313904be3bc2cdaf6d50a"
+SRC_URI[md5sum] = "7f62d3f6fc5475138791d3d883fdf4cd"
+SRC_URI[sha256sum] = "2189fbc4af08d519f85468e70e32c902eab0f1341b2c41028b94b2832d3169a7"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.17.1

