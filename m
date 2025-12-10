Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BD6D3C52D
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:21 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10966.1765354571242579651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9i/1G6M;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-11beb0a7bd6so752618c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354570; x=1765959370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5wso7EYmbi4n4l093lKi8Ej9fq5B1R8wREFQ0yIRnM=;
        b=i9i/1G6Mfqg9jbjAO3CIMHKSY9HHSM2TXSrvp3cZIworUI4FqrRBsptFprfFTtbmUx
         qFfq4qHdjrk0sCjMFnWxt1H5Krtwu6WhFn/MSkg877+Z+V9fvV91mirU2YE+wljKEd1p
         Gg29DAdAlbCftrkcjLMYV54DU96ySLk5Bs6Jz4NXwMVs75m+jbBnzlBHLpSIEayL78+6
         qG0U0gXd35NPkl7WI11pCeLb6SRfYT6auZ3PeYt3MeXQnHaMq9azYl41IZyOUFNodL6N
         QjmGtlC0hZz+3uO9VPFHCegP46PdWMH7JX8bY+054uLRlWvVu44zNX9b75m3aLYWsf7q
         b0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354570; x=1765959370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5wso7EYmbi4n4l093lKi8Ej9fq5B1R8wREFQ0yIRnM=;
        b=rwIkAuQLUEi2hx8r0+fkNPi4vxPTifqrFV8u3eltJS5pcnvVulIlrucflFNqTWq7g+
         dj3bB4fFYc3TmwWmUG0shlfoubkHCUm28cOlBYHgyp7slGFyp5zuX5FafcAQPsimVwOH
         ZDAMHYwobMlNhfxMBwrMp+8k0vsijesS5m1pqK4ZEeNWW+mlj87T8DTXytwwe9oDSgko
         k1BMwQgH68jSkgdw4XUspr2cGOW3LENjzmBiMtL1zFJ9D/TZht/9/ef3TOEbdDyEIduW
         Of/Z6gX+Oixc8Se5tQOmp0sV4C7Y6LYCWVm4Cl1cUwqijJvJk7PyIYd/dhF1ufXfOV7O
         L33Q==
X-Gm-Message-State: AOJu0YzOv6p7mCvJPLctziwNEtQLVL5534JNmSrIIMuMHO3BF5IEkH9Y
	rnBheCMjLcv2VJpBLteOQBhPgevCb2c4gIc0SIKciUACJe/2ljG5n6IV/W/+mbRQ
X-Gm-Gg: ASbGncv2dmvSyJjc32C8rPcefdU6g6UVb7cfOkIh/ITvqKObAkopBk/LF7qBnbt/E4R
	MK3nsHonF9je/mv2t3aLTuM7SNLRAJHpZNDfOE8LQMPtFVlyYCa/JJ9RMwAk8eX19WOzKAA4rek
	EuX0FiHMndhkQXcZAEKf6Fi3LjB8KralLqceXqlLewgHghJQ++k80VooNzV48jRlUBdg5T0dA4s
	IkaNepGJF3ly5BKFpl9dHAaG3LED46+vhmFal0X5t13f+viDaXKrdarM7rc5r9EV6Nol+V/pVMW
	O06u1C7rK9TcswpW/weIY9w6cxk8ZqgoKvH+wARnsRle8pFmzqIH9NEZqQcQmvslPeEyoqmVTss
	322DO8STraJZZCXBGW7aLMMZ3iDIfZ/evk3+Ei7uRDZlLK9hOTdjFZNPo/tUVTWzClmmCS1QGQe
	+95O/o/pdR9EQE1kJuQrBtU/oc57WTlOo4z++CGolYbsw/cpNfgBJAxZN+PS6kwejttEmJBmTj4
	b5YYp+r9ERw0VH9xg8DlQ+fYx+TOcv3
X-Google-Smtp-Source: AGHT+IGrz5678e93K42VMPsUP9yr6JVLETMApW3DDi3L/wAok0ABRFK0N6YLV+lhefK/XksElbcbUg==
X-Received: by 2002:a05:7022:6091:b0:11b:a8e3:847b with SMTP id a92af1059eb24-11f293b677dmr1281868c88.5.1765354570069;
        Wed, 10 Dec 2025 00:16:10 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] ktls-utils: Fix build with musl
Date: Wed, 10 Dec 2025 00:16:02 -0800
Message-ID: <20251210081607.3196421-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210081607.3196421-1-raj.khem@gmail.com>
References: <20251210081607.3196421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122489

CMSG_NXTHDR results in different signed-ness for cmsghdr
on musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
index 47e1f7f091..947aa90e2e 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
@@ -19,3 +19,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 PACKAGECONFIG[systemd] = "--with-systemd,,systemd"

 SYSTEMD_SERVICE:${PN} = "tlshd.service"
+# ../../../sources/ktls-utils-1.3.0/src/tlshd/quic.c:515:58: error: comparison of integers of different signs: 'unsigned long' and 'long' [-Werror,-Wsign-compare]
+CFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"

