Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.25960.1629128391111489963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 08:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ijL8JW/J;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id n12so20481042plf.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Aug 2021 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n8MKEw5OxNEv9uHwSvLNUiO8hzz25WOMqf0AGlhyeoU=;
        b=ijL8JW/JrwbH/r2VLnKiynr5YJ1Z2QEwrD4Kxv2LF6Tc28JkKE2ZmWXLEBWZc9HnFn
         Y8ah9Y1IqpMo5xz2I1iab1QHvyRlZGHqvtjzU09PoWsKwV/xlNCOFZqwbNeYVt14ouxT
         iRbbr+RFyQ5DiT2ceMg8dWTnrPUaHfSMeCS6JTFLoQSGjo+jRH3ejdEL/G/Rs1XYKVj6
         dfQ7KzRRpiSKhgXQfEXt2bwt0dlcLauPfIMT6EWjdzWrctev/e+3BMLRh8a4c4rgYd6V
         vDb7S6nRQY3/ZtdBukxqhHr0nn8E360Jn6YpJsHYr7Mk79DwTQtESo2BNOZoT6Qn63az
         IF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n8MKEw5OxNEv9uHwSvLNUiO8hzz25WOMqf0AGlhyeoU=;
        b=qJkKqE1NvqhpaTr+sr+616YhnMLF1L2o+57JHsPFE7jCEy0LmGGidmSwAxGqaP1VgA
         EgiJLGGG4+/V7V/Micurv3xmz/bqVB6A6plSnu3VU7LsE+C32L2NNTEOg8wmH/Ub/9fp
         EuUiOU55Zc2EC/83nApVCUvCqIV8jsZI6oy1qNYABLoYliY53HHi8tD1b5DUXZF1OawL
         GQV1kCw/jjnVZtJNp34ldXT+NatRf9STwYeVay382FwEbvSKy7conq64REAZ4isWezv7
         g23nn0ntCo8URj4n44DTCkfd1Fwl5IAE08+mo0LRxO4XOC1WTt0rnAmQfcZOuqzEByBY
         v05A==
X-Gm-Message-State: AOAM531IxvYameYxhz9nZu26oNjdZ8TR2gtyVXd5NTSCV+F1lHggcwA1
	+PthSEUjOhsOV+J9fJMsJlw7sSo9vjkfuQ==
X-Google-Smtp-Source: ABdhPJx0jPBiVImmXv6SpM+djZBbeJHJx2+eUR9CJ+/SeCoDUwipS/gk164qaV8ZVFpdKw/NYwSUeg==
X-Received: by 2002:a05:6a00:10cb:b029:3c6:8cc9:5098 with SMTP id d11-20020a056a0010cbb02903c68cc95098mr17089611pfu.41.1629128390218;
        Mon, 16 Aug 2021 08:39:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8e60])
        by smtp.gmail.com with ESMTPSA id ds6sm10010484pjb.32.2021.08.16.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:39:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-oe][PATCH] layer.conf: Add ttf-ipa to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS on fontconfig
Date: Mon, 16 Aug 2021 08:39:47 -0700
Message-Id: <20210816153947.214562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is newly added font recipe but missed the entry here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/conf/layer.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bfb3e59057..8aaff84b9f 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -5,7 +5,7 @@
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
 # of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does
+# the recipe contention so the order of directories in BBFILES does
 # not matter.

 # We have a conf and classes directory, append to BBPATH
@@ -81,6 +81,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-gentium->fontconfig \
   ttf-hunkyfonts->fontconfig \
   ttf-inconsolata->fontconfig \
+  ttf-ipa->fontconfig \
   ttf-liberation->fontconfig \
   ttf-liberation-sans-narrow->fontconfig \
   ttf-lklug->fontconfig \
--
2.32.0
