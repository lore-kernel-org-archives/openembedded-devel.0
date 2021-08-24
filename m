Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.36247.1629793120646220115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45220 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mIRdh-0003rk-Br; Tue, 24 Aug 2021 11:18:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-simplejson: Upgrade 3.17.4 -> 3.17.5
Date: Tue, 24 Aug 2021 11:18:14 +0300
Message-Id: <20210824081816.1806-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824081816.1806-1-leon.anavi@konsulko.com>
References: <20210824081816.1806-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.17.5:

- Fix the C extension module to harden is_namedtuple against
  looks-a-likes such as Mocks. Also prevent dict encoding from
  causing an unraised SystemError when encountering a non-Dict.
  Noticed by running user tests against a CPython interpreter
  with C asserts enabled (COPTS += -UNDEBUG).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-simplejson_3.17.4.bb => python3-simplejson_3.17.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.4.bb => python3-simplejson_3.17.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.4.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.4.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.5.bb
index e50aac67a9..7c92761c40 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "2af85e028714c4b6cb2eb6fc03aa91f39ffd654f2eb2f6f8f860e14aeefa6be1"
+SRC_URI[sha256sum] = "91cfb43fb91ff6d1e4258be04eee84b51a4ef40a28d899679b9ea2556322fb50"
 
 inherit pypi setuptools3
 
-- 
2.17.1

