Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.222.1617899781230517622
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oBdwnjRz;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id t23-20020a0568301e37b02901b65ab30024so2895160otr.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JQoxsQgxw7gu3QLvNeC/VwgODFKZhyTNpG96LFbTYOQ=;
        b=oBdwnjRzkjQEzBAliakPsTZVGDdPiYNCuodEdXpoUaPbRz9baBjt3CqJnqV6ezcX5O
         8NdJpk1DyYmbzghi1zSAptSv9ZBPeh96HhIdHV+xD5fVuwTum9/61lUaDaptpilG/k9e
         nuMdwY4aE/gGnqy869XeFTIQhrnaZjVMls4hPI5WNijoJwEjg5WY9ODa86c025GjAqkF
         xBtpu29hp+iFWsEhxD3oiPBnd/NHQOubkpbBgFdpTo4oaKLYPFouv92sOr2K8MgPjA84
         IFRXy4sum9vnJe2dNARF/i+SN04bpTKrsI3AaLnhbUUQ5SUFnpk/hPCfpBWe2TZLmZjm
         fjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JQoxsQgxw7gu3QLvNeC/VwgODFKZhyTNpG96LFbTYOQ=;
        b=VamxWXfPkSvOYFGC2AfAdepaPL4JD5Y8HUHef/iBlECFXajSOmGWhn2nPB/3sXpAxW
         4d+HaIr/tjeueJU8Bc503rkqYZ+5lQEcSQm1xkgbaiGeeURmw4stFy1NCft5N8eUJrtw
         fBAl+RTs6viurWFmgYbNAtb7+Mz+T5CnoWg0qWrzlCiZU6Z9YxKFm6qNSUNtxqyN9398
         /WdLQate9dKWfAVbdvsRbKz/4zglsya9pNN8fNaXq863gDhk3fbNBP1nb2XaHw7D0s/N
         DH708FJiwr1KEc3a+wFs0GebalikjYYhNJfhE9NrFyUO8eXTioxuED8ziPbq7002IAFh
         rmzw==
X-Gm-Message-State: AOAM532TFysek3DiY2FwbXTwqtJWhBzJwFlbDJFZHW5CDgNyl2UzGO42
	1e9FyDOznoFYrBqzFSsrujNWWmM62U8=
X-Google-Smtp-Source: ABdhPJwEMwfASDyXpmppuzO6WlTSxR2crYN/wy5eVgO6zuwA0xZmM232wF+nlCdP+Jsqav2nH3Ty0w==
X-Received: by 2002:a05:6830:619:: with SMTP id w25mr8440794oti.371.1617899780367;
        Thu, 08 Apr 2021 09:36:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/64] openjpeg: add native/nativesdk class extension
Date: Thu,  8 Apr 2021 09:35:12 -0700
Message-Id: <21cd8895da5ccf43590509cbaa9a4ffe451d534d.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 41bbe1c62f13ac85f15c8ec8f57cb442b9e0025c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 8e264bf71b2..62aa4b43db7 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -19,3 +19,5 @@ inherit cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/', '')}"
 
 FILES_${PN} += "${libdir}/openjpeg*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

