Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADBC7E33D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 17:47:43 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id gn7so3028983plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qlft00vW7RvRSorB0gew4TvwaLs7F0YIvzdIboffWv8=;
	b=c8jY21dJb2OcxEjZ0PV/HjCgr+lYY8g/pYnOY62UwhR7UauEkYGO/Rd1CvY3fCFyJF
	x4GNR3xr+Vckx/4vdU2NH9+GK852ic40vMYzGwZrHD6WoCJn0VWJ+c7XoEW7iIq9NmRf
	IvYyCjCyp9oEHd/MFIWIpnsE5yQV58bgVb9YtCTmrDJ6f+lefTAD4Fsf5Ufg85O6udyD
	cH1lQkVF7l20xbbYpR2j4RjCcoOFTLZoBT4P3FRPTS3Au4MjwvTl+dvQ9rCMf55vFwI6
	jxqQSxNy1zhSWm7wXSvAGY1gy2YvALUV9ho9+a9ppTokJueyPqS5kRDOGq1/LIfaPdqm
	stSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qlft00vW7RvRSorB0gew4TvwaLs7F0YIvzdIboffWv8=;
	b=EymWX6KFzI0M1bkAOrRkq/t3goFpBUUIglX5B3khdBkOO/Os2UOJDJBfSgnCc0uL6M
	LAPenhIFeXtU/F0ut5Ew6XrwmSKv5/Yj1GdwjJn8DNfbG3+mm1j6oWOoI8q66ClltEqG
	+Wt1b3+BCVwRgBIsCJU4NeNg/nyV6yRG/o3kO8aLGeldiGqu81PuF+cbYrsREpzvsjYY
	7+Ed2JTkJmDsdVP/4uWHGKoGhxdSF9FVVAc84X+ARwFhY6oXrl2mF/wBrY2MUUFUqZ5R
	hNOycEFwVGI59ISS/JkRFQfLNBm0hIsF6qNNvRT75Zuj+aSwoFcB2GjNVFObW6X49aEc
	HRnQ==
X-Gm-Message-State: APjAAAXat8AIWEu+s2OyABWlhUZLNeca3RfQj4c/JPtk8H8eRfwsfUlP
	wYCl5zRmFg+/4btJOlj+DVgri2gnQYM=
X-Google-Smtp-Source: APXvYqyV/8LnpqS2Wet6xMyBNMS7zwPY5LRYLBCUK7nNh7os2FwnJzjVod+2wjbP6ibtQ9cAWq6qGg==
X-Received: by 2002:a17:902:868c:: with SMTP id
	g12mr83582022plo.323.1558633663408; 
	Thu, 23 May 2019 10:47:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id y7sm1569217pja.26.2019.05.23.10.47.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 10:47:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 10:47:35 -0700
Message-Id: <20190523174735.42541-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] spice, spice-protocol: Uprev to 0.14.0
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
X-List-Received-Date: Thu, 23 May 2019 17:47:43 -0000
Content-Transfer-Encoding: 8bit

Drop the patch for fixing printf formatting, its fixed differently
upstream

Forward port pthread_t printf patch

Add -Wno-address-of-packed-member needed with gcc9

replace _append += with just _append syntax

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../spice/spice-protocol_git.bb               |  4 +--
 ...0001-Convert-pthread_t-to-be-numeric.patch | 25 +++++--------
 .../0001-spice-fix-compile-fail-problem.patch | 36 -------------------
 .../recipes-support/spice/spice_git.bb        | 11 +++---
 4 files changed, 17 insertions(+), 59 deletions(-)
 delete mode 100644 meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch

diff --git a/meta-networking/recipes-support/spice/spice-protocol_git.bb b/meta-networking/recipes-support/spice/spice-protocol_git.bb
index 30d0a76752..be9dba32f1 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
@@ -13,9 +13,9 @@ architectures."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
 
-PV = "0.12.13+git${SRCPV}"
+PV = "0.14.0+git${SRCPV}"
 
-SRCREV = "87441524f4e7b79658e42bd8f1f6c3e3c8649aa5"
+SRCREV = "f72ece993aeaf23f77e2845562b20e5563e52ba0"
 
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice-protocol \
diff --git a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
index 505b7c890b..e63cbe3b72 100644
--- a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
+++ b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
@@ -14,21 +14,19 @@ Upstream-Status: Pending
  server/red-client.c  | 6 +++---
  2 files changed, 6 insertions(+), 5 deletions(-)
 
-diff --git a/server/red-channel.c b/server/red-channel.c
-index 1b38f04d..11dc667b 100644
 --- a/server/red-channel.c
 +++ b/server/red-channel.c
