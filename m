Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.231.1619821056434726320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Apr 2021 15:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SD13PGhJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id u3so28720165eja.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Apr 2021 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n81Comqb8W2nneROYtztl/EHSDhNkqvQm98svA+Fpvg=;
        b=SD13PGhJpOFxpz02s9cm+YlZUPe6D69gotf3JtQdwFMXLACjPvN5hdjBT/PxSQAIhL
         YZeUm2Mc0vPUx5H4GvVwjaFPu4UNsnSiC4sIZiim4jgc0Pq4k7yM1j1mIWtcCjp2eZ94
         77HKZUmbAi43zypbBygRWE7zb7GMTWByxVluCR6FQ2G0azwoaOhBhIeSRhi1DuvzB7px
         UzyJazXjbz62mKq+ah1yF9S1KfCohMz7M2mnehlx7oxmmtV1QLjowScTgQzsG1+39iLy
         Jev8jjdFhe4kKza20gWWl5N3A3z2ecWnnl4o/+t/2DZtwdVSvvEZNFH/lk74CkrApicH
         Kajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n81Comqb8W2nneROYtztl/EHSDhNkqvQm98svA+Fpvg=;
        b=X5JRgT21aIVjQ77d7FsUiRKdCFNXty7CTiD2V19eYXkd/V6EWGOdkg2eBHhuh7hQFt
         go6CLwjqjNi29tbs9ImiIzlG4Xu3QVvz8OwxJDylydEDAT5Q7EFT9N0NoB5f+Ei0Nbfc
         feNNGFXrKGHxVbKYBnbgSRxtS+lcYfBjplzV1eqRkez/4fHcC6IOTTUa17f383EDXR1U
         m59F6nvSzD7PMThUabJtCYFa5ggxPdqw8Ti+UCF84pQNENqjmEaiVTJLjWBa83oK1uCW
         U0FL97YBLx8dENn/s0peOZQ7a4wASMsksnIgzMziGWKyWVQ5ZDn3DAnAHTGNxobeOccS
         ioqw==
X-Gm-Message-State: AOAM532CWOi2lkluQ6kHMU4xb7+qZ/a427TohRj1VLOFuQTKSJMMD3xD
	7rmtB+GcClHOXmDq48IQfqtszhCmbBE=
X-Google-Smtp-Source: ABdhPJyiaNdlM8xcgCRTJNnKtSbI45OT3YXWa4UZT8mcgcT4zqO8DKX5yHs/7bXDL+34ZVYbuZYQQw==
X-Received: by 2002:a17:906:b315:: with SMTP id n21mr6676259ejz.219.1619821054817;
        Fri, 30 Apr 2021 15:17:34 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f15f5094da33e6dbc0cf84f.dip0.t-ipconnect.de. [2003:f0:7f15:f509:4da3:3e6d:bc0c:f84f])
        by smtp.gmail.com with ESMTPSA id h11sm2817669eds.15.2021.04.30.15.17.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 15:17:34 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] jack: upgrade 1.19.17 -> 1.19.18
Date: Sat,  1 May 2021 00:17:12 +0200
Message-Id: <20210430221713.2128361-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:
* Add zalsa_in/out as internal client (based on zita-a2j/j2a and jack1 code)
* Fix jack_midi_dump deadlock on close after the jack server is restarted
* Fix interrupt signal for linux futex waits
* Log error message when cleaning previous DB (macOS and Windows)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../jack/{jack_1.19.17.bb => jack_1.19.18.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.17.bb => jack_1.19.18.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.17.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.17.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
index d5288c7b7..038e9ce11 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.17.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
@@ -17,7 +17,7 @@ DEPENDS = "libsamplerate0 libsndfile1 readline"
 SRC_URI = "git://github.com/jackaudio/jack2.git \
            file://0001-example-clients-Use-c-compiler-for-jack_simdtests.patch \
           "
-SRCREV = "9e23888b8def6527774889cf4ef6348fb78c7154"
+SRCREV = "5041ab0fe7fb719efa5122386d355397289a91f0"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2

