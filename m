Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.743.1607971376613711696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L/cSRpV5;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id c7so16601050qke.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKIRzK7DC2uO8snGqB54UQsj7KX3PVYEdOD/l1cW//U=;
        b=L/cSRpV5l42ovy0zuwSF+C4WM04Nzr7uVhDPT0s8Uhg1l0ZUNqckjrfSpnjFsRa/dY
         iCBOI3aG+KwRLTmhcq/GxGI3iBo6Yx/ntxDyrM2gti5MHTWjibfhZrJ131g4yKrmd+5G
         oDPoKcQ4xXsgyBDlAekQqhjE7us4wnlj/Q838/Xy/m7vIrQNCiiX/RqoShNoGW89VGrz
         6pNhUG8FMqgQO97P3DTo5hOH2DDvpZ9XV1W5HBYRwiX/1q9l8WE99YqiE48FkWc6w/ya
         DSYMZ1/mUvWNbNrRtDtrmwj0rKgejVfa8mM+GudND2KyZfTkK2RypiB06jJWvUQkSH+8
         FfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKIRzK7DC2uO8snGqB54UQsj7KX3PVYEdOD/l1cW//U=;
        b=KP018dFOZdOemWIyCBiA+iqBd2lTNMDqRYCESgOp7o7tKLkJhFn9vWS4s9UxI/7gh5
         EIvunZa63GgEdt4dq1zgq5ajmdla2/O/2l2NUg+Gs2vdIRSsAUz+3GdA/dz8JBGv3yGJ
         ueGv4Pi7PxjVP+8AMG/7TILRtj+Um33kBPIq3Gbkcg7YFRPpkbyml4puKsBGlSi/OEq4
         WqLqMA8MTtjFPCMnbGcq2+xRM+kql1gpLlybgIV7U28MxvphzNsfcz2aqDzTiorthUzE
         JqXMHMK9z3eI4UJ6tAuiQztbarLWPbDF9Op2jytrbT2lWkD/X2ejfBLHIBYQ6QMB/3Ex
         gbMQ==
X-Gm-Message-State: AOAM533SI5W29X0DgTWCet91fW8axHfQ9OK89w3Y836PO+BfgQqHXDtb
	04AWrdc/YaJXLPtAw+m0C3ko2VGR5vWsFA==
X-Google-Smtp-Source: ABdhPJyyUc40Ls+0CQUT2IsISFPItFL/8U2MiQ1LUjiu7K3lgQNDSqwlYqoacKPDTl0cKq3I/efPnA==
X-Received: by 2002:a37:d42:: with SMTP id 63mr33046563qkn.461.1607971375428;
        Mon, 14 Dec 2020 10:42:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.cable.comcast.com ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id m10sm14864483qtg.52.2020.12.14.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 10:42:54 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-matplotlib: Disable LTO on mips/clang
Date: Mon, 14 Dec 2020 10:42:50 -0800
Message-Id: <20201214184251.353899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs lld with lto and lld does not yet support gnu_hash for mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
index 3cfa3f31f4..25709a1176 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
@@ -26,6 +26,7 @@ inherit pypi setuptools3 pkgconfig
 
 # LTO with clang needs lld
 LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
+LDFLAGS_remove_toolchain-clang_mips = "-fuse-ld=lld"
 
 RDEPENDS_${PN} = "\
     freetype \
@@ -40,6 +41,7 @@ RDEPENDS_${PN} = "\
 
 ENABLELTO_toolchain-clang_riscv64 = "echo enable_lto = False >> ${S}/setup.cfg"
 ENABLELTO_toolchain-clang_riscv32 = "echo enable_lto = False >> ${S}/setup.cfg"
+ENABLELTO_toolchain-clang_mips = "echo enable_lto = False >> ${S}/setup.cfg"
 do_compile_prepend() {
     echo [libs] > ${S}/setup.cfg
     echo system_freetype = true >> ${S}/setup.cfg
-- 
2.29.2

