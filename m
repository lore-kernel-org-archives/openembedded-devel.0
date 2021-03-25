Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7914.1616679290821257798
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8P-0007lW-Lr; Thu, 25 Mar 2021 15:34:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/11] python3-rfc3339-validator: Upgrade 0.1.2 -> 0.1.3
Date: Thu, 25 Mar 2021 15:34:31 +0200
Message-Id: <20210325133436.18328-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.1.3:

- Add missing test requirements to setup.py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...9-validator_0.1.2.bb => python3-rfc3339-validator_0.1.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.2.bb => python3-rfc3339-validator_0.1.3.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
rename to meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
index e226e11b7..a07a09447 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
 
-SRC_URI[md5sum] = "2c233007189d5ef21046cb2afac51a96"
-SRC_URI[sha256sum] = "c9659c3183488a1875c4d327c9873d9e92c54cdcd69dfbfae7546ad8b27baf9a"
+SRC_URI[sha256sum] = "7a578aa0740e9ee2b48356fe1f347139190c4c72e27f303b3617054efd15df32"
 
 PYPI_PACKAGE = "rfc3339_validator"
 
-- 
2.17.1

