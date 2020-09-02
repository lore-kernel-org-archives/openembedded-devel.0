Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.15471.1599072277468901074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 11:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=llXGZU9y;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id a8so183592plm.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ph3qGWwMk7bljKZaHX6ir3t1qUSu+Pi5g4TqITxIlE=;
        b=llXGZU9ysJawjq8pdkyAiLEKU1HaEXtCfo1DNWTc5lhfxefqf3UpYJ1uEM17olXB5X
         oAbuZmpXsJW0yXKGsKtQ5i9UAZpvZBP0Zy/4ZfLIP2Q2aTfENfyDmtYbSzFnq/Lmwi/K
         uLi/5TJ/BtUgvA+yvxSycvRjUtwCkiUrjNvD+V4UJSKeRxXmoQkvkSFHqaYnR3O213SR
         aTOj1G1tdqe52/JdOU57aisDbkfQtvrjQcQajKMRhNC7UG1ZGxqilO+IsERgIo0+anSM
         XTeBeaz5+IxqcP80krwiS0T0G7td3uQVd1RSEqLnikhhzPFIHI5niJrWV3KZ7OUyYp3M
         ceng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ph3qGWwMk7bljKZaHX6ir3t1qUSu+Pi5g4TqITxIlE=;
        b=B2bOxsoHeTN+J/ejMEXkM0Fvrb/ABlzgj2PsQxYttsD5st2qzx/SOjYr57NH+sQ5Jl
         ++PAEkq4SEA7lOtYd4hchPuj5gFTakRt8NAbVGbm91Zg88UnyOyGVU1bIX98cDpJppA5
         MLctNi9l4RqBgJjd1yP3lw4QiowmfZV4VF0fGTZzzmBbcvNRjrzQC8McCpI10NVuUB+y
         dfqg46kYb7wcx1VF1Csbu7radF/RmFVDSJaui4ZMwoG7wPIpA1j/uUeIT0U29qfpBFsi
         YSe5+uNx4qyaLN+Nytfj5cxluGSSSpVIbR0My6keIN3I0Z4vIIzdgevpaGJD8EIdINhb
         xfOA==
X-Gm-Message-State: AOAM530frNYJ8z7XbWn/3Uv8pd8xZoMIAihNCLCaSrFMPb995c6ATc/v
	qVOsf1wXkhRL2ii3GF4qhFh0rqhL16Df1A==
X-Google-Smtp-Source: ABdhPJzdmXYVhP06mYAfINPL/jMVTpQg55asSAlXEZa1sMqpNNp7utP6r8KEuvlk2AnecPaAAdYQGg==
X-Received: by 2002:a17:902:76cb:: with SMTP id j11mr3270893plt.29.1599072276402;
        Wed, 02 Sep 2020 11:44:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id x12sm126813pjq.43.2020.09.02.11.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:44:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] packagegroup-meta-multimedia: Remove projucer on musl
Date: Wed,  2 Sep 2020 11:44:31 -0700
Message-Id: <20200902184431.1098556-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902184431.1098556-1-raj.khem@gmail.com>
References: <20200902184431.1098556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 7de9fce86a..2bf8877bb9 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -73,6 +73,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     webrtc-audio-processing \
     ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "x265", "", d)} \
 "
+RDEPENDS_packagegroup-meta-multimedia_remove_libc-musl = "projucer"
 
 RDEPENDS_packagegroup-meta-multimedia-connectivity = "\
     gssdp \
-- 
2.28.0

