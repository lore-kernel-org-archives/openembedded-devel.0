Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8297.1600847940138143338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58518 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKzg0-0005D6-K9; Wed, 23 Sep 2020 10:58:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-greenlet: Upgrade 0.4.16 -> 0.4.17
Date: Wed, 23 Sep 2020 10:58:30 +0300
Message-Id: <20200923075830.30859-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923075830.30859-1-leon.anavi@konsulko.com>
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 0.4.17:

- Provide support for PEP 567 ContextVars
- Provide a feature flag indicating whether we handle context vars
- Switch contextvars when switching greenlets

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-greenlet_0.4.16.bb => python3-greenlet_0.4.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.16.bb => python3-greenlet_0.4.17.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
index 4556d499fa..744265e1fa 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "9aebea08f7beb6b87143d0588578c984"
-SRC_URI[sha256sum] = "6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c"
+SRC_URI[md5sum] = "d964c95c2d2f0f02f36c75e158d8e3dc"
+SRC_URI[sha256sum] = "41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b"
 
 inherit pypi distutils3
-- 
2.17.1

