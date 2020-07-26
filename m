Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.26123.1595757560037140390
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 02:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=HRwngIHM;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id v4so4461170ljd.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vmoLBeJf+lmXoqr+dUcKd07tgDgHQh2LT+iwMDQJBg=;
        b=HRwngIHMkO0s6qtEgyldpJ3l1Lp5ljzlK0BEDBJ1qMxLgREjVdtdygzyMMqKBjGIGU
         DrKCw4rZDfzY78LCIr8xkCM4Z/LU8RYTDaAe/L7Zoj6fd7kuHOCZ/pryACgBnG8O2tD5
         g8RJLD3U5CSUoheAzu6qkl2ndDRkPWBav5YHj0alVhulju2Y19UcUpZxsddFQImKt7mU
         nKgExP9zBUF5cS3yqmKGZv84SkkJUs9PXIvdb4qmOxy5exQ32azHLZBdXBZ/14y+U592
         jS1rgqFyyxAJrJaXkV+DCmnwmLGPqFws3LG0ZhbMDRTbFPPGqW95k4Gn2Kj9ggnUbQWA
         5BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vmoLBeJf+lmXoqr+dUcKd07tgDgHQh2LT+iwMDQJBg=;
        b=Be5XcWySrU8igJXv3bTSzp6Dy+AB4EE9UfXRYnjb+vm0r5HY4vv5fes7njujbOXfbZ
         BROcKFYlbuMIG7hJhiMDAb4LF2dsKs+dY67o1EyFnZEnw8UYIC/VIIUpEqhlqalNhkRC
         wbzIqWxWnfgUpdiERMbheBqm/aKZ3pfD9K46j7/JN7THtsGSVBBK/asQYDasIsAzWqKq
         +TFttt+KgPZM/gfJdLHNyko5KM0+iAEnRVmrCRGvHtPMfyaVySOVOysQPwbPqGvrF5QU
         KDtv9xf/jqSS+/Ls8fBjVqYQS0A9aL9RLiR4cNT9bD7AegDNH52DNWozh145N03fQCQz
         5XLw==
X-Gm-Message-State: AOAM532d6WQlpJEtmy+M3vldbDtV8H5e3FqaYqC/c/RKTX/DKyVSv9sV
	+4N78W1f04yIilYl0GA0bAozNVmRaJs=
X-Google-Smtp-Source: ABdhPJxBipzDFv46jPZzFPsCOx0nVj2YQDAi/iY9e3A3DSnxjbXu/P5DrcZN7HnnGJ6WQwaIeqGyVA==
X-Received: by 2002:a2e:2e07:: with SMTP id u7mr7268595lju.195.1595757558009;
        Sun, 26 Jul 2020 02:59:18 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q3sm1722904ljm.22.2020.07.26.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:59:17 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 2/2] libopusenc: add recipe 0.2.1
Date: Sun, 26 Jul 2020 11:59:13 +0200
Message-Id: <20200726095913.3962157-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726095913.3962157-1-open.source@oleksandr-kravchuk.com>
References: <20200726095913.3962157-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libopusenc/libopusenc_0.2.1.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb

diff --git a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
new file mode 100644
index 0000000000..596c5fe86d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Opus Audio Codec"
+DESCRIPTION = "The libopusenc libraries provide a high-level API for encoding \
+               .opus files. libopusenc depends only on libopus."
+HOMEPAGE = "http://www.opus-codec.org/"
+SECTION = "libs/multimedia"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=174b92049c2c697eb73112801662a07c"
+
+DEPENDS = "libopus"
+
+UPSTREAM_CHECK_URI = "https://github.com/xiph/libopusenc/releases"
+
+SRC_URI = "https://ftp.osuosl.org/pub/xiph/releases/opus/libopusenc-${PV}.tar.gz"
+SRC_URI[md5sum] = "f038ea0f4168d184c76b42d293697c57"
+SRC_URI[sha256sum] = "8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9"
+
+S = "${WORKDIR}/libopusenc-${PV}"
+
+inherit autotools pkgconfig
-- 
2.25.1

