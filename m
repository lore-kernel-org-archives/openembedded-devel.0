Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.3090.1617129590909855904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 11:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VoUz/KiB;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id j3so19335567edp.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4c9Nbz22/JDq5H22tBe6uG8Zkio2yP1Py2CvdhYdmg=;
        b=VoUz/KiBGYaSLK9726/NCSD0cG+aC3hAmYR5Tf4U0Xfqs0CpL1rpiVFLwrxU4bg4i0
         uU87BgMhh7QQh2l9ryxbZ17isXtPw06RPn5S0VumgHY5TPqUwBj4/jMOPghZh4Gy9lPr
         QNigID4UtFCVclajAdwLuOoE1ksfRfQoI73wXvElQ9TDiEdZ3b46nf2UptyVU5NqDUjZ
         3G13l8jmp4lVzYF09aiKBczc/HqM2/vgIYL9VXuVYwF6rhGeGDjvNLnVKaCq2ETojWmx
         kaFXBSeKIIxvK865GfvH5gVMPIfW5HkHjJiojfcWasXafkEvizJzmBodqmZOjNY2uQ+w
         2VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4c9Nbz22/JDq5H22tBe6uG8Zkio2yP1Py2CvdhYdmg=;
        b=MhDPgRU9ZCk6TScEE9GEVwv0POWAagtQvMQL08fLFv/+5gA/JsJ4VCKCmVB2ppL+Lg
         LJoHgTfMFeC3ZrJ+/86GRuaugGej1FHVrYiHid//g0EP1sunnlZNo3TL/AJBx2nCy8Di
         ZsjJiwsy4pAUXwcqT7g4BZzOKBCnp/VQplGrVn/pITQuHxK3suEsbc0sTXJoHjna9QxP
         RyhIS/i0yjGZvmAMFQniIoxqcDLcfozYG9lYAD0tCahscBWUu1kGKl5+haQOCDI1qsPQ
         NYiPXboux0baknmpzPfQRvduG3QqEL4+cyVo6HFFJlZxMswczNof65F6pn6enBhokZhh
         wUvw==
X-Gm-Message-State: AOAM530zJzaQJhQgdY+3/hivbejB3tyctRXKDaeGsLaWs3Labppev4QG
	OEeYwS3ckrInL5dfAyzA//30foqzQAs=
X-Google-Smtp-Source: ABdhPJwqqXPTnhBpZ69Bv3EhfHvZoQ7x06zPONjEVn+55GCOyvDjj2/zXgwr55wmvk7Li/YOXjEYGw==
X-Received: by 2002:a50:f391:: with SMTP id g17mr35012712edm.26.1617129589388;
        Tue, 30 Mar 2021 11:39:49 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id mc2sm10500855ejb.115.2021.03.30.11.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:39:49 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: include projucer only with x11 in DISTRO_FEATURES
Date: Tue, 30 Mar 2021 20:39:42 +0200
Message-Id: <20210330183942.83244-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 350c14b264..0a82b8c2f1 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -54,7 +54,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     tearsofsteel-1080p \
     schroedinger \
     pipewire \
-    projucer \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d)} \
     libcamera \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-- 
2.30.2

