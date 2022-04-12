Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E695C46467
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.2475.1649800999339431980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CTsUvSmO;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id j17so241471pfi.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CR9qAfuwL0AEXWkCp7hu+ongZkjK7cUDBn0Y739m8SQ=;
        b=CTsUvSmO66BGf7klKqKBe565A2DUR/opVuE/i6zgYb9LjH9GI08vsqLDbZa+WYIHn0
         Iv/WhXWLE/zV7+WCis0GEr2iXIzKf7iPlk7E8Mu4Z2rz61RGgo/i//BQVXvp8CZMkZ3x
         z+T2aZNU3AoRdbRzIkElElKkqCL96FDWZyLpECUb2oe6C2H3vbUeQs79G+9HT2fwZyfr
         Nbv1tU312+YbERrbE3wughd8KT+QjlGGBpOlyJUY4dDuMfRTjMYjaEHQs0eBhjjghWOv
         5znK1/l0ewCyMQ9txe2bg3WjolOByRu9Wpkez28hWjv4IgZst+Rartz9tcK/Ao/Ft3gB
         V/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CR9qAfuwL0AEXWkCp7hu+ongZkjK7cUDBn0Y739m8SQ=;
        b=vniIaUW0ZZ13kjU3hvGxYDy4lYIUkxhBosjCV/Ec7aNn7jxWCvOUaPXhEn0m8ucTP5
         DW7GELt17v4JGhKp6xjEhohAH7vTJUErFX6t1WRT2Fu92kG+VLXS5hHwG9YaoBgrIwH3
         xzvr8SWq+L96K2vL6uPNw1COmkSk4PJK5yIHl7VhpC9jmcHXV+W9Bt+7xDocJOgj+jLN
         /cX6dCyx/d1S6kKnHtjJMr7HbSbMdlYp5WTxUeUXkwN7NefDrCBlKsBjBssGOmp8Z8IH
         MOZgFjKwTdgCpsUbmBzdQWrBnv/cGYvBXvQv3YEnDHpS6v5E5gm+uJdTMdCyMh3iOuuc
         2Cyg==
X-Gm-Message-State: AOAM532nxzGTts4ri2BQgbc4HfBEZIzbMLgD8FLoAgmCPvKgynxVui2y
	T5V7idc4q4TbVoK6/ISqwR/3DdLiXHSaZg==
X-Google-Smtp-Source: 
 ABdhPJwqNf2aW8BGBJXdDhW3xbgDwjY+2jjEWVMijWZgghAxFICC5ioefclUZsigcQYz1PRJE4AViw==
X-Received: by 2002:a63:6809:0:b0:37c:68d3:1224 with SMTP id
 d9-20020a636809000000b0037c68d31224mr31725010pgc.287.1649800998597;
        Tue, 12 Apr 2022 15:03:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/7] libkcapi: Upgrade to 1.4.0
Date: Tue, 12 Apr 2022 15:03:10 -0700
Message-Id: <20220412220316.3876985-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96594

Drop upstreamed patch
Disable new warnings seen with gcc 12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Adjust-for-musl-msghdr-struct-compat.patch | 81 -------------------
 .../{libkcapi_1.3.1.bb => libkcapi_1.4.0.bb}  |  7 +-
 2 files changed, 4 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.3.1.bb => libkcapi_1.4.0.bb} (80%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch
deleted file mode 100644
index 687eb359cf..0000000000
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From d54e532821d40f8094a49742831d32ec7e76caed Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Dec 2021 15:18:21 -0800
-Subject: [PATCH] kcapi-kernel-if: Adjust for musl  msghdr struct compatibility
-
-musl sticks to POSIX and defines msg_iovlen and msg_controllen as int
-and socklen_t types respectively whereas glibc and kernel mark them as
-size_t which is them assumed as such in the code here as well, Make the
-needed conversions to get it going on musl/linux also see [1] for more
-info
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=7168790763cdeb794df52be6e3b39fbb021c5a64
-
-Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/131]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/kcapi-kernel-if.c | 22 ++++++++++++++++++----
- 1 file changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
-index 739841e..e5d15d4 100644
---- a/lib/kcapi-kernel-if.c
-+++ b/lib/kcapi-kernel-if.c
-@@ -168,10 +168,14 @@ ssize_t _kcapi_common_send_meta(struct kcapi_handle *handle,
- 	}
- 
- 	msg.msg_control = buffer_p;
--	msg.msg_controllen = bufferlen;
- 	msg.msg_iov = iov;
-+#ifdef __GLIBC__
- 	msg.msg_iovlen = iovlen;
--
-+	msg.msg_controllen = bufferlen;
-+#else
-+	msg.msg_iovlen = (int)iovlen;
-+	msg.msg_controllen = (socklen_t)bufferlen;
-+#endif
- 	/* encrypt/decrypt operation */
- 	header = CMSG_FIRSTHDR(&msg);
- 	if (!header) {
-@@ -193,7 +197,11 @@ ssize_t _kcapi_common_send_meta(struct kcapi_handle *handle,
- 		}
- 		header->cmsg_level = SOL_ALG;
- 		header->cmsg_type = ALG_SET_IV;
-+#ifdef __GLIBC__
- 		header->cmsg_len = iv_msg_size;
-+#else
-+		header->cmsg_len = (socklen_t)iv_msg_size;
-+#endif
- 		alg_iv = (void*)CMSG_DATA(header);
- 		alg_iv->ivlen = tfm->info.ivsize;
- 		memcpy(alg_iv->iv, handle->cipher.iv, tfm->info.ivsize);
-@@ -244,8 +252,11 @@ ssize_t _kcapi_common_send_data(struct kcapi_handle *handle,
- 	msg.msg_controllen = 0;
- 	msg.msg_flags = 0;
- 	msg.msg_iov = iov;
-+#ifdef __GLIBC__
- 	msg.msg_iovlen = iovlen;
--
-+#else
-+	msg.msg_iovlen = (int)iovlen;
-+#endif
- 	ret = sendmsg(*_kcapi_get_opfd(handle), &msg, (int)flags);
- 	if (ret < 0)
- 		ret = -errno;
-@@ -542,8 +553,11 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
- 	msg.msg_controllen = 0;
- 	msg.msg_flags = 0;
- 	msg.msg_iov = iov;
-+#ifdef __GLIBC__
- 	msg.msg_iovlen = iovlen;
--
-+#else
-+	msg.msg_iovlen = (int)iovlen;
-+#endif
- 	ret = recvmsg(*_kcapi_get_opfd(handle), &msg, 0);
- 	if (ret < 0)
- 		ret = -errno;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.4.0.bb
similarity index 80%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.4.0.bb
index 8ff5ddd175..3be8c76b54 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.4.0.bb
@@ -1,12 +1,11 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "http://www.chronox.de/libkcapi.html"
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=80c467906eb826339c7f09e61808ed23"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a2562899bc38f1735868f0bf0c1dd1a5"
 
 S = "${WORKDIR}/git"
-SRCREV = "2936ecd060c299157ac880650ba2c9fd94d27bb1"
+SRCREV = "1429ab42d48123cc8f73b96c69a87fb9c6d8a7c9"
 SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
-           file://0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch \
           "
 
 inherit autotools
@@ -27,5 +26,7 @@ do_install:append() {
 }
 
 CPPFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
+CPPFLAGS:remove:libc-musl:toolchain-clang = "-Wno-error=sign-conversion"
+CPPFLAGS:append:libc-musl = " -Wno-error=sign-conversion"
 
 BBCLASSEXTEND = "native"
-- 
2.35.1


