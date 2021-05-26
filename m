Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.6277.1622029985531213884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b+BVqopj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so196734pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MMFX6ZHKw9OOIr/FqUoXNFmx3AxJWBSB1UC2XsRvh9g=;
        b=b+BVqopj09z93IxGsNzWNCbvJBchCKNOBZK5YqLyMxRoEBYOkeEU8sXLhJodRMmriG
         J2VsgXe1Wcwt4TI9pliflADPjCvlnSNSDQ1HPXMpitzv8ibjtUuReHt+crWKVSN9fGdl
         dCaMAZjAIXtCtoGBLbFgfsX5XHM/sNPJhVHUj99zxjkcvRm6gRm2z10ecZyyY+9Crjfj
         jNPIuYLlueko8R/3xzzR4U6bt6jdWKq81rYVaJFs/92oYWZMKLcsgSNEf0A0Qm7vhKjM
         RJqny8M8AttZ6aWTB6vIuUByms8E1Vo881+57/YDl+WpYDayT5u0Yej9tpPRjKIObw00
         Joug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MMFX6ZHKw9OOIr/FqUoXNFmx3AxJWBSB1UC2XsRvh9g=;
        b=fvT22bf4aKsVAcc0onKXkU7RpELAjPOyTe0O7G+GhoLvg4EXrPU7WPjW56yGoNfqsf
         H5EfJU9TnkrLUBS6MaBtS7q+Wnt8EnDLYGjnIBzXJJESI8P091L7KrcUgHlbf6Me27nx
         SYen0Jn7YLtJSeeGp+9/10O8g/c6xYQRJBFFsaspAkTZIcmANwdM5oI4Fwp5uR3exUt6
         6biLSS1KyYlCQSZxBH5C2ZupfK2IfcIFB6TltQtOiS43tYJYc2Fu8gF3YBX0hYTUOEcS
         qOaeAsIxjb/7LWNLhp6o4fRX2yEKAZHsS7r7b7zChoDYZ6vuqF+F/iePRxNTPCLeNt+t
         ff1w==
X-Gm-Message-State: AOAM532sVEa5YWTGD3qySSghwMdueOFxLEN+Rp+mx6UZAUALC7URV3ce
	QjNmCwpqFoSPveKG1WOth93u+uJiv0LrpQ==
X-Google-Smtp-Source: ABdhPJxzkqUQccNe7Vh354oU4vqFbxjNXNn1qqSdw+4Dlh3FXli1Vc4Xb6Ht733y7/+L2CulahfgoA==
X-Received: by 2002:a17:90a:1982:: with SMTP id 2mr32209157pji.185.1622029985001;
        Wed, 26 May 2021 04:53:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:04 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 19/23] trace-cmd: Conflict resolution
Date: Wed, 26 May 2021 04:52:34 -0700
Message-Id: <15938ed77bfb3acf1c66e30782cc82b7da10bc44.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

perf(oe-core) also uses the doc included in plugins/, so package it in own subdirs of trace-cmd.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8402fdd6f6710effd763a0a9c06c83255e39722)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
index d39afff8e4..906ca2c1f3 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git"
 
 do_install() {
        oe_runmake etcdir=${sysconfdir} DESTDIR=${D} install
+       mkdir -p ${D}${libdir}/traceevent/plugins/${BPN}
+       mv ${D}/${libdir}/traceevent/plugins/*.so ${D}${libdir}/traceevent/plugins/${BPN}/
 }
 
 FILES_${PN} += "${libdir}/traceevent/plugins"
-- 
2.17.1

