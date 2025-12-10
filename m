Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0F8D3C93D
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2012.1765388940504673178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UtTB0aOF;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so63665b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388940; x=1765993740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1V7lYn44S/7+6cmVGvWBLVTLlukG/U/tYirJh3yvqM=;
        b=UtTB0aOF4IFAMQwsQXnEBp37zqtSavpC1mb+S50SaCpQumNTzfPf06vQX5kBVOqDKj
         /M7uBcOJAypD6jvtFvQyINHxodwGW54xi7ujh/m46IQd3dCDwMzjlaYDSbBHHEOusVAe
         fqkISkXLLWINHIjPEnb22i3Kg0U2UPWQuOct7ZjNSbIgxikjSfI/elhqTe8VNcjxQbI4
         ulq+ccDOwc0aTsAQwq7p5ncs6Xo9R9vuwEenqVJ/chyzH7tc0NrDHKEpbo2S8lY8RaZj
         ZDwoLfjX0LQQUjkzuY8LWPfSCBTSKgjbzYygJ4V/apVzs8+pShdHPGOT6OF/djUNzGqz
         1m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388940; x=1765993740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1V7lYn44S/7+6cmVGvWBLVTLlukG/U/tYirJh3yvqM=;
        b=mYTHcpORRVkWLsKa8bFJ1mcex51E2uRjiKumeeAWeQ9CuHki2fibfcuBb2UdXBIiba
         Qc2dsd1nL6EVsu/O4w2Pkez8QneoaSkDgalz1v9pnRUu4OtgIRznysI4lnArfzffmHJH
         gHfx2z6flg/ykCZIZeINzdeD6VjkGteET57TM0yFDs5Fln9ooGtSyaJJE6ag/a0dw/Kh
         qBDLPHKYzEsSACsdfLiAB8/9EGoMJFirmCqo4iIVmgfqQKdPfiQ9z5voKqjFvCPIyqK0
         GLDu0ds0ujFx7JqzpM8u7GfCWLPAkFsuEXLcEIUoiGY61yrff05EfLCEAnGRFOL2v/GK
         FQyw==
X-Gm-Message-State: AOJu0YwqUDd6QMcwNNdyx7nPAClxtV/VDsDv73L9bKJJOM0ONh6OUpW8
	tfWOnjG9wRMiPnZtN6vqW+72Ot1CQrgbTdBQmNAnRtZyh0IyC457EfTr41UWTKiW
X-Gm-Gg: ASbGncuMNL8jH4inxwtsm/F4NerDUenHM99NiTJqO8dj4dFUp0WE4QH9dDoxmTr0CRi
	00DlvSm8CX2PAY4fhnSPEy7XRKI1NFErfzJF79dicwT9iGX5c/MYn4x04aiOJkmymngVNIHy2/6
	n4pjEZR9MUQQoyTKJChNyL1GlhafXKTYvIONZ34iP5IdbrfnGV7f2PFo7MhmUIl8E6o2vv68NuX
	WMv/9jhttkIEU/ojEcY8emznMnQ2hcREoC2kbkLKD4rG8gSpmtJcc+hnaFtdz/QKMTyL45wFGRk
	20UwuFliL9OZim//jpSFG97KpKuGngCaQtAfZMK88mswqASwG9P/TfQ6exHykrCzGZ1T28Uri4I
	6eklBXYRbWczqp5bXzab1N83aKmsMgbPha6mM5QZNY/8d2QT2fZZdYWlOwshM5MNoktZvqARm1J
	zQn6T2gLmw96zA643Bn2cYBIqfytfSkOdIKA==
X-Google-Smtp-Source: AGHT+IGLl/1fO3nNpBiBTjz1DIt7EEeoLbYBvvxrZpPViMqrKhNPvTBia2hRcUFq6TpaiJFGDvI4ng==
X-Received: by 2002:a05:6a21:3383:b0:34f:c83b:b3ea with SMTP id adf61e73a8af0-366e0de844amr3582316637.18.1765388939568;
        Wed, 10 Dec 2025 09:48:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:48:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 02/10] netcat-openbsd: update to 1.228
Date: Wed, 10 Dec 2025 23:18:39 +0530
Message-ID: <20251210174847.2828731-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122568

From: Dan McGregor <dan.mcgregor@usask.ca>

A version newer than 1.195 is required for certain features of newer
versions of cloud-init.  May as well bump to the version in Debian
Testing.

I also noticed it appears the licence was incorrectly specified, and is
indeed BSD-3-Clause.

