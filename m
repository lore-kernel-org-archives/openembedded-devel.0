Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11267.1603376281820953251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 07:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45090 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVbPl-0002Yk-3v; Thu, 22 Oct 2020 17:18:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-lxml: Upgrade 4.5.2 -> 4.6.1
Date: Thu, 22 Oct 2020 17:17:49 +0300
Message-Id: <20201022141749.14950-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022141749.14950-1-leon.anavi@konsulko.com>
References: <20201022141749.14950-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.6.1:

- lxml.html.InputGetter supports __len__() to count the number of
  input fields.
- lxml.html.InputGetter has a new .items() method to ease
  processing all input fields.
- lxml.html.InputGetter.keys() now returns the field names in
  document order.
- GH-309: The API documentation is now generated using
  sphinx-apidoc.
- C14N 2.0 serialisation failed for unprefixed attributes when a
  default namespace was defined.
- TreeBuilder.close() raised AssertionError in some error cases
  where it should have raised XMLSyntaxError. It now raises a
  combined exception to keep up backwards compatibility, while
  switching to XMLSyntaxError as an interface.
- A vulnerability was discovered in the HTML Cleaner by Yaniv
  Nizry, which allowed JavaScript to pass through. The cleaner
  now removes more sneaky "style" content.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lxml_4.5.2.bb => python3-lxml_4.6.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.2.bb => python3-lxml_4.6.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
index 7e11a67e7f..af012e6300 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "83ad758eab6c254b3565715967d553a6"
-SRC_URI[sha256sum] = "cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6"
+SRC_URI[md5sum] = "10924ab543397a06cb4cfaf9bdf0b80f"
+SRC_URI[sha256sum] = "c152b2e93b639d1f36ec5a8ca24cde4a8eefb2b6b83668fcd8e83a67badcb367"
 
 inherit pypi setuptools3
 
-- 
2.17.1

