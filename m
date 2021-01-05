Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6718.1609859820212723925
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4m-0007qz-P6; Tue, 05 Jan 2021 17:16:49 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-argcomplete: Upgrade 1.12.1 -> 1.12.2
Date: Tue,  5 Jan 2021 17:16:31 +0200
Message-Id: <20210105151638.15700-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.2:

- Update importlib-metadata dependency pin
- Add change log project URL
- Replace Travis CI with GitHub Actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-argcomplete_1.12.1.bb => python3-argcomplete_1.12.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.1.bb => python3-argcomplete_1.12.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
index c14a7eba12..a08f882ab1 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "2262d0466a40d42267b424bba5010a0b"
-SRC_URI[sha256sum] = "849c2444c35bb2175aea74100ca5f644c29bf716429399c0f2203bb5d9a8e4e6"
+SRC_URI[sha256sum] = "de0e1282330940d52ea92a80fea2e4b9e0da1932aaa570f84d268939d1897b04"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.17.1

