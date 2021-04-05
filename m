Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.4137.1617626986747417357
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 05:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55456 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTOfp-0005yF-4l; Mon, 05 Apr 2021 15:49:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-regex: Upgrade 2021.3.17 -> 2021.4.4
Date: Mon,  5 Apr 2021 15:49:33 +0300
Message-Id: <20210405124933.8920-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405124933.8920-1-leon.anavi@konsulko.com>
References: <20210405124933.8920-1-leon.anavi@konsulko.com>
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

Upgrade to release 2021.4.4 with the following bug fixes:

- regex fails with a quantified backreference but succeeds with
  repeated backref
- API is not a drop-in replacement for python's re when it comes
  to typing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2021.3.17.bb => python3-regex_2021.4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.3.17.bb => python3-regex_2021.4.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb b/meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
index a3cb80413..177b06b97 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4b8a1fb724904139149a43e172850f35aa6ea97fb0545244dc0b805e0154ed68"
+SRC_URI[sha256sum] = "52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

