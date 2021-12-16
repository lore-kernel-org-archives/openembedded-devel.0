Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A6BC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 23:25:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.1847.1639697102211343283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hJCxLPMr;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso4083809pji.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQtvPvzE/dhnfe5/EbytFSAt4soLqJkNnz68MDdqhck=;
        b=hJCxLPMr9n0dRACPlrIw/RUNf0q5O+5FB+TpTMlJgfnUb8J9+1Rg2QQHS/x4UqkwAD
         BY4dzdsyeLpeSTnJW2kme2DM6veaCP/RJSGkId85xz0zms/4QSu9ai08aTrOYz1LLNcu
         0YhhRp8Fbztp7Owtpk647lCUFdvo9vUBBzug+D8v+JnAPmwN7ExMIJGDWNGJ+8841vt6
         d6Xe8vEfjxFN61kbiwqNxKmXTzBI184XZCbcNtVTgsLiOhUWWhleDy6X+oFIXffLbxbh
         oJF01/cQ5a+XfGJZpTRF+2qrCRyeIq/OJe0IAfW73d/8gzyd/fKxUjZQsLGEyJVHyBqq
         V+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQtvPvzE/dhnfe5/EbytFSAt4soLqJkNnz68MDdqhck=;
        b=p53lzgWgtp8njEviEbTfWH8GmMhFVVdTzqcaLUbCftxBWmavGdNpOdF1JW3Hdnpwd1
         B5jnCJzw1+hTtpOf0yhSHPoBuN/MOtX5UR/3b3t//bfAzXyd9Mwb6zMRgodCg+a8L6DG
         NksivocOhsR6nrNfxopRmbuNX1MJ1N7Nc3MOfX++WKFeLFWpMy2WvtOQCm+wjgWmbeEG
         lUKk0X3u5oQWzZRYeJmSM1Dpz4Jb9U77YOmFUuCUyjNmAf2aiGfMo+mmoRo0sEOTuWeF
         1PuW/fL/HdbaZI0DVxjPFsIutF/qlE+YNvHnsqBteg+nfZFSSNzn/w9SY3NUEnQWqE1n
         D2lg==
X-Gm-Message-State: AOAM53004OQbhBdcof05OHFRIIpoSKKGgaf8OXIPhSi4XdJr9bJc9dCu
	SeXLUZiq1Tg7/HdT/Bx6Q+8yRXVYpsY=
X-Google-Smtp-Source: 
 ABdhPJxvIXUfTR7aIntw4Ny7RwEWVpgtetUsNFdlpw0Twhv6GxR1P6vNYQ2L/R0SB9LOdfKEaTGafQ==
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr322317pll.46.1639697101365;
        Thu, 16 Dec 2021 15:25:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 oj11sm9959595pjb.46.2021.12.16.15.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 15:25:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 2/2] libkcapi: Fix build with musl
Date: Thu, 16 Dec 2021 15:24:57 -0800
Message-Id: <20211216232457.1080201-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216232457.1080201-1-raj.khem@gmail.com>
References: <20211216232457.1080201-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 23:25:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94413

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...Adjust-for-musl-msghdr-struct-compat.patch | 81 +++++++++++++++++++
 .../recipes-crypto/libkcapi/libkcapi_1.3.1.bb |  4 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch
new file mode 100644
index 0000000000..687eb359cf
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch
@@ -0,0 +1,81 @@
+From d54e532821d40f8094a49742831d32ec7e76caed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Dec 2021 15:18:21 -0800
+Subject: [PATCH] kcapi-kernel-if: Adjust for musl  msghdr struct compatibility
+
+musl sticks to POSIX and defines msg_iovlen and msg_controllen as int
+and socklen_t types respectively whereas glibc and kernel mark them as
+size_t which is them assumed as such in the code here as well, Make the
+needed conversions to get it going on musl/linux also see [1] for more
+info
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=7168790763cdeb794df52be6e3b39fbb021c5a64
+
+Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/131]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/kcapi-kernel-if.c | 22 ++++++++++++++++++----
+ 1 file changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index 739841e..e5d15d4 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -168,10 +168,14 @@ ssize_t _kcapi_common_send_meta(struct kcapi_handle *handle,
+ 	}
+ 
+ 	msg.msg_control = buffer_p;
+-	msg.msg_controllen = bufferlen;
+ 	msg.msg_iov = iov;
++#ifdef __GLIBC__
+ 	msg.msg_iovlen = iovlen;
+-
++	msg.msg_controllen = bufferlen;
++#else
++	msg.msg_iovlen = (int)iovlen;
++	msg.msg_controllen = (socklen_t)bufferlen;
++#endif
+ 	/* encrypt/decrypt operation */
+ 	header = CMSG_FIRSTHDR(&msg);
+ 	if (!header) {
+@@ -193,7 +197,11 @@ ssize_t _kcapi_common_send_meta(struct kcapi_handle *handle,
+ 		}
+ 		header->cmsg_level = SOL_ALG;
+ 		header->cmsg_type = ALG_SET_IV;
++#ifdef __GLIBC__
+ 		header->cmsg_len = iv_msg_size;
++#else
++		header->cmsg_len = (socklen_t)iv_msg_size;
++#endif
+ 		alg_iv = (void*)CMSG_DATA(header);
+ 		alg_iv->ivlen = tfm->info.ivsize;
+ 		memcpy(alg_iv->iv, handle->cipher.iv, tfm->info.ivsize);
+@@ -244,8 +252,11 @@ ssize_t _kcapi_common_send_data(struct kcapi_handle *handle,
+ 	msg.msg_controllen = 0;
+ 	msg.msg_flags = 0;
+ 	msg.msg_iov = iov;
++#ifdef __GLIBC__
+ 	msg.msg_iovlen = iovlen;
+-
++#else
++	msg.msg_iovlen = (int)iovlen;
++#endif
+ 	ret = sendmsg(*_kcapi_get_opfd(handle), &msg, (int)flags);
+ 	if (ret < 0)
+ 		ret = -errno;
+@@ -542,8 +553,11 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 	msg.msg_controllen = 0;
+ 	msg.msg_flags = 0;
+ 	msg.msg_iov = iov;
++#ifdef __GLIBC__
+ 	msg.msg_iovlen = iovlen;
+-
++#else
++	msg.msg_iovlen = (int)iovlen;
++#endif
+ 	ret = recvmsg(*_kcapi_get_opfd(handle), &msg, 0);
+ 	if (ret < 0)
+ 		ret = -errno;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
index f10d684701..1bd587f0bc 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c467906eb826339c7f09e61808ed23"
 
 S = "${WORKDIR}/git"
 SRCREV = "2936ecd060c299157ac880650ba2c9fd94d27bb1"
-SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
+           file://0001-kcapi-kernel-if-Adjust-for-musl-msghdr-struct-compat.patch \
+          "
 
 inherit autotools
 
-- 
2.34.1


