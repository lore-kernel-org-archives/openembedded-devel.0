Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5201.1628673357828446836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 02:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDkKz-0001XG-TP; Wed, 11 Aug 2021 12:15:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-apply-defaults: Upgrade 0.1.4 -> 0.1.6
Date: Wed, 11 Aug 2021 12:15:30 +0300
Message-Id: <20210811091530.26594-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210811091530.26594-1-leon.anavi@konsulko.com>
References: <20210811091530.26594-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.1.6:

- Alias imports in __init__.py, so that mypy considers them
  re-exported.
- Use mypy with the --strict flag.
- Added Github Actions to the repo.
- Add .pre-commit-config.yml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...apply-defaults_0.1.4.bb => python3-apply-defaults_0.1.6.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-apply-defaults_0.1.4.bb => python3-apply-defaults_0.1.6.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb
rename to meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
index 7889f0c62a..6bf61cfcd3 100644
--- a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
 PYPI_PACKAGE = "apply_defaults"
 
-SRC_URI[md5sum] = "719abb133f4b46283ebd940fcdf30a78"
-SRC_URI[sha256sum] = "1ce26326a61d8773d38a9726a345c6525a91a6120d7333af79ad792dacb6246c"
+SRC_URI[sha256sum] = "3773de3491b94c0fe44310f1a85888389cdc71e1544b343bce0d2bd6991acea5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

