Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.13001.1589899429574727837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GwUKBBA8;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id p30so499420pgl.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2f5+LhENuIgRVD7KqX19oqYRzv3Ba9Zrixenb+e0GVM=;
        b=GwUKBBA89p0DKMIWF1l6Udl1FHZ3exoqxBTLUno3lx2VVoDxFLWyQ/3g/MtXAdOf8o
         vvq1AaJVISxBhlppK60JtUL+zBwxEJuBrz4hK4WikWePpSn/JkTwjGmLJfnbowbPouU2
         ZLsoFKf0vUclUsK2radzGm9n14WiZSMOeZIVRqVgebHwRqBFnlqmJ3PQWNNjvdwa/fhI
         cD49SJQ/Bnl/A0LYpZYw6iT35VjFU93YncadMoRD7N6CsPzb5wjJiQP+6O8CXTtmpgc0
         xumZhVKN7qjHH0/HwiE9dnnz/r+jRSkEFWL/H3WiRk26Vls0otLJB7Q1U/SyFiMEjDk2
         p57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2f5+LhENuIgRVD7KqX19oqYRzv3Ba9Zrixenb+e0GVM=;
        b=QNk1HdcGJ3Q+JoF5IdTPaaftAZwiyVTL58Ni/EKZVnqqmsRDQLOm3C8NHmpD7mdE+x
         2r+kyUIg8Y3/VhhLxbJQDoQdc4n9E8LMTPzXKd3Wm223s5Gy7ggmxWOqrr4ZSQCyuIq/
         ncQ2U7z3/BS6HdATXP69qC1xyBRdhlogCBxaDmkwWAVV9DnnPYfFMI8rgfSFmgiVPsg1
         G/is9qukM99Vy13m5YQAqw3tfRD/KGcPB/aS0wJoNS+N+BH6axxVHOJRL5P1ZrQrV3Rx
         bltzGsOpufKSLVdMKVHJvpj5t5jDsQWD+fH70ld3euiA7zImwCgu7PRkfclah0DxqIJf
         jnVw==
X-Gm-Message-State: AOAM531SYFP0SFgAjiAl4HnFcDOiOev2UmfThF6G2NkkCKaLNta03f9O
	3xwNvbp7AJ/JnNccWPtOu5D7PcM+
X-Google-Smtp-Source: ABdhPJwBrC8Ucy4PGWSph7y22rnAA5CjlcLT6olQxBMicU/12HsOZa6wv011aMicy5S6s3SxY3u2sg==
X-Received: by 2002:a62:7f92:: with SMTP id a140mr9846563pfd.240.1589899428371;
        Tue, 19 May 2020 07:43:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 12/18] gtkwave: Disable mime update during install
Date: Tue, 19 May 2020 07:43:26 -0700
Message-Id: <20200519144332.12822-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Its not cross compile safe, and there is a post install step via mime
bbclass which should take care of it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6105a7bd4dbb8f02d4c70335b3b3480df5268378)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
index 6c06c30aaf..6c22f0e044 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += "tk-lib"
 inherit features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc"
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc --disable-mime-update"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.17.1

