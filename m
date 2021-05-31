Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.46909.1622481242024177982
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lnlUG-00054C-Kp; Mon, 31 May 2021 20:14:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-humanize: Upgrade 3.5.0 -> 3.6.0
Date: Mon, 31 May 2021 20:13:47 +0300
Message-Id: <20210531171350.11059-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531171350.11059-1-leon.anavi@konsulko.com>
References: <20210531171350.11059-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.6.0:

- Add pluralization for intword
- Add es_ES '%s and %s' translation
- Add gender support for ordinals
- Add type hints for all exposed natural* functions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.5.0.bb => python3-humanize_3.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.5.0.bb => python3-humanize_3.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.5.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-humanize_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.6.0.bb
index 866079105..1c269bac9 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.6.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "a0474226e1494923f9106758e11f0c3bb4dbe5e7d84388fa78f90eb7713b5d65"
+SRC_URI[sha256sum] = "a31704cf41f023e268032c4813c6482573320150a0d986f76b245e0451bb89e1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

