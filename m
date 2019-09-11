Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 990C97E684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 04:54:03 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x3so9587676plr.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gLE+dcUY6+xxEfum3oRo66y4EELRtIIiLc5aaJ7pYkc=;
	b=nTQoGh5kLbrukAhsmMjpAJ8jfN7o+2jBtbWxp7Yh97Mk1bDSFOLKwJHjNi3uXwTEPZ
	Pg/FfcXWFOKslGI6Cum3w1RF6Na+DmmNid8PDsV3VA95C8TTF2MxV9sW6BApVpG/RGui
	RssHDAPqNwzeMj8sxZG012QOpNkruzlHReOGrUkm9yv5yUR7XV/IWwJSqgDfpn1yGVTK
	k9/2H0bYamoxOCAgQnn5B5wwBr2hxpeAbBCTV02LpzdWQJba0JmDXZ1NrExrK1DpTbDS
	JOj+1atbuNNE2VNV/ZQeUGezr0zPx+59ffhKX5LOU6eJDXktMgIFqOJtUUR9n0MazzHw
	bsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gLE+dcUY6+xxEfum3oRo66y4EELRtIIiLc5aaJ7pYkc=;
	b=Mwrz9iS2qJ0a+GlDTM95t9FRquTsP2g8mKOTAmT3EvPFbmO/dw+Cp3jGc1a7QdNNXP
	+0E2YQjllxw2akbBjkEvUTB8BXZfRxIFL4Z86K8ZERCoKBZOW2U6ol0PUhst4KCSXISs
	rSBbx7hsxyrc9x+AV71fRAVm7WcWqBVZVhny0oEV7QcsKnRE5d7f0jyzQy4LoAK0N0xH
	Bj+QRfJf1NTqujqihDBsNLHxwHH5SbZ7rBlorGt7eKdQA468pHTPbX5BB9D4N7z9GY2v
	qBSN3FCsCXggkfHPEilXYTLAF5SCgc3OW9wPBuZaZ4FH7AEoEMl2W9WRSRFbt/tIcrwC
	/ezQ==
X-Gm-Message-State: APjAAAU4RkfKaDz3TVPYCPgNPJWE/0anA1yfDTZRgslBU5wvCvzALaHI
	gdjEatF8SV41L62R8UMb3bV57t7LcB0=
X-Google-Smtp-Source: APXvYqw3AfsLKXUvvyuJqbpWOAYf53MxFYPElRlXnbPSQ173W5/ruQa57rhFL5Zni36ZlG1WTLG3Ig==
X-Received: by 2002:a17:902:8210:: with SMTP id
	x16mr22895462pln.292.1568177644033; 
	Tue, 10 Sep 2019 21:54:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	i6sm36123311pfq.20.2019.09.10.21.54.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 21:54:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 21:53:46 -0700
Message-Id: <20190911045348.3308507-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] redis: Fix build with clang/x86
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
X-List-Received-Date: Wed, 11 Sep 2019 04:54:03 -0000
Content-Transfer-Encoding: 8bit

Need to link with libatomics for 64bit atomics support
Fixes
i686-yoe-linux/i686-yoe-linux-ld: networking.o: in function `createClient':
| /usr/src/debug/redis/4.0.14-r0/redis-4.0.14/src/networking.c:103: undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch    | 32 +++++++++++++++++++
 .../recipes-extended/redis/redis_4.0.14.bb    |  5 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch

diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
new file mode 100644
index 0000000000..04af15dd86
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
index 5df5312a0f..45ea29b702 100644
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
2.23.0


