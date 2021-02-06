Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.13913.1612653436423498099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FLmQiTt6;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o21so5956257pgn.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=joe1kNENLFLiKrk4JUrG8+UYWKuqLAeuSf3I0p/ao+I=;
        b=FLmQiTt6iL2rToUX/Dc0Uwiahw+IoEy8rtekjX2cUthTfUX/ACDEZk3219p1VOv7Lx
         HwGYLWb70sbuXkJp9aYdClqRnqJuAoYsGbO3YD8XD6ryrRGeX9yv5WcraoU5oMq7eKhN
         FHUlJjw+cYL311zMCvVuguscLPR6pIsdg2uq1Fa8xVUx7tNHlWOKF3GeYfJHZJxT/JPm
         6ta13ycLd5f96g7R2ccu6b5urWYMjpM0gThyHYXg5KRVjJmxaPVsddlp8aEYihBGCdrN
         pe+iJIzwSr+6MllZrSwzrtgtNHpvxxHCX579em5HoeDBUdaXVdhcQAIgovvvKm8895NX
         pSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=joe1kNENLFLiKrk4JUrG8+UYWKuqLAeuSf3I0p/ao+I=;
        b=M7YCJ/xUANmlD2oGCjas/3ca+K90UZ+CKIrjte6Sb74fSG9l1c2KCo65IekLN6L6Fs
         UpGbcQ0/Nnbp38MbKCJkmIxuPRXSYEfGKRL0v8s3S6eAq7Fm0uivSr4yMu6eA1dYBwQv
         9ryif5m3bURdsnhlQjR33LcH/NUWVQpyC9IsS6wm3kbFrTZ9Uj2/NZDi1JmGQdQqmUCN
         0TUkpfjP/x6NzWT9wLPBRelY6hOmSrngbT/qaCZbLgyxf24oZOZan7WLEkClNZiJsPLK
         mGJFLZEEIqTWDSMuNwdkuiV5gZDQnO9lTWgA8bYNITceYZq7pxzymNJOgFFrV6IyrEBI
         6uOA==
X-Gm-Message-State: AOAM532O40Ie2gE0DVvRyZrqnd+0xQkdEQMYoZGzX+zCah9shMSBP4RY
	gF4bq+Ec1i5+rTJcpcTFaVE1tHawFuxueg==
X-Google-Smtp-Source: ABdhPJxleNa6MTGTGuu9555Yjo0pcC6ej1bdQO2sQ5iFUirdUKMds77v8Nmjq/GG9w/hxfx3WgCXSQ==
X-Received: by 2002:a05:6a00:1353:b029:1c5:8a8d:7ee6 with SMTP id k19-20020a056a001353b02901c58a8d7ee6mr10689475pfu.13.1612653435797;
        Sat, 06 Feb 2021 15:17:15 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:15 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 06/10] flatbuffers: whitelist CVE-2020-35864
Date: Sat,  6 Feb 2021 15:17:02 -0800
Message-Id: <b5b2f97772780bea9fe10d358dab0807ffc6b1ad.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

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

