Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3652.1592905915003074692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfar-0006Iq-6z; Tue, 23 Jun 2020 12:51:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/11] python3-semver: Upgrade 2.8.1 -> 2.10.2
Date: Tue, 23 Jun 2020 12:51:33 +0300
Message-Id: <20200623095136.24854-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 2.10.2:

- :gh:`268`: Increase coverage
- :gh:`260` (:pr:`261`): Fixed __getitem__ returning None on
  wrong parts :pr:`263`: Doc: Add missing "install" subcommand
  for openSUSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-semver_2.8.1.bb => python3-semver_2.10.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_2.8.1.bb => python3-semver_2.10.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
index a469b23b1..b41ef5ddc 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
@@ -4,8 +4,8 @@ BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
-SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
+SRC_URI[md5sum] = "3e11ae9782121e8ffe9f8a8b763a8cb5"
+SRC_URI[sha256sum] = "c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276"
 
 inherit pypi setuptools3
 
-- 
2.17.1

