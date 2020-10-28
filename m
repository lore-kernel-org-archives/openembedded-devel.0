Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.659.1603907193752189000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51340 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kXpWp-0001ga-0A; Wed, 28 Oct 2020 19:46:31 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-kiwisolver: Upgrade 1.2.0 -> 1.3.0
Date: Wed, 28 Oct 2020 19:46:20 +0200
Message-Id: <20201028174622.7515-1-leon.anavi@konsulko.com>
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

- add c++ benchmarks and run them on CIs
- modernize the c++ code by using more c++11 features
- introduce move semantic in some c++ constructors to improve
  performances
- add support for Python 3.9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-kiwisolver_1.2.0.bb => python3-kiwisolver_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.2.0.bb => python3-kiwisolver_1.3.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
index 94db61142b..f499f04530 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
 
-SRC_URI[md5sum] = "9f53fabb361c04d76c5afc688652c814"
-SRC_URI[sha256sum] = "247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f"
+SRC_URI[md5sum] = "9d1b3e2dd2bbe1a81ffedcc73cab07e0"
+SRC_URI[sha256sum] = "14f81644e1f3bf01fbc8b9c990a7889e9bb4400c4d0ff9155aa0bdd19cce24a9"
 
 inherit pypi setuptools3
 
-- 
2.17.1

