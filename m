Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7837.1614337780068981549
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Feb 2021 03:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54444 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFb05-0007VN-1Z; Fri, 26 Feb 2021 13:09:39 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-autobahn: Upgrade 21.2.1 -> 21.2.2
Date: Fri, 26 Feb 2021 13:09:30 +0200
Message-Id: <20210226110931.6287-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226110931.6287-1-leon.anavi@konsulko.com>
References: <20210226110931.6287-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.2.2:

- fix: correct some sphinx doc references
- new: minimum supported Python (language) version is now 3.7 (on
  CPython and PyPy)
- new: more XBR proxy/stub code generation capabilities (RPC
  call/invoation handlers)
- fix: wamp-cryptosign loading of keys from SSH agent
- fix: update Docker image building and build Docker multi-arch
  images
- new: add more WAMP-cryptosign signature test vectors and unit
  tests
- fix: include XBR code rendering templates in package manifest

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_21.2.1.bb => python3-autobahn_21.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_21.2.1.bb => python3-autobahn_21.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
index 3af81d1dab..cc3773fc56 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "7e6b1bf95196b733978bab2d54a7ab8899c16ce11be369dc58422c07b7eea726"
+SRC_URI[sha256sum] = "bf7a9d302a34d0f719d43c57f65ca1f2f5c982dd6ea0c11e1e190ef6f43710fe"
 
 inherit pypi setuptools3
 
-- 
2.17.1

