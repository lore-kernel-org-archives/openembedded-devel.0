Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12897.1597146301233427869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiB-0004It-A6; Tue, 11 Aug 2020 14:45:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-isort: Upgrade 5.2.2 -> 5.3.2
Date: Tue, 11 Aug 2020 14:44:24 +0300
Message-Id: <20200811114430.27916-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3.2:

- Fixed incorrect warning code (W503->W0503)
- Improve upgrade warnings to be less noisy and point to error
  codes for easy interoperability with Visual Studio Code
- Implemented ability to treat all or select comments as code
- Implemented ability to use different configs for different
  file extensions
- Implemented ability to specify the types of imports
- Implemented ability to dedup import headings
- Added experimental support for sorting literals
- Added experimental support for sorting and deduping groupings
  of assignments
- Improved handling of deprecated single line variables for usage
  with Visual Studio Code
- Improved handling of mixed newline forms within same source file
- Improved error handling for known sections
- Improved API consistency, returning a boolean value for all
  modification API calls to indicate if changes were made
- Fixed spurious errors when combining skip with --gitignore
- Fixed --skip-gitignore does not honor ignored symlink

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.2.2.bb => python3-isort_5.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.2.2.bb => python3-isort_5.3.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
index 4aa3a8838..2f1a9838e 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "2e501eacbf110d1e2c524590b183d339"
-SRC_URI[sha256sum] = "96b27045e3187b9bdde001143b79f9b10a462f372bff7062302818013b6c86f3"
+SRC_URI[md5sum] = "5ef33a4fe121b3f24493ad8ac450baac"
+SRC_URI[sha256sum] = "ba83762132a8661d3525f87a86549712fb7d8da79eeb452e01f327ada9e87920"
 
 inherit pypi setuptools3
 
-- 
2.17.1

