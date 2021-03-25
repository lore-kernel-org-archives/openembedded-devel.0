Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8130.1616679291704684096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8Q-0007lW-EB; Thu, 25 Mar 2021 15:34:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/11] python3-pyflakes: Upgrade 2.3.0 -> 2.3.1
Date: Thu, 25 Mar 2021 15:34:32 +0200
Message-Id: <20210325133436.18328-7-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.1:

- Allow passing tox positional arguments to unittest
- Annotations no longer redefine names

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyflakes_2.3.0.bb => python3-pyflakes_2.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.3.0.bb => python3-pyflakes_2.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.3.1.bb
index 0c8956728..69680ddcb 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "e59fd8e750e588358f1b8885e5a4751203a0516e0ee6d34811089ac294c8806f"
+SRC_URI[sha256sum] = "f5bc8ecabc05bb9d291eb5203d6810b49040f6ff446a756326104746cc00c1db"
 
 inherit pypi setuptools3
 
-- 
2.17.1

