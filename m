Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 98CD179E05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:51:27 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id z10so8747489pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 18:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=F3XToJ4YYz8t8s+CFrIXHDUlQe71J3s3gn0ZjytFCVM=;
	b=X0HZGsKwr3YBQx2t+XE1Y0V0mHJjDvE92K0gSFMFFU1Aa4ulMahLvNhtim1MJakeoA
	dMpks6tnhPPFPnFu5qj2RY1rVVCS4sFPtLp0kFbDysdU0xSM1ndmPyY26Dcgi/IpSvFL
	m/NieT0gXUY77r7IvwuHPAHu+0PmktRExPF5OxHpPaClUqxg5NOAGyepvZoh9n2DU/M7
	iTRKMSVi9Ur8RpIoCVx+rFpZFw+laaGGD9tyztFiJa1NvMijaAUtPfSCuN9DFWu5FEfx
	3r3YwLBQkDALRrcOSbqOIxZZYfOJEfVqeSm3kHSo9D/Cf9OzTUcVJrdd39QJXUshF4bm
	EZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F3XToJ4YYz8t8s+CFrIXHDUlQe71J3s3gn0ZjytFCVM=;
	b=VRdbAjGdTzeKM2j7B9jtr1sJlW25Kfe/WJ3PmRLu3Xh43FZ+d1njfV65Ig0vQp8zxl
	hsDmlV1QC/erKmT3KLLwLnbW43lTok2ztNHtlGAu0ETuClFp32xcRsk/3Et/nLNYrkFb
	QZ9ip4Ki2XOCAJrcdzvKCSLG6vbwTjAcsWKmG8Vptq6k+5dsk5SnK3elfdhppplS8wZ2
	fGVyvqoG22AVMBR0LsN6u8UNQRv/odT0mp8scsd9BpP0gYHMArEg+sx5CHTqPGCgRhU7
	fP/Moixv6GJMfeNZxoWTqQjxP5sFazOqL9IHnP8G6dE9h0oP5B9acRuvSnHgKaMRN9Aw
	V+qQ==
X-Gm-Message-State: AA+aEWaXbZo4J4OcTcJigVigxbOecIOX+yleNNr/6enkmrVJO8/8phLz
	x74R9kQej4HPOnaMjgRGJ3UZezcm1pU=
X-Google-Smtp-Source: AFSGD/VuTpCowQ2RN3cf4v32XhCEmOqwyQZUo2M7CIxmMws1rcgNn+zhUOG4yDL5Ba08bOu49f0uWg==
X-Received: by 2002:a63:374e:: with SMTP id g14mr14989816pgn.59.1545187888201; 
	Tue, 18 Dec 2018 18:51:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m3sm28000563pff.173.2018.12.18.18.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 18:51:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 18:51:07 -0800
Message-Id: <20181219025109.19159-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219025109.19159-1-raj.khem@gmail.com>
References: <20181219025109.19159-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/6] collectd: Upgrade to 5.8.1 release
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
X-List-Received-Date: Wed, 19 Dec 2018 02:51:27 -0000
Content-Transfer-Encoding: 8bit

