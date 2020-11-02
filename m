Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.29127.1604311395704431296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 02:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kZWgB-0004Pi-2w; Mon, 02 Nov 2020 12:03:12 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-tornado: Upgrade 6.0.4 -> 6.1
Date: Mon,  2 Nov 2020 12:03:02 +0200
Message-Id: <20201102100303.2377-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102100303.2377-1-leon.anavi@konsulko.com>
References: <20201102100303.2377-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 6.1:

- Windows support has been improved. Tornado is now compatible
  with the proactor event loop (which became the default in Python
  3.8) by automatically falling back to running a selector in a
  second thread. This means that it is no longer necessary to
  explicitly configure a selector event loop, although doing so
  may improve performance. This does not change the fact that
  Tornado is significantly less scalable on Windows than on other
  platforms.
- Binary wheels are now provided for Windows, MacOS, and Linux
  (amd64 and arm64).
- This is the last release of Tornado to support Python 3.5.
  Future versions will require Python 3.6 or newer

License-Update:  Checksum change, lisense remains "Apache-2.0"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tornado_6.0.4.bb => python3-tornado_6.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.0.4.bb => python3-tornado_6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.1.bb
index db6b567444..89ff715b65 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
@@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "cf39425f3d7eba9a54287f3e795a2f23"
-SRC_URI[sha256sum] = "0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc"
+SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
+SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
 
 inherit pypi setuptools3
 
-- 
2.17.1

