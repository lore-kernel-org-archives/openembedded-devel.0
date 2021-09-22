Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.932.1632338555575962903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ozJ4xnAz;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id k24so3771546pgh.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkAMjGgo5g7GKemzPdPd135lpH6Pw6zkzfKxZ29tWrE=;
        b=ozJ4xnAzE4xk6Kv6TEjzRAeBWNdKvSxhoerddqT7hvnUee7s9PerQas6MwoxtVfeG0
         dInng4LINFQTxscdWaakvD7qrFZI22FcSH/WPlLZM8BsXxH9pnYAdNfYPriObI5wv+Y9
         AeXatzZf88xlHWgAnsrkzjxGpMTqjeZuLRFtM7cF5Im4b7N/VTbYBE4ta2RuCJsoNFa3
         IoBV7PeiVmdlgBwXN3/MNHi+YMmYX85fS6KBV/APsbcXoj9DsK7E1Wphb1RZPA+7WXFv
         g13w+OW2JohLESACoFE2rsPQT5tMqC8kfiNixKpUQs+lHuJO80rBQIV6gO5DgBNm6ut1
         CtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkAMjGgo5g7GKemzPdPd135lpH6Pw6zkzfKxZ29tWrE=;
        b=ozEIKihRQSWdnSKNeowVbtJQ07+3kNOcnwZ0zWqYvMBAPNxTSxRHa4Xk8rb9WKvuXc
         lVOa1RMADN/rQk4hus8NjdAbDDfolf33sgVAzzK4/3ZIxj4+QpSrQ78cq04HUh+P1o6C
         Qy3C5PMtcKzbUstAIRCoZRaoIL642fbDw+wMsiA00pcE8hCiLkvDhe9880ElESFVARyn
         q3pZMDnIoHfnOhu/9tredhFP0VWSdov9Px1LuTRdNQyglsYZf4sa3xKSmhRGDy9BHWw5
         kVfJAWTpkpFYDTW3dFggSZPhdRLv5BoNQPYsw8pGu37CPKc5rVEkC77DfjIV0+dWB5Vm
         v8IA==
X-Gm-Message-State: AOAM530TrlS4EIA+Zjbaquri+geLh8Jp8Iy2HvFXhYk6ubWyuUqUK2oE
	1ocmVEhQZG8gmYOUiPF7O/gLGiVAngDO+w==
X-Google-Smtp-Source: ABdhPJyV4V15DSmwC+nHqFhPbj3iEUiTaXJG5zZQc5uafQjHHhEhHaK0NHiNu4hZwOXFH5fKPaQKeA==
X-Received: by 2002:a63:3748:: with SMTP id g8mr520394pgn.102.1632338554940;
        Wed, 22 Sep 2021 12:22:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 22/39] libvdpau: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:56 -0700
Message-Id: <20210922192213.3062719-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../git/src/meson.build:1:0: ERROR: Pkg-config binary for machine MachineChoice.HOST not found. Giving up.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
index ec2d10608b..64dd3ea785 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
 
 S = "${WORKDIR}/git"
 
-inherit features_check meson
+inherit features_check meson pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.33.0

