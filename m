Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5991.1615798059428355172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLisv-0004Tf-Pp; Mon, 15 Mar 2021 10:47:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-pymisp: Upgrade 2.4.138 -> 2.4.140
Date: Mon, 15 Mar 2021 10:47:18 +0200
Message-Id: <20210315084727.26812-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 2.4.140:

- Soft delete object in MISPEvent
- Add in ability to add a new cluster relation
- MISP Galaxy 2.0 capability

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.138.bb => python3-pymisp_2.4.140.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.138.bb => python3-pymisp_2.4.140.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
index eb7bea834..32e673660 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "9316420dc028a1ffc541986fc08793e669f2165e"
+SRCREV = "39a7b8242f0d3022276d417ec334bb46b890ff23"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1

