Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103E1C54E68
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.3725.1710583263135878984
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KxNCd0la;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41408d7781cso1414575e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583261; x=1711188061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keLtxQwTbGPPKCqiJbtc59qTKYClrySs+RxL1V8nMq8=;
        b=KxNCd0la5HvolKnLvdPabdNd4RNZApHzfJ8D2yOUeaTHRjlqbU/gKALtSjCY8r3/QO
         CX/siCGgUeMkjBZeSt+a7xbMoNet2fw6o07fm99w0PGdbX3BAJJ4LGoeo0ReCdNg8v9I
         1JnwzfTNMHx6cKBGy06dy/YIg851GcZhqMNtbgGSIv3ze7PwORQeEGH5JNTuNjF5AwgY
         b2qrFrH+JJT81/rZq/9As8NkjJT85/RqMSOTgrQf//jsYapt3H0mTJVmmPR8kO2laW/7
         QhLYYmd2ZGDryJj0XDDD+AGursWLzapsa6MOmq9qm/y8uWq2AW+51Zw/p/nmd+QUPF7W
         6RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583261; x=1711188061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keLtxQwTbGPPKCqiJbtc59qTKYClrySs+RxL1V8nMq8=;
        b=os527nBwUkyXm1s+HhP25gyhrcg40/M4m+KHLWoEECPJ5YxXKn8E07Tj0cf+Jo7R1p
         EobqVR35xSaDVFO+Ew1WrFDc6e/4kwz1gGfzCtABzvFN5nla//Jk1R35OOih98nM/qbj
         xp9po8p79OD2chAs3IYWnCAOw4ZW/T7J6sQfe11gqHJHDY0UWir10SqHpj0C2UprThGi
         fMUyoihhd7rkYys/+tTYpAv3vY/asaAjXB8UzOW8aBE5F62EWAPWrofQuJ5Lr4p2NiCJ
         pkrD32g7swuayu+zS0aEPaMmoWYIW2NtfdgTtfVr1zwOOEPcpujBi+lG+HUYRUuc1gV+
         jLeQ==
X-Gm-Message-State: AOJu0YxVobkfqUwMkqSyBKVf2vY0bJqdna63WYTGIODoaHmUnxIiVNw2
	I1oAlNDkPXv+tY2B1dyIJUWhQhqo5x5A5wH2ZDFEOy/Ab9TzQm8zZPlmkJTywKA=
X-Google-Smtp-Source: AGHT+IH53/vz9s/jkRDeWMNRfFP1dvVRv2CzlgoM5vmItjLvcABvje2JhjvSWcM5SGSE2MnTK+mrEw==
X-Received: by 2002:a05:600c:1c08:b0:413:fe9d:eaa5 with SMTP id j8-20020a05600c1c0800b00413fe9deaa5mr3517017wms.26.1710583261257;
        Sat, 16 Mar 2024 03:01:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:01:01 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
Date: Sat, 16 Mar 2024 11:00:55 +0100
Message-ID: <20240316100056.409758-6-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109361

When DRM is activated for LVGL, it adds a dependency on drm.h.
As for lvgl-demo-fb, add an include path to fix this usecase.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
index 8bd718efd..6a9a7411b 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -21,6 +21,8 @@ inherit cmake
 EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib} -DBUILD_SHARED_LIBS=ON"
 S = "${WORKDIR}/git"
 
+TARGET_CFLAGS += "-I${STAGING_INCDIR}/libdrm"
+
 ALLOW_EMPTY:${PN} = "1"
 
 PACKAGECONFIG ??= "drm"
-- 
2.44.0


