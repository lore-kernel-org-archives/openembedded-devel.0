Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10116.1618389335079336824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 01:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWazj-00040c-6I; Wed, 14 Apr 2021 11:35:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-colorlog: Upgrade 4.8.0 -> 5.0.1
Date: Wed, 14 Apr 2021 11:35:23 +0300
Message-Id: <20210414083525.10948-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414083525.10948-1-leon.anavi@konsulko.com>
References: <20210414083525.10948-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.1:

- Fix colorlog.basicConfig does not accept '{' style
- Fix linter errors

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_4.8.0.bb => python3-colorlog_5.0.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.8.0.bb => python3-colorlog_5.0.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
index 6f9b8d47a4..61b8152a1e 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A colored formatter for the python logging module"
 HOMEPAGE = "https://github.com/borntyping/python-colorlog"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=85a1d478cd35d62763a1419e948bdde4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5c3c6ebdec7792ae12df8d1c0a46b26a"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "59b53160c60902c405cdec28d38356e09d40686659048893e026ecbd589516b1"
+SRC_URI[sha256sum] = "f17c013a06962b02f4449ee07cfdbe6b287df29efc2c9a1515b4a376f4e588ea"
-- 
2.17.1

