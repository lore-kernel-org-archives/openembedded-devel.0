Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1865.1621626241783520178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 12:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lkB3q-00060E-FX; Fri, 21 May 2021 22:43:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pytest-runner: Upgrade 5.3.0 -> 5.3.1
Date: Fri, 21 May 2021 22:43:42 +0300
Message-Id: <20210521194342.6448-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521194342.6448-1-leon.anavi@konsulko.com>
References: <20210521194342.6448-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3.1:

- Refreshed package metadata.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pytest-runner_5.3.0.bb => python3-pytest-runner_5.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_5.3.0.bb => python3-pytest-runner_5.3.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
index 35f6c6c0a0..fcbd29050e 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "ca3f58ff4957e8be6c54c55d575b235725cbbcf4dc0d5091c29c6444cfc8a5fe"
+SRC_URI[sha256sum] = "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e2077a89ebcf204aac91"
 
 inherit pypi setuptools3
 
-- 
2.17.1

