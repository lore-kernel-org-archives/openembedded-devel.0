Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14347.1592822170909206618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJo7-0005ty-N7; Mon, 22 Jun 2020 13:36:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-requests-file: Upgrade 1.4.3 -> 1.5.1
Date: Mon, 22 Jun 2020 13:35:37 +0300
Message-Id: <20200622103542.27830-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.1:

- Add set_content_length flag to disable on demand setting
  Content-Length
- Fix python 2.7 compatibility
- Rename test file for pytest
- Add tests via github actions
- Format code with black

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-requests-file_1.4.3.bb => python3-requests-file_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-file_1.4.3.bb => python3-requests-file_1.5.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
index 0407779da..1c8bba40d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/dashea/requests-file"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 
-SRC_URI[md5sum] = "470711c9b7e0de1057f7b72a58b7ab51"
-SRC_URI[sha256sum] = "8f04aa6201bacda0567e7ac7f677f1499b0fc76b22140c54bc06edf1ba92e2fa"
+SRC_URI[md5sum] = "c96daf6b0c56687556e8a52748fd896c"
+SRC_URI[sha256sum] = "07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

