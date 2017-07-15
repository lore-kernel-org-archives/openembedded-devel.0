Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA0E78245
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jul 2017 01:55:48 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id c73so52873399pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dtxirfz5/7QK7pUoRxuyggx5BA2u9W42nGdGz/gLfGQ=;
	b=kcLxeRqShuQEdRfmuWxJC/KxxtfWlIGHbAyljKwzkpUX9Ala5XuXuzcDh9pwM/iIrv
	xuSdaoyvBQUo4oVNyALFT8yb+MiUzCBwBpwN8P3RcIo2ebKmGZMbYZ9WXxfDnZLibnqB
	w0P7AOaXWX3xg2E2sOmveoGvER+NHR6BzJFuLxe0iW6KIF99kCX99893z1ra4CfKaPp6
	atPGjhl6/LuHCbmfEqJAU/wFE+XpwLM5XE/Z26nfjOEsGVM+FoB0MRA4389YtF+SPmdu
	H3I1+34KuuFPHOmqDwaY35G0cJe5r/VyVo/VN6hcX+Mlg41xPPcV4Tj5N7stiZIB4ZHe
	5Iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dtxirfz5/7QK7pUoRxuyggx5BA2u9W42nGdGz/gLfGQ=;
	b=LJrVhDt/1FHp1i4HLAhFiYwa/ooOebfYhx62HJnbZ3N3U4yeCSZ+Cj75nTiQVqihmf
	5VhvkwP/ZYOmV5c06zGvXefzBXz0msW2ZGw8vGM0kWb1cswGZF15m9+E09DhjQuIucp5
	M2RPTL0SltgjHpTQAs+4OiGh8KyFgEA+YZ/7hDzeERR38zl/HamiINuXuMyrFry1NMuu
	prL1KXSYC9XE36Sv36KiJ7qrUNXyVsGA1Jop5JRR4EIZy7Fh2ZlNTYRuCMfjAQouR4lj
	R1fPdWcNAaMHiZiBpeVtXIi0Sw0ifsFZBmlMkkSF24BE5D/pxnoyIVX9L6bdLnyhMa6P
	mG4w==
X-Gm-Message-State: AIVw111cSZvqJF8ekj+2jUG0r2SMKd90xSp1HTGTKsPaNWIsq3A1CcfE
	/lIqoEFAKFyZgq3f
X-Received: by 10.98.108.74 with SMTP id h71mr8117350pfc.206.1500083749291;
	Fri, 14 Jul 2017 18:55:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l4sm18189589pgr.21.2017.07.14.18.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 18:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 18:55:35 -0700
