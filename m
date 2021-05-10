Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.32166.1620655655129522365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZI-000657-E2; Mon, 10 May 2021 17:07:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-humanize: Upgrade 3.4.1 -> 3.5.0
Date: Mon, 10 May 2021 17:07:14 +0300
Message-Id: <20210510140722.27201-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.5.0:

- Add intword processing for thousands
- Update translation .po files with 'thousand'
- Remove generated translation binaries from repo

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.4.1.bb => python3-humanize_3.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.4.1.bb => python3-humanize_3.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb b/meta-python/recipes-devtools/python/python3-humanize_3.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.5.0.bb
index 5ffc2b5938..866079105e 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.5.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "6e04cdd75d66074c34ff93c30a2ad6d19d91202a65c1bd400b2edeedae399bda"
+SRC_URI[sha256sum] = "a0474226e1494923f9106758e11f0c3bb4dbe5e7d84388fa78f90eb7713b5d65"
 
 inherit pypi setuptools3
 
-- 
2.17.1

