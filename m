Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7664.1601540426225966312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 01:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52088 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kNtpA-0007uO-Ec; Thu, 01 Oct 2020 11:20:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pystemd: Upgrade 0.7.0 -> 0.8.0
Date: Thu,  1 Oct 2020 11:20:05 +0300
Message-Id: <20201001082006.21365-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001082006.21365-1-leon.anavi@konsulko.com>
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.0:

- add initial support for python 3.7 and 3.8
- added options StandardOutputFile, StandardOutputFileToAppend,
  StandardErrorFile and StandardErrorFileToAppend to known unit
  signatures.
- Added type stubs for pystemd.daemon, pystemd.dbuslib,
  pystemd.systemd1.Unit and pystemd.systemd1.Manager because we
  still "support python 3.4.
- fix issue when char is unsigned, and <char *> -1 returns 255.
- added slice_ option to pystemd.run to specify the cgroup where
  the unit is created.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pystemd_0.7.0.bb => python3-pystemd_0.8.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.7.0.bb => python3-pystemd_0.8.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
index 66f026cae2..e09b633f90 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "f493c3e54457e49fe3c160274b863bac"
-SRC_URI[sha256sum] = "f5dc49d02995ab96335d9e94f9fe036673d89b8cc9907e7a0ac83c06665f2430"
+SRC_URI[md5sum] = "f993739eca645749f18d4ccfd4a0fbf3"
+SRC_URI[sha256sum] = "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af6d9cd6458b9972"
 
 DEPENDS = "systemd"
 REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.17.1

