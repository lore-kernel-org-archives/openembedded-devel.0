Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.171.1626365357595729379
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 09:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41550 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m43vG-0000O5-J5; Thu, 15 Jul 2021 19:09:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pandas: Upgrade 1.2.5 -> 1.3.0
Date: Thu, 15 Jul 2021 19:09:04 +0300
Message-Id: <20210715160906.26266-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.3.0:

- Custom HTTP(s) headers when reading csv or json files
- Read and write XML documents
- Styler enhancements
- DataFrame constructor honors copy=False with dict
- PyArrow backed string data type
- Centered datetime-like rolling windows
- Bug fix: Categorical.unique now always maintains same dtype as
  original
- Bug fix: preserve dtypes in DataFrame.combine_first()
- Bug fix: Groupby methods agg and transform no longer changes
  return dtype for callables
- Bug fix: Consistent casting with setting into Boolean Series
- Bug fix: GroupBy.rolling with MultiIndex no longer drops levels
  in the result

License-Update: Update license year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.2.5.bb => python3-pandas_1.3.0.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.5.bb => python3-pandas_1.3.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.5.bb b/meta-python/recipes-devtools/python/python3-pandas_1.3.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.5.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.3.0.bb
index 71386dc94a..b98e2865c7 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.3.0.bb
@@ -4,9 +4,9 @@ high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "14abb8ea73fce8aebbb1fb44bec809163f1c55241bcc1db91c2c780e97265033"
+SRC_URI[sha256sum] = "c554e6c9cf2d5ea1aba5979cc837b3649539ced0e18ece186f055450c86622e2"
 
 inherit pypi setuptools3
 
@@ -20,6 +20,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-numpy \
     ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-dateutil-zoneinfo \
     ${PYTHON_PN}-pytz \
     ${PYTHON_PN}-profile \
 "
-- 
2.17.1

