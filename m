Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63ABD7F2B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:24 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id a24so6340666pgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PEqWDfRXHEVSLWj+xyD1p4p+vkFidV8qcfM21hdbrYs=;
	b=FbmZejubUIgelsr7QXlVXYm2JLn2JStrl8JAQ3JcHI9N+xXd/8nGo/nYNoHSacwTKf
	BGS7xkxt5MDbuIakklMUy5RTC2PuokYir1HqLpNC2R2rH7KComao1ZlbN3eReOlrPy9L
	bHdSO2yIPVh0svrSz4hD/ejk0yKnG6D4YOm1Ap24KwUjzEINyD6L1NFUQ7pcqcu6yWov
	8p+zOudvpFpqJrSC6pcljzLJ8TIvwqwxW9CzrSshixZ+GdIOSsqf7FvEVdfCeKrUzx7R
	7ESmpDjbWel8z+zfC+ERvaNHbk6VEm3hPXL95qiU0owzvU4Y4t3BXEyf/+JAeqwipluk
	OsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PEqWDfRXHEVSLWj+xyD1p4p+vkFidV8qcfM21hdbrYs=;
	b=YNhYN0kZ5+49AKhR/JRgjPAw4gTXUEo0T5SPVSK1yA/jHG3O37AkkmmfdG7H9ZsIrt
	gFUVRxXdsh85CIKrTU6uVofaPbHr1nyqqNK0Mp2+Lsf12lBgJ73SnDZ8DH5kunXPolVD
	Gt8lhrqR9LN0dLIim3tawmUUuYGPkHdPcwLzbtRmV/AfcdJqdvfyZ11l/Gbd6PDYvOZf
	LyYixiN9SHaQZNHp2IlspMafSRjDNNwlejeU3R+yO/P54hsQTdVC/iOj/XCIzbtstxyr
	G/bp/Y7fMZjpSMFeoBF1n2oyWk4ns3PjEqRw/trTa1AsQCX0SP+p72W0fEtXF7bh+gbX
	5jxw==
X-Gm-Message-State: APjAAAWDDznKsUAwNjpEogn3sGSJVHSwo7Icj8WpXB3xXTpkSrzb/oKr
	b6C3UO1kjPiVtVefvLz8HC7kg0tSHiI=
X-Google-Smtp-Source: APXvYqwZhc1X3gTo+6xbkmwZGkkJF20ImNUnYcT+raBaj2BXchYLwX3iigqzNYK4K1uZeSk7o/Eltw==
X-Received: by 2002:a62:8749:: with SMTP id i70mr17604449pfe.12.1569801325332; 
	Sun, 29 Sep 2019 16:55:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:06 -0700
Message-Id: <d18181125c6024b1e170c46988c42261f5ab2ee5.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 08/10] linux-atm: Fix build with kernel headers 5.2+
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:24 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dff93352c83660f965771a3dc91f39ff23b685c5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...mdump-Include-linux-sockios.h-for-SIOCGST.patch | 59 ++++++++++++++++++++++
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
new file mode 100644
index 0000000..a54869d
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
@@ -0,0 +1,59 @@
+From 4456e13880803a300e4b6f263ad22a37481b5df5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 09:33:43 -0700
+Subject: [PATCH] saaldump,atmdump: Include linux/sockios.h for SIOCGSTAMP
+
+In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
+the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
+Instead it provides only SIOCGSTAMP_OLD.
+
+The linux/sockios.h header now defines SIOCGSTAMP using either
+SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
+header file is not pulled so we get a build failure.
+
+Fixes
+../../../linux-atm-2.5.2/src/maint/atmdump.c:142:18: error: use of undeclared identifier 'SIOCGSTAMP'
+            if (ioctl(s,SIOCGSTAMP,&stamp) < 0) {
+                        ^
+1 error generated.
+make[3]: *** [Makefile:623: atmdump.o] Error 1
+make[3]: *** Waiting for unfinished jobs....
+../../../linux-atm-2.5.2/src/maint/saaldump.c:169:14: error: use of undeclared identifier 'SIOCGSTAMP'
+        if (ioctl(s,SIOCGSTAMP,&stamp) < 0) {
+                    ^
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/maint/atmdump.c  | 2 +-
+ src/maint/saaldump.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/maint/atmdump.c b/src/maint/atmdump.c
+index 8b17826..9e4853b 100644
+--- a/src/maint/atmdump.c
++++ b/src/maint/atmdump.c
+@@ -5,7 +5,7 @@
+ #if HAVE_CONFIG_H
+ #include <config.h>
+ #endif
+-
++#include <linux/sockios.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <unistd.h>
+diff --git a/src/maint/saaldump.c b/src/maint/saaldump.c
+index 83bdde9..69429a8 100644
+--- a/src/maint/saaldump.c
++++ b/src/maint/saaldump.c
+@@ -5,7 +5,7 @@
+ #if HAVE_CONFIG_H
+ #include <config.h>
+ #endif
+-
++#include <linux/sockios.h>
+ #include <stdlib.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+-- 
+2.23.0
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 9ed7ca6..e594906 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0001-ttcp-Add-printf-format-string.patch \
            file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
            file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
+           file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
 "
 
 SRC_URI_append_libc-musl = " file://musl-no-on_exit.patch"
-- 
2.7.4


