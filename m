Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.48149.1598857417889201820
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdqq-0006cW-82; Mon, 31 Aug 2020 10:03:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-sh: Upgrade 1.13.1 -> 1.14.0
Date: Mon, 31 Aug 2020 10:03:10 +0300
Message-Id: <20200831070318.6573-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.14.0:

- _env now more lenient in accepting dictionary-like objects
- None and False arguments now do not pass through to underlying
  command
- Implemented find_spec on the fancy importer, which fixes some
  Python3.4+ issues

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sh_1.13.1.bb => python3-sh_1.14.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.13.1.bb => python3-sh_1.14.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
index 2a6d9bcc6..7724f4be0 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[md5sum] = "7e3dd3a6b49c06db93746994a68cb8cf"
-SRC_URI[sha256sum] = "97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3"
+SRC_URI[md5sum] = "4cbbcb85c081d78f4b0f00d634db9bb9"
+SRC_URI[sha256sum] = "05c7e520cdf70f70a7228a03b589da9f96c6e0d06fc487ab21fc62b26a592e59"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.17.1

