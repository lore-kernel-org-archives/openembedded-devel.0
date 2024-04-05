Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648D3C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 16:25:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.17032.1712334315563428636
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 09:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZHWcGJUD;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1357642f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712334312; x=1712939112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPuH7H5lT3pZkRRl1ZPXhuzj5+JQs2cGcB2hZIuGgf8=;
        b=ZHWcGJUDjKiwbQWvkjBureAqU6Me6xBhrIZVxmS+36mG/+pJmBzosdpMsCwYMvFGyv
         zFZK4y3bMi9U+WMIWlqmRNuF/MQ9Za2K1fGKDeWv3JnoaJ9IfBjIs19OXIonJlHQdekA
         BQO22XclLn/uzzl2yfI4oAsMekN2jhBXO/9AuzLqDMF3N5XKAXmIauZ1lLk4X+Z6NUeh
         tIIi01M0FIK9XWV2YkDOPw4/6ecXXA15zzhyheS4SERZbknSqoFyRPkuAVSGi6b/U6w6
         pnNd4PA2bMS8p38Lyc+/TyGSUoAiiYmCODrKgbPvmM5JtKEvMOVo2UWW9N2EfmXYZVJq
         lNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712334312; x=1712939112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPuH7H5lT3pZkRRl1ZPXhuzj5+JQs2cGcB2hZIuGgf8=;
        b=VSRkw2u44umzzUZiRrOnQtqjULq3g5xwoQRXdTLZUfzB2d2WOHwTQ+TJ4Fica1PI3H
         SCQ6xJyMHBNaTJt3CvVV0JtNmE8U3sdMoM1OhbBcL9WT/PmGpgqsQTYML1aBQRR9+mZ9
         u9F1f9aCAho/9cjVChnc9aEWHmFoGfaZJSUpIv2DujQB1m63ES2mDdpqXhQZtajaRkdV
         8JRSEaSotcdx0b2tDsL0H3T+ugtw7HiXBXpUqsUQN1ZkDJeOrvkB5JXK+ju9cExjqIwT
         wjD639QwTeGFkLkXhtE79aVfVJp5+fK/E+dWXMK9cWS5VjEJ9b1TzeNg5pAK3ZF1XIOx
         Uq+g==
X-Gm-Message-State: AOJu0Yy7hYEb8OYlD9TxdypSIn+PBtl3ZLIodU8/ltPsnvcH1wrKVrla
	i6c0YOU6/gxdP56JR9ohi8rbUjRn0sCiKT+2cWQeQ2fjCl7Lp5H4ejjbMqrs3rb3pLMfltpuZmP
	GUUA=
X-Google-Smtp-Source: AGHT+IFdZK4LyCjl0uUB57HtDcxfngMSBomnQoTUNETcZrehPLjD8h5ayOYBKv/7uPoG9JwaimD4kw==
X-Received: by 2002:a5d:6107:0:b0:33e:c68d:d536 with SMTP id v7-20020a5d6107000000b0033ec68dd536mr1911926wrt.15.1712334311816;
        Fri, 05 Apr 2024 09:25:11 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d4ec7000000b0033dd2a7167fsm2361712wrv.29.2024.04.05.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:25:11 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [oe][meta-oe][PATCH] composefs: add a new recipe
Date: Fri,  5 Apr 2024 18:24:59 +0200
Message-ID: <20240405162459.1286945-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 16:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109825

Tools to handle creating and mounting composefs images

Flexible mechanism to support read-only mountable filesystem trees,
stacking on top of Linux filesystem.

It will allow to enable filesystem integrity by leveraging the stack:
ostree -> composefs -> fs-verity

For reference:
https://github.com/containers/composefs?tab=readme-ov-file#filesystem-integrity
https://ostreedev.github.io/ostree/composefs/#using-composefs-with-ostree

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../composefs/composefs_1.0.3.bb              | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-extended/composefs/composefs_1.0.3.bb

diff --git a/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb b/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb
new file mode 100644
index 0000000000..ddc67d9b57
--- /dev/null
+++ b/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Tools to handle creating and mounting composefs images"
+HOMEPAGE = "https://github.com/containers/composefs"
+LICENSE = "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
+LIC_FILES_CHKSUM = "\
+    file://BSD-2-Clause.txt;md5=121c8a0a8fa5961a26b7863034ebcce8 \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+"
+DEPENDS = "fuse3 openssl"
+SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
+PV = "1.0.3"
+
+SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.43.0


