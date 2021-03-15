Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5942.1615798069727791131
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLitA-0004Tf-4Y; Mon, 15 Mar 2021 10:47:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-pyflakes: Upgrade 2.2.0 -> 2.3.0
Date: Mon, 15 Mar 2021 10:47:26 +0200
Message-Id: <20210315084727.26812-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315084727.26812-1-leon.anavi@konsulko.com>
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.0:

- Recognize tuple concatenation in __all__ export definitions
- Better support use of annotation-only assignments when using
  from __future__ import annotations
- Recognize special-case typing for Annotated
- Fix undefined name __qualname__ in class scope
- Recognize special-cased typing for TypeVar
- Errors for undefined exports in __all__ are shown in a
  deterministic order
- Fix false positives in certain typing constructs (TypeVar,
  NamedTuple, TypedDict, cast)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyflakes_2.2.0.bb => python3-pyflakes_2.3.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.2.0.bb => python3-pyflakes_2.3.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
index 911cf4ec3..0c8956728 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[md5sum] = "48b1c29732ca810a70cba0e6d0531169"
-SRC_URI[sha256sum] = "35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8"
+SRC_URI[sha256sum] = "e59fd8e750e588358f1b8885e5a4751203a0516e0ee6d34811089ac294c8806f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

