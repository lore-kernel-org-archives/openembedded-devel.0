Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3911.1794729116770651905
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Oisms4Xi;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so2338857eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729116; x=1795333916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/sqBZd2wuP1xvACxp4axhMeV1r0sC2fGSWpRUNJM8M=;
        b=Oisms4Xi9KBgg0uOA+bra9GkE2lsqD68vusNAZRrIrQxLAupF1VKbvy3ynFmA2Ve4r
         GcoT1InnKKtIqUC6RIdiSQL2IgSpq/H978OHgR09/TXHCY+EHiCKPuXBvun59dTNFY/M
         /sype1jP+QvG/OIdaglVSJWG/n8yu+wm1g9TPMZpBCYEDy35G0nBgGjYlJfMNGfCZX4S
         k0bw4mGlmlwt5JjAssGzijJPFG+kAX0OwM2Ckzbg12aaPU4VBL1zsOVhKlyXzfVdfbkT
         rdJ8IFVA6T+pl53TVoz1YKcvdGxnToTNA5x3ILtWh9dU3Uj80QKEO1ntfcIYHBp8o8cw
         TgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729116; x=1795333916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/sqBZd2wuP1xvACxp4axhMeV1r0sC2fGSWpRUNJM8M=;
        b=WGIkfwuLSB4FxU1+cF0s+r5RpWapBnpE0T8vgd4QvTNu2gg0YLGQSrN80ubOFt6ADo
         0h76j2cq6lp+vNH1Or6a+cC9/j/cyixqv5enXHSDRUxkkYQpPT+QTtdegG3cg6LTlX/W
         tLx1xzYcJTELnWrymfgdqrheKPjUsVo+qumhzM0LTB3BT3iLYg9mxj3pYu8Oi96s5AKR
         9LLN8wgksWPa5VWEQXKZ3awSSdnFInt8/2W0zuXihEUngjTqzTvIc22bQBSNOo+fOgkp
         5dg5jhSedYx/rQ/2MgTyNX2ok7E0jIk8lHQGwhr1N052zyb2Ue7+MCktN+Bmy42RlsuU
         Dcgg==
X-Gm-Message-State: APuU4Z+OZSEOhM8RVY0mz+O4v15HVIjRjsPdoW6/09yEDqO44QL7IFw8
	KuH7umMrZ4Ku+RrJ/Iqh1RrcsrGUqmhqF7DRDzRbONEUFgKOdzbx7kypz9eTtVUj
X-Gm-Gg: AYBFou3SP5QjYDiR5ImYLD5CnHFjov0pT75Ultc8+9k7qdXsTC+pOwwIiHR2ipVN4FO
	NHbrDLERgen2oYtWro9obR/uz3yTnQ6IU/uCAckzOwiIOqW9nTmtdk6JWkwoSGsSSjoKV396In5
	/MceQCe29KL7hZ37H6iR6hot6DpeaKU0XqZNm1PeBoI+t66sZ9+CSTugc4FL7EhxWuM0gMrO/MH
	Ixbf7PGE5//sPg36iZAsHYSelddcl73rQpcoJzsPBoxb3/2FkQsnobrXijv9C1crsL/otC2iTnq
	rfm9qxknU2R186qZ7w4WXIF48OzVT2v+mPBBR+0hKaAALS4X8lOVJxdcaFHDuLHZXM1kNa0Yr+U
	FwjM4DjVl9OtcbV+ufeT8rNUIZ85+6utCx0OTssFKnJbPRnDIKckP7Fx4gdivmPC9LtmLt6OabR
	NJ4h4xCR6PZ3BMZfkN5B480aA40RpYHmpXdouPynaj9F0tD3HgQ1pPrZpaRLrkAz4Ot68Gyc7RG
	wZEvmqdU+AY99SEBOepw8yR7C7WOx9oGPDlI0dJN7wnNjOvYNswuWcxDWC/kSfqx1zbDg6sueUA
	TZ/kAMWHp8mZwx20mt/J45tSdK/aG1Tldp9bNP7t+CicJ3a0v86dC2hmNs3YmyuT9SpuILoXbGQ
	dULIWXN6nVs7H1ZDH72xTm/Ncm4TAgbMHGLd1f+hOVXGF44G2Ui90HuFP4UoOBeU01dxsK57m5u
	JgecRiE6ZJorT02JF56lBbr3EAXyibjfyih4tU14CkdrC8ArQLF6H6xLUPBQ69Sxd+1nwqhJQmt
	DU4f0k+MEZPavZrGBuJEniswwr5LMVS8B8rkoxA+ZCQNJu9fcSZyF27ow1vS8HNUdzjcGoClrE8
	sXMf
