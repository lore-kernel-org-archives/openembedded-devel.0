Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web12.227.1617899786768841673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EyaDDDGh;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id c16so2806972oib.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qcn0mL07UCi+/sCYOzOQM95urbC20NtAggVnsDePoqU=;
        b=EyaDDDGhPzL9PIIji+C4obLTqyDHMKiV+vK8tK366onW63v5BkMf9IVKyaiuN39Tzi
         zTsoMuJ7PYvUk5WljWD1PduoiRDj2lfRLabHddSpoTtlSxYcCUfAx4/+zXcekQJUJNCK
         /ZuuMLOvhemsuxr9HQWH6N3+1SAC0FQtGpvfJWD6VLiKDEWrKoEeaN90g3jktjQ7c9ze
         ST6jvxMkeoRa5s/cxxP5u4iOYRIWr92xHxpqEblY5aK503R73tiBnTXbsM49aECubSHz
         Rcka2Np2Nkyx24Eb1NxD+exptth2GImEWxl/T9eB+vhIyAHeWaOuA8zgkYu3/FaQQBaE
         inug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qcn0mL07UCi+/sCYOzOQM95urbC20NtAggVnsDePoqU=;
        b=O2WGgxenNb9FrcqEMhw7M3GP8OcWJ073xox58/AQ5ROQbZHFN9z88+7jF4muN8zg/Q
         oXWgBhAWMx+EbkNlIfM+d2s28/PsLAP+lD4QcY9jr6pFIPObgr/GuGiJW2NEzjMEUHM4
         xkgwnJcUB3A+Qf3uORnOb613IFjnBaxU2M8PQcZV1wsq9V7/lUgQTgqiRKOLMI8J1VpG
         BbOaH8n1/znQnI6uh+BX8OblXghdrwwi95nts1GcRsJLM5Pv2aS5Mv9rNvqwQsdb6jzQ
         wuPvheS0IxbS5cOMHbgs4cFTzXz7TTDhxpdEF8DCdtYb14Vxf5Yv2ySSXB7j3CwCS8KQ
         Y4XQ==
X-Gm-Message-State: AOAM532nsnoZNHFDCMse5WhUzzOhDKAGNNxno2ImpTXfEPanfDM2hIsS
	oCuiGZ7VyFWeYJVmLmIYMuJQBHYkZBY=
X-Google-Smtp-Source: ABdhPJwRgn+8RUr85DpL9FWBwuk/ML6+SwwhLlRdioMkrriq+FDgJXzl+mFSCyZOrIXUbw6y2s0V/w==
X-Received: by 2002:aca:d70a:: with SMTP id o10mr6935355oig.143.1617899786010;
        Thu, 08 Apr 2021 09:36:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 13/64] sox: Remove LICENSE_FLAGS = "commercial"
Date: Thu,  8 Apr 2021 09:35:20 -0700
Message-Id: <d93e3b7f968a640181c7eebe83272514ef941f89.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Its not needed bitbake gives a better diagnostics when included
in image deps without accepting commercial license

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
(cherry picked from commit da393545a2721af13ff42426b7effdd7adc4d927)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 4c3f37913ad..2d6e913d871 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -6,9 +6,6 @@ SECTION = "audio"
 
 DEPENDS = "libpng ffmpeg libsndfile1"
 
-# While this item does not require it, it depends on ffmpeg which does
-LICENSE_FLAGS = "commercial"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
 "
@@ -40,4 +37,3 @@ SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3b
 inherit autotools pkgconfig
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-
-- 
2.17.1