Message-Id: <20170715015539.31584-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170715015539.31584-1-raj.khem@gmail.com>
References: <20170715015539.31584-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] v4l-utils: Fix build with musl
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
X-List-Received-Date: Sat, 15 Jul 2017 01:55:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tl-Define-TEMP_FAILURE_RETRY-if-undefined.patch | 55 ++++++++++++++++++++++
 ...t-Link-mc_nextgen_test-with-libargp-if-ne.patch | 28 +++++++++++
 .../0003-v4l2-ctl-Do-not-use-getsubopt.patch       | 49 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.12.3.bb                   |  5 +-
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
new file mode 100644
index 000000000..f1e11da3f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
@@ -0,0 +1,55 @@
+From e60aea50e41ae8a17672beb5859beecb66e7a305 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 13:11:25 -0700
+Subject: [PATCH 1/3] ir-ctl: Define TEMP_FAILURE_RETRY if undefined
+
+use strndup() instead of strndupa() which is not
+universally available in C libraries
+
+Taken from AlpineLinux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/ir-ctl/ir-ctl.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
+index bc58cee..1a44011 100644
+--- a/utils/ir-ctl/ir-ctl.c
++++ b/utils/ir-ctl/ir-ctl.c
+@@ -42,6 +42,16 @@
+ # define _(string) string
+ #endif
+ 
++/* taken from glibc unistd.h */
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__                                                              \
++    ({ long int __result;                                                     \
++       do __result = (long int) (expression);                                 \
++       while (__result == -1L && errno == EINTR);                             \
++       __result; }))
++#endif
++
+ # define N_(string) string
+ 
+ 
+@@ -344,12 +354,14 @@ static struct file *read_scancode(const char *name)
+ 		return NULL;
+ 	}
+ 
+-	pstr = strndupa(name, p - name);
++	pstr = strndup(name, p - name);
+ 
+ 	if (!protocol_match(pstr, &proto)) {
+ 		fprintf(stderr, _("error: protocol '%s' not found\n"), pstr);
++		free(pstr);
+ 		return NULL;
+ 	}
++	free(pstr);
+ 
+ 	if (!strtoscancode(p + 1, &scancode)) {
+ 		fprintf(stderr, _("error: invalid scancode '%s'\n"), p + 1);
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
new file mode 100644
index 000000000..2fb4057ec
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
@@ -0,0 +1,28 @@
+From b3acc4c6407f9553f32582a9aee6a11b5fcd1d8a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 13:17:19 -0700
+Subject: [PATCH 2/3] contrib/test: Link mc_nextgen_test with libargp if needed
+
+musl depends on external argp implementation e.g.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ contrib/test/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
+index 4641e21..e47b948 100644
+--- a/contrib/test/Makefile.am
++++ b/contrib/test/Makefile.am
+@@ -32,7 +32,7 @@ v4l2gl_LDFLAGS = $(X11_LIBS) $(GL_LIBS) $(GLU_LIBS) $(ARGP_LIBS)
+ v4l2gl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la
+ 
+ mc_nextgen_test_CFLAGS = $(LIBUDEV_CFLAGS)
+-mc_nextgen_test_LDFLAGS = $(LIBUDEV_LIBS)
++mc_nextgen_test_LDFLAGS = $(ARGP_LIBS) $(LIBUDEV_LIBS)
+ 
+ 
+ ioctl_test_SOURCES = ioctl-test.c ioctl-test.h ioctl_32.h ioctl_64.h
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
new file mode 100644
index 000000000..0a986ae5d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
@@ -0,0 +1,49 @@
+From d04aa6866cbea57c4a81b033cd60586a9436ac6b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 13:20:05 -0700
+Subject: [PATCH 3/3] v4l2-ctl: Do not use getsubopt
+
+POSIX says that behavior when subopts list is empty is undefined.
+musl libs will set value to NULL which leads to crash.
+
+Taken from AlpineLinux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/v4l2-ctl/v4l2-ctl-common.cpp | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
+index 3ea6cd3..291fb3e 100644
+--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
++++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
+@@ -692,16 +692,17 @@ static bool parse_subset(char *optarg)
+ 
+ static bool parse_next_subopt(char **subs, char **value)
+ {
+-	static char *const subopts[] = {
+-	    NULL
+-	};
+-	int opt = getsubopt(subs, subopts, value);
++	char *p = *subs;
++	*value = *subs;
+ 
+-	if (opt < 0 || *value)
+-		return false;
+-	fprintf(stderr, "No value given to suboption <%s>\n",
+-			subopts[opt]);
+-	return true;
++	while (*p && *p != ',')
++		p++;
++
++	if (*p)
++		*p++ = '\0';
++
++	*subs = p;
++	return false;
+ }
+ 
+ void common_cmd(int ch, char *optarg)
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
index 42da5cc09..b408bb0a9 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
@@ -18,7 +18,10 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0001-buildsystem-do-not-assume-building-in-source-tree.patch \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
-          "
+           file://0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch \
+           file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
+           file://0003-v4l2-ctl-Do-not-use-getsubopt.patch \
+           "
 SRC_URI[md5sum] = "89e1ed6c69c94e0489dc0a638c7841aa"
 SRC_URI[sha256sum] = "5a47dd6f0e7dfe902d94605c01d385a4a4e87583ff5856d6f181900ea81cf46e"
 
-- 
2.13.3