-@@ -192,7 +192,7 @@ red_channel_constructed(GObject *object)
+@@ -204,7 +204,7 @@ red_channel_constructed(GObject *object)
  {
      RedChannel *self = RED_CHANNEL(object);
  
--    red_channel_debug(self, "thread_id 0x%lx", self->priv->thread_id);
-+    red_channel_debug(self, "thread_id 0x%lx", (unsigned long)self->priv->thread_id);
+-    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", self->priv->thread_id);
++    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsigned long)self->priv->thread_id);
  
      RedChannelClass *klass = RED_CHANNEL_GET_CLASS(self);
  
-@@ -475,7 +475,8 @@ void red_channel_remove_client(RedChannel *channel, RedChannelClient *rcc)
-         red_channel_warning(channel, "channel->thread_id (0x%lx) != pthread_self (0x%lx)."
+@@ -479,7 +479,8 @@ void red_channel_remove_client(RedChanne
+                             "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
                              "If one of the threads is != io-thread && != vcpu-thread, "
                              "this might be a BUG",
 -                            channel->priv->thread_id, pthread_self());
@@ -37,12 +35,10 @@ index 1b38f04d..11dc667b 100644
      }
      spice_return_if_fail(channel);
      link = g_list_find(channel->priv->clients, rcc);
-diff --git a/server/red-client.c b/server/red-client.c
-index ddfc5400..76986640 100644
 --- a/server/red-client.c
 +++ b/server/red-client.c
-@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *client)
-         spice_warning("client->thread_id (0x%lx) != pthread_self (0x%lx)."
+@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *clien
+                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
                        "If one of the threads is != io-thread && != vcpu-thread,"
                        " this might be a BUG",
 -                      client->thread_id, pthread_self());
@@ -50,8 +46,8 @@ index ddfc5400..76986640 100644
      }
      FOREACH_CHANNEL_CLIENT(client, rcc) {
          if (red_channel_client_is_connected(rcc)) {
-@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *client)
-         spice_warning("client->thread_id (0x%lx) != pthread_self (0x%lx)."
+@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *clien
+                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
                        "If one of the threads is != io-thread && != vcpu-thread,"
                        " this might be a BUG",
 -                      client->thread_id,
@@ -61,6 +57,3 @@ index ddfc5400..76986640 100644
      }
      red_client_set_disconnecting(client);
      FOREACH_CHANNEL_CLIENT(client, rcc) {
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
deleted file mode 100644
index 1f9d5fdd7b..0000000000
--- a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7023732c65b4dc509c46a54fb7715da275b5597f Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 13 Sep 2018 12:39:44 +0800
-Subject: [PATCH] spice: fix compile fail problem
-
-compile error:
-format '%d' expects argument of type 'int', but argument 6 has 
-type 'long unsigned int' [-Werror=format=]
-
-spice compile failed on 32bit system, since upstream commit
-9541cd2fe(in V0.14.1) change %ld to %PRIdPTR, %PRIdPTR is %d, but argument
-strm.total_out is uLong.
-
-Upstream-Status: Submitted[https://github.com/freedesktop/spice/pull/1]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- server/red-replay-qxl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
-index 1fce76c..bd33b58 100644
---- a/server/red-replay-qxl.c
-+++ b/server/red-replay-qxl.c
-@@ -266,7 +266,7 @@ static replay_t read_binary(SpiceReplay *replay, const char *prefix, size_t *siz
-             exit(1);
-         }
-         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
--            spice_error("inflate error %d (disc: %" PRIdPTR ")", ret, *size - strm.total_out);
-+            spice_error("inflate error %d (disc: %ld)", ret, *size - strm.total_out);
-             if (ret == Z_DATA_ERROR) {
-                 /* last operation may be wrong. since we do the recording
-                  * in red_worker, when there is a shutdown from the vcpu/io thread
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 1ad46c2c31..6249b0422b 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -13,10 +13,10 @@ architectures."
 LICENSE = "BSD & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-PV = "0.14.1+git${SRCPV}"
+PV = "0.14.2+git${SRCPV}"
 
-SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
-SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
+SRCREV_spice = "7cbd70b931db76c69c89c2d9d5d704f67381a81b"
+SRCREV_spice-common = "4fc4c2db36c7f07b906e9a326a9d3dc0ae6a2671"
 
 SRCREV_FORMAT = "spice_spice-common"
 
@@ -24,7 +24,6 @@ SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice;name=spice \
     git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
     file://0001-Convert-pthread_t-to-be-numeric.patch \
-    file://0001-spice-fix-compile-fail-problem.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -37,6 +36,8 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
+CFLAGS += "-Wno-address-of-packed-member"
+
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
@@ -54,4 +55,4 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OECONF_toolchain-clang += "--disable-werror"
+EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
-- 
2.21.0


