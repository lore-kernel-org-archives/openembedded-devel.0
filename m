Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD5C6025E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:35:19 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e9-v6so6136063pfi.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+sh595q2pHy5ZYnP5OEIDd0tz+ddeuXT5CZnUORz92c=;
	b=egFtAzEm5sXUw5Eim45wPgXIviZ3P/Fj2N51X/YRrWhYM9MUYLe+rAIEj/ld1mFkRS
	HJ60uoqQ95ibza8ZKpTCB4bJdGOMNP07E6pQmYJCgWF/Hdjflwd3cgjqJqzEaVKflD5j
	HjhWCHTgORX0elBX9cevrXVZK7k4fNXFZIclSD3ApuYrm7AsrFKNJbCKvLnNPSkSu4VL
	jTi/g9RWsV3HvpDXbxkJ9ik7BYnbbRWDK6ZYDQZfGMMq8EPdYFK7slGT32+ldHqWVIOp
	zyRc+vKl1kEr3/TozUAPJfHyj418Csq3MzOek9ABqRkyb6N8ubO1K4YnBituaZ2Ydnb8
	ebng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+sh595q2pHy5ZYnP5OEIDd0tz+ddeuXT5CZnUORz92c=;
	b=U42cg2FgsGI7DGjEXXJYZK2Cll37Kek+WA0EAs28V0IF/MlxM/kT5RNIQPrhbS+Hhn
	Y9taCJJO4ZUcR3E8nK3OURvc3hU3ruaTYdjAi5LjxG75JxIgKu88lQ1VnYfFe/RBGrGr
	hOcCi6e/ZJHuL5k+2TgA//3Z/eZauMwWYmwGdL/V0UhWJrjfJF+fK4rmr96N6EiWEDEA
	5VEHrwPNOHWXhZKLriGWOxMZzGvSW6LF4VHA4ZnrfC+G1LU4B2F3Y/w895o7wlZu+CYt
	NOnwcAZqAf2r28vz5TNA9lN52GQByICyYGK+DinbbepX6ETdOVeU3KKQbMU2mifZhmck
	MgoA==
X-Gm-Message-State: ALKqPwcj6l3bAaiDsV4UvuZJ46bvo8orVok/+MT3qrHX1ry59NllwHL+
	JZg9j7j7Sc4EKWY7Nh5UqodPxw==
X-Google-Smtp-Source: AB8JxZp2C2BGpGEhC2qFyElyiibxRxwf/K7Bq9FRhQeOcl6udXDT7mrQJemHiy4AkRJ/vBqT6lRBfQ==
X-Received: by 2002:a62:d352:: with SMTP id
	q79-v6mr17957414pfg.45.1526855720910; 
	Sun, 20 May 2018 15:35:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm21887763pfz.131.2018.05.20.15.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:35:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 15:35:14 -0700
Message-Id: <20180520223517.9869-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180520223517.9869-1-raj.khem@gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] poppler: Fix build on musl
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
X-List-Received-Date: Sun, 20 May 2018 22:35:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../poppler/poppler/basename-include.patch    | 20 +++++++++++++++++++
 .../recipes-support/poppler/poppler_0.64.0.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/basename-include.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/basename-include.patch b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
new file mode 100644
index 0000000000..528528ae7c
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
@@ -0,0 +1,20 @@
+Minic GNU basename() API for non-glibc library e.g. musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: poppler-0.64.0/utils/pdfsig.cc
+===================================================================
+--- poppler-0.64.0.orig/utils/pdfsig.cc
++++ poppler-0.64.0/utils/pdfsig.cc
+@@ -35,6 +35,10 @@
+ #include "Win32Console.h"
+ #include "numberofcharacters.h"
+ 
++#if !defined(__GLIBC__)
++#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
++#endif
++
+ static const char * getReadableSigState(SignatureValidationStatus sig_vs)
+ {
+   switch(sig_vs) {
diff --git a/meta-oe/recipes-support/poppler/poppler_0.64.0.bb b/meta-oe/recipes-support/poppler/poppler_0.64.0.bb
index 1e87ae6e6c..b90f3fa359 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.64.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.64.0.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
+           file://basename-include.patch \
            "
 SRC_URI[md5sum] = "f7f687ebb60004f8ad61994575018044"
 SRC_URI[sha256sum] = "b21df92ca99f78067785cf2dc8e06deb04726b62389c0ee1f5d8b103c77f64b1"
-- 
2.17.0


