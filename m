Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.227.1626456502099305249
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 10:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ipd1j3Sj;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id y4so9460368pfi.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JyNqmJBgJo8Eef6BS6eUElJuG/bvunFUK95g07Vr3jI=;
        b=ipd1j3SjyEzkJYi70bMgnfJVNzVZcXEwKloJKsJgP2ElRO4qCK9w1yPconN7iCsOLS
         Xk1dkL2kWNkYR+wy88RzP9DGo+epwn5uf/CKQz6RBEw4+ncdLSrnB9j1v/AZ1VjZkP8K
         khcSJ+1kPkIuim/wvK5pFbFfDi6msNADrqH9Cc/xNPRrtV/RVH3Sl0VQDqptqqFWxRS+
         iwpupY+niLeUVihp7fW8HdV3Nd1X7SU4C7EV8oSN9slsXm20pFt4Cs1PsFLWFy0H0G6B
         UAOyz7qj/SqeO8UqR44GYK6FGOyd/JdAwoRYXiD1eZS5TSFTHo4dsgw7ofM1rNRUrc9O
         M6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JyNqmJBgJo8Eef6BS6eUElJuG/bvunFUK95g07Vr3jI=;
        b=g8GVHVnMrt6PiTDcL+SBbV9R6CRDdjOFKMiJr8TGmicR4f4HVzFgJ94qByLavMzqIs
         k+SiviuDuf7MB8IMwyAom+qCYYfuCMR3wchREaqynuCgQvZD7i5sNquG+m6PDoIniCGY
         5xmSRRUK9DFK2KDhwVOt82Nn5srcsG37MIQaTGKpOMQcEypP7+zxO+gUkVtimR3Nv8wa
         exM/wJkMPTy/QcQUocrOejaRz6aq3REatrcVUAdToThvWDUq6Dk6Xf/vBnahNLXqw3ho
         D7AaZJDxeuwJfEdr/hTozDm8QWmYn88HPn1PAB9xajo9wxLEgS87a1uuvX/ZSLmwq5+C
         51AA==
X-Gm-Message-State: AOAM531PnIBz//vEvvO2fAdKsAAfokE359SvGGk176WDDxfW0RIu88wn
	SNursJWJkAnEVPurJJRWXPycXsl/Ck2D1g==
X-Google-Smtp-Source: ABdhPJxPfGjBhvUW2ctz53VO9gLQR1Jv+GK6V1Kj6U3/AeVdFBGb87a3grmON2hLE9SWLVpYsS+aCw==
X-Received: by 2002:a62:3852:0:b029:32e:50d4:6ee5 with SMTP id f79-20020a6238520000b029032e50d46ee5mr11429206pfa.3.1626456501348;
        Fri, 16 Jul 2021 10:28:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id g123sm10472755pfb.187.2021.07.16.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 10:28:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] apitrace: Update to latest trunk
Date: Fri, 16 Jul 2021 10:28:18 -0700
Message-Id: <20210716172818.3651063-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use git submodules fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
index 616d56daa1..e42b891d46 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -5,9 +5,9 @@ LICENSE = "MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"

-SRCREV = "03e4e9d2cab4f1a61d3f589785641a73dff027c5"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git \
-           file://0001-libbacktrace-include-config.h.patch \
+SRCREV = "9d42f667e2a36a6624d92b9bd697de097cc4e619"
+PV .= "+10.0.1+git${SRCPV}"
+SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git \
           "

 S = "${WORKDIR}/git"
--
2.32.0
