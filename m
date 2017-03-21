Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0F5777A2C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:44 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 81so15584752pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UED+Ei8evkPH8bzOfiaJeLbTWymKNasUAuFO/wjRuG8=;
	b=CbWAT/DbbjFjgq/W11ND4mn1dShG62wPYOSQ10+2+oS66WIledSYsGOwC78kDR35LT
	FaYyP9AIqs+hvn1CnCYngjveaMHwJ0noZ9U5qPHnUSQbFXPO05XgwZqUKm6yMTSqo8lu
	MrA4bV/CjA51lW7cMt0MNJdtoM93bB6XPw1ACXUGKa0pH90fHkA3o+TGJ7C7cIWECI3i
	WQ2JmK/I+mO8YmzZ3eT9MOTXb3QPDSjjSBRTq21ZHg+jnaS2OUOb8LB7ts9+tpgMk/uX
	B9tHT5bzYQHqlB4yNEOidO4q9MSHoixXHza+MEE3Akh+Cx43MogiYsiMPPuyFrBSCwGU
	tP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UED+Ei8evkPH8bzOfiaJeLbTWymKNasUAuFO/wjRuG8=;
	b=T+bTHe8oVTZYyfEZONv43h+Y2Ce9LYXqyNIf7qfyu98vMIFgri1jsXwpaNraG8Bb3N
	bVD7VayClBrUnU+wrPiLN+v/6voAOCThUzy+NhGKebIUsBPSUMer3gp6vNWeziIIyEOm
	x371i3LVKoNrjizripCvdnhCZ4qPUlsJGnZGHyApC/CDC1ToEXdBUqqdNCb0Gfmcslas
	dBZYYeyn/MZAbN5OXOZHVkEqylzW7pOn321PobY0TnA4aa+WvjvKjZYQz0KhuAs3hJhd
	t32//Ykp8eaBKcEeDKqKDDSK8x51Bxs/IIhb2PO0CwQk6vpNTSfK9voa5YncQQn71Kkx
	SMeA==
X-Gm-Message-State: AFeK/H3q+++3O73gPZHNfFOOkzbIIe+u3SF6wI49bAQDg/XmRsDqxiOi6frl+B1BKNA4CQ==
X-Received: by 10.84.214.129 with SMTP id j1mr45963295pli.23.1490077966225;
	Mon, 20 Mar 2017 23:32:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:26 -0700
Message-Id: <20170321063227.11565-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] lio-utils: Fix GNU_HASH QA errors
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...espect-environment-variables-and-add-LDFL.patch | 61 ++++++++++++++++++++++
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch

diff --git a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch b/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch
new file mode 100644
index 000000000..9608b7e75
--- /dev/null
+++ b/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch
@@ -0,0 +1,61 @@
+From 2cc2315eecaa48fd24792aaa889dc7d9fb96978b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2017 22:18:44 -0700
+Subject: [PATCH] Makefiles: Respect environment variables and add LDFLAGS to
+ linker cmdline
+
+Fixes QA errors about GNU_HASH
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mib-modules/Makefile | 10 +++++-----
+ tools/Makefile       |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/mib-modules/Makefile b/mib-modules/Makefile
+index 0d54c9b..051d4d2 100644
+--- a/mib-modules/Makefile
++++ b/mib-modules/Makefile
+@@ -17,13 +17,13 @@ TARG		= iscsiTargetMib.so
+ OBJS		= iscsiTargetMib.o iscsiMib.o scsiMib.o ipsAuthMib.o \
+ 		iscsiAuthData.o
+ 
+-CC		= gcc
+-CFLAGS		= -I$(INCLDIR) -I$(INCLDIR)/agent -I$(INCLDIR)/agent/mibgroup -shared -fPIC
++CC		?= gcc
++CFLAGS		+= -I$(INCLDIR) -I$(INCLDIR)/agent -I$(INCLDIR)/agent/mibgroup -shared -fPIC
+ CFLAGS		+= -I../include -Wall -Werror
+ #CFLAGS		+=$(AUTO_CFLAGS)
+ 
+-LD		= gcc -shared
+-
++LD		?= gcc
++LDFLAGS		+= -shared
+ INSTALL		= install
+ 
+ all: $(TARG)
+@@ -32,7 +32,7 @@ all: $(TARG)
+ 	$(CC) $(CFLAGS) -o $@ -c $<
+ 
+ $(TARG): $(OBJS)
+-	$(LD) -o $@ $(OBJS)
++	$(LD) -o $@ $(OBJS) $(LDFLAGS)
+ 
+ clean:
+ 	rm -f $(OBJS) $(TARG)
+diff --git a/tools/Makefile b/tools/Makefile
+index 79ed3cd..ffd9bf3 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -6,7 +6,7 @@ ISCSI_NAME_OBJS      = $(ISCSI_NAME_SRCS:.c=.o)
+ all:: $(ISCSI_NAME) 
+ 
+ $(ISCSI_NAME): $(ISCSI_NAME_OBJS)
+-	$(CC) -o $@ $(CFLAGS) $(ISCSI_NAME_OBJS) 
++	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(ISCSI_NAME_OBJS) 
+ 
+ clean:
+ 	rm -f $(ISCSI_NAME_OBJS) $(ISCSI_NAME) 
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 35ba16141..3a6319c31 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=c3ea231a32635cbb5debedf3e88aa3df
 
 PV = "4.1+git${SRCPV}"
 
-SRC_URI = "git://risingtidesystems.com/lio-utils.git"
+SRC_URI = "git://risingtidesystems.com/lio-utils.git \
+           file://0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch \
+           "
 SRCREV = "28bd928655bdc7bd3cf380f0196630690c51e05f"
 S = "${WORKDIR}/git"
 
-- 
2.12.0


