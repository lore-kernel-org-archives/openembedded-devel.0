Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5592.1615883875682991032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lM5D7-0006gf-Rh; Tue, 16 Mar 2021 10:37:54 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-defusedxml: Upgrade 0.6.0 -> 0.7.1
Date: Tue, 16 Mar 2021 10:37:41 +0200
Message-Id: <20210316083744.17558-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316083744.17558-1-leon.anavi@konsulko.com>
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.1:

- Re-add and deprecate ``defusedxml.cElementTree``
- Use GitHub Actions instead of TravisCI
- Restore ``ElementTree`` attribute of ``xml.etree`` module
  after patching
- Add support for Python 3.9
- Python 2 is deprecate. Support for Python 2 will be removed
  in 0.8.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-defusedxml_0.6.0.bb => python3-defusedxml_0.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-defusedxml_0.6.0.bb => python3-defusedxml_0.7.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index d041d0e6c..f48c429c4 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -5,7 +5,6 @@ parsers that prevent any potentially malicious operation."
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e"
 
-SRC_URI[md5sum] = "a59741f675c4cba649de40a99f732897"
-SRC_URI[sha256sum] = "f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5"
+SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
 
 inherit pypi setuptools3
-- 
2.17.1

