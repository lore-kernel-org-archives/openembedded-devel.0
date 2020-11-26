Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.3618.1606389756774275163
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFMB-0005Yd-Ej; Thu, 26 Nov 2020 13:22:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-prettytable: Upgrade 1.0.1 -> 2.0.0
Date: Thu, 26 Nov 2020 13:22:13 +0200
Message-Id: <20201126112215.11451-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
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

- Add tbody and thead tags
- Add add_rows to add several rows at once
- Add Python 3.10-dev to CI Tests
- Stop testing on Travis CI due to new open-source limitations
- Move to src/ and tests/ layout
- Drop support for EOL Python 2.7 and 3.5
- Fix padding_width = 0
- Don't create universal wheel for Python 2 (and 3)
- Fix docs to match code: from_cursor -> from_db_cursor
- readme: update function name in example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-prettytable_1.0.1.bb => python3-prettytable_2.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_1.0.1.bb => python3-prettytable_2.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
index 79341b9d29..3563bfa113 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[md5sum] = "b5bd0acec56ae7ccf5ac22d3f671c3a7"
-SRC_URI[sha256sum] = "6bb7f539903cb031fecb855b615cbcac8cd245ebc6fa51c6e23ab3386db89771"
+SRC_URI[sha256sum] = "e37acd91976fe6119172771520e58d1742c8479703489321dc1d9c85e7259922"
 
 do_install_append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -36,5 +35,5 @@ RDEPENDS_${PN}-ptest += " \
 "
 
 do_install_ptest() {
-	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
+	cp -f ${S}/tests/test_prettytable.py ${D}${PTEST_PATH}/
 }
-- 
2.17.1

