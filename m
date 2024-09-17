Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90271CAC5A2
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 20:57:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.875.1726606656317661452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 13:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdk5tsf7;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d873dc644dso5065589a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726606655; x=1727211455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMCSHjqzO9+hEw5TajnJh9D2gws06KTiRRl+q7fUrPs=;
        b=hdk5tsf7dZYc8MK4fNGjR+vd1zfzMaQuTwB7ikelvA8XqNzPBMOPcHvZDzxrQ+6ugH
         NVjB3w9Hq2nL3/L8R3UynrfvnOgTW56tmK59CXrZO2NRJzV9jXrR5rBE+9hy3ODyGOsI
         igC3kddpAde6pHH6Qru2pbNV134thkSHkBCVdg1K23cCZl45sFGh+0KQlcaQYJpjeXVx
         4VHmuyuwOH5o/jsrvTrhUxvi5do2IgcmyANOfLbbjYeEHZRCoiY50TKEh5iQI0peX/wr
         kfxXlEo+35Xejvz8pTTFl77w1l6P3wnHniOwVXn27Ni30e/cKjsG7k9Wiba7YGB0ipLB
         ntPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726606655; x=1727211455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMCSHjqzO9+hEw5TajnJh9D2gws06KTiRRl+q7fUrPs=;
        b=XHkiNyI0hYDTQ4vtfrDj+BH/vhZVqjvG6xjMmHhZAhc2hP8dG5W+rzjzj/XnOSXXJ/
         5+K1JzeVm4eToj/XcQHKCyruqqCn98jd3zOyhGt51uOrvgE/6Q531VMH5D4VZJwCaIua
         nw/GFff30l/u2/Ou6eOtqQF1+XzFLeT0PzUPE9GbK/MC7Xc4ZaMxhlvGp68/30ApUFp4
         zVouG5Wo6gbmKTEprMrer4qS67biMKTuPZhiZmSwEMuyjVl+xe/0wS8gJDT2DQIjDRIa
         ze3jrn7wp4usouTJmf78FDAKPL/vveUBxPIY+jyCu0ElvE19bYd1pWEv4rjg/KgQhTTK
         Lqpg==
X-Gm-Message-State: AOJu0YzkiYWBNYgx/XzTPnx9wC4DElhzo8Y97etpcv2JMD0rx/Ph6T9Q
	3ZvSjpvMPOxzGBZNEdpDxiY/+qICnYl/4VC3oWIMVI88PTm91yjBMW/8BbD0
X-Google-Smtp-Source: AGHT+IEgCiopX6r7AijSux6r7U1peCEUjwu/Gyg+1cPqdNngPoBhzzPYDKLAOirFzQKniZ63eqrZ3w==
X-Received: by 2002:a17:90b:111:b0:2da:d2a2:4a71 with SMTP id 98e67ed59e1d1-2dba0082efamr20788719a91.40.1726606655465;
        Tue, 17 Sep 2024 13:57:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2c8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c4a253sm9979663a91.4.2024.09.17.13.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 13:57:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libjxl: Disable sizeless-vectors on riscv32
Date: Tue, 17 Sep 2024 13:57:33 -0700
Message-ID: <20240917205733.819586-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 20:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112348

They endup in undefined intrinsics demanded by compiler

error: use of undeclared identifier '__riscv_vsetvlmax_e8mf8'

Perhaps an upgrade of vendored highway module ( when it happens)
will fix it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
index 6e6e5edfd7..505fca4c8f 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
@@ -38,6 +38,7 @@ PACKAGECONFIG ?= "mime gdk-pixbuf-loader sizeless-vectors"
 #  591 | HWY_RVV_FOREACH(HWY_RVV_LANES, Lanes, setvlmax_e, _ALL)
 #      |                 ^
 PACKAGECONFIG:remove:riscv64 = "sizeless-vectors"
+PACKAGECONFIG:remove:riscv32 = "sizeless-vectors"
 PACKAGECONFIG[gdk-pixbuf-loader] = "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=OFF,gdk-pixbuf"
 PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF,gimp"
 PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"

