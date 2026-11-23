Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48047.1795411880985441918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Rg0W/XNq;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38692f62b22so1251243eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411880; x=1796016680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/B6yJPSfm/3GHWLKLaMSradbIg8d62+eMyWYrzygrw=;
        b=Rg0W/XNq26pzv6zMSfLuG2sIzufo43++34As/XbDgwi8wasFmlXbynmjDw94W3uz1R
         y0ZaQgKAcb4oppAtlRjdvnj8nEp+N4C7JFa7+8ADF1Bas354tmlyDdPsSrChZL/fTape
         WVi0TwyK1I3JJ6tN+MfwC4BRgBN4mIkZu+7+7LhfZDrqvailg0Ijrz61Bb7t3I6xafF2
         BeTIhfm8hk6MrjuXFo+RRq8T7T6TlsjieolQZEAWNFe9cfzHh3LPTnn+lAn1oTzWjjo1
         BUBzfF4Ati8TuEGOVstFzlvvYUUcvuM9rZZkuj1BwShS6v0Wv3PAglSc63uhkd3201P7
         K1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411880; x=1796016680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/B6yJPSfm/3GHWLKLaMSradbIg8d62+eMyWYrzygrw=;
        b=iks10PHSCFwS0mdVjgoc6VRxQPgdiY/94XL+wjBhgBtGjEsQhkmp3c7HAlvxTscDug
         WjA6RtZZlvhOyad2HFwFHzTU+055NnhKhIZe0TA/kGJlPfNMBJLSFZOZSrY26V2Z16R4
         dc96HRaCbDr9Nz99NCmlLffPhYFZix9Xn5hQd1PcaD15t5FlmsaiZaVtd/dwgwAvQUs5
         0NePMhsbQhE6YeInAsJdQ60/tk+nT/LlOAP7KZkCZFjvdgxcsT1pXEkz2Wk7Sd2PK63d
         52OsIyHebC4/4bKQ6tnU9DY+jNK/vNrCMqzbfyr8VYJkf/mq4QRexNQujrAb+IVKefSF
         SbXg==
X-Gm-Message-State: APuU4Z8xVCZyeu39SoGFd3ARWFZAEfHZgCthIHeiTPx0OE2UJTASQX/e
	YgNrl92KOAIcPvrnBpqM0+gcMo6T9cTsPRT2dhMQvRP11E6QfZqzqmKoyliHj3WEKDA=
X-Gm-Gg: AZFdTZe3qwadZJpBBWp2Rjfzo2DeFb8KahKP8r7MKQZvtz9tatixYB1AdxbAZZ+pBZY
	Mv75DBH2RAaq1C7+Vu+ubYcljYFGrR7kZQ3YFASRd3TkvJ01/GG8fY56CdD70IxKJG3PNnDJaiq
	AndKjhl07YEXe2mNFrSfFNZzbaOoIdhGFTTK5DDPxBfgxlP5giCK7id2/v327co4HABoAD98s4e
	tGkHlolioipiRZRXw6grc7bYpvkh5NvwoUleNPQHJKz+2MEQg8IrPWoXlGDH1rzuMaQejhxqEnN
	pat/TW1xl7E1tmDweDLLxt6pvQ2wIf0XWNLfFVbxFo4A/fcospGNPaBrGhXxXjYex081xg6L69q
	MAwd048wSuCEcZuP30f8eBi0fJYkceEpTqOw7OO8fe63F3+mHIgNF3jfkRzRS4mp72MFtc+XDZT
	MBQ0WY1grsEK0fN4xYfVdtW5BXvVmNY3pu+7W1GNmxZNsUYWBJueA3xDlbhKcBzIMmxFUxgCqPg
	aWN2F+mftbjuq/ij1IkRYqor3HMeR58qpvOCRAjXBd6CJOl2DYOXNR/OAwU4KcCbsfzZKpP67Z6
	EzvayYPRmNnnGGJazvzfRxENI3s9jIL3hcV6soehIfgNEpMHMLPmB4w8/8GjEb4Ntp4gYOenQYt
	EpUBIouCG+mcPKjflLnALpkImmVRe6biX8PVwwLFAKWaSBd3R0pWSR0ThE2OusyNxNJ+Ty6pdIc
	jYTN2RrkawuonVJMSy1vTeG+Nl7RPe2wGVt1oqI0q6KoX1NllnuE7cMleVeOyuw7/WYZYNWTivy
	GCUddrHZ20JBJJXf5bRuCW6Cz2wj905vWBGpAbr0T1Yrl64e6HFp+Dwnqb+QvP4mPffSNE6jP+n
	iMmx
X-Received: by 2002:a05:7300:f0c2:b0:386:688:7f25 with SMTP id 5a478bee46e88-386068880f5mr10023495eec.18.1795411880268;
        Sun, 22 Nov 2026 21:31:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 41/42] libsmi: Fix a parallel build race between bison and flex
Date: Sun, 22 Nov 2026 21:29:25 -0800
Message-ID: <20261123052953.3658549-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132856
Content-Type: text/plain; charset="utf-8"

Only the smi bison rule names its parser-*.tab.h header as an output, so
under parallel make scanner-yang.c could be generated and compiled while
bison was still rewriting parser-yang.tab.h, failing with "unknown type
name YYSTYPE". The recipe regenerates the parsers on every build, since a
patch touches parser-yang.y. Make each header depend on its parser.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...the-scanners-after-the-bison-headers.patch | 41 +++++++++++++++++++
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch

diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch
new file mode 100644
index 0000000000..2c86975617
--- /dev/null
+++ b/meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch
@@ -0,0 +1,41 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 22 Nov 2026 00:00:00 -0800
+Subject: [PATCH] lib/Makefile.am: order the scanners after the bison headers
+
+bison writes parser-*.tab.h together with parser-*.c, but only the smi
+rule names the header as an output, and that one as a second independent
+target, which can run bison twice. For sming and yang make has no rule
+for the header at all, so a scanner that includes it can be generated and
+compiled while bison is still rewriting it. Under parallel make this
+fails with errors such as "unknown type name 'YYSTYPE'" in
+scanner-yang.c.
+
+Make each header depend on its parser with no recipe of its own, so
+everything that needs a header waits for bison to finish.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/Makefile.am | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -45,9 +45,14 @@
+ 		  	  parser-yang.c scanner-yang.c
+ libsmi_la_LDFLAGS	= -version-info @VERSION_LIBTOOL@
+ 
+-parser-smi.c parser-smi.tab.h: parser-smi.y scanner-smi.h parser-smi.h error.h
++parser-smi.c: parser-smi.y scanner-smi.h parser-smi.h error.h
+ 	$(BISON) --defines=parser-smi.tab.h -t -psmi -o parser-smi.c parser-smi.y
+ 
++# bison writes the .tab.h headers together with the parsers
++parser-smi.tab.h: parser-smi.c
++parser-sming.tab.h: parser-sming.c
++parser-yang.tab.h: parser-yang.c
++
+ parser-sming.c: parser-sming.y scanner-sming.h parser-sming.h error.h
+ 	$(BISON) --defines=parser-sming.tab.h -t -psming -o parser-sming.c parser-sming.y
+ 
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index b57e9201c8..d5b49aaf59 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://0001-Define-createIdentifierRef-prototype-in-yang-complex.patch \
            file://0001-parser-yang-Define-_DEFAULT_SOURCE.patch \
            file://0001-Fix-build-failure-with-gcc-15.patch \
+           file://0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch \
           "
 
 SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
