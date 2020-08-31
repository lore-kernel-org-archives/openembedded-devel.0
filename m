Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.48152.1598857430014596125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdr2-0006cW-Dx; Mon, 31 Aug 2020 10:03:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-more-itertools: Upgrade 8.4.0 -> 8.5.0
Date: Mon, 31 Aug 2020 10:03:14 +0300
Message-Id: <20200831070318.6573-6-leon.anavi@konsulko.com>
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

Upgrade to release 8.5.0:

- Add :func:`windowed_complete`
- The :func:`is_sorted` implementation was improved
- The :func:`groupby_transform` now accepts a reducefunc parameter
- The :func:`last` implementation was improved
- Various documentation fixes
- The tests for :func:`distinct_combinations` were improved
- Automated tests now run on GitHub Actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ore-itertools_8.4.0.bb => python3-more-itertools_8.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-more-itertools_8.4.0.bb => python3-more-itertools_8.5.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
rename to meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
index f040b1a97..e924b0f73 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[md5sum] = "0912041c05148ed079984cff69af2e99"
-SRC_URI[sha256sum] = "68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5"
+SRC_URI[md5sum] = "2588b5a7042576b99574779582be9292"
+SRC_URI[sha256sum] = "6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