Fix build with gcc9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0005-Disable-new-gcc8-warnings.patch      | 18 +++++------
 ...ctdclient-Fix-string-overflow-errors.patch | 31 +++++++++++++++++++
 .../{collectd_5.8.0.bb => collectd_5.8.1.bb}  |  5 +--
 3 files changed, 43 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0006-libcollectdclient-Fix-string-overflow-errors.patch
 rename meta-oe/recipes-extended/collectd/{collectd_5.8.0.bb => collectd_5.8.1.bb} (95%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch b/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
index b12690b327..13510cdea0 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
@@ -1,4 +1,4 @@
-From d65e48b68076d5b304e6d865967003ae1fea0e6c Mon Sep 17 00:00:00 2001
+From f82f8faf9942f51e9c3c773b56574652695bef5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 May 2018 21:45:38 -0700
 Subject: [PATCH] Disable new gcc8 warnings
@@ -7,17 +7,17 @@ GCC seems to be not able to detect the checks for size are
 already in place
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
-Upstream-Status: Submitted [https://github.com/collectd/collectd/pull/2768]
  src/libcollectdclient/network_parse.c | 7 +++++++
  src/write_sensu.c                     | 7 +++++++
  2 files changed, 14 insertions(+)
 
 diff --git a/src/libcollectdclient/network_parse.c b/src/libcollectdclient/network_parse.c
-index 2365ab0a..79e6ed96 100644
+index aa753ce..fef43a9 100644
 --- a/src/libcollectdclient/network_parse.c
 +++ b/src/libcollectdclient/network_parse.c
-@@ -163,6 +163,11 @@ static int parse_int(void *payload, size_t payload_size, uint64_t *out) {
+@@ -148,6 +148,11 @@ static int parse_int(void *payload, size_t payload_size, uint64_t *out) {
    return 0;
  }
  
@@ -29,7 +29,7 @@ index 2365ab0a..79e6ed96 100644
  static int parse_string(void *payload, size_t payload_size, char *out,
                          size_t out_size) {
    char *in = payload;
-@@ -175,6 +180,8 @@ static int parse_string(void *payload, size_t payload_size, char *out,
+@@ -160,6 +165,8 @@ static int parse_string(void *payload, size_t payload_size, char *out,
    return 0;
  }
  
@@ -39,22 +39,22 @@ index 2365ab0a..79e6ed96 100644
                              lcc_value_list_t *state) {
    char buf[LCC_NAME_LEN];
 diff --git a/src/write_sensu.c b/src/write_sensu.c
-index ce23e654..63e1f599 100644
+index bd7a56d..6cb59d5 100644
 --- a/src/write_sensu.c
 +++ b/src/write_sensu.c
-@@ -569,6 +569,11 @@ static char *sensu_value_to_json(struct sensu_host const *host, /* {{{ */
+@@ -570,6 +570,11 @@ static char *sensu_value_to_json(struct sensu_host const *host, /* {{{ */
    return ret_str;
  } /* }}} char *sensu_value_to_json */
  
 +#pragma GCC diagnostic push
-+#if __GNUC__ == 8
++#if __GNUC__ > 7
 +#pragma GCC diagnostic ignored "-Wstringop-overflow"
 +#pragma GCC diagnostic ignored "-Wstringop-truncation"
 +#endif
  /*
   * Uses replace_str2() implementation from
   * http://creativeandcritical.net/str-replace-c/
-@@ -631,6 +636,8 @@ static char *replace_str(const char *str, const char *old, /* {{{ */
+@@ -632,6 +637,8 @@ static char *replace_str(const char *str, const char *old, /* {{{ */
    return ret;
  } /* }}} char *replace_str */
  
diff --git a/meta-oe/recipes-extended/collectd/collectd/0006-libcollectdclient-Fix-string-overflow-errors.patch b/meta-oe/recipes-extended/collectd/collectd/0006-libcollectdclient-Fix-string-overflow-errors.patch
new file mode 100644
index 0000000000..3ed652f71f
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0006-libcollectdclient-Fix-string-overflow-errors.patch
@@ -0,0 +1,31 @@
+From 98719ea7f717750c790a1f9384ea8d0117e7f52d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Dec 2018 18:15:05 -0800
+Subject: [PATCH] libcollectdclient: Fix string overflow errors
+
+Ensure that string has a space for ending null char
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libcollectdclient/network_parse.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/libcollectdclient/network_parse.c b/src/libcollectdclient/network_parse.c
+index fef43a9..6d65266 100644
+--- a/src/libcollectdclient/network_parse.c
++++ b/src/libcollectdclient/network_parse.c
+@@ -169,9 +169,9 @@ static int parse_string(void *payload, size_t payload_size, char *out,
+ 
+ static int parse_identifier(uint16_t type, void *payload, size_t payload_size,
+                             lcc_value_list_t *state) {
+-  char buf[LCC_NAME_LEN];
+-
+-  if (parse_string(payload, payload_size, buf, sizeof(buf)) != 0)
++  char buf[LCC_NAME_LEN+1];
++  buf[LCC_NAME_LEN] = '\0';
++  if (parse_string(payload, payload_size, buf, LCC_NAME_LEN) != 0)
+     return EINVAL;
+ 
+   switch (type) {
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
similarity index 95%
rename from meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
index df9fa233cd..6dff18c16b 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
@@ -13,9 +13,10 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-fix-to-build-with-glibc-2.25.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0005-Disable-new-gcc8-warnings.patch \
+           file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
            "
-SRC_URI[md5sum] = "a841159323624f18bf03198e9f5aa364"
-SRC_URI[sha256sum] = "b06ff476bbf05533cb97ae6749262cc3c76c9969f032bd8496690084ddeb15c9"
+SRC_URI[md5sum] = "bfce96c42cede5243028510bcc57c1e6"
+SRC_URI[sha256sum] = "e796fda27ce06377f491ad91aa286962a68c2b54076aa77a29673d53204453da"
 
 inherit autotools pythonnative update-rc.d pkgconfig systemd
 
-- 
2.20.1


