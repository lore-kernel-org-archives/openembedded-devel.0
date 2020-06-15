Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.17077.1592225376526597811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkoYP-00028F-2E; Mon, 15 Jun 2020 15:49:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-protobuf: Upgrade 3.11.3 -> 3.12.2
Date: Mon, 15 Jun 2020 15:49:26 +0300
Message-Id: <20200615124926.19597-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to relase 3.12.2. Depends on the upgrade of protobuf
to 3.12.3 in meta-oe. The new release for Python brings:

- [experimental] Added proto3 presence support.
- [experimental] fast import protobuf module, only works with cpp
  generated code linked in.
- Truncate 'float' fields to 4 bytes of precision in setters for
  pure-Python implementation.
- Fixed a memory leak in C++ bindings.
- Added a deprecation warning when code tries to create Descriptor
  objects directly.
- Fix unintended comparison between bytes and string in
  descriptor.py.
- Avoid printing excess digits for float fields in TextFormat.
- Remove Python 2.5 syntax compatibility from the proto compiler
  generated _pb2.py module code.
- Drop 3.3, 3.4 and use single version docker images for all python
  tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-protobuf_3.11.3.bb => python3-protobuf_3.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.11.3.bb => python3-protobuf_3.12.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
index a4c9d6699..03d0b0c60 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "eeda7dea65fc94e560fc9a8180eb1872"
-SRC_URI[sha256sum] = "c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f"
+SRC_URI[md5sum] = "b4336acee38ebe915b6e72fe8c5bce7b"
+SRC_URI[sha256sum] = "49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.17.1

