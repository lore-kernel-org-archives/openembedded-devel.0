Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.46129.1597070611291427279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591O-0008Tw-BA; Mon, 10 Aug 2020 17:43:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-cantools: Upgrade 35.1.0 -> 35.3.0
Date: Mon, 10 Aug 2020 17:43:15 +0300
Message-Id: <20200810144318.17106-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 35.3.0:

- Fix dump of signal types in DBC files
- Fix SIG_VALTYPE_ item on DBC dump for extended frame id messages
- Fix compile error

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cantools_35.1.0.bb => python3-cantools_35.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_35.1.0.bb => python3-cantools_35.3.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
index a9638fbd2..c79e51e33 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[md5sum] = "46b71bbfec33146d9dbba708489a8ae2"
-SRC_URI[sha256sum] = "bd0ac5b16bb7fe2ada0c9436c91a0b3795217bed7126296dde1565919a3f44f1"
+SRC_URI[md5sum] = "068514ac776e03ebaa8b2d02dd16fc77"
+SRC_URI[sha256sum] = "5e3a6f679ad3dcb31142e388e052187d5fc5bd481c4fc3b2791eaa1e681cca98"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.17.1

