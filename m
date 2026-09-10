Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F486C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:01:23 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7494.1789020071400678406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UDP0Gb5T;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: raj.khem@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so1128634fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 23:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789020070; x=1789624870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=15vNMdq9uPcn10C6dF87fAQ+gE3O7E0fp5I6WNAvUuM=;
        b=UDP0Gb5T+6Lv8RaG2OMLY1GaBccvS3m6tvNYYHi2pZTjzZr068owOTwZPUXABbLPX4
         rdUIHFslJiTwcLt3BgmVMA/dGpfloQcxEa4FItnLrTpK/C1lT+tP/VTiSv0gqHhHIILd
         u76sLzKVxJuXnrERisZyRJ3VAEVWXjKb8FrC/1dcKsLmZC8m2jldi05VUFdQivFOYIba
         y6kkY8gKhhl8I/7/ige1fgR0Wl9UmeTz/gnxZQargoN5msXCpmc8EqQkV5Yc51os7n0I
         l5r+JA7rJ2qcSbGSSaV30XCx/4HKYBOZ/wwJDP0kW1H8n7G7xymmaTwAzypBBvzf8DSY
         ue5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789020070; x=1789624870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15vNMdq9uPcn10C6dF87fAQ+gE3O7E0fp5I6WNAvUuM=;
        b=GgbhugtwAOdufoqKckmb7ZcktpwGlFbWyHz+LWfUBwluYgx3kWnYQe36uwNJNn2YGG
         ZAX4FD0TJM2aP9VW/xeur0CeRg7BMDMPIdfYIFoKTPQk2hzFvVbUajBfoPfzCs6/0lh5
         HKiUA0WK8t/3PFOJE5toRss9udreE2NUrkzXEsXR+uQAoILwdW5aX4o64eo+bmm+6AdZ
         oDNl7/9kXQ4y8EkqLr5WwzcxiQTlyCTsVBR+v3vwts3/SR+PJxS0vShdDjOSmVVdpbnB
         4NfA3wpWZg6Nf35i5ZC4DiBNEbFQH9GTjqDJ95FUS+xumw7nDB41HirC4pFsyByllXx9
         lHXg==
X-Gm-Message-State: AFuF++nnvUOcx6IOaSpbTAYT14OXDxjJx6fqH0c+Z+2zYp5cg7m1jk6t
	1i//mYZlpZJGOjdN/CA6CQeLpX/uF3rBZ0tIn5ei5QudlAg2I4CjNyUIwt98eQ==
X-Gm-Gg: AYBFou3uUyYwONrcoqLH/a4bR+U7+hL7O+wo+z1yF+jRxAigWSzPFfHlS4KcBA9Sq6o
	xF/uZhSBYezGcj5RVw7q1QD5BI5MnfsWNTBb8wWdKQoEotOqLKZO8HAQfyVydSxdJabsSbg4t0w
	PqAlzxTux4e1vV82x9iOMgYaqyZ4G+ydq1TA0xeDtp1m7kVIujTY/S/b3iuJHxZ4L/xoC+uH9LY
	y55cqat1E7RvQraEEiqjlqe1VsZXM7aDLlL1tToOTyb1Ba1B3yT8yoFa5EIgxXBBRuQNvSoGtn7
	f8dHvuDM0VjppevMmIyaa7LkusdwX9X5D7zQT18Oiqh5TADQy/eXhlT/sy95er4aC9ZnwgYY102
	Kj7arGc1QglSU2kbyezC/8A6gIPISL5ShvJxHzY3B29gdzfRnclrYmxajJUrc3TtwJjGzuPWMjA
	2PIKBsieK7dwn4TA5MfZ1atd+AUhCBtz5AVfHea/ez8nqew+348Ktt7dB/HaI2Fpqsy/c11v/g3
	YHmVl+GKpCZkHM5+e/A5kXnxHAdd+f9jsxjA/YajdVp728FN070KQPRKepNmEwiLdj6VZRLIvX3
	LMqy1OCBC+l3hbgYM2LAuVAwz5RypanpNOO4W9cHijOH9cCOJ63/YT8oP+dGyJYPahiYKKJo9ai
	Ort3wN3D8jyd5BAOgXSM5pOgNnuhS7DxzA4pGOX3u8NTrsBdvWkQzT6s8
X-Received: by 2002:a05:6820:1529:b0:6b7:46fa:1699 with SMTP id 006d021491bc7-6bee78372a5mr3370074eaf.46.1789020070217;
        Wed, 09 Sep 2026 23:01:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm59531570c88.5.2026.09.09.23.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:01:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] spdm-emu: Switch default crypto backend to mbedtls and update to latest tip
Date: Wed,  9 Sep 2026 23:01:06 -0700
Message-ID: <20260910060106.2214089-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 06:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129906

The openssl backend no longer compiles against openssl 4.x. OpenSSL 4.0
made struct asn1_string_st opaque (asn1.h only forward declares it now),
while libspdm's cryptlib_openssl still reaches into ASN1_INTEGER and
ASN1_TIME members directly:

  libspdm/os_stub/cryptlib_openssl/pk/x509.c:814:51: error: incomplete
    definition of type 'ASN1_INTEGER' (aka 'struct asn1_string_st')
  libspdm/os_stub/cryptlib_openssl/pk/x509.c:1131:14: error: invalid
    application of 'sizeof' to an incomplete type 'ASN1_TIME'

make the crypto backend a PACKAGECONFIG choice and default to mbedtls,
which builds fine. openssl stays selectable for anyone still on openssl
3.x, and the two options are marked as mutually exclusive.

While at it, update SRCREV to the current tip of main, which carries 41
commits including a build refactor, TPM support, Linux kernel MCTP stack
support and several libspdm syncs.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
index 060cb055fc..99fd0a45b7 100644
--- a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ed4cfe4688e1ac2cc2e6748766571949"

 SRC_URI = "gitsm://github.com/DMTF/spdm-emu;protocol=https;branch=main"

-SRCREV = "5fca359b15e4edd4f070ca83c9da02799b6f78ae"
+SRCREV = "ea77f25410cc01098320c0b44b3e150192ec4d5e"
 # Upstream release tags are "X.Y.Z" (newest 3.8.0).
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 # PV is "git" (AUTOINC recipe with no numeric PV), so the resolved tag (3.8.0)
@@ -16,9 +16,11 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_VERSION_UNKNOWN = "1"
 inherit cmake pkgconfig systemd

-DEPENDS = "openssl"
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "mbedtls ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-DENABLE_SYSTEMD=ON,-DENABLE_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[openssl] = "-DCRYPTO=openssl -DENABLE_BINARY_BUILD=1,,openssl,,,mbedtls"
+# ENABLE_BINARY_BUILD=0 makes libspdm compile its own bundled mbedtls
+PACKAGECONFIG[mbedtls] = "-DCRYPTO=mbedtls -DENABLE_BINARY_BUILD=0,,,,,openssl"

 SYSTEMD_SERVICE:${PN} = "spdm-responder-emu.service"

@@ -45,8 +47,6 @@ EXTRA_OECMAKE += "\
     -DARCH=${@get_spdm_multiarch(d)} \
     -DTOOLCHAIN=NONE \
     -DTARGET=Release \
-    -DCRYPTO=openssl \
-    -DENABLE_BINARY_BUILD=1 \
     -DCOMPILED_LIBCRYPTO_PATH=${libdir} \
     -DCOMPILED_LIBSSL_PATH=${libdir} \
 "

