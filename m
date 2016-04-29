Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 91D97731D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 15:21:25 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id r184so46735229qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qPZ6q4TvaFXsSw0hkozjwYM7XKDVXopiSu6jcTnXw5U=;
	b=ad2aAPquJhircxw0hzWeNa69MgP546495UpyiQus5cYjNFoL3p5riWf6yZIkWMpC1V
	IoT7WeddLKh5EzvchU/ozuBJwGYflcNJKk6Wiout9nxhoiILapXGoKr/wbdXvvLCjdnk
	JuSz2m1m7UMXpqM/FnGTH9eXZHgGVM03XPcVeu1cThcMU0fA5MFgi8kJyrfd4azAcRwj
	gAa5sSsYIJsJgIeL+Aj4+BhbGnAHjPOaseampDpGwBKFPLz7TORs9XUYIf2Ebo2RBUuq
	KG375+DFOJW7t1J6JMpMTQnFPqRKutnbhVh6v5rj+qFT5st6Bz5N5v991/vzuWEb41jX
	vz0w==
X-Gm-Message-State: AOPr4FWmXt0BCxhlwW6VAg12zwjeBWqDVfDtOyyO4ovhjiQYMmdESe23WOG29P52Fk/vXg==
X-Received: by 10.55.170.134 with SMTP id t128mr20345486qke.19.1461943285489; 
	Fri, 29 Apr 2016 08:21:25 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id v65sm4577126qhc.6.2016.04.29.08.21.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 08:21:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 11:20:48 -0400
Message-Id: <1461943248-919-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCHv2] fribidi: update to version 0.19.7
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
X-List-Received-Date: Fri, 29 Apr 2016 15:21:25 -0000

 * license copyright entities were updated

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
index 0000000..f8e7aa0
--- /dev/null
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Fribidi library for bidirectional text"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+BBCLASSEXTEND = "native"
+
+PROVIDES = "libfribidi"
+DEPENDS = "glib-2.0 libpcre"
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


