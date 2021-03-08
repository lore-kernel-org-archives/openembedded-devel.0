Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.38678.1615220300615989111
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35290 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lJIaI-0005d6-R7; Mon, 08 Mar 2021 18:18:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-prettytable: Upgrade 2.0.0 -> 2.1.0
Date: Mon,  8 Mar 2021 18:18:07 +0200
Message-Id: <20210308161810.21582-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308161810.21582-1-leon.anavi@konsulko.com>
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- Support formatting options in get_json_string()
- Replace setuptools/pkg_resources with importlib.metadata for
  getting version
- Docs: Add documentation for align, max_width, etc.
- Docs: Remove reference to Python 2.x print statement in README
- Docs: Update get_html_string with thead and tbody tags

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-prettytable_2.0.0.bb => python3-prettytable_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_2.0.0.bb => python3-prettytable_2.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
index 3563bfa11..fe7206255 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "e37acd91976fe6119172771520e58d1742c8479703489321dc1d9c85e7259922"
+SRC_URI[sha256sum] = "5882ed9092b391bb8f6e91f59bcdbd748924ff556bb7c634089d5519be87baa0"
 
 do_install_append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.17.1

