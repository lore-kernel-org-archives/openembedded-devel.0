Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.19747.1621261516244706873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kk6emVOQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id s4so1669452plg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ALjw3n+jBPIEwoLTbdkjhCd+DQXU7dZOR40LZbHjsYM=;
        b=Kk6emVOQJhSkUgfzz2NU433YoVFjiDx9UHGljo1d0nph3LXWDlPHFBfin5KDvRrtTq
         BNECOSl9yrVBYtFfB/hpg9eu4ZltYWWmPK0VIsIlrNl9OIOmOOz6x80Ex4G3b9UJVqQB
         e5pZYyqwA8q5Y/lfqj2rgY1kg84XOXkS1dGx2gUZTFhhONydx5V6woXKRzjTy4fXwnUm
         H0qitqa6oCgmO4OZdpVXiEfBxQErkgynVFov1VBI5S12IQvRbffw/KQ2qbE+1UMTVJ9v
         BcUdidaq1F94qohEVDXyDpyeZmqbHiUbv7Qo5YptwDsXnvXnW1l6P53I6lUVGr+gT9/F
         hx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALjw3n+jBPIEwoLTbdkjhCd+DQXU7dZOR40LZbHjsYM=;
        b=OQ9dAhTjFiuMi5Q09+zmvdrE/LJWWAZrzD8LpaGn3vNkPqji++c4B+w8S1fYGGgRSm
         z0aHje4XaFxPV6O/2l3iNhwu+XoaOO1l8A5hsmjcddzsMKXL521RRa5/Q5Nk6lNIX134
         4fnm303b2xsHip6OTQ40l5+WLRLlWwchNMNs86n4AUp96bUuFFTvOIg02rXHmODXD7U6
         JUtzQLQ4hBUJyvZOLcrzMeuSI1M+tMFSJgfw+2VhLnR0HtVRGRTeMAJYbI5qJfmZ+MJI
         +dWWLOhL8fXNLO75lIGyTcPweVveZ0RsbW3BXtwOoCjWveqgBYWeabnVljC+b9lJf+fo
         ecng==
X-Gm-Message-State: AOAM530BVf8Fj0TYhGrk9HLNBT/errDnPMzGNeZwoNS1g+KyAy5JfZCZ
	oq8ujSkyLUIP0Ohx4q6BynG4ldz9kI0=
X-Google-Smtp-Source: ABdhPJxxJ7GJSoHxPvI0lxKxiN+xnEojU2BHv8rHptkmosXNjRDbo/Y5ot6zJlL2hmfcjQnBrM9l8Q==
X-Received: by 2002:a17:902:b611:b029:f0:ca8c:9a9 with SMTP id b17-20020a170902b611b02900f0ca8c09a9mr273432pls.20.1621261515689;
        Mon, 17 May 2021 07:25:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:15 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/11] zsh: reduce priority slightly to avoid conflict with bash
Date: Mon, 17 May 2021 07:25:02 -0700
Message-Id: <30bb060b4cea034985f4c0ebfe6e81e6e58610b0.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

| [log_check] Warn: update-alternatives: sh has multiple providers with the same priority, please check /workdir/raspberrypi4_64-mortsgna-linux/allgui-dev-image/1.0-r0/rootfs/usr/lib/opkg/alternatives/sh for details

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df10c7bcc03d1a3eb0cd4d7e937bd935c8043c97)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
index 3aab65bf5b..aa372b70a3 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
@@ -38,7 +38,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 ALTERNATIVE_${PN} = "sh"
 ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "90"
 
 export AUTOHEADER = "true"
 
-- 
2.17.1

