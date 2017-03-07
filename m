Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A11E573109
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:09 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 187so8406048pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ztD2fVkoTHcJXToxjCp6ZkWNEsEhbFiLf/Xqiw0vihs=;
	b=UC7Ktp5X32YToioCbnCTxv6ju+BTiiazYKFlxw85zxZ/5ZoYYmqhkCsgrWJT8U49La
	Rh0whvTf3UVhZsgaqJd+q3xa29ETPn8eqEcsyK2UuzU6/y3c1vYycZrM7h50XqudMOqW
	urJAXFkaPAwz4V0O7MQ4WDvw2nvNapG6ChH6n64OyEBgef97bJdOBxf7w75C80l1NTWT
	rG57bw8tkT+QfomLLdJZ2O185wGRlRCr12Qne/o8R50PvhRAGWWEyIgCcsTev/jpH/Kv
	hMksjuj9kJLWhSbDSO9xjTX2q5DlV2MlGpuW8IoEwEDzOEE7ETcGaqP2TilX7KSDjHPL
	XKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ztD2fVkoTHcJXToxjCp6ZkWNEsEhbFiLf/Xqiw0vihs=;
	b=d54WRkfE7qvnM4iPi0PiGF4u2+4yqGydEkB4MUm/3jJDl1TJ+XzvWd80xuB5UrA0lw
	41B5uVB8loAzyI36WGF8O8noRN5P7DpqKTfXLnak06i30yuupOcRzOGRRnFWAQ0lRGIY
	cawvs7I/vOVJh2NMuHpMrpmuGtQza/AhFIkNK0IcIaa2PekeZvaljRuXJBaVyhJBzQFz
	F6BHUFg/+A9a24ElT6oIfgM7QjT/IEcx7rWY40SQASt53GTff7Ez7iv6C4U5DIRllOru
	HZuBCPt0wp/1HfZR7mntVQY25MMQFBiQB5ydGwepBfrouBTEZvBvNFfsId1pjbvi1NGx
	sUtQ==
X-Gm-Message-State: AMke39ly7VT4qtGKDO/yKCSjnMdGVkHyBCPTNxE+jpP3CPRRVzNEJ6JhtJHpnpHFNTvt+w==
X-Received: by 10.99.157.2 with SMTP id i2mr9078690pgd.139.1488870851268;
	Mon, 06 Mar 2017 23:14:11 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:48 -0800
Message-Id: <20170307071349.16444-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/14] iptraf: Fix build with clang
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../iptraf/iptraf/format_string.patch              | 31 +++++++++++++++++++
 .../recipes-devtools/iptraf/iptraf/ldopts.patch    | 35 ++++++++++++++++++++++
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb    |  7 +++--
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch b/meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
new file mode 100644
index 000000000..5f96f0f4c
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf/format_string.patch
@@ -0,0 +1,31 @@
+Index: iptraf-3.0.0/src/othptab.c
+===================================================================
+--- iptraf-3.0.0.orig/src/othptab.c
++++ iptraf-3.0.0/src/othptab.c
+@@ -335,7 +335,7 @@ void printothpentry(struct othptable *ta
+                 break;
+             }
+ 
+-            sprintf(scratchpad, inet_ntoa(saddr));
++            sprintf(scratchpad, "%s", inet_ntoa(saddr));
+             strcat(msgstring, scratchpad);
+             wattrset(table->othpwin, ARPATTR);
+             break;
+@@ -354,7 +354,7 @@ void printothpentry(struct othptable *ta
+                 break;
+             }
+ 
+-            sprintf(scratchpad, rarp_mac_addr);
++            sprintf(scratchpad, "%s", rarp_mac_addr);
+             strcat(msgstring, scratchpad);
+             wattrset(table->othpwin, ARPATTR);
+             break;
+@@ -421,7 +421,7 @@ void printothpentry(struct othptable *ta
+         wattrset(table->othpwin, UNKNIPATTR);
+         protptr = getprotobynumber(entry->protocol);
+         if (protptr != NULL) {
+-            sprintf(protname, protptr->p_aliases[0]);
++            sprintf(protname, "%s", protptr->p_aliases[0]);
+         } else {
+             sprintf(protname, "IP protocol");
+             unknown = 1;
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch b/meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch
new file mode 100644
index 000000000..c84a0a0ad
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf/ldopts.patch
@@ -0,0 +1,35 @@
+Index: iptraf-3.0.0/src/Makefile
+===================================================================
+--- iptraf-3.0.0.orig/src/Makefile
++++ iptraf-3.0.0/src/Makefile
+@@ -5,7 +5,7 @@
+ #
+ # Architecture determination string borrowed from the kernel makefile.
+ #
+-ARCH 		:= $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
++ARCH 		?= $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
+ 			-e s/arm.*/arm/ -e s/sa110/arm/)
+ PLATFORM 	= -DPLATFORM=\"$(shell uname -s)/$(ARCH)\"
+ VERNUMBER	:= $(shell cat version)
+@@ -17,7 +17,7 @@ VERSION 	= -DVERSION=\"$(VERNUMBER)\"
+ #
+ BINDIR		= ../../iptraf-$(VERNUMBER).bin.$(ARCH)
+ 
+-CC		= gcc
++CC		= $(CC)
+ LIBS		= -L../support -ltextbox -lpanel -lncurses   # in this order!
+ 
+ # comment this one out to omit debug code when done.
+@@ -31,10 +31,10 @@ PROF		= #-pg
+ # options to be passed to the compiler.  I don't believe they need to be
+ # modified (except for -m486 on non-Intel x86 platforms).
+ 
+-CFLAGS		= -Wall #-O2 #-m486
++CFLAGS		?= -Wall #-O2 #-m486
+ DIRS		= -DWORKDIR=\"$(WORKDIR)\" \
+ 		  -DLOGDIR=\"$(LOGDIR)\" -DEXECDIR=\"$(TARGET)\"
+-LDOPTS		= #-static
++LDOPTS		?= #-static
+ 
+ # you may want to change this to point to your ncurses include directory
+ # if the ncurses include files are not in the default location.
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
index e7a406fc5..abfab02e0 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
@@ -12,12 +12,15 @@ DEPENDS = "ncurses"
 
 SRC_URI = " \
     ftp://iptraf.seul.org/pub/iptraf/iptraf-3.0.0.tar.gz \
-    file://0001-src-Fix-error-in-cross-compile.patch"
+    file://0001-src-Fix-error-in-cross-compile.patch \
+    file://format_string.patch \
+    file://ldopts.patch \
+"
 SRC_URI[md5sum] = "377371c28ee3c21a76f7024920649ea8"
 SRC_URI[sha256sum] = "9ee433d95573d612539da4b452e6cdcbca6ab6674a88bfbf6eaf12d4902b5163"
 RDEPENDS_${PN} = "ncurses"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "-e MAKEFLAGS= LDOPTS='${LDFLAGS}' ARCH='${TARGET_ARCH}'"
 
 do_compile() {
     oe_runmake -C src all
-- 
2.12.0


