Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1555.1626834692369652348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 19:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nm3rwdu+;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c1so1071845pfc.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJGrbk2v9ibcK7vcpPcm7blNUfnO1VWzqpdNnwPrmzI=;
        b=nm3rwdu+OtuQRfGJ6Ks/9yGNjclsXWvbqkRqj1JbpZpyZW8e156Ua1ZDJ2+90b+rmp
         EvhGWaufhwJ9mbpmJYTVGpEb0MCqdubU7U7knntfbsUU5acZ7jSNdHYkwAOQexpa6Ewm
         y40FI95s8s8RuMJvrC0eTA6NhnGvuckUlGKppxGT6LA21BSwBEBqdL4+gmLgYKrHvalQ
         MpVPXi5zXNfljxj6K0oazh9Hk5QlugglSy0xEJEL3zIuCig51jLL7saNKH7Sv7BQpr5Y
         SNLfAnfYXS6ghgV9aM3LrtNzj1jwwW82sk6u3xpTJ013q0k5CtOIKKyajuFVxXQ6hULt
         qakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJGrbk2v9ibcK7vcpPcm7blNUfnO1VWzqpdNnwPrmzI=;
        b=CFYZkEu3MqHdZHevgc25JbpU2YSZusw39LyhWkel6riNIvQNWSy5fdI5j7GfVTUkxB
         KBuW2ST3lP/8hU4d7wRhQ8L3GAJuk7UyS39kSlU+JL88ch8XSygQuuf23+FPt4+SdqIw
         wcOn6sU5I91CYlKsrFE8jTTDJpBd8F9Sf/kilhPx3LfDLpniu10xiDgijxHL3GuFMo74
         eAQsCLriKtrtaGvuhetrcz6x7PljV0qwu+QO2p3hCpDy/gVKVChmm2OwFqHSlIGrs6V0
         2F4fNmONYHitirFbdlCtqJgfAIYxaYWTN39/qcD9vmE/VcUzToGkdN+y0zvsC86izqWd
         hFvQ==
X-Gm-Message-State: AOAM530HvqEtDK80UgpStVGcmJ2sSfg5DODzy1CirVQJu93Eoo98bpSZ
	UZGc3+etRFYSqNnH9fcUZGipqMXsc/0xDg==
X-Google-Smtp-Source: ABdhPJzgK/JFWKYK+UANLH1tmU/WgIo8M1ABjw64C5edTPBT5OXcUlYCepoiL0Vb34OZfDbXIKX0SQ==
X-Received: by 2002:a63:338d:: with SMTP id z135mr7697863pgz.265.1626834691241;
        Tue, 20 Jul 2021 19:31:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id m19sm25398747pfa.135.2021.07.20.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 19:31:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] netperf: Update to latest
Date: Tue, 20 Jul 2021 19:31:27 -0700
Message-Id: <20210721023128.1089570-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Upstream has switched to MIT [1]

[1] https://github.com/HewlettPackard/netperf/commit/2d88bcc75d97f462eafe8605f8da0c1f875b7dad

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/netperf/netperf_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index a084fb4c15..9d1e8df8e8 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -2,8 +2,7 @@ SUMMARY = "A networking benchmarking tool"
 DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
 SECTION = "net"
 HOMEPAGE = "http://www.netperf.org/"
-LICENSE = "netperf"
-LICENSE_FLAGS = "non-commercial"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"

 PV = "2.7.0+git${SRCPV}"
@@ -16,7 +15,7 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git \
            file://0001-nettest_omni-Remove-duplicate-variable-definitions.patch \
            "

-SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
+SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"

 S = "${WORKDIR}/git"

--
2.32.0
