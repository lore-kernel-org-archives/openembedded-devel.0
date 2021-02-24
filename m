Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5619.1614165926246452162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56972 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEsIG-000137-LG; Wed, 24 Feb 2021 13:25:25 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pytest-runner: Upgrade 5.2 -> 5.3.0
Date: Wed, 24 Feb 2021 13:25:12 +0200
Message-Id: <20210224112512.31406-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224112512.31406-1-leon.anavi@konsulko.com>
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3.0:

- Require Python 3.6 or later
- Refreshed package metadata

License-Update: License remains MIT

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-pytest-runner_5.2.bb => python3-pytest-runner_5.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_5.2.bb => python3-pytest-runner_5.3.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
index d00cd48739..35f6c6c0a0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.0.bb
@@ -1,9 +1,8 @@
 SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "e5f66b8e8e87f62c59631c35c919d321"
-SRC_URI[sha256sum] = "96c7e73ead7b93e388c5d614770d2bae6526efd997757d3543fe17b557a0942b"
+SRC_URI[sha256sum] = "ca3f58ff4957e8be6c54c55d575b235725cbbcf4dc0d5091c29c6444cfc8a5fe"
 
 inherit pypi setuptools3
 
-- 
2.17.1