License-update: Added copyright holders and clarified man page licence
Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91389e4d5aff2180fb947746c058c520ff3ea042)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...bundle-own-base64-encode-decode-functions.patch | 12 ++++++------
 ...0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch | 10 +++++-----
 ...at-openbsd_1.195.bb => netcat-openbsd_1.228.bb} | 14 ++++++--------
 3 files changed, 17 insertions(+), 19 deletions(-)
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.195.bb => netcat-openbsd_1.228.bb} (63%)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
index 929f63f4a9..7e665d777f 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
@@ -14,7 +14,7 @@ Update to version 1.190-2
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  Makefile |   4 +-
- base64.c | 313 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ base64.c | 313 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
  netcat.c |   3 +
  socks.c  |   3 +
  4 files changed, 321 insertions(+), 2 deletions(-)
@@ -360,8 +360,8 @@ diff --git a/netcat.c b/netcat.c
 index a0fb51b..9c4ed23 100644
 --- a/netcat.c
 +++ b/netcat.c
-@@ -240,6 +240,9 @@ static int connect_with_timeout(int fd, const struct sockaddr *sa,
- 
+@@ -239,6 +239,9 @@ char *proto_name(int, int);
+ static int connect_with_timeout(int, const struct sockaddr *, socklen_t, int);
  static void quit();
  
 +int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
@@ -378,10 +378,10 @@ index 9068f39..c576f6b 100644
  #define SOCKS_DOMAIN	3
  #define SOCKS_IPV6	4
  
-+int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
-+int    b64_pton(char const *src, u_char *target, size_t targsize);
++int	b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
++int	b64_pton(char const *src, u_char *target, size_t targsize);
 +
- int	remote_connect(const char *, const char *, struct addrinfo);
+ int	remote_connect(const char *, const char *, struct addrinfo, char *);
  int	socks_connect(const char *, const char *, struct addrinfo,
  	    const char *, const char *, struct addrinfo, int,
 -- 
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
index c1757d39ad..d574ee0b67 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
@@ -28,19 +28,19 @@ Signed-off-by: mark.yang <mark.yang@lge.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/netcat.c b/netcat.c
-index d70598a..b8ba959 100644
+index 62d01d8..7367f47 100644
 --- a/netcat.c
 +++ b/netcat.c
-@@ -238,7 +238,7 @@ char *proto_name(int uflag, int dccpflag);
- static int connect_with_timeout(int fd, const struct sockaddr *sa,
-         socklen_t salen, int ctimeout);
+@@ -237,7 +237,7 @@ ssize_t fillbuf(int, unsigned char *, size_t *);
  
+ char *proto_name(int, int);
+ static int connect_with_timeout(int, const struct sockaddr *, socklen_t, int);
 -static void quit();
 +static void quit(int sig);
  
  int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
  int    b64_pton(char const *src, u_char *target, size_t targsize);
-@@ -2235,7 +2235,7 @@ usage(int ret)
+@@ -2347,7 +2347,7 @@ usage(int ret)
   * quit()
   * handler for a "-q" timeout (exit 0 instead of 1)
   */
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
similarity index 63%
rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
index 99ae90aa91..82753b9f42 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
@@ -1,22 +1,20 @@
 require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=f39e60ae4ea9fdb559c833be2e59de99"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=7c58e21ba8c9e76c25f46b2182b23bb8"
 
 DEPENDS += "glib-2.0 libbsd"
 do_patch[depends] = "quilt-native:do_populate_sysroot"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20181022T085404Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
-           http://snapshot.debian.org/archive/debian/20181022T085404Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20250301T025722Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
+           http://snapshot.debian.org/archive/debian/20250301T025722Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
            file://0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch \
            "
 
-SRC_URI[netcat.md5sum] = "219d5e49c45658e229a3bda63063a986"
-SRC_URI[netcat.sha256sum] = "0e283b2a214313c69447cd962c528ac19afb3ddfe606b25de6d179f187cde4c3"
-SRC_URI[netcat-patch.md5sum] = "7eba241989dbef6caa78ec4bc8e35151"
-SRC_URI[netcat-patch.sha256sum] = "c6736fcbab5254cbbc52278993a951da1126e42800a297c27db297e332e2017e"
+SRC_URI[netcat.sha256sum] = "e501b0239db0d8f981b964adee74effe80e6337e5d402a00515a6df8d933269e"
+SRC_URI[netcat-patch.sha256sum] = "7989cc18b3ffa4ef1da57149bd3fc03999546a91c35b82b49caf4d758015c573"
 
 inherit pkgconfig
 

