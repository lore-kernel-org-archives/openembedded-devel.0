Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 290887F568
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:37 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i5so8925058pgj.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MfJMungFUyiwxrY//jTWW+wxYj3iniWNHXOdUO4phOg=;
	b=KeRchDpbKzbSDiPdtNO9JC/sRrOiePeQDorrrNt0NgsyoV+QODCxtnH9wkirnpq212
	I94fE43OTw87Xa2awgLSfHlVmnFcBVYBws7f8avZyEDMGBuSERcI+ERm7TpMeKBQhU8V
	e1PF1sA2VwnqHzF5o9vPxSrfYfUCrhVruI7TaDE2IEMlJHMnc3+eAqR2Lk1lNJ2zsube
	lj0NdOA8RkVdV0ejM1z35lT0Mk+1X8HLh0kd6nrdiv5gtV6ZNjwiOxfec2wzAVmPfc7P
	zUsviUAzksigONGyqrtcZupacL5NgYRKk7TkmWL9Tt1EzBDFUC0ukZLpkfSLnb5hJPod
	XP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MfJMungFUyiwxrY//jTWW+wxYj3iniWNHXOdUO4phOg=;
	b=R9nlDf/oIxsyulSelNy7t8Fpi66WHj/jaKawOwlGgqcpXrAGAWo5vXmdWKWo8S/K2Z
	jaeXmwyLBXbOt/K/hbQJAooou5T4shwIHtJexJfTI62LR/m+Lw6oxDWl3jqncpw5QEys
	CaBnzZUaBRlazH1ECRMjKKcZzFMI9IctQeDxkRZ3aVseZ8BfuQ4thGqe1qR9p3+WH3CV
	vZSglEpi2Qx66bKFet4hYq0Pe1LFPv4psz09paXAs0zJlyasyM+/uge01x0le7ii9H8O
	nWwGDamopNCD+ajmsCwYRmslt1zIuEw2hGIMZBx5cryWCAY+eXKC7VPwQTk5KtHv/qBc
	hhdQ==
X-Gm-Message-State: APjAAAVfpqsqkk4XTTBSz4fGHY53V3Fp4fEmBidKZnZ3Y6TjmRoG32DR
	FZERguCvZJRPsbdI20vhhWrenSmF6UI=
X-Google-Smtp-Source: APXvYqxFNvyR9hW3XkVMpQhRfOaYxlasHf/1fEguzkRhn4vCOrLHyiIcQp0qIQ0qSkeBOd1VRm2e2A==
X-Received: by 2002:a63:510e:: with SMTP id f14mr9055453pgb.35.1575225997775; 
	Sun, 01 Dec 2019 10:46:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:18 -0800
Message-Id: <20191201184622.889513-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/9] v4l-utils: Update to 1.18.0
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:38 -0000
Content-Transfer-Encoding: 8bit

- Fix build on 32bit arches with 64bit time_t
- Forward port patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fine-error_t-and-include-sys-types.h.patch | 45 +++++++++++++++++++
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 41 +++++++++++++++++
 ....patch => 0007-Do-not-use-getsubopt.patch} | 25 ++++++-----
 ...4l-utils_1.16.5.bb => v4l-utils_1.18.0.bb} |  8 ++--
 4 files changed, 104 insertions(+), 15 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 rename meta-oe/recipes-multimedia/v4l2apps/v4l-utils/{0003-v4l2-ctl-Do-not-use-getsubopt.patch => 0007-Do-not-use-getsubopt.patch} (56%)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.16.5.bb => v4l-utils_1.18.0.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
