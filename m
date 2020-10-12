Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.41302.1602511236543476442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kRyNP-00026S-75; Mon, 12 Oct 2020 17:00:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-prettytable: Upgrade 1.0.0 -> 1.0.1
Date: Mon, 12 Oct 2020 17:00:21 +0300
Message-Id: <20201012140022.15761-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012140022.15761-1-leon.anavi@konsulko.com>
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.1:

- Add setuptools as a dependency
- Fix string comparison and deprecation warning
- Update release checklist to deploy from GitHub Actions
- Use Release Drafter to draft GH Releases from labelled PRs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-prettytable_1.0.0.bb => python3-prettytable_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_1.0.0.bb => python3-prettytable_1.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
index e5688a3866..a065b6c475 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[md5sum] = "fb31d4c94fef42f2caf9784c44d8ea82"
-SRC_URI[sha256sum] = "98a3b74b1980e6a9392498e3a2a5406f6bd836f412843c2be23d9c88671747ac"
+SRC_URI[md5sum] = "b5bd0acec56ae7ccf5ac22d3f671c3a7"
+SRC_URI[sha256sum] = "6bb7f539903cb031fecb855b615cbcac8cd245ebc6fa51c6e23ab3386db89771"
 
 do_install_append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.17.1

