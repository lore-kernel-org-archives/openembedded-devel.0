Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5941.1615798065051500454
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLit5-0004Tf-9X; Mon, 15 Mar 2021 10:47:44 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-configargparse: Upgrade 1.3 -> 1.4
Date: Mon, 15 Mar 2021 10:47:21 +0200
Message-Id: <20210315084727.26812-4-leon.anavi@konsulko.com>
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

Upgrade to release 1.4:

- Allow nearly all characters in a keyword

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-configargparse_1.3.bb => python3-configargparse_1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.3.bb => python3-configargparse_1.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
index aac58de37..393f13874 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "0428b975ab6c48bb101ccb732e1b5cb616296e28268e032aa806f32b647a1cc1"
+SRC_URI[sha256sum] = "abef9ff44fb0091f0e3bb2ee7e5b26a02b5b62d45408a5272a9bd461f5b59b4b"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.17.1