new file mode 100644
index 0000000000..57948add6e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
@@ -0,0 +1,45 @@
+From 137ce23ae677b11e5483ef810751edae7bf96bb9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 18:40:06 -0800
+Subject: [PATCH] Define error_t and include sys/types.h
+
+Fix 'unknown type name' for error_t and u_int32_t.
+u_int32_t is defined in sys/type.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/ir-ctl/keymap.h   | 4 ++++
+ utils/keytable/keymap.h | 5 +++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/utils/ir-ctl/keymap.h b/utils/ir-ctl/keymap.h
+index f2b2963..1f8a3f8 100644
+--- a/utils/ir-ctl/keymap.h
++++ b/utils/ir-ctl/keymap.h
+@@ -2,6 +2,10 @@
+ #ifndef __KEYMAP_H
+ #define __KEYMAP_H
+ 
++#include <sys/types.h>
++#ifndef error_t
++typedef int error_t;
++#endif
+ struct keymap {
+ 	struct keymap *next;
+ 	char *name;
+diff --git a/utils/keytable/keymap.h b/utils/keytable/keymap.h
+index f2b2963..345d55d 100644
+--- a/utils/keytable/keymap.h
++++ b/utils/keytable/keymap.h
+@@ -2,6 +2,11 @@
+ #ifndef __KEYMAP_H
+ #define __KEYMAP_H
+ 
++#include <sys/types.h>
++#ifndef error_t
++typedef int error_t;
++#endif
++
+ struct keymap {
+ 	struct keymap *next;
+ 	char *name;
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..a8926762ed
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,41 @@
+From b213da2d5fcc93cd24fc880c71c717d8e2ce2968 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 18:43:21 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/keytable/keytable.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
+index 6cb0217..59ff1ee 100644
+--- a/utils/keytable/keytable.c
++++ b/utils/keytable/keytable.c
+@@ -53,6 +53,11 @@
+ 
+ # define N_(string) string
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ struct input_keymap_entry_v2 {
+ #define KEYMAP_BY_INDEX	(1 << 0)
+ 	u_int8_t  flags;
+@@ -1533,7 +1538,7 @@ static void test_event(struct rc_device *rc_dev, int fd)
+ 
+ 		for (i = 0; i < rd / sizeof(struct input_event); i++) {
+ 			printf(_("%ld.%06ld: event type %s(0x%02x)"),
+-				ev[i].time.tv_sec, ev[i].time.tv_usec,
++				ev[i].input_event_sec, ev[i].input_event_usec,
+ 				get_event_name(events_type, ev[i].type), ev[i].type);
+ 
+ 			switch (ev[i].type) {
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
similarity index 56%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
index 5b84af2c32..ac704c72dc 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
@@ -1,24 +1,26 @@
-From f7a4b79b3323534460a63b3e6c58ebaf06adf207 Mon Sep 17 00:00:00 2001
+From 4a10eab0e31d69948161241b1801c41201a5d081 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 13:20:05 -0700
-Subject: [PATCH] v4l2-ctl: Do not use getsubopt
+Date: Sat, 30 Nov 2019 18:50:34 -0800
+Subject: [PATCH] Do not use getsubopt
 
 POSIX says that behavior when subopts list is empty is undefined.
 musl libs will set value to NULL which leads to crash.
 
-Taken from AlpineLinux
+Simply avoid getsubopt, since we cannot rely on it.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Imported from Alpine Linux
 
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- utils/v4l2-ctl/v4l2-ctl-common.cpp | 19 ++++++++++---------
- 1 file changed, 10 insertions(+), 9 deletions(-)
+ utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
 
 diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
-index 3ea6cd3..291fb3e 100644
+index 651917e..cea57b7 100644
 --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
 +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
-@@ -692,16 +692,17 @@ static bool parse_subset(char *optarg)
+@@ -782,15 +782,17 @@ static bool parse_subset(char *optarg)
  
  static bool parse_next_subopt(char **subs, char **value)
  {
@@ -31,8 +33,7 @@ index 3ea6cd3..291fb3e 100644
  
 -	if (opt < 0 || *value)
 -		return false;
--	fprintf(stderr, "No value given to suboption <%s>\n",
--			subopts[opt]);
+-	fprintf(stderr, "Missing suboption value\n");
 -	return true;
 +	while (*p && *p != ',')
 +		p++;
@@ -44,4 +45,4 @@ index 3ea6cd3..291fb3e 100644
 +	return false;
  }
  
- void common_cmd(int ch, char *optarg)
+ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.5.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.5.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
index 415446844d..9cc2a8e5b4 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.5.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
@@ -20,10 +20,12 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
            file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
-           file://0003-v4l2-ctl-Do-not-use-getsubopt.patch \
+           file://0005-Define-error_t-and-include-sys-types.h.patch \
+           file://0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           file://0007-Do-not-use-getsubopt.patch \
            "
-SRC_URI[md5sum] = "de272817133c0dca000a78a5c8c8ec8b"
-SRC_URI[sha256sum] = "ed80242510385017a1dc566e17a285a77222bb301f5bc19386badfcc2c19df1b"
+SRC_URI[md5sum] = "18996bd5e9d83d47055c05de376708cd"
+SRC_URI[sha256sum] = "6cb60d822eeed20486a03cc23e0fc65956fbc1e85e0c1a7477f68bbd9802880d"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-- 
2.24.0


