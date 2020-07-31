Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18114.1596201779558409408
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1Uzw-000741-KE; Fri, 31 Jul 2020 16:22:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/15] python3-lxml: Upgrade 4.5.1 -> 4.5.2
Date: Fri, 31 Jul 2020 16:22:17 +0300
Message-Id: <20200731132230.20031-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.5.2:

- Cleaner() now validates that only known configuration options
  can be set.
- LP#1882606: Cleaner.clean_html() discarded comments and PIs
  regardless of the corresponding configuration option, if
  remove_unknown_tags was set.
- LP#1880251: Instead of globally overwriting the document loader
  in libxml2, lxml now sets it per parser run, which improves the
  interoperability with other users of libxml2 such as libxmlsec.
- LP#1881960: Fix build in CPython 3.10 by using Cython 0.29.21.
- The setup options "--with-xml2-config" and "--with-xslt-config"
  were accidentally renamed to "--xml2-config" and "--xslt-config"
  in 4.5.1 and are now available again.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lxml_4.5.1.bb => python3-lxml_4.5.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.1.bb => python3-lxml_4.5.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
index a4198b029..7e11a67e7 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "4d3cca9c0018dd98f39e0ac54fcc3d14"
-SRC_URI[sha256sum] = "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
+SRC_URI[md5sum] = "83ad758eab6c254b3565715967d553a6"
+SRC_URI[sha256sum] = "cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

