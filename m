Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.97.1614016253189923585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55530 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEFMA-0008OK-Vj; Mon, 22 Feb 2021 19:50:52 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyperclip: Upgrade 1.8.1 -> 1.8.2
Date: Mon, 22 Feb 2021 19:50:41 +0200
Message-Id: <20210222175043.21231-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210222175043.21231-1-leon.anavi@konsulko.com>
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.2:

- Better wayland session detection

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperclip_1.8.1.bb => python3-pyperclip_1.8.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.1.bb => python3-pyperclip_1.8.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
index 211580b37c..142d075493 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/asweigart/pyperclip"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
 
-SRC_URI[md5sum] = "0ac879899da5c2af755a834245ca6a0f"
-SRC_URI[sha256sum] = "9abef1e79ce635eb62309ecae02dfb5a3eb952fa7d6dce09c1aef063f81424d3"
+SRC_URI[sha256sum] = "105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57"
 
 inherit pypi setuptools3
 
-- 
2.17.1

