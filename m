Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.3142.1599324981785358086
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=szwixJbo;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b16so4633516pjp.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AxM23iksBv11E4KKv4RzQASh1WR5cYGcaOL6kETfDeo=;
        b=szwixJboM4tjcEBdDP6dv8L5Vw6bVaYKJ39GW36XvLNUazOvjQde0ioJFMugtGgZzJ
         sQNUegAgD4P353PP/pnGpow/uAAob4MnulEqW6eEG5yiRDpVzyq6G12iawu0qTJTSQ+8
         hG23CIepd9HL9n1PfyjR6VKloE6XzKRtgDbb1ooAkTJIiRcLTLn4DGSTtk3++ow7fKJu
         TeysR059ARHK4YyF7SW5+x/9mWSlYjX3cwGcmfIQLwgVwxBLVZ5LYwB8xvmlBwEpTf/1
         YMQ1XzXTlAEjx5pG+GOMzET9RVPq+TqDCBuof0keDr8+7HQXkf2PT32h7aWZcPCbDH49
         6lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AxM23iksBv11E4KKv4RzQASh1WR5cYGcaOL6kETfDeo=;
        b=pPGLAtpU14rLos9wsDkNvdaZYgRCP2og4/IRtnmmzb4fKsXUvdhDqKvpUpT12lrvhp
         piHzLTcxWd+aRd7FagLofjv8Zx1fDZQZE0JqXJF3cu8sA6gEjNyooyNk//RnF7kHJjH+
         c/9ufHZKCskNT0WRBeKehFTRIcRweV5tbOH3n3PFvzOGbvb3sXxurnpXLZLt6MaWCePV
         Wg+q6ZV2Vjh+vVMhDmy2nMFgcchvvjiolGgqdcu7Y3MP35ioJ2HWIeylG/dVs3jdrrIB
         NGUxYXtXMGIZG3XEAguwoDB6sJK0fw1tEGezb3Ba72ePhdq/jND82m3pYAkdb4NMD6Dr
         xX6w==
X-Gm-Message-State: AOAM533NUM2rj/awprjbcKmEubOb1VuwiQtzSO3wv+LPa5luIasXrjUS
	y7O4TAJz/kXx3tXnYUq9VTlUsBcpmhc=
X-Google-Smtp-Source: ABdhPJwOqbffohSQ38vyu/WLtpWiHz/jjjLe+exEQByxFXLB3sBkhc/mSebLDy7ecwRTrXcVcCTLZA==
X-Received: by 2002:a17:902:6f01:: with SMTP id w1mr13578313plk.49.1599324981201;
        Sat, 05 Sep 2020 09:56:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/20] babl-native: fix build issue
Date: Sat,  5 Sep 2020 09:56:00 -0700
Message-Id: <6a8d6ddc549638bed6dbf1d91df146b8a69ca589.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

../babl-0.1.74/babl/babl-fish-reference.c:1064:7: error: ‘for’ loop initial declarations are only allowed in C99 mode
|        for (int i = 0; i < n; i++)
|        ^
| ../babl-0.1.74/babl/babl-fish-reference.c:1064:7: note: use option -std=c99 or -std=gnu99 to compile your code

Fails on CentOS7 with Arch64

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gimp/babl/babl_0.1.74.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
index c470987b4f..9b405be0b3 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
@@ -10,6 +10,8 @@ inherit setuptools3 gnomebase gobject-introspection
 
 DEPENDS += "lcms"
 
+CFLAGS_append_class-native = " -std=gnu99"
+
 # https://bugs.llvm.org/show_bug.cgi?id=45555
 CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
-- 
2.17.1

