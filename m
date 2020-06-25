Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6706.1593076087641985404
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNrZ-0005y7-1v; Thu, 25 Jun 2020 12:08:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/12] python3-jsonpatch: Upgrade 1.25 -> 1.26
Date: Thu, 25 Jun 2020 12:07:09 +0300
Message-Id: <20200625090719.16068-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.26:

- Optimize exception message
- Optimize error handling
- Fixed some typos and wording

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.25.bb => python3-jsonpatch_1.26.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.25.bb => python3-jsonpatch_1.26.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
index 8ec21ff11..b1217cfac 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "fcc546892414bef2f7f89f0e2a618a9e"
-SRC_URI[sha256sum] = "ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a"
+SRC_URI[md5sum] = "3aa7e75ad472c51a6de0123137dbfdf2"
+SRC_URI[sha256sum] = "e45df18b0ab7df1925f20671bbc3f6bd0b4b556fb4b9c5d97684b0a7eac01744"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
-- 
2.17.1

