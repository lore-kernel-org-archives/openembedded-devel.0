Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.32063.1620655673281715696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6Za-000657-4v; Mon, 10 May 2021 17:07:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-babel: Upgrade 2.9.0 -> 2.9.1
Date: Mon, 10 May 2021 17:07:21 +0300
Message-Id: <20210510140722.27201-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.9.1:

- The internal locale-data loading functions now validate the name
  of the locale file to be loaded and only allow files within
  Babel's data directory. Thanks to Chris Lyne of Tenable, Inc. for
  discovering the issue!

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-babel_2.9.0.bb => python3-babel_2.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-babel_2.9.0.bb => python3-babel_2.9.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.9.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.9.1.bb
index 7248abf33b..a54f0d2100 100644
--- a/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-babel_2.9.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22a580b27e4ebf9689e466b63aedeb7f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05fb707293a85504aa67afc8ea34d747"
 
-SRC_URI[sha256sum] = "da031ab54472314f210b0adcff1588ee5d1d1d0ba4dbd07b94dba82bde791e05"
+SRC_URI[sha256sum] = "bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.17.1

