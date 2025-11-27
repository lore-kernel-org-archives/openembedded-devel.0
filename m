Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2129CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 20:58:14 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3451.1764277087954607481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 12:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: danismostlikely@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4edaf8773c4so14757531cf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 12:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764277087; x=1764881887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3sfIaxjAIgN8gif34j+5pIUO5OUcE2zOMjrLmzGyBI=;
        b=n1o2toUF94MZ7VpMyhjfnoWAIy4SkRKQ4ejIh7rbYbkkXvo0yrYcikZCtCrT9pk4bR
         QgMOsf+ylJR8zvl38M8jIW6ohY5x0jsJR6z8pMCLMvqpe2XsHpduMMqOJ6YtpsvgOj09
         sqPvX1CM7LWADCB2C52gOaAx2zYuQsDRWGJGe27cT8vanIBEcLS4EGYKmFOOHN43M+cc
         DjT+0zIj+veXgERJeGgtb3L729z/Sbuj1gDlmZvdpPFwWqCaC8yGtElHvd0dBMlNTZFy
         n0qAyaRksFk/pDvTU4B0REEXt2NnG+htOvglPtr8EHZhI6FFEnzuDJ+lPzF6ncYK9aS6
         PuhA==
X-Gm-Message-State: AOJu0YyDzI1O1XMdwnp5LIZpBLLq4sOKijGSQKBv2TgaVk81T6/W3A5z
	TQJB8QRv0AT/vBJkeBhmHOYn9esjPAA5hAlavUf4FPXLZyoHmYYymXM46wRDqA==
X-Gm-Gg: ASbGnctrn3GSI6Qw19UAtIBxxqNuStmxObzOUKSTPfdqlDE8TBDYOgUQuF2W+lSWjUi
	klepfakSNAxiep0TQmNb3OtaEbALxxF3iwyusOJTFG7Xdcf5sVIAIZDchlHMNMdT3W1bXspdDCW
	G4slRv1Jii8ozP32tNxIv85rPIUpLOWkRA3AcCzzAPmLahgeD+rRRF0s640VwmZQjui1m/6sM9H
	8ms+ssucVBhgTcus4pbtGyuFoM9xNhOiwREIVrJ61zZp6E8srzq3y58qpg+fKSJnHPRkdGhOb/Q
	1m6Mwwr923M1HK4leU4PuTCTMZbi4cAVnYylzhROiR1T2UivCx3TirMBpDPap+ZvebGi5TFlvTo
	FkjpvUZaBjKjaZy4z7zL3eKARehhlght6Bn8qpPXwo17QQ0HkQXLEzjfInA7e/vxYTCKdAPy8E2
	GrIs1b0O7XIPyc/d3PSUoUH/m0xhWRSAdWQW4PzZ3/qg==
X-Google-Smtp-Source: AGHT+IEyRxAPtlxtiU415L4xNkXT3NTNuQ3WEZgaYWqhG9738rhfjxwIaU2vgtMKDhjebiWbfQAM3A==
X-Received: by 2002:a05:622a:1802:b0:4ee:1f09:4c39 with SMTP id d75a77b69052e-4ee58ad4719mr329880781cf.45.1764277086746;
        Thu, 27 Nov 2025 12:58:06 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm14701181cf.3.2025.11.27.12.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:58:06 -0800 (PST)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-networking][PATCH v2] netcat-openbsd: update to 1.228
Date: Thu, 27 Nov 2025 14:57:37 -0600
Message-ID: <20251127205737.1625218-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 20:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122115

A version newer than 1.195 is required for certain features of newer
versions of cloud-init.  May as well bump to the version in Debian
Testing.

I also noticed it appears the licence was incorrectly specified, and is
indeed BSD-3-Clause.

License-update: Added copyright holders and clarified man page licence
Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...bundle-own-base64-encode-decode-functions.patch | 12 ++++++------
 ...0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch | 10 +++++-----
 ...at-openbsd_1.195.bb => netcat-openbsd_1.228.bb} | 14 ++++++--------
 3 files changed, 17 insertions(+), 19 deletions(-)
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.195.bb => netcat-openbsd_1.228.bb} (63%)

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
similarity index 63%
rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
index 99ae90aa914..82753b9f422 100644
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
 

