Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5330.1628584281750617587
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53578 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDNAI-0005EL-St; Tue, 10 Aug 2021 11:31:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pycurl: Upgrade 7.43.0.6 -> 7.44.0
Date: Tue, 10 Aug 2021 11:30:57 +0300
Message-Id: <20210810083058.29524-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810083058.29524-1-leon.anavi@konsulko.com>
References: <20210810083058.29524-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.44.0:

- getinfo(CURLINFO_FTP_ENTRY_PATH) now handles NULL return from
  libcurl, returning None in this case.
- Python 3.9 is now officially supported (patch by Bill Collins).
- Added CURLOPT_DOH_URL (patch by resokou).
- Best effort Python 2 support has been reinstated.
- Added missing fields to curl_version_info struct (patch by
  Hasan).
- Added CURLINFO_CONDITION_UNMET (patch by Dima Tisnek).
- Exposed MAX_CONCURRENT_STREAMS in CurlMulti (patch by Alexandre
  Pion).
- Compilation fixed against Python 3.10 alpha (patch by Kamil
  Dudka).

License-Update: update copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycurl_7.43.0.6.bb => python3-pycurl_7.44.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.43.0.6.bb => python3-pycurl_7.44.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.44.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.44.0.bb
index 0437a6cc93..72b87dafb2 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.44.0.bb
@@ -9,11 +9,10 @@ HOMEPAGE = "http://pycurl.io/"
 
 LICENSE = "LGPLv2 | MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6 \
+                    file://COPYING-MIT;md5=75f131c591546fd1277ca49c9a81ab1b \
                     "
 
-SRC_URI[md5sum] = "3e121d895101022c30619e1bbf97eb97"
-SRC_URI[sha256sum] = "8301518689daefa53726b59ded6b48f33751c383cf987b0ccfbbc4ed40281325"
+SRC_URI[sha256sum] = "2ce9905626d8ceafcbadee666e2f45397e29c7618ddcdc63fc22d85e5046c6d6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

