Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11318.1617712430940414842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 05:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55444 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTkto-0003tX-3l; Tue, 06 Apr 2021 15:33:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pymisp: Upgrade 2.4.141 -> 2.4.141.1
Date: Tue,  6 Apr 2021 15:33:30 +0300
Message-Id: <20210406123331.23266-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406123331.23266-1-leon.anavi@konsulko.com>
References: <20210406123331.23266-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.141.1:

- Re-bump changelog
- Bump version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.141.bb => python3-pymisp_2.4.141.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.141.bb => python3-pymisp_2.4.141.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
index c8bd52f10..df6f1c762 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "4a0c1e1dc42af171d3c1bcaa12436f79ff6cfd9b"
+SRCREV = "62cd5173f087e88834e88472060181b681b0b4d2"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1

