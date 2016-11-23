Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53F2A605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:42 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so452338pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VsUKd46X+1oDo1kFhWZd9LmpxJcFx88yhgS1ycDlBSE=;
	b=Gz0Z5BU0uQbMH1+ZXOpY0ZkRYuAesw2D1nKG9tGIK3kl4VVRAl/TwAvUpl0DHBYOOl
	VSHIW1R+RxdJqwBQIxB/DNzpasjNI/m9KiavAOEJpuG3tvTAGAZEG4eC5RZdLJ9jdmyx
	7LuYZ8t1Vgx9isd5j8THooHsrbJZJ/7PUPCAxrHvf3mIiz4QJQFGrL8eYZYweIs4iZ1P
	yH1npfaaL/qyPrhQor421PgkSrYu/+8Aa76NM3uwJ/T2CSByBumZsOOkzll+UwkEn/v9
	uMryVQ1/ZbBvhEs0AzjPhYAZKbLmEdFQv72Rv0jUZMtix3nApxF/Sxo0Mg41xsNh/FP/
	f+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VsUKd46X+1oDo1kFhWZd9LmpxJcFx88yhgS1ycDlBSE=;
	b=mzTnZBJpQQruinTrdHiJd1htbZ32u+Og1jxIAddnzKFJ5Fe2N87bIsRYdhmIxbP8ae
	iyi5HsYR08oYtvyEKFqZjmbBpVdS3eitnXJiYAYGoSQVhnShis4rW70b+i5Ltm3tys89
	Lf2BlUHhNm2nkxrO+lHWcSrtF3JK2+SrRKJDOOY3ApuHVU+HuQ+K/cT5PP0ul2jUuYmX
	ljy24rH/EtvUfbEFf6Lb2B3BjAJAOBjn6oB07gpHG1hALWaeVGt9ZCwLj0tW7f54kd9R
	WHyzSadAodhJC18DQOzNQT0OXNhwhsvFu6o1GLUDlvDSetcDuVjwkqN28Q41a+4flahk
	pPNQ==
X-Gm-Message-State: AKaTC02gOd7UyKEbjesN9e7gT63K4vaRftEYD4XIQMsnTD5xBMsyU65ylxLzHohK5QPAng==
X-Received: by 10.99.116.92 with SMTP id e28mr3559735pgn.162.1479892963972;
	Wed, 23 Nov 2016 01:22:43 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:55 -0800
Message-Id: <20161123092209.23699-35-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 35/49] crda: Fix build with clang
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/crda/crda/make.patch      | 25 ++++++++++++++++++++++
 .../recipes-connectivity/crda/crda_3.18.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/make.patch

diff --git a/meta-networking/recipes-connectivity/crda/crda/make.patch b/meta-networking/recipes-connectivity/crda/crda/make.patch
new file mode 100644
index 0000000..0b73785
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/make.patch
@@ -0,0 +1,25 @@
+These headers are not related to any Make rule but they do appear in
+compiling of libreg.so, specifying .h files in compiler cmdline is flagged
+as error by clang
+
+| clang-4.0: error: cannot specify -o when generating multiple output files
+| make: *** [libreg.so] Error 1
+
+This is how we see headers in cmdline
+-O2 -fpic -std=gnu
+99 -Wall -Werror -pedantic -Wall -g -DUSE_GCRYPT -DCONFIG_LIBNL30 `pkg-config --cflags libnl-3.0`  -o libreg.so -shared -Wl,-soname,libreg.so
+regdb.h reglib.h reglib.c keys-gcrypt.c -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -L ./ -lm -lgcrypt
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Makefile.kk	2016-11-15 04:54:53.338670000 +0000
++++ a/Makefile	2016-11-15 04:55:07.718670000 +0000
+@@ -114,7 +114,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
+ 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
+ 	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
+ 
+-$(LIBREG): regdb.h reglib.h reglib.c
++$(LIBREG): reglib.c
+ 	$(NQ) '  CC  ' $@
+ 	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^ $(LDFLAGS) $(LIBREGLDLIBS)
+ 
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 00c358d..4b704fe 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://fix-linking-of-libraries-used-by-reglib.patch \
            file://fix-gcc-6-unused-variables.patch \
            file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
+           file://make.patch \
 "
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
-- 
2.10.2


