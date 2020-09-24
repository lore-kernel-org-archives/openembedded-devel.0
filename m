Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.16717.1600953694375085389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 06:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58940 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLRBl-0007nc-3F; Thu, 24 Sep 2020 16:21:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-yarl: Upgrade 1.5.1 -> 1.6.0
Date: Thu, 24 Sep 2020 16:21:20 +0300
Message-Id: <20200924132122.30697-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200924132122.30697-1-leon.anavi@konsulko.com>
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.0:

- Allow for int and float subclasses in query, while still denying
  bool.
- Do not requote arguments in URL.build(), with_xxx() and in /
  operator.
- Keep IPv6 brackets in origin().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.5.1.bb => python3-yarl_1.6.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.5.1.bb => python3-yarl_1.6.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
index 40f0e4db03..543acc51ba 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
 
-SRC_URI[md5sum] = "a9b20bf0b8a6962e1101b28908a67bf8"
-SRC_URI[sha256sum] = "c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6"
+SRC_URI[md5sum] = "802bb27ebdb260fbbaecbcc8168d6f28"
+SRC_URI[sha256sum] = "61d3ea3c175fe45f1498af868879c6ffeb989d4143ac542163c45538ba5ec21b"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

