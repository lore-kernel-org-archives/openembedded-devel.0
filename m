Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DFCC369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.9978.1744977120990666280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCq46jKI;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso359226666b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977119; x=1745581919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dPFKPIMcXMPWLxnx74uryrWdzAarj8Qzu/lwf9H2dk=;
        b=jCq46jKIpokFbGJsl/QyRQq//8HVrtJ6I+OpfZLFnBc1RcmkJliWDbteQO78SFPwu1
         ORCs+4qyFIFj81/pevnAg0/aRjFR2ZQOjwZKyGbgFvp9pbqrY5A148P9E/bdojT3mVTs
         00y5y9rKCdRtyVY1M1wfcmLCwcm/oHxXn+0XQMaSd9SAxZDlttmz9lPV/53KImadzSGX
         xjpTQ6NIxS7M4BnWZE7mMVOPMbpnv8qhkrz9em1YWpJqzM1rMHh09+g7vgYGlu1yJFCS
         7jwbU0untWVeQZdY+bcyN0tJGbDZTMaU0cVWZMbLT+ZBc7aSupakCjjpgpfI2uB2KKYc
         zAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977119; x=1745581919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dPFKPIMcXMPWLxnx74uryrWdzAarj8Qzu/lwf9H2dk=;
        b=o133HF2oboYsNfXtskdq4hiTq88rxyBQ70ROGOQc0cg3WeO+1o2JPbooM4etH5Wngh
         7yHWjk9xeAcf+rn476gPI3Dq82u/dqQjDd1U5nOUVpHhrAh9R+WAI0WfXdPeQiRQ9YuL
         gJhIGeomGTQRzesrKNBHxymb9NydBapxKBapbNFHYFj0R3zYexf/3Az4qdFQaaGPz07M
         EH5VCwx1JLC9hO27VNFXGlgGh83Fzz8XPF+bLzIIHA30nyUhbrYM9lN36XkYbXOgCw4N
         gy530q9SmjdaGNNtFO8t3DbAQOHvIL41Hg0INVcbzh35erguqgv6GhKGFxlHfvKf4zEb
         u7hw==
X-Gm-Message-State: AOJu0YwpdBOA1THxgLFNaxx/xhBBXXJ2/xM8QicCNGw8zGTm5N3yxEL4
	8uofLhV3klpCb027aGLp9dQsZzS4sD4O1BVVu9T3cRJzYOfV4QbX
X-Gm-Gg: ASbGnctkvYumoOw2bpDzh0U9+YmujAmUg2/dVuu8fAYYtWX+BEahk/JjBtCIvwfzXXe
	wFG62MinpqSnibmHzNYGtWfvAtNLiK/HZtQdUBJ+kx78QjmT6xLH3Ijb2TkPvzZVjeO0O6j7w83
	YHWSLOriovu6+M/Rn0p6w8Lim+SkxA4BieDFO5WPDZLzKQ9kVNy3tk69Ce8XZJ27TdnO/9v/tMT
	8Diwg2MCVehu+nL+QbSmuXxBv1C6g85+HcsGWeWJF+/xeikL401YKkgFHacFRjgZFs6V1DVk92C
	Wh0iqg8sJY9kntSeqflqhZF04uFo7sChuUSuMx9UbJNDHZ/rRm1Md567Yv9KJWZRyvM7jayoXtb
	Q5GHGTMhkLTmmrgILGHTHm3jBIyiuaZ+arTQBN6kaLEdCDPFJA8rj
X-Google-Smtp-Source: AGHT+IGdXK5uB8Qj2pTwn9QR6lqLWwxViDZUgyyC016Vdh5MlDFt2d3YtoG2CiSzoc3/waOQ6KkRTg==
X-Received: by 2002:a17:906:c14a:b0:ac7:ee62:8d5 with SMTP id a640c23a62f3a-acb74e18ef8mr189904366b.57.1744977119210;
        Fri, 18 Apr 2025 04:51:59 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm109718166b.166.2025.04.18.04.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:51:58 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	amerciai <alb3rt0.m3rciai@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2 5/5] Remove can-utils_2023.03
Date: Fri, 18 Apr 2025 13:51:41 +0200
Message-Id: <20250418115141.150272-6-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
References: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116962

From: amerciai <alb3rt0.m3rciai@gmail.com>

Signed-off-by: amerciai <alb3rt0.m3rciai@gmail.com>
---
 .../socketcan/can-utils_2023.03.bb            | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
deleted file mode 100644
index ca6cb7db58..0000000000
--- a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "Linux CAN network development utilities"
-LICENSE = "GPL-2.0-only & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
-
-DEPENDS = "libsocketcan"
-
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master"
-
-SRCREV = "cfe41963f3425e9adb01a70cfaddedf5e5982720"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig update-alternatives
-
-PACKAGES =+ "${PN}-access ${PN}-isotp ${PN}-j1939 ${PN}-cantest ${PN}-slcan ${PN}-log"
-
-FILES:${PN}-access = " \
-    ${bindir}/cangw \
-    ${bindir}/canlogserver \
-    ${bindir}/bcmserver \
-    ${bindir}/socketcand \
-    ${bindir}/cannelloni \
-"
-
-FILES:${PN}-isotp = "${bindir}/isotp*"
-
-FILES:${PN}-j1939 = " \
-    ${bindir}/j* \
-    ${bindir}/testj1939 \
-"
-
-FILES:${PN}-cantest = " \
-    ${bindir}/canbusload \
-    ${bindir}/can-calc-bit-timing \
-    ${bindir}/canfdtest \
-"
-
-FILES:${PN}-slcan = "${bindir}/slcan*"
-
-FILES:${PN}-log = "${bindir}/*log*"
-
-ALTERNATIVE:${PN} = "candump cansend cansequence"
-ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
-ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
-ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
-
-# busybox ip fails to configure can interfaces, so we need iproute2 to do so.
-# See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
-RRECOMMENDS:${PN} += "iproute2"
-
-- 
2.34.1


