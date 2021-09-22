Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.955.1632338556536834717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+cJhcQL;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id f129so3811785pgc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MX4URTGYx8x8hPTqZpyEVeP7lzzkkZICwh1KdkmEUtU=;
        b=Y+cJhcQLAv8KhYmffjOGBuj60uKWlLPzxZl0RlunjdZgqMp5Kxk2x5R1Uujy6JX4rF
         qWKYe3O9ZNoGDge+uId8jVE1jVae57PQwfx6Fervc5SAzOaI75n1+hbiOpFk7HSAwj/K
         Fa6H6tI/RXruuKSTRpyPhE2wIkLYgSfyrsOWU0Irz2Vg3IUHaK8Z50GZvX4u9rPXx6UE
         e1s8ElWPvtm740up5wudtzlw9HTP9+ooMgCfvB3xO2bKFSvuid1rwEK9qDSSPzhxYs7J
         m0+9TCi2NXtllNc8XZxFpj5Vlyhl88bFtCpYe2DTHGWOWcvLIe7mjMD6V9+4iZ41l4iI
         e+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MX4URTGYx8x8hPTqZpyEVeP7lzzkkZICwh1KdkmEUtU=;
        b=2CXVJBIxYmv/ZVE7rH6DrgJ0Wilf6vY/tbyLUCVim8kI/8OM6rQmTJQVzkzbTlyl30
         ZpDag4CD0yomVv8aDTk1SH0bdBbQetJKrsAws91zNQgUHip/18YIdma0NULvsZgtrqQe
         EGa/fOp9y3PYY0YtPe2dZFmVsR/Gu+hM/1ska37FDuTuJ7LiMeAL9yFjQBqjRcA6pK2/
         /zpUEBHBC1jiS1nchzV+VYvshRcXeyDnEN40nCrPXuBbA2l2Snd6CT8wVPAbaAbmk4La
         Mk/IdS3v8GsiZ4Zelu+rYy+/q8ksjvFSbe3LhIRlmBmGdkqT4l4M7s0lL9CngdupNRak
         3vRg==
X-Gm-Message-State: AOAM533iCV8diH512PHfuxefMmDRmuw/YIIB2w7TBZNfGjgCocUGxfFF
	UwViSHNwC93b/TQpJ1Njwze24m28tpCQVg==
X-Google-Smtp-Source: ABdhPJzWDblmdreT5Lz2q0FPujo2vAy4pbx+XfRYOFkpj/b2yfpYj3A1+fnG8aKaMT2jN4vFwRhD1w==
X-Received: by 2002:a63:bf07:: with SMTP id v7mr460623pgf.333.1632338555899;
        Wed, 22 Sep 2021 12:22:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 23/39] tigervnc: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:57 -0700
Message-Id: <20210922192213.3062719-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure.ac:118: error: possibly undefined macro: AC_DEFINE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 057a1772a4..e7673c58da 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
 S = "${WORKDIR}/git"
 
-inherit features_check
+inherit autotools cmake features_check pkgconfig
+
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-inherit autotools cmake
 B = "${S}"
 
 SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
-- 
2.33.0