X-Received: by 2002:a05:693c:4099:b0:376:89a4:d0f4 with SMTP id 5a478bee46e88-37966093f2amr8068971eec.6.1794729116184;
        Sat, 14 Nov 2026 23:51:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 95/96] libcupsfilters: Do not run gen-lorem-text during build
Date: Sat, 14 Nov 2026 23:49:13 -0800
Message-ID: <20261115074918.2932593-95-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132365
Content-Type: text/plain; charset="utf-8"

test_text_lorem.txt is in BUILT_SOURCES, so do_compile builds
gen-lorem-text for the target and runs it on the build host. That only
works when the host can execute target binaries; it fails e.g. for
aarch64 musl on an aarch64 glibc host:

  ./gen-lorem-text > cupsfilters/test_files/test_text_lorem.txt
  /bin/bash: line 1: ./gen-lorem-text: cannot execute: required file not found

Generate the file only for make check, which is the only user.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-generate-test_text_lorem.txt-for-ma.patch | 49 +++++++++++++++++++
 .../cups/libcupsfilters_2.2.1.bb              |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-Makefile.am-Only-generate-test_text_lorem.txt-for-ma.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0001-Makefile.am-Only-generate-test_text_lorem.txt-for-ma.patch b/meta-oe/recipes-printing/cups/libcupsfilters/0001-Makefile.am-Only-generate-test_text_lorem.txt-for-ma.patch
new file mode 100644
index 0000000000..921076b3b8
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0001-Makefile.am-Only-generate-test_text_lorem.txt-for-ma.patch
@@ -0,0 +1,49 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 14 Nov 2026 08:23:08 -0800
+Subject: [PATCH] Makefile.am: Only generate test_text_lorem.txt for make check
+
+test_text_lorem.txt is listed in BUILT_SOURCES, so a plain "make" builds
+gen-lorem-text and runs it to regenerate the file.  When cross
+compiling, gen-lorem-text is built for the target and cannot be
+executed on the build host, failing the build with:
+
+  ./gen-lorem-text > cupsfilters/test_files/test_text_lorem.txt
+  /bin/bash: line 1: ./gen-lorem-text: cannot execute: required file not found
+
+The file is only used by testfilters during "make check", so build
+gen-lorem-text as a check program and the lorem text as check_DATA,
+which automake builds before running the tests.
+
+Upstream-Status: Submitted [https://github.com/OpenPrinting/libcupsfilters/pull/346]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Makefile.am | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2689a60..4a14500 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -337,15 +337,17 @@ testfilters_LDFLAGS = \
+ 	-D_GNU_SOURCE \
+ 	-L/usr/lib
+
+-noinst_PROGRAMS = gen-lorem-text
++check_PROGRAMS += gen-lorem-text
+ gen_lorem_text_SOURCES = cupsfilters/gen-lorem-text.c
+ EXTRA_DIST += cupsfilters/gen-lorem-text.c
+ # Built by cupsfilters/test-pdftoraster-copy-height.sh under AddressSanitizer
+ # (not a check_PROGRAM, so it can skip when ASan is absent); named here so it
+ # ships in "make dist".
+ EXTRA_DIST += cupsfilters/test-pdftoraster-copy-height.c
+-# Generated deterministic lorem text for texttopdf tests
+-BUILT_SOURCES = cupsfilters/test_files/test_text_lorem.txt
++# Generated deterministic lorem text for texttopdf tests.  Only needed by
++# "make check"; gen-lorem-text cannot be run on the build host when cross
++# compiling.
++check_DATA = cupsfilters/test_files/test_text_lorem.txt
+ CLEANFILES   = cupsfilters/test_files/test_text_lorem.txt
+
+ cupsfilters/test_files/test_text_lorem.txt: gen-lorem-text
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
index 5fa268295f..c1a887b3ec 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aab2024bd2a475438a154cd1640c9684"
 DEPENDS = "cups fontconfig libexif dbus lcms pdfio libpng jpeg tiff"

 SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-Makefile.am-Only-generate-test_text_lorem.txt-for-ma.patch \
            "
 SRC_URI[sha256sum] = "0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed821d4860"

