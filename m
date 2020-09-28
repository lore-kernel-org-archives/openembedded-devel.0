Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.31851.1601280092021957886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40866 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kMo6A-0001Xq-W3; Mon, 28 Sep 2020 11:01:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-argcomplete: Upgrade 1.12.0 -> 1.12.1
Date: Mon, 28 Sep 2020 11:00:57 +0300
Message-Id: <20200928080059.18929-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928080059.18929-1-leon.anavi@konsulko.com>
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.1:

- Update importlib-metadata dependency version range
- Bash nounset mode fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-argcomplete_1.12.0.bb => python3-argcomplete_1.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.0.bb => python3-argcomplete_1.12.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
index dd749dd9eb..c14a7eba12 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "47e2a3db821f57165be8f3d3ec1e5259"
-SRC_URI[sha256sum] = "2fbe5ed09fd2c1d727d4199feca96569a5b50d44c71b16da9c742201f7cc295c"
+SRC_URI[md5sum] = "2262d0466a40d42267b424bba5010a0b"
+SRC_URI[sha256sum] = "849c2444c35bb2175aea74100ca5f644c29bf716429399c0f2203bb5d9a8e4e6"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.17.1

