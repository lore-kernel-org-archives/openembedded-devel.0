Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.205.1587499701005059269
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 13:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qgTNdn01;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id g30so7116435pfr.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 13:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RYE4/AtQb2ahYDZC6WATcn/nZOzXOIqaE//qsQMdGk0=;
        b=qgTNdn01MkuB3O6VHz+H3exX4nFgTeTKWBw3W9pn2yDjUNsjG5eL3IQlBYkayX1NzO
         6WT4H0diw3aBtE6I5/gZ1Ri9rfxhwi3MIvuU9eUMqZjp/kBNVJfJpwrDCGoqekL+pjSk
         TYQkEsBhqHTH4lZaIqimc8v0fHsF1cGn7jWIcZcdYbaqiEfzwEEHoQViVorBYpPYopjV
         y7WwNW6ki68MyJS656IHtyA8E8b7JDDUGIM1H5gANJZxvG+YjHGyFgU4OHlwGvdNMe9c
         MptAjGv7w6lfVI56i2UXvWcZvsdxIqEfZumSp4+wDJ/uYGgUCHLhi8uq7GGG9PiOt8a7
         FOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RYE4/AtQb2ahYDZC6WATcn/nZOzXOIqaE//qsQMdGk0=;
        b=YdSEQ85BHqXtHkfEUH2afv3CSKNLzufbgxN7Ud4AjVqMOqktEjrqepQxz9XuuQo67G
         b6mHDIxJXIG7UXq47ifZxjbUfIfXu0CeqIL5oMS9Z5yn+kjGKkqn8CUYrZhz5ezc4SZL
         wM2SJD3hGPctjm2oXUM+MTWY22V6O3/eWnfIZzTA4l0JlJflexmQUgGtTLP3sOcmEEqg
         ujiJeKwNfWpNTyh0UeeFS+ZFCqQBDL1aJJI4ofUCf1gqySJ6dfcm3rt7Aml+MlRmUSF5
         DsA2u0RKXJ5hEfXErFxIt0EWv5iy3I2dt/VYZixjPYGuwHQttkR+MdV8bbpjZWpfmpVC
         O/xw==
X-Gm-Message-State: AGi0PuYUfzuZyLVFvj5ZjA9bhxH7VcUymOUeGnaVidqArP24mjWTwjKC
	lku5HESvr86ga8uq1b0/3LC12sOQjcg=
X-Google-Smtp-Source: APiQypK5r/gyMZm4Y6dlQptCez3vrl0RQS10Aa3kHi7vi/aWYc2Ao+oFYaX9TP0F+4/fjToO3ghi0Q==
X-Received: by 2002:a63:d143:: with SMTP id c3mr22355454pgj.171.1587499699985;
        Tue, 21 Apr 2020 13:08:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d473])
        by smtp.gmail.com with ESMTPSA id t80sm3334852pfc.23.2020.04.21.13.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:08:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] babl: Disable ffp-exception-behavior on riscv/clang
Date: Tue, 21 Apr 2020 13:08:17 -0700
Message-Id: <20200421200817.3768030-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has same problem as mips.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/babl/babl_0.1.74.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
index 55462dcdd7..c470987b4f 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
@@ -12,6 +12,7 @@ DEPENDS += "lcms"
 
 # https://bugs.llvm.org/show_bug.cgi?id=45555
 CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
+CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
 SRC_URI[md5sum] = "d032853f2678bc95054c39d4f02045c1"
-- 
2.26.2

