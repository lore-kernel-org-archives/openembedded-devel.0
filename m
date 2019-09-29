Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 709287F281
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:18 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d22so3171139pls.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C4HQTK8Cvc+JvSwv5yTWqUthc8wj6bVwc6BgEI06GqE=;
	b=Sm9fDnQfs9R56OtZXSsmT9+g/ycY4alJxNrTt7HfBPfu3dsTnkIICL/4m/oSNidMV6
	PR5SQmJWdLllDpZ8FV3NzJOi1jgwEynQOC1fovZ8OZ/thCEtYbhrMEU8U2seiWqXpPMR
	NEX4kvMjJXZm97PCmPjVBveKuUG4WSV3DVZIbNweEWO3B8djJoNkmxvhMMS0WiSeJvuZ
	0lnm0gSUkiHs033hT12VSf4KPa023eXUl8ENh/r+g2esP+HBeDUhg7ZyxN92iZlQnvam
	A9d8jjuRknk+wkiZmQYs8cbCfQ7OAjraxvzE9C3+DDZxd9868umuSUWE420tMleDGDH1
	o7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C4HQTK8Cvc+JvSwv5yTWqUthc8wj6bVwc6BgEI06GqE=;
	b=NEZtRImncqt07hFsATtWXD1bLJq0iCcAzmo+0+mNuTlRUDVBGSsw1iYDhgwuM6w7gg
	x/o9U/SNxaBIvFDV62FBlY0LJzRWo4LKNHz+QhgNy1tVhx9ha2UZK++qOofBLiAFNV8s
	mbg+3RMeJxRaUXjj/kp8DLgvswRln3IcXOzqwA5Y+SOqhw7Yuoj611mx7Ze3nRg6U8qs
	mMRcf43p/FE2QBZgUObj5jcYGz3b9GJeSzPdjWiOMcb6hoqlxuM0AMbolEp8/oLF30+p
	c4jzmjZ0hoPvFWUeSaV9imRLnIuSemKDEzFjcxEtQghnkDcNddn7kNUWClspI+PuUlSr
	IzEw==
X-Gm-Message-State: APjAAAUj34ipUvck5ffhB613Yvf8mTJCMtoW4PZEUiWkgNcTulJPyqXv
	YAbfJdfy4ES85yMy/SKqGOChc+2KrD8=
X-Google-Smtp-Source: APXvYqzGjF8oSWRz4j+nGcw1JI3mWSSFikzC6Z1grk4d1DUHnXOmIgF2ooqGZfLWRC0dGMT3SrAE3w==
X-Received: by 2002:a17:902:bd43:: with SMTP id
	b3mr17501916plx.327.1569801319037; 
	Sun, 29 Sep 2019 16:55:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:00 -0700
Message-Id: <58736b6483c97dffaf9e3c5a097377a786d79edd.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 02/10] redis: Fix build with clang/x86
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:18 -0000

From: Khem Raj <raj.khem@gmail.com>

Need to link with libatomics for 64bit atomics support
Fixes
i686-yoe-linux/i686-yoe-linux-ld: networking.o: in function `createClient':
| /usr/src/debug/redis/4.0.14-r0/redis-4.0.14/src/networking.c:103: undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2b49254d61ca817799a206cd022617854aa5bc0b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../redis/0001-src-Do-not-reset-FINAL_LIBS.patch   | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_4.0.14.bb     |  5 +++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch

diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
new file mode 100644
index 0000000..04af15d
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
@@ -0,0 +1,32 @@
+From 97584e1eb78dc18599534b47b6670c20c63f5ee2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 10 Sep 2019 20:04:26 -0700
+Subject: [PATCH] src: Do not reset FINAL_LIBS
+
+This helps case where additional libraries are needed to be passed from
+environment to get it going
+
+e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 7f7c625..c71dd3b 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -66,7 +66,7 @@ endif
+ 
+ FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
+ FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
+-FINAL_LIBS=-lm
++FINAL_LIBS+=-lm
+ DEBUG=-g -ggdb
+ 
+ ifeq ($(uname_S),SunOS)
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_4.0.14.bb b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
index 5df5312..45ea29b 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
            file://Fixed-stack-trace-generation-on-aarch64.patch \
+           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
@@ -25,11 +26,13 @@ SRC_URI[sha256sum] = "1e1e18420a86cfb285933123b04a82e1ebda20bfb0a289472745a08758
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
+FINAL_LIBS_x86_toolchain-clang = "-latomic"
+export FINAL_LIBS
+
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN}  = "--system --home-dir /var/lib/redis -g redis --shell /bin/false redis"
 GROUPADD_PARAM_${PN} = "--system redis"
 
-
 REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
 
 do_compile_prepend() {
-- 
2.7.4


