Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD684C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 11:23:10 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32807.1788780185034349940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 04:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SOAJdRaj;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: schonm@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-86382f10801so283597b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780184; x=1789384984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+rygVM0/uQMW+i94X6Io+e45CTremetNIistblzOVg=;
        b=SOAJdRajHzWlv5wbA/WcVGbJ1+fH3ffI5TFCEIfs+1bHiuWxUjBGv8C+oMitSlmmSY
         aYX5Pzx4DLqihNBoHwVqeS/GLvOm4iBpgl4Lqw+adFWKuqWMSsuSRlYpQrqLXEBL4cIG
         NSjSGr7bhlXDAL/nkjNX05PZGazj35jppYqD8FF9XCkHvgYezNFkXNDX1EyeO1+mp7eW
         RHYw6al7DqvqbCm3ne5JYM8tmCJJKKWabcWcsL73eW+T9KjcTWvEAGq3pcjyjr0QHXvo
         1JRdwaDYb6w505h5jrTuynflsPC2xJQ9tFeI1t6pDuFAN+5YPfU2YfHTxuNFEUvIOg9h
         dryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780184; x=1789384984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+rygVM0/uQMW+i94X6Io+e45CTremetNIistblzOVg=;
        b=Xowu/4DXhWHWa41JRWIWmlRkbGLM/skKXZB7Nioj7Xn03h1IFMElaPuSNhK1nSeEuV
         vBvwNcC14eGiPPaRAiefvll6T9Jsygr7e5FuIpT+4qqURUzuI2n9CKNPNdZ5NnddgcLo
         ts66OdYo2gm3rPD7TuLTHMr36muXj45FhNtbocvRYOiIPzehGJI+8QXAeW0ThdTMelqz
         8R5MVAX3hN2iAoHBOTpWzTiy92DwJdSVZf/f/UKfyv7CfSljmy3Lk6e5ontFtJUp1OgV
         cTF3ggcUTEidf42SdNarjDTQcB2TL/PLlp6K5LiTlzNg6zTtA7ot97sWwKqmab5LRsBD
         a7sg==
X-Gm-Message-State: AFuF++luE4Aphdw5EORPF0kK/qcjXk8C5qGgHvy5trO/NuZo35AhFvVZ
	R2Eo8CgF28xhW8fh3vrCdWqwFoVRucm2XpyjFNp7vJDqpWXSPrZzNJeIraj9Bbf3
X-Gm-Gg: AYBFou1Zq8gktEe9RqwFL/M/DpRHrNVhj8WtoURXXLL6ffF5H8kTLSFDnTQxkZNG2bY
	1vUxbU7GufPwOB6uhzI5rLAoFdEFKdkurVV7H1MUY24cm1kRUQBkS+DgDPrkeNGjxqpcy9S+AlL
	GATifEPmD+ZaVF11HsDMmItXkWSu41mjfs4pdMne/kF2a6umgKMe3DiG3mmm4I02gf2HyAZGFt8
	NQU9vBu2Fxu7y/srrmCGhPB+KuuGxqQYcsIV1fqWsoTy1q7VEM/X5R2FU4UMfVAvXzlgPtcqyUv
	JKF5FSoHYBHUtmtYZPaEbY/i1TlIkDb16DpxfNkEhcbLVMHDzjbD4O+19vFhiCYURM0IGlzi/kx
	4G8r/ZYOuNtDPbzqrdEGswQo+jcm6R6knKwxcDeG0G+scQaqDdCVWgoi3rl5PDMibQAN1iUCb1X
	9IXjcnLpLOihBKUhhyVci/bjELNfhzqkB75rGT0/WzGAuNc3c9DNlf7la6NNrn19S+L7srDOId+
	tyFeHJPl5xojjmKQPkMBeJx4o/jg6X0OWq8oqSJeF61Yf3XiZYNSIDsWmgiTHo/s6Z2ZKzeRzYJ
	f4k9ezRTINJs
X-Received: by 2002:a05:690c:102:b0:867:617c:98e0 with SMTP id 00721157ae682-87c0a0649f6mr895207b3.14.1788780183731;
        Mon, 07 Sep 2026 04:23:03 -0700 (PDT)
Received: from localhost.localdomain ([67.233.63.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714c0e5c6fsm70826607b3.48.2026.09.07.04.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:23:03 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: update 2.52.5 -> 2.52.6
Date: Mon,  7 Sep 2026 07:22:47 -0400
Message-ID: <20260907112247.2490787-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 11:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129847

Changelog: https://webkitgtk.org/2026/08/19/webkitgtk2.52.6-released.html

Note that while the changelog suggests that this is just a bugfix release,
there are a number of CVEs which have been addressed in this release.

CVE-2026-43804 CVE-2026-64713 CVE-2026-64719 CVE-2026-64728 CVE-2026-64730 CVE-2026-64757 CVE-2026-64783

See : https://webkitgtk.org/security/WSA-2026-0005.html for details.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.52.5.bb => webkitgtk3_2.52.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.52.5.bb => webkitgtk3_2.52.6.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.6.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.6.bb
index ba1ea3de6c..a192f89b64 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "8a531a9abd2215936e8a8a914c077b586c0228b31d652f205286a8ec90f3364b"
+SRC_URI[sha256sum] = "179a2ea3f8f6edd4be7f31fdc55afc57bd0729f1fba648c61d4181539ac116fc"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


