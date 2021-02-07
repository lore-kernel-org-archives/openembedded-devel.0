Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.24654.1612725018172192213
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dbkDonEI;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u15so6681152plf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=joe1kNENLFLiKrk4JUrG8+UYWKuqLAeuSf3I0p/ao+I=;
        b=dbkDonEId7LEDcJRYv/cFNNwDtY3Fsr3KqOyasP1NPX+K67AJJxKiHHZ/ldUQ1Dv+L
         XyxWC1DzCiiy5R+y23EgsM60yXRlCjcQTBmF1BDVv4xdj0p4434+n5+Owxi8efzqgAl+
         BXtUNohxSOUbRYayoj/0KstrUPirbycB56/C/HawEahD0qXL8CMDLvrW/pZN/H4NYkMC
         lypgX9p+tx64JqNWxKkiWQcPRKfcd5GzJ22tpTdGf16UoGY4Mo/2xbHVa5sGM40NYy4a
         4kLaB9Velbp3qb7kVxXW4hFzLlMl4Zo1NwBJNGJb8GagAajPFandSb+nDOI88q8Ek1NR
         9wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=joe1kNENLFLiKrk4JUrG8+UYWKuqLAeuSf3I0p/ao+I=;
        b=BolFYuPuDjaazAtTTE5qpLkJFzO/CHK/DYu2ny2SY5gdBSTJh2oa0FHQi8ZA7c1392
         9TZkAew3aZHI1KFH0HqR2ap6MQwYuAlQiFd+xkC2UXWDGTj8mFMMvHfrc7vujxKtgI7P
         VoBSM9IcOktQRvWnEq/Lx/3NC87lNyf6DZO7XwMcf6EbvQoVgRD0fJEHPcz00ldaMli0
         o2buKHiGz79nHQXWlh4Ojs/zo4YB3HXnn+YEsvPtJJ1DGkl/kmEsCwS9eJ445kYyPPlL
         dcUdSHpUZZ3+WN9/aO5dLmr94zlKUSPqLbJuEuXngwiAS8uosa9mpKSSIvqxh+xvyJnE
         BN1w==
X-Gm-Message-State: AOAM531FzRR+f99xbVL6ET3yM6fYQdgU6s3eivqCdmYY5I8bX2VB1rwf
	Io3eh/7TenmbXUcK7nt5Gs5G663iQf0q3A==
X-Google-Smtp-Source: ABdhPJy7GlWyFuUXn6QSNgHlAr+JQj6YYk7m93/dDGueW5zvTHPfoVwGM9Kgrb3rX/JPHikIRCtCGQ==
X-Received: by 2002:a17:90a:fe89:: with SMTP id co9mr13663757pjb.83.1612725017624;
        Sun, 07 Feb 2021 11:10:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:17 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 06/10] flatbuffers: whitelist CVE-2020-35864
Date: Sun,  7 Feb 2021 11:10:04 -0800
Message-Id: <b5b2f97772780bea9fe10d358dab0807ffc6b1ad.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

CVE-2020-35864 is for the rust crate for flatbuffers, not
flatbuffers itself.

https://security-tracker.debian.org/tracker/CVE-2020-35864

"NOT-FOR-US: flatbuffers rust crate"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index 1abfc8819d..65f7beec40 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -14,6 +14,8 @@ SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
 
 SRC_URI = "git://github.com/google/flatbuffers.git"
 
+CVE_CHECK_WHITELIST += "CVE-2020-35864"
+
 CXXFLAGS += "-fPIC"
 BUILD_CXXFLAGS += "-fPIC"
 
-- 
2.17.1

