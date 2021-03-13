Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.724.1615598476728883133
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 17:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBUJVzA8;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x21so1705285pfa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 17:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xdlqDArVdikgS87BvCGvJE/4SkdH/fKMm6IvI7icTUU=;
        b=lBUJVzA8CS26m8bv50git5aRVLrT5t788/evRcjBjYbWPFg0dMraXEsmOl2FX+AZ4/
         mQ6u9okon4Riz367E3XC0hFe+t466jpuZ2nrnSYBkERrO8swHZlTr67BWSgA7KZ7qOl2
         ab/2WtFKBF7aWuiusdpwJZ/Rqi8ZqGvuU5AmmiLbSD6E3cIphTU58hGQMkOcZIRSpGRi
         pU+H6E25fJ8YGAePAkbnY7edabhV3odeyl6mUeXx0oyPnwlvQPM50dDgY8Ck2wViGZAL
         GltSuWZjkHZ0Vt6cu0+b8z7bYnGn6RWS7i5xFQa80qAACzUrfcK3TRTxzx4222s163jn
         zWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdlqDArVdikgS87BvCGvJE/4SkdH/fKMm6IvI7icTUU=;
        b=NGmSJ8vK6Ror9iaxPzoEU5g5rkS4yrvZMOjsza8OrywBaHD76BLPui+HPcvDMMAwY+
         yyYpLS5AZwJA0BPgbykOWjOvYR7xHk2WUP8Kkxysb8Z1ysXv2+YPLlUAohDIkoX1xB3P
         Y3WezAYwM+rW07WaM97w8Znl8fK09DOUoShTOgPVoLQb3PfopOAsq4NGCa7GUoO1E/2t
         bGnZ28xsv+l1vK1d/eq4DbUDkneB1dwXWm/EIUwAl/LCF2pU494qt2r9ktxD3ly8F37M
         Ukq50MCuwtR8RW2yjq8+j3Knm085WzWIsQ/R15womK5Ir4eW2DII7lxLCaHr1bDpiws7
         xdaw==
X-Gm-Message-State: AOAM530djdk+MwYKxZ4CAQ1cVtGc7EGu5S2s57gu2TvpGWN5n/QKveyu
	m2Y+237qwVhwoBHvfKpKuTcLEYS5rncydg==
X-Google-Smtp-Source: ABdhPJzsRmeFpSqtQ0OAdzJXhMUNyexyMIsSxaRyRVh2vIKZ9yEKU2H/ntcVu+iNxjs3yWxBOnmSTw==
X-Received: by 2002:a62:92cc:0:b029:1fa:515d:808f with SMTP id o195-20020a6292cc0000b02901fa515d808fmr14820445pfd.43.1615598476062;
        Fri, 12 Mar 2021 17:21:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id w79sm6868369pfc.87.2021.03.12.17.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 17:21:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] libnma: Disbale vapi
Date: Fri, 12 Mar 2021 17:21:13 -0800
Message-Id: <20210313012113.292085-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313012113.292085-1-raj.khem@gmail.com>
References: <20210313012113.292085-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

introspection is not supported for ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
index 3f3cb90b79..c0a7dd63d8 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
@@ -20,7 +20,8 @@ PACKAGECONFIG[mobile_broadband_provider_info] = "-Dmobile_broadband_provider_inf
 
 # go introspection is not supported for mipsn32/riscv32, but vapi needs it
 #
-EXTRA_OEMESON_mipsarchn32_append = " -Dvapi=false"
-EXTRA_OEMESON_riscv32_append = " -Dvapi=false"
+EXTRA_OEMESON_append_mipsarchn32 = " -Dvapi=false"
+EXTRA_OEMESON_append_riscv32 = " -Dvapi=false"
+EXTRA_OEMESON_append_powerpc64le = " -Dvapi=false"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.30.2

