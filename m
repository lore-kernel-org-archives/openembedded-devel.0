Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.46132.1597070612138974581
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591P-0008Tw-4F; Mon, 10 Aug 2020 17:43:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-wtforms: Upgrade 2.3.1 -> 2.3.3
Date: Mon, 10 Aug 2020 17:43:16 +0300
Message-Id: <20200810144318.17106-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.3:

- Includes the missing translation files
- Fixed a bug with SelectField choices shortcut at form submission

License-Update: Use the exact line from PKG-INFO. The license
remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wtforms_2.3.1.bb => python3-wtforms_2.3.3.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_2.3.1.bb => python3-wtforms_2.3.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
index 9f081b68c..a6e7a5b2e 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A flexible forms validation and rendering library for python web
 HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=208ce1c159f911ecf389806650582021"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
-SRC_URI[md5sum] = "bff06943e59671581af07f80d14bda5f"
-SRC_URI[sha256sum] = "861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972"
+SRC_URI[md5sum] = "2b6ea167a71c6becf20f0934417fd06c"
+SRC_URI[sha256sum] = "81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c"
 
 PYPI_PACKAGE = "WTForms"
 
-- 
2.17.1

