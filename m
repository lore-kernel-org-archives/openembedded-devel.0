Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288F6C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 01:02:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.3547.1668646924127698677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 17:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L71KQUq1;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso3945325pjg.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 17:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xxP5jUtmySjOAOYCYQvhsNBq5stZk5wRRa3h7B6GEE=;
        b=L71KQUq1bp33VMzg+J+j5z3kCHIb7ySEPZGeUkPU35MSG4WNDXZIxL9SOSY/OzTm+V
         MORszBFFUt7Qc5uOVPFa6Zz66TfOR0S0bGPXF1N/LB49pIqrf3harPEo7RX7sEnGy6OK
         cgH9zuKMk4VZWEOp4k+ZeoN+EJXoIV0ANOezMGwlv2wAiQcWzRpYjT0JVCCIP9/vccT8
         CPmo8brvLRlb+Kd6v1y0MqlimC8PENhPwu6KiKCPW2t4yef9AmD4uPlNCoPBYwBQBxhw
         HwbBNLJ6MycHFCpxESCxxftgEc7ktnbQWlyS//oyddQ0MvXFLmeE/8xfKk+N3KfYCpk3
         B2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xxP5jUtmySjOAOYCYQvhsNBq5stZk5wRRa3h7B6GEE=;
        b=S//dUyX/VABqU8tgj61GbVysSJPpXBf1n1Ysx5NMDTANkanO6lU3lNK/HdKV2eWNtE
         TfU6hMVLLroBj0h77mw1XCG+UjzXcWm6/Q/DoWWW8Kpj+VLcPQ7nRGqiGYmCHV8Ijyuj
         eNR3HlgqaBlLV8lqTs7jtJZ533f7ee8GKeEXP6otoJzUhe7cXCpROEB/ZSJaP/GFbouS
         u7eRDgAjacPQfdFIotmJ71oYsvxw+0cN13vcTnxrr+HH3Pn2eOgMZgvFuLmbk1HzkNT5
         sKSthAxpdn9K03cmrtDPOmveL5RnlLbh6n20x4jZbsusdPNTJbe89J6b2lIHo8Bv+6QY
         I2yg==
X-Gm-Message-State: ANoB5pk6heQN1iji5RvyzLAyt0pjFxyJRjXBYyLo97+tYtfIRvwEgKQl
	huCgpOWjWhdphZ2x0aYdsZDc43MOucQ=
X-Google-Smtp-Source: AA0mqf5rbGpeyjqlQQZxozcfsYVcNRNTJ0I70ASn4PD+hRW+WYNQIMNEikeExN0rJ1qi/g0bsNkvIA==
X-Received: by 2002:a17:902:da82:b0:176:9842:c651 with SMTP id j2-20020a170902da8200b001769842c651mr378209plx.108.1668646923168;
        Wed, 16 Nov 2022 17:02:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::8bfc])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902f15100b00186b3c3e2dasm12874008plb.155.2022.11.16.17.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 17:02:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xcb-util-cursor: Update to 0.1.4
Date: Wed, 16 Nov 2022 17:01:59 -0800
Message-Id: <20221117010159.238102-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 01:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99600

Changes compared to 0.1.3

xcb-util-cursor 0.1.4HEADxcb-util-cursor-0.1.4master
autogen: add default patch prefix
autogen.sh: use quoted string variables
autogen.sh: use exec instead of waiting for configure to finish
autogen.sh: Honor NOCONFIGURE=1
configure: Drop AM_MAINTAINER_MODE
gitlab CI: add a basic build test
Update m4 to xorg/util/xcb-util-m4@c617eee22ae5c285e79e81
Use AC_CONFIG_FILES to replace the deprecated AC_OUTPUT with parameters
Build xz tarballs instead of bzip2
Add README.md to EXTRA_DIST
Update README for gitlab migration
Fix out-of-source builds
documentation: Call xcb_free_cursor() when done

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{xcb-util-cursor_0.1.3.bb => xcb-util-cursor_0.1.4.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{xcb-util-cursor_0.1.3.bb => xcb-util-cursor_0.1.4.bb} (62%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb b/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
similarity index 62%
rename from meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb
rename to meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
index f935edd6fe..047697845c 100644
--- a/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
@@ -7,5 +7,4 @@ DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
 
-SRC_URI[md5sum] = "6ac3b17cba51aaaa36ba035a53527214"
-SRC_URI[sha256sum] = "05a10a0706a1a789a078be297b5fb663f66a71fb7f7f1b99658264c35926394f"
+SRC_URI[sha256sum] = "28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb"
-- 
2.38.1


