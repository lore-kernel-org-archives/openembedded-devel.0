Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7FB608B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:09:30 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id c4so7371656wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 01:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CdTuG1udxNCzO3Q/r0TWi4BOXVGyCvTqpVjPaI7bnH0=;
	b=qAJsadLTQEb+SM4n7y3hmkyLt5s8fKTsVsTjlYlF4lvtQhMXVIWk+e5vldT7JIXBQV
	Qx2WNe0CJZCihCVSSg6ZDllZB7/onnT5c5oE+83lbAyvqHloROX/lbkvxKB1RcbL/dUs
	TUjaUfE8wKmVCHQzzoH6j+fwJAsogWgimBWPHXx5LRu9Wu9iliU3uOQfGugHmKwH29S6
	J5X+Xzg8MD296e6I8AYvzYkcAW8FFxKMNFB9oUztrardBVq7GdU+KJWKu5cX5XzVp1N/
	lY/8kbFzwiMq/bldvGXR+FCfC9gIKDZOYdwByEJCGIkxmMPPpWOj+jU1su6m7ksKJjrA
	3dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CdTuG1udxNCzO3Q/r0TWi4BOXVGyCvTqpVjPaI7bnH0=;
	b=VkS1GpBtxHClhkLnOMTv9QT+H927ypxBdL3Tu6aApfhNtKOHHqcE+SToEKzBcbjyai
	vKDGBb9RimGgbjb1/JhUevEyD4O0XyUSR6qQQyTSeSzSS0xTSeRgwV6if9KuuSogNLOr
	HC3Vm8eoPdR0XZ26ULIw3iFrpDtaqac5WUybDnQFD7Ibdudiqs9UDk+KpJRVZsb42fy5
	DYUSHB/ZTG33KNewx7JJdgMVkpvmkXZWOAlVfXAlG68MmgFoJvvofIG46tDyi2x22Z7i
	/HozursEhvmlIwSSDMXleDiK88pkqq/SNT9Zu4d0hMu1PNGZrMbIIm8uLXhZt0mS3k/v
	Pc8Q==
X-Gm-Message-State: AMke39ljQ/lGMnUxn58b0BJKqKH8W4YEc+0ub2+ofID/uYd4gwpOCn6C3UIX/3rTepzTnQ==
X-Received: by 10.223.135.146 with SMTP id b18mr23477366wrb.189.1487063370715; 
	Tue, 14 Feb 2017 01:09:30 -0800 (PST)
Received: from localhost.localdomain (ip-213-127-11-0.ip.prioritytelecom.net.
	[213.127.11.0]) by smtp.gmail.com with ESMTPSA id
	o59sm13994358wrc.56.2017.02.14.01.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 01:09:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 01:09:22 -0800
Message-Id: <1487063362-26334-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libuv: update 1.10.2 -> 1.11.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2017 09:09:31 -0000

Also add support for -native and remove redundent definition of S.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../libuv/{libuv_1.10.2.bb => libuv_1.11.0.bb}                 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.10.2.bb => libuv_1.11.0.bb} (61%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
similarity index 61%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
index fbdbeaa..592c3a8 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
@@ -4,12 +4,10 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
 
-SRC_URI = "https://github.com/libuv/${PN}/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/libuv/${BPN}/archive/v${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6e16d1d1ca464add0730d637effb1c1c"
-SRC_URI[sha256sum] = "2d740a2adea0f1a19058626f55a076ac41a4ac1f95d4e57cae0c8a634a6cd63b"
-
-S = "${WORKDIR}/${PN}-${PV}"
+SRC_URI[md5sum] = "15550a9f5f45f7f32ae2d9bb0a21a2a7"
+SRC_URI[sha256sum] = "6ec7eec6ecc24b1a8ffedebedb2fe9313fffb5410de89aaf784dd01080411c7a"
 
 inherit autotools
 
@@ -17,3 +15,5 @@ do_configure() {
     ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
     oe_runconf
 }
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


