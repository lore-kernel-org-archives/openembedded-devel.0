Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CFC827DFD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450J642yDZz79
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 18:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557417788;
	bh=TrT8/NwBcl1ly4u1c9V7FZ+96gXK3nPkEWJxTBJr1xc=;
	h=From:To:Subject:Date:From;
	b=Q4dgnOxOE/lIBpisqDyREbIT7hEZPjrTMBPRvIYKuSpHZjMdbZBglm4ptB5+BKOVd
	IetvAvOSP9VNKeA7URAbRoUGpLBgxFbA/TaT1SzivvQikg2JFBolCnxiS4nG8/wdc4
	qosD5l47z68OH5knlNi1bFPH4OBv3aEaR0HQ9H39UBU6/ZcrtVfLoYFbevZUg6vrFI
	pmgf3x5PkWmtqV2dnRAMlcnkjPvZGKrVkZctJ6Klre1++4n2jwe0edaoGrtYhfwhpy
	f2fgHAB44+TTBEXCfxtBbaRQwx3aPYhwhGvqWOJdLihcyeXOVI4NrMRaGPPoZtnw8R
	RRgIe4VVhQiZWQ9FoOGXnIilRlT+F49Hp+EWjLh5Tr9qTJ3UcBQ/uC5HkXzJV44AV3
	pK0dpGPtes4kmigmlpSrJDNCIN6ORrGuE1uVrHqwzNYlzV6pabvL3Hguj7lff1pNhM
	ayItnnjxBifQsVM4+Rqf1X+1ZbUEnSjH7vRsGUaKY+j9g9qT69tRZ3a8zhYjghhBM4
	tfJhViRvXPKUX6Ae1bAQybIGwJ5fE7C1oHhazPJz9T/wDL6mRMOiBTJK5whRzj49nZ
	C9sZBjnxEW5mV/AvKNo6IsYQOw/TWSrvY6K5DwF28xD9MP3Rj8lSeajmHpy4HwnaZe
	Zxfk3zNjf7LUghkXyVvDMXYE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 19:03:05 +0300
Message-Id: <20190509160306.857-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] pptp-linux: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Thu, 09 May 2019 16:03:08 -0000

Remove patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-include-missing-sys-types.h.patch    | 28 -------------------
 ...tp-linux_1.9.0.bb => pptp-linux_1.10.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch
 rename meta-networking/recipes-protocols/pptp-linux/{pptp-linux_1.9.0.bb => pptp-linux_1.10.0.bb} (82%)

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch b/meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch
deleted file mode 100644
index 804bf1234..000000000
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f6c4d2468ae0dadd2f35680d61b98b2a59077328 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jul 2017 10:31:03 -0700
-Subject: [PATCH] include missing sys/types.h
-
-Fixes errors seen on musl
-pqueue.h:21:3: error: unknown type name 'u_int32_t'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pqueue.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pqueue.h b/pqueue.h
-index c37ba7b..ae4cc6a 100644
---- a/pqueue.h
-+++ b/pqueue.h
-@@ -3,6 +3,7 @@
- 
- #include <time.h>
- #include <sys/time.h>
-+#include <sys/types.h>
- 
- /* wait this many seconds for missing packets before forgetting about them */
- #define DEFAULT_PACKET_TIMEOUT 0.3
--- 
-2.13.2
-
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.9.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
similarity index 82%
rename from meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.9.0.bb
rename to meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
index 10c9170fb..322158146 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.9.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
@@ -11,11 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
            file://options.pptp \
-           file://0001-include-missing-sys-types.h.patch \
            "
 
-SRC_URI[md5sum] = "b2117b377f65294a9786f80f0235d308"
-SRC_URI[sha256sum] = "0b1e8cbfc578d3f5ab12ee87c5c2c60419abfe9cc445690a8a19c320b11c9201"
+SRC_URI[md5sum] = "8d25341352fdae5ad5b36b9f18254908"
+SRC_URI[sha256sum] = "82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c553ec7093aefb5af4"
 
 S = "${WORKDIR}/pptp-${PV}"
 
-- 
2.17.1


