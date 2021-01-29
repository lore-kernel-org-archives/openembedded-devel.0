Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9052.1611925840882726983
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 05:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56034 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l5TXq-0007LC-Ob; Fri, 29 Jan 2021 15:10:40 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-aiohttp-jinja2: Upgrade 1.2.0 -> 1.4.2
Date: Fri, 29 Jan 2021 15:10:29 +0200
Message-Id: <20210129131029.2163-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129131029.2163-1-leon.anavi@konsulko.com>
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.2:

- Fix type annotation for context_processors argument
- Bump the minimal supported aiohttp version to 3.6.3 to avoid
  problems with uncompatibility between aiohttp and yarl
- Add async rendering support
- Document async rendering functions
- Add CHANGES.rst to MANIFEST.in and sdist

License-Update: Remove an empty line at the end of the file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...iohttp-jinja2_1.2.0.bb => python3-aiohttp-jinja2_1.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp-jinja2_1.2.0.bb => python3-aiohttp-jinja2_1.4.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
index de336af22..05afed8b6 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c82758543767c96574b6e29fc478fb73"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=29dca541e03964615590ca7b50392d97"
 
-SRC_URI[sha256sum] = "2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79"
+SRC_URI[sha256sum] = "9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

