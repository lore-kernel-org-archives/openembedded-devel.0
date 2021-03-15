Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5897.1615798067503198190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLit7-0004Tf-3q; Mon, 15 Mar 2021 10:47:45 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-pycodestyle: Upgrade 2.6.0 -> 2.7.0
Date: Mon, 15 Mar 2021 10:47:23 +0200
Message-Id: <20210315084727.26812-6-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.0:

- Fix physical checks (such as W191) at end of file
- Add --indent-size option (defaulting to 4)
- W605: fix escaped crlf false positive on windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pycodestyle_2.6.0.bb => python3-pycodestyle_2.7.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.6.0.bb => python3-pycodestyle_2.7.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
index 4ad1f5493..611abca6b 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[md5sum] = "e2fcdace728267d5fa3aa98e08ee40db"
-SRC_URI[sha256sum] = "c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e"
+SRC_URI[sha256sum] = "c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef"
 
 inherit pypi setuptools3
 
-- 
2.17.1

