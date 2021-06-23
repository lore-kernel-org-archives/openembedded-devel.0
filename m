Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5110.1624439172477520032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 02:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvypl-0008WN-DM; Wed, 23 Jun 2021 12:06:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pandas: Upgrade 1.2.4 -> 1.2.5
Date: Wed, 23 Jun 2021 12:06:01 +0300
Message-Id: <20210623090602.27496-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210623090602.27496-1-leon.anavi@konsulko.com>
References: <20210623090602.27496-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.5:

- Fixed regression in concat() between two DataFrame where one has
  an Index that is all-None and the other is DatetimeIndex
  incorrectly raising
- Fixed regression in DataFrame.sum() and DataFrame.prod() when
  min_count and numeric_only are both given
- Fixed regression in read_csv() when using memory_map=True with
  an non-UTF8 encoding
- Fixed regression in DataFrame.replace() and Series.replace()
  when the values to replace is a NumPy float array
- Fixed regression in ExcelFile() when a corrupt file is opened
  but not closed
- Fixed regression in DataFrame.astype() with dtype=str failing
  to convert NaN in categorical columns

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.2.4.bb => python3-pandas_1.2.5.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.4.bb => python3-pandas_1.2.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.5.bb
index 54fa910a98..71386dc94a 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[sha256sum] = "649ecab692fade3cbfcf967ff936496b0cfba0af00a55dfaacd82bdda5cb2279"
+SRC_URI[sha256sum] = "14abb8ea73fce8aebbb1fb44bec809163f1c55241bcc1db91c2c780e97265033"
 
 inherit pypi setuptools3
 
@@ -21,4 +21,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numpy \
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-profile \
 "
-- 
2.17.1

