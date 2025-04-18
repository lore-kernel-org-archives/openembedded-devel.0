Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AF1C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:32:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9669.1744975972698721739
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICu4/Ubt;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso5359354a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975971; x=1745580771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dPFKPIMcXMPWLxnx74uryrWdzAarj8Qzu/lwf9H2dk=;
        b=ICu4/UbtHgDv6AjyJFcS++M+fI8/BHGtt1QD9z/bIj56KwvQmdmygskTjCFn1LiCRr
         IVUMNA0blk2ldQkh+lE8dhZXFhwTy9jrAEa5VYAoyuTr5i7xMHwH3eQAZQtIZwKPGQBT
         y/IQUy5ZLDgtVIJWRe6xjL8b+SgxRlYz9yoO+e3pmVJur9KUEyPzlE+EpyylcTECbr4R
         WhzYM8X+sD0bhtxuAn1ETbT5Ts+YdWlQgcqQ6H48GmJap7W2b7jAXN0zs810K4pOUjKe
         PrjN8IjocMsC/d91cZYo7CJJzz1TCUyunwr4rtAFPpGnC0U2ZB77h2lIXpVBbaWm7jVQ
         go4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975971; x=1745580771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dPFKPIMcXMPWLxnx74uryrWdzAarj8Qzu/lwf9H2dk=;
        b=alWyJogDW/a5Pw/jsRH/c8X/a/xqjP5iZpUL/b2v2wwyE0xrQUmvMioXNQ9QM7Fsy+
         rzRK8RheF/+ngPuXq4nL//HYaXMaLb3fvRaU5nCSRDNk/PWuoYyhI9J/eP4+K8JM0kXT
         5F1HEmpbbw9UKZNUz8alqXoylrQsiagN5jiVRzOXzOcQyqpmNoX+1rm1Fh+Q8CDJ3J1o
         pdFydZ/wxly6/falwbAeF90g9S+xhK9eR0DL3qpEXNd7E/7w/gHyTVj/8dcP75tYVDj8
         fhYVMDXNbh0qzMb8knpJfVKtVnr50n+mKwfPwS+VnkXRlZduFUuOJfWTGuMeSGwaLtJo
         jEgA==
X-Gm-Message-State: AOJu0YwXiTMBlTZceXez+uV4XKszt324sYrOjHq8BX0MK5VCb0XVuwo4
	6ui5GLXIP7TA6XzVyCfK40n/Z6dAPRXeSe3pU+l/rX5QwHLTsmKU
X-Gm-Gg: ASbGnctj1NWvTi3PM9JzIhRBM3n6i1mzyZfkEkwmurOpj1B/K+IswnORiVcy96VN5Uc
	qYXyd0d04Ay9HyOvN8Oj/xpKpcUQbYjIMc24KyhXsV9DScRv7mrln7ZkEHiZ4IXg/J/nHlb8TG4
	43oHNmtEv2KhgmzFRIAymaIFtak++q88XNXw6VD8X5Sn5xNxVe5dbXxsMrTa7yKhggKVTHjiLGk
	GQy0b7A1n0nyPokuc2vSN5DqMMJF+2doOOMOhSQRs7ObOyDtB+sYKzUYCDJg+tFYI3L+k0/6fyI
	xiPIi/8O5cmPb/1qe1RH2XBkLcNXR3SVe4nzqQntzUPyMBOqM8gcNesSLRxnxfU1bX+uWgox4oo
	QQR0gLEek4awNFF3Eio4RX6zW+bsTO4OGgT83V9nHseue5S3kqfm+sssmjMP6BJ4=
X-Google-Smtp-Source: AGHT+IHnOO0/wKn6jh9qmTakvawAin/QXv7g1mtqwxkZuEbBlxTASKWVfbMZQ03fUDeUlycv4Ruy7A==
X-Received: by 2002:a17:906:db06:b0:ac7:7d3e:7336 with SMTP id a640c23a62f3a-acb7534a375mr193780966b.22.1744975970779;
        Fri, 18 Apr 2025 04:32:50 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm108313566b.43.2025.04.18.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:32:50 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	amerciai <alb3rt0.m3rciai@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 5/5] Remove can-utils_2023.03
Date: Fri, 18 Apr 2025 13:31:48 +0200
Message-Id: <20250418113148.142480-6-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
References: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116956

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


