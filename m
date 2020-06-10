Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10439.1591794968482686775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0aJ-0005hT-CT; Wed, 10 Jun 2020 16:16:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-multidict: Upgrade 4.7.5 -> 4.7.6
Date: Wed, 10 Jun 2020 16:15:36 +0300
Message-Id: <20200610131536.31426-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.7.6 which include the following bug fixes:

* Fixed an issue with some versions of the wheel dist failing
  because of being unable to detect the license file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_4.7.5.bb => python3-multidict_4.7.6.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_4.7.5.bb => python3-multidict_4.7.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb b/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
rename to meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
index 30e10c251..02c541b4c 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
-SRC_URI[sha256sum] = "aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e"
+SRC_URI[md5sum] = "40b6ca77171ac8af55f7aa60049f3cdf"
+SRC_URI[sha256sum] = "fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

