Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.9307.1626279954488443543
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 09:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HZyWAgiY;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id cu14so1934274pjb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oKg1Hu3ZQ7h4XWNxoSwNtjOmCeBGUDqtdGWYoDUtv7Y=;
        b=HZyWAgiYERmRpV0EUegr8pu60ZngLb29ESdPQKzambwidbiE1CNKvZQ0UwFgV2Uhm5
         b2cLi4fXvKqN2UcpAAbIFRxrwHOpF5rJyd39YXcH6uO+aOgO07WuV8jrw9ZIEQR9oxCr
         ka15jIy2A63RcliIpD07Hr9ioFHRMb6aXrGrgc0BxZYGAS+oD2JlcHyXuBrWKK6mqBfR
         JkjgYYuRHXu74xEVr6Qyjj4r/+Py6Twjt6/7zrEp4MwWIcESfc3qjzeDunetFcwhg9V3
         N+uMqkMaeW3GjX0t666/nZKky/ic6pCn8gXmDk+2UdgK71Cq5dAIVZLInE2RiDN2Bthv
         Uu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oKg1Hu3ZQ7h4XWNxoSwNtjOmCeBGUDqtdGWYoDUtv7Y=;
        b=bVC9bWcGza0vRxwyjEf6Q7u+xFWnwJpBcHB++m4245aLf6fvD5A0zAKr4FA5CzpWz7
         qmU4GzVZlZa7O00RRpPoHKUOWwvpVGWOeYXz4f12+0vB3Bnr58no12tW4e0Rby9lCA5g
         mQ3pnvpsohA41/0B9N1+jW+VgF/fujRKvMy96YVH1gojJyeMm9gt6OfifDEDyhnRXkJS
         TdgFDRGXOl6gPGFaU4a5d/orM6NEqzXXVpkWJd8KGc+F7alDEVE2kWlm0ZxKw6tRsLdT
         7hEpKTy9xtS4RpHpHonaD0JDLcsrmjNGVwc3iE5sxEgtIToE973Gjw9IFZZ0q6rjbjEk
         FEXg==
X-Gm-Message-State: AOAM5301MdW7rxo9j6iid/kaCS4/rTl0hyc8TEmMJogKuUSn13sN4DwQ
	TVeu7RdyQlQvMVOkLFmrJhbw50xCdsaVzw==
X-Google-Smtp-Source: ABdhPJzuXkoc94xNvXSgO9u1uYo831QarTAgIpdMk6ebOPhJBmDClkbkV1jRqVecrlAMgr2uZZ/Aaw==
X-Received: by 2002:a17:90b:3617:: with SMTP id ml23mr10424034pjb.236.1626279953713;
        Wed, 14 Jul 2021 09:25:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id js5sm2610533pjb.40.2021.07.14.09.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 09:25:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: David Sterling <david-sterling@users.noreply.github.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] can-isotp: Upgrade to latest on master
Date: Wed, 14 Jul 2021 09:25:49 -0700
Message-Id: <20210714162550.3153376-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Sterling <david-sterling@users.noreply.github.com>

It is needed for 5.2 to 5.10 kernel

Can-isotp is now upstream from kernel 5.10 onwards.
Use kernel config file instead.  This is only provided for legacy kernels.

For kernel 5.10 onwards use kernel defconfig option for ISO 15765-2 CAN
transport and do not use can-isotp recipe. You will get "The file
/usr/include/linux/can/isotp.h is installed by both linux-libc-headers
and can-isotp" error using this recipe with kernel >= 5.10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index eca8dfc7b7..72d6757804 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,14 +1,17 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "b31bce98d65f894aad6427bcf6f3f7822e261a59"
+SRCREV = "beb4650660179963a8ed5b5cbf2085cc1b34f608"
 PV = "1.0+git${SRCPV}"

 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https"

+
 S = "${WORKDIR}/git"

 inherit module

 EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"

-PNBLACKLIST[can-isotp] ?= "Kernel module Needs forward porting to kernel 5.2+"
+do_install_append() {
+    install -Dm 644 ${S}/include/uapi/linux/can/isotp.h ${D}${includedir}/linux/can/isotp.h
+}
--
2.32.0
