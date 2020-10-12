Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.39178.1602505068170560075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uqCzaViK;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id e23so9971793wme.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2020 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=uqCzaViK87TCMRMNXw7x3XfoLWOT8B/WSj68RHvzpXjx/h/1DoZ8pACvO27n/588pG
         ksIIXDAgcRQchHVbQplfkXrFn+L2denFr6pwxVw/STGHI3N387BNteKPY1678oyn058Y
         H1DRAJkwbn3vlRytYBmlO6QvriM2ddkHjd6dDfpNDtoSzXzUomOwkaCuKloqX6AFIJwv
         DNLotvHRciq5m9UZmtI7zhjL59YGPjRR/NCwaAIqGWhNlEjcD1M1Vb126njtxRgLdPNQ
         cOGGVIFLBy+Yz65oJGNLu10Oz9SwFxinYnz349FQggkFmivNZ4GcaTGLrErCQIqtmPTj
         h9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=hs+k0JEESjjKODtZeM2V3UwjPq4FA0QkSOJG2+jLY7lBy5kRRzouGhhTiAK6cvnbhq
         O9jex3wudF6kblWJmfqPdPRTqp0/8QjzZRnE0b25lC2ExcGv/wavEZmVsPE8AMkoOvdf
         h712Onoi0nVIh4gtPjasdwE/o2xbCA2iFauVncs1dt3Cqanq2iQezWRLS8Wgh7NzEEDU
         kDEoKKT+1smxUONZHbhvQ6jY5PIdHmCaTqTlnusn78jPaUrsct+dp2VPtyPZIbQk0FZR
         bLiytApG+VN+zT+MhNX3rdXYd2eq0Xa+B1qSMO3JKp8dnwejnAzq5mpwbEGStzemtuhs
         pqxQ==
X-Gm-Message-State: AOAM530bx32jLK5PrRNo82MB6gKGxVZFwuNY4U1mLEGRWUg2Bovq23JX
	AJzB6PkJDdlSLxNnUFT2TtM5EBxgEZs4cQ==
X-Google-Smtp-Source: ABdhPJzcEGO+kUsrB2YBU1xLGyYt3d3Zq0OC+1Xnqr6yQbB1LbBFzmdPjVM3oQwqSG6BWOmgGVrZJA==
X-Received: by 2002:a1c:4887:: with SMTP id v129mr11232733wma.13.1602505065821;
        Mon, 12 Oct 2020 05:17:45 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id l1sm4158196wrb.1.2020.10.12.05.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:17:45 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 12/13] gstreamer1.0-omx: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:17:28 +0100
Message-Id: <20201012121729.2094355-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012121729.2094355-1-quaresma.jose@gmail.com>
References: <20201012121729.2094355-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index f1bdbd235d..c4855034e0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
+SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.28.0

