Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6292CAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:20:36 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.3448.1758914433611807770
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 12:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KDP1gQBg;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-85e76e886a0so142757485a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 12:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758914432; x=1759519232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgcVeytlYkyHeJSnG9PTFiLz7YOqOCYDG7NutH+NSZs=;
        b=KDP1gQBgMBZyOkjs5S7Jkf1UMAC4Bu8UBXT6/K+O5odAz1Fqf1TAidv113cMG7Bsqv
         vCGIPXjMSjkF8tMYcJCcql2jgxjIrcZLYkX3//8kVpHJXgeE1FsawYa70b+XlkBXT4yi
         r131w3xnNI39Oo+9C3uGsdeKoqPeWbtd8pOpgjZrw+8t5Cfbg7nqo2iZ7dmcZ5Y90tmm
         7wCHdEhKdvS0j+qxcHcKVuwGSgkiljJ0us81I8u4qcov3VA0tm0CLQguHEhbLyL4SN8h
         d2mwQtIbmlT1hkxPhq8hnJ/MjAOTgLbk9MDRSMJEpIzRsRBiekZ4P6FFd3tEUG1KpXHT
         kFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758914432; x=1759519232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgcVeytlYkyHeJSnG9PTFiLz7YOqOCYDG7NutH+NSZs=;
        b=f0NVuhessR1Qok0Osf7YRWQITJdV9Q6Atn4hMt5lVLGM6qDvRW7cvZCez4Eqd8WI+z
         /cZ7F0bjnOf+Jb61SlnKDI0wNtCFGTERG9fTO6iFwjSQYhNM5D4DxN7ujNizE2cXELXu
         UqwlMUfF/WNlWexwUnJWA0MKRBG5EotHVJNqdp2OnNSZip36dAgYeGo3N0NrD96UI+qV
         GyRX9Zum96sNEcJ5YEWN9mmSwKcHbeShofEGNL470hewKM/wKGAvXqJvS69HFLPRKzkX
         LE+xEM2lU0/kamIdJOszdRLG0G9bECaKPwN7TtqCQjOtdqZXZlY0XlpaCXYuJwWBz/0Y
         HStg==
X-Gm-Message-State: AOJu0Yya5l84x79HL0i1b6A58eJPgzgezNcBe6CeuBBvKR39OK/KsCN6
	vJ3u4GVMF76rfg58B3sZFEJe41OsHdklo32tN3XHVXE6Qd3HKhf0swPTXBKYlw==
X-Gm-Gg: ASbGncubZLJfM7CXIyz91zMQ0jIDLsxi2mUa6kcf7oL1HObVVP77x3ZGcc1CiedB5SG
	MPYbxAfHCcN1ZTVjhKM3I9CNJuXUi971ZOdWqy18BOV6c9aeB/sOdVnu/ILHuHjJ0X/WyMm3h7a
	FdqXr/DQSM2qnmb5qppzEEBMdi2MO7+/kAFU9m6ACVDCaD8eaunS3hz2wQ0ZNmHk5Q9BiiCxD8G
	cPSCUZBtWKeSZarIw1TL0sqPb2i4jW4zsWD5DGECJMBBAw7r55+VTIO0Deu0HmMJnnmhIg+Ta41
	iJPjFAECLXe9v1ANDw9bVQgXhxBETdHQJX6waeISw5BdQ0g4KgLLPqxCE4CxpRRro5mKGXqPKgv
	h0/iWJgIWutjppJRrosfHdMgom6SddF0DKLW/uSsKMcUZ9374In1tcg==
X-Google-Smtp-Source: AGHT+IG3qvWniNlMYDij/spx7fk4zAwyzd2NIxAIA+Pp+86U7oULIQ4QPA/SAVnFelYEIYGhJG5NUg==
X-Received: by 2002:a05:620a:1727:b0:864:c4b9:da10 with SMTP id af79cd13be357-864c4b9fa77mr17019485a.81.1758914432127;
        Fri, 26 Sep 2025 12:20:32 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0b94599esm30523571cf.16.2025.09.26.12.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 12:20:31 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-networking][PATCH] netcat-openbsd: update to 1.228
Date: Fri, 26 Sep 2025 13:20:25 -0600
Message-ID: <20250926192025.894307-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 19:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119937

From: Dan McGregor <dan.mcgregor@usask.ca>

A version newer than 1.195 is required for certain features of newer
versions of cloud-init.  May as well bump to the version in Debian
Testing.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...1-bundle-own-base64-encode-decode-functions.patch | 12 ++++++------
 .../0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch  | 10 +++++-----
 ...tcat-openbsd_1.195.bb => netcat-openbsd_1.228.bb} | 12 +++++-------
 3 files changed, 16 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.195.bb => netcat-openbsd_1.228.bb} (64%)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
index 929f63f4a9c..7e665d777fb 100644
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
index c1757d39ad8..d574ee0b67c 100644
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
similarity index 64%
rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
index 99ae90aa914..af01f7f2ac4 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
@@ -2,21 +2,19 @@ require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=f39e60ae4ea9fdb559c833be2e59de99"
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
 

