Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12358.1619618108634681033
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 06:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44422 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lbkeX-0000GX-Dp; Wed, 28 Apr 2021 16:54:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pymisp: Upgrade 2.4.141.1 -> 2.4.142
Date: Wed, 28 Apr 2021 16:54:48 +0300
Message-Id: <20210428135448.9231-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428135448.9231-1-leon.anavi@konsulko.com>
References: <20210428135448.9231-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.142:

- Support for correlation exclusion list

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.141.1.bb => python3-pymisp_2.4.142.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.141.1.bb => python3-pymisp_2.4.142.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.142.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.142.bb
index df6f1c762d..a644978e40 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.142.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "62cd5173f087e88834e88472060181b681b0b4d2"
+SRCREV = "357096f24c4f8d7dac87dfe0b9edad4f924f27a3"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1

