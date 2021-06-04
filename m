Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.706.1622820733412337600
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53150 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lpBnt-0008SE-Lb; Fri, 04 Jun 2021 18:32:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-typeguard: Upgrade 2.12.0 -> 2.12.1
Date: Fri,  4 Jun 2021 18:31:57 +0300
Message-Id: <20210604153200.20570-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604153200.20570-1-leon.anavi@konsulko.com>
References: <20210604153200.20570-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.12.1:

- Fixed AttributeError when __code__ is missing from the checked
  callable

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-typeguard_2.12.0.bb => python3-typeguard_2.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.12.0.bb => python3-typeguard_2.12.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.12.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.12.1.bb
index 148806e101..803067651a 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "fca77fd4ccba63465b421cdbbab5a1a8e3994e6d6f18b45da2bb475c09f147ef"
+SRC_URI[sha256sum] = "c2af8b9bdd7657f4bd27b45336e7930171aead796711bc4cfc99b4731bb9d051"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

