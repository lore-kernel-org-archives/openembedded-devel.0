Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.113.1614016254025026075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55530 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEFMC-0008OK-A1; Mon, 22 Feb 2021 19:50:53 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-elementpath: Upgrade 2.1.3 -> 2.1.4
Date: Mon, 22 Feb 2021 19:50:42 +0200
Message-Id: <20210222175043.21231-4-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.4:

- Add tests and apply small fixes to TDOP parser
- Fix wildcard selection of attributes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-elementpath_2.1.3.bb => python3-elementpath_2.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.3.bb => python3-elementpath_2.1.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
index 2cba4fb5c8..10aa17d381 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "b729d9376cc0f76479c9b0cef30cc0d3c9082ccb4507caa0da1a5e4964926960"
+SRC_URI[sha256sum] = "326643aca7beff0864d022cd591736b8550a70fccafd67a89198166baed1c2c4"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.17.1

