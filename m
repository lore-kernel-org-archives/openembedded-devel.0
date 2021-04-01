Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8048.1617284410124105315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33924 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRxYO-0006Ea-Jd; Thu, 01 Apr 2021 16:40:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pymisp: Upgrade 2.4.140 -> 2.4.141
Date: Thu,  1 Apr 2021 16:39:59 +0300
Message-Id: <20210401134000.7628-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401134000.7628-1-leon.anavi@konsulko.com>
References: <20210401134000.7628-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.141:

- Use get_uuid_or_id_from_abstract_misp in tag methods
- Skip nameless sections in ELF
- Make reportlab tests optional if missing dep
- Enable taxonomy failed if global pythonify is on
- Properly pass content-type
- Re-enable support for uploading STIX 1 documents

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.140.bb => python3-pymisp_2.4.141.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.140.bb => python3-pymisp_2.4.141.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
index 32e673660..c8bd52f10 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "39a7b8242f0d3022276d417ec334bb46b890ff23"
+SRCREV = "4a0c1e1dc42af171d3c1bcaa12436f79ff6cfd9b"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1

