Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.55885.1622541999109559701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 03:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49790 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lo1ID-0002gA-Ql; Tue, 01 Jun 2021 13:06:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pytest-helpers-namespace: Upgrade 2021.3.24 -> 2021.4.29
Date: Tue,  1 Jun 2021 13:06:29 +0300
Message-Id: <20210601100631.3277-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601100631.3277-1-leon.anavi@konsulko.com>
References: <20210601100631.3277-1-leon.anavi@konsulko.com>
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

Upgrade to release 2021.4.29:

- Don't set latest on codecov flags
- Lower PyTest requirement to 6.0.0, test several pytest versions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...21.3.24.bb => python3-pytest-helpers-namespace_2021.4.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-helpers-namespace_2021.3.24.bb => python3-pytest-helpers-namespace_2021.4.29.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.3.24.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.3.24.bb
rename to meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
index 9211ac394..86b66f021 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.3.24.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=440a4cdb311cd7ad181efb4cba06d562"
 
-SRC_URI[sha256sum] = "188df5a7c52390fa27d6cd2f18e74d64a2ef0b9fb6e12f15fdf5a95f4813d25f"
+SRC_URI[sha256sum] = "183524e3db4e2a1fea92e0ca3662a624ba44c9f3568da15679d7535ba6838a6a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

