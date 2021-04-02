Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15706.1617366902093650314
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 05:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52498 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lSJ0u-0004S7-8H; Fri, 02 Apr 2021 15:35:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-typeguard: Upgrade 2.11.1 -> 2.12.0
Date: Fri,  2 Apr 2021 15:34:52 +0300
Message-Id: <20210402123455.23702-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402123455.23702-1-leon.anavi@konsulko.com>
References: <20210402123455.23702-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.12.0:

- Added @typeguard_ignore decorator to exclude specific functions
  and classes from runtime type checking

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-typeguard_2.11.1.bb => python3-typeguard_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.11.1.bb => python3-typeguard_2.12.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
index 640adf83b..148806e10 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "33243c1cbfcb9736a06c6db22dd08876b5f297e6344aa272a2862c0f8e669f64"
+SRC_URI[sha256sum] = "fca77fd4ccba63465b421cdbbab5a1a8e3994e6d6f18b45da2bb475c09f147ef"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

