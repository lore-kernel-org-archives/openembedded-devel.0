Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.3290.1608096619074100370
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 21:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AJPbiBIf;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id n10so8796470pgl.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 21:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gi1wvj3dAeACMWV/iHiZInzLsvR++EGpJigQ6rnKrgM=;
        b=AJPbiBIf56RDIOAO464uU/vSF+bJkPmhrurO6s3G/eYKtXASwrqmrek3nI2wApSVJk
         bVHcspTZUihwbTpqBofvy0KW0qQ+C8IJR8uMMd1XKMcO0Y/CEUJbOh9HF0d8UbkuVnfe
         iX69KPn5QYmrhijgywEaBOz0nADluEUNEcfb20Pf9fHbQiPoP6MKBP9xB+viSx3zXjHg
         bHOD97gFoh8NxmJXwpvR5SQjB3/zRrfA52p1NCdb0o5aJxjPE2U6scBDf9GX8W/CFJfD
         V+z01aupxIV9rQoPKbMKf87OFpTsUnzv+dJZRIMhesI3RgwqZtQNZW2BPl2uAlSsh725
         FuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gi1wvj3dAeACMWV/iHiZInzLsvR++EGpJigQ6rnKrgM=;
        b=I8/azWnB5esIKMy7XZnCezMuHOB9bS4kZrU5DlGPw8P5DGxPhtTPZcqZ15XGNmvZuC
         uqQpN/T0o5YUceNc4eYjoQP8iWTRi35KGDRzJCSh5za+WSLOkNWH2mNDk0CpJ1/MHmLV
         HxEvckLGskFHWg8ROBXXhwIlaYUsRQN90b5O/+tIC4Q1sE4RTLbkGKYIvnWQ/8SdvagW
         wzeI3ixkNAljv3YZpAAZ63IBpOYQhTKMoEKL5S+pJvjZGIN+7DvCRBY+omVcNXwT1ABK
         HvQ1S6dH98Fy0tmFommmi87YFXNsfhcc0Y5yHBXfR+70ndgZQEefjchDYrFTCj4rhK7e
         E3UA==
X-Gm-Message-State: AOAM533QKZGs8pwop6oi8xe20Kx0SKCzwqilIylU7bt2hs+oSMgMECHh
	34ABMuiLRdy81L6ZR7/Wje26sWmVxNQCTg==
X-Google-Smtp-Source: ABdhPJynnelfCBq5I60oZKQy4xU7tcfeH0VClndn8II4sbIdb5xSgM/o0iSXyW6gBPGM/TaxYdtDGA==
X-Received: by 2002:a62:4e43:0:b029:1a4:684c:87ea with SMTP id c64-20020a624e430000b02901a4684c87eamr2716978pfb.75.1608096618365;
        Tue, 15 Dec 2020 21:30:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id e13sm887230pfj.63.2020.12.15.21.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 21:30:17 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Caio Toledo <caioviniciusdetoledo@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] Add dbus-cxx to packagegroup-meta-oe
Date: Tue, 15 Dec 2020 21:30:13 -0800
Message-Id: <20201216053013.1661310-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216053013.1661310-1-raj.khem@gmail.com>
References: <20201216053013.1661310-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Caio Toledo <caioviniciusdetoledo@gmail.com>

Signed-off-by: Caio Toledo <caioviniciusdetoledo@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 577f2e7886..5023e49510 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -179,6 +179,7 @@ RDEPENDS_packagegroup-meta-oe-core = "\
     sdbus-c++ \
     toybox \
     usleep \
+    dbus-cxx \
 "
 RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " glfw"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv64 = "safec"
-- 
2.29.2

