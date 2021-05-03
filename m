Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.65.1620071786114278657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h8TZGq4y;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id t21so3470286plo.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8WtvC95J2bt9ODcuul9kK9HuqXTDxBlnvX9SSNVDpU=;
        b=h8TZGq4yFfD2UjPcVgXO7kRHDUffN8N5KotZq6tD/tD/CzX8hyQ7KbhFylzIrA/koH
         QBuZs1llb+vQZ/c2TUBwHllu9Dd83Aq7udWCk1AIOUT4tr1OPE84zE+hwddgLrEniCD+
         M7wYZrOyKTRGBZnuPye0bvEQsHqtkaKE7sqtYbV8SL/9AQcwjzJhlTqYJ89TBKBRGYLT
         /RiYboa+ygeclnwRd9m9DyNSX4bpNLGze56ufVvb0PEgYYqUQdjQqPK1AsYq3MqXcXyx
         oWstxrB1sTeUyLkiCFAWciXzc5fmwOOeTN8AI0fqJkvJYMbeXbM+SbAN+junmQ7zGXK4
         RxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8WtvC95J2bt9ODcuul9kK9HuqXTDxBlnvX9SSNVDpU=;
        b=DmDdWVHOz1iid/+WYLHJ+W7gi8Fm6pntSkYjALeX4snvFhjctR7DpBFe8rt7AfJ+BE
         gaElN+3AlhH21kl/4DgH5sU4orHrjNlq5qfLqwjAj9Lxo7BnALKvwrbfuFHWI1TV5+LM
         JbSnNKVPosdvIzXvegxk+cczff7j/03nxxiawqRYU3wdVtmmx8PJMgtj8kgNmf3jS9UB
         6c3HTNNsAPZnw06HPAG7p2hkIygiARdioBBlEZ7LdAJYRC/lHXiKqanAS5w//KL/OsHh
         qLb7FtuAF0XeGXkp7FDGasgjwhY/4eqqBn4CgGlsxtHuLuHJgd93TDvCZIGo+03Tbh4q
         BuBw==
X-Gm-Message-State: AOAM532g/eprZGandPxjFDzSsxZhaLEmJZ1sT46SflPyXhTdEPP5eLKg
	GjlKVQjRaeRlz68rMCaTM+eWTv8FPHwKhA==
X-Google-Smtp-Source: ABdhPJxhk8ibNsjtQ4xupAe7NivSY1raCjmzMU2X6O4vGoF7dKxS4kAhofF302rdON99AqzELt/9lA==
X-Received: by 2002:a17:902:8ec1:b029:e9:998d:91f3 with SMTP id x1-20020a1709028ec1b02900e9998d91f3mr22017523plo.59.1620071785403;
        Mon, 03 May 2021 12:56:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id x4sm9978112pfr.160.2021.05.03.12.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:56:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dibbler: Add libpthread to linker flags
Date: Mon,  3 May 2021 12:56:22 -0700
Message-Id: <20210503195622.3536554-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed build issue
lowlevel-linux-link-state.c:(.text+0x450): undefined reference to `pthread_create'
clang-12: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/dibbler/dibbler_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index c2f4827161..b19364e1e2 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -29,6 +29,8 @@ inherit autotools
 
 DEPENDS += "flex-native"
 
+LDFLAGS += "-pthread"
+
 PACKAGES =+ "${PN}-requestor ${PN}-client ${PN}-relay ${PN}-server"
 
 FILES_${PN}-client = "${sbindir}/${PN}-client"
-- 
2.31.1

