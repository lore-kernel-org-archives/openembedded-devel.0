Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.6309.1622029984491647659
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SNXLwWph;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id kr9so639777pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jtBWWLcD1262c9T40nWjr7cBvsClwHrB8/jhHTjWRGc=;
        b=SNXLwWphKX3iquyNhzDg4mbMtatG1nTqRlH8UEBBdzwx2DWkeWZG3qZ/Vc8YLY+6yS
         ccgBpQgopopgV/P7dVeWfu+QiM+L9m1GuSb5gwpRbZRJtdv9EpQH9R2c4sKumVbrhyZf
         uZHkoMl6JVhYJo7fUMFdqFoI7XFj2dVf8nu0CzawmX/JTsS5UMh/jsiS3PZizIgED/kg
         IFqARnMrQFGRXsuXjeY/vkJRyRuom1R7THIT+gNyndmTeivCekKKj+9tU8My0603Pu9C
         Vc57XdWHYnlSxzQ+6FfY9F+KuSKkE/zXhIdaZt6j8bzXWEwSlSYvmA4o+dvsBTZZ9VFk
         kbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jtBWWLcD1262c9T40nWjr7cBvsClwHrB8/jhHTjWRGc=;
        b=UljORQjAofc+1PoBTlkxPWAKwl2Fqn/DhoowCZssHz6xpFAp/pvhMYDP0qyjZilXmC
         fshPOLU2hcKi+KSJPuRqQjPf7A87XrcRTWgluNdz7jCUfewb0q0YB4yvvxZt+ujLnO2C
         b4PGuAISQr2PxQUq+9vb3CGxxBVKiMnJNWwM2CaDtS3NKDcdDJ6INGoSKeq52hucNVQa
         HEd31iEVvgqTp71XW2BCQ0uz29GDJtk1nVGYn0UwSVts8Ip9k03GmZq/hpHOgaWimTA7
         1O5LtmveMTJnpiWoHflHE0ZWus1etTy+AcrhgcLf+jXR/imq0+wRZyOcuya0+t8PaD0D
         n8hw==
X-Gm-Message-State: AOAM531nltZyBSDo+ve2yLkyHuI5di2uCWTkpe1EB9N2d2yF4trDq2/E
	ApwSm3BG8B56CUtnBThR/PEgeh1vl/1LaA==
X-Google-Smtp-Source: ABdhPJy1p4/qY/poHzWyk7YPVua8rEX31Iq9S6fA9STDwV/oSofL8Apsn60DeHJGl8Cg6OJVwiFH/A==
X-Received: by 2002:a17:903:22d1:b029:f2:67be:82fb with SMTP id y17-20020a17090322d1b02900f267be82fbmr35305135plg.15.1622029983904;
        Wed, 26 May 2021 04:53:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:03 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 18/23] sysdig: disable building for ppc
Date: Wed, 26 May 2021 04:52:33 -0700
Message-Id: <bf945de831db67832b1c4deff8033c70ef5831c2.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Saul Wold <Saul.Wold@windriver.com>

Sysdig depends on tbb which no longer builds for powerpc

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 433603cb7dd0243856509a552ff354dbc0fccd95)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index d9da190578..f1b77070c1 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -14,6 +14,7 @@ JIT_mipsarchn32 = ""
 JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
+JIT_powerpc = ""
 
 DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
@@ -49,3 +50,4 @@ COMPATIBLE_HOST_libc-musl = "null"
 COMPATIBLE_HOST_mips = "null"
 COMPATIBLE_HOST_riscv64 = "null"
 COMPATIBLE_HOST_riscv32 = "null"
+COMPATIBLE_HOST_powerpc = "null"
-- 
2.17.1

