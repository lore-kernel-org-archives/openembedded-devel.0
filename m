Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 65B08605BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:04:11 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x7so41813671qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zx6IaSKlz6ePWoDnr5hgS86TkHXPNdnxwFeWZuB4OiM=;
	b=X4OBG3/HWa+lph9dCbjzvDZtANtNEtNJuIz2JrUgyn8GD+0Ln8ZlAQgUNv98iv1G4p
	w6ZDRrklhMZA+jbbqrxgY/Pd6KkeLWnkWTDlxFb67y3/h85iy00lB2WyFJuDtNoGc/iN
	lBGr/EpFJSvrOY27dvNBTYOPURe6fa2k+595hWqCP0KDPGz7l5Cmy0RmV0RE4Lm0BK8l
	xy04mZ86Qw9epCcQk8QZSOjOMciCS3khcbUlPDB43qbt28leElqdY3IfvlgM7f5jKF5d
	6Ra5cB0tfadM+AP/ZY+9AIVYhVWqW4ruKfoylDKLUXAi/WSPUEb8t5KgKTjo++qxpsjZ
	SoaA==
X-Gm-Message-State: AOPr4FWAZL/HEPMBANc5x3rotOWBDYZliT6cdVuWV3Fm42cvhOXm3dyZL2D56T7MKiGX1Q==
X-Received: by 10.55.198.149 with SMTP id s21mr27244548qkl.61.1461351851762;
	Fri, 22 Apr 2016 12:04:11 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	200sm2734133qhw.18.2016.04.22.12.04.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:04:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 15:04:02 -0400
Message-Id: <1461351842-8783-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] fribidi: update to version 0.19.7
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
X-List-Received-Date: Fri, 22 Apr 2016 19:04:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb | 17 -----------------
 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
 create mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb

diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
deleted file mode 100644
index cb4bc24..0000000
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Fribidi library for bidirectional text"
-SECTION = "libs"
-PR = "r1"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-BBCLASSEXTEND = "native"
-
-PROVIDES = "libfribidi"
-
-inherit autotools lib_package pkgconfig
-
-CFLAGS_append = "  -DPAGE_SIZE=4096 "
-
-SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "626db17d2d99b43615ad9d12500f568a"
-SRC_URI[sha256sum] = "49cf91586e48b52fe25872ff66c1da0dff0daac2593f9f300e2af12f44f64177"
diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
new file mode 100644
index 0000000..02b8764
--- /dev/null
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Fribidi library for bidirectional text"
+SECTION = "libs"
+PR = "r1"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+BBCLASSEXTEND = "native"
+
+PROVIDES = "libfribidi"
+
+inherit autotools lib_package pkgconfig
+
+CFLAGS_append = "  -DPAGE_SIZE=4096 "
+
+SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "6c7e7cfdd39c908f7ac619351c1c5c23"
+SRC_URI[sha256sum] = "08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e"
-- 
1.9.1


