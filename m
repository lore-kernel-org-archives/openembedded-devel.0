Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.1358.1632322910440345120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 08:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ho9qhFOR;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso4670127pjh.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lBYVeG4oTS/+Jl/Tb9AKEXTy/ICMuea8JRJorDucSkQ=;
        b=ho9qhFOR9hIIGQSv5F+z09xxhvrlEbZdMHihAeift1eHUSl/zvOUFtIR8hv6wYC5k0
         U5fCQDQJYdwXQtMpB9hTziqUn2b16oL5WOH3VDIGjmz0Tki5ODaBl4Ooat9ax8w5K6q8
         TUs8u0JS6212h/zKkLLmMmWvkzolgw018iGjWbIK1ywtREJK7xkA/UXKWZAxMEv6emRP
         qosQyFCc8FCo6DTYoJOlBAJlX8oE7tsFZ/xy6xmZdlxrYmkxjGg/L+qh3pn2K+EhFYGb
         fBd9VuUn48LfjAUk4+Etxt9cObhjOunZ7HL43ANLq1sMn7ePzCuAbs0t86gwzuWY2/bh
         2JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lBYVeG4oTS/+Jl/Tb9AKEXTy/ICMuea8JRJorDucSkQ=;
        b=VQWdzTyNEkwRG9p97YoyMH+J+6AtZk9lQTtzBR4A8QA1nGIbLfGcNYmF9H3yjMQ43O
         BslJwbxUvU4x4yWnLspB30VqLMdoKFq/8kPimHtJeqiiDFCcnxgqfQyvBctT+IUhn8Wo
         CFkSzVNpQVHkqR6bwpLXVVRQkhFuz8X2moAbS1DehCIcV7gLXVZkERUZcG37yaSouYy3
         5wVu0CAEIvEH3z/tSBQozy0qElzcgMTy8k/dCcYI+d+TKo5QrGRdOAdX/i+XEvYTTLGh
         wN+2wXhhXHsSCKdRM8kmzffsnQpXONJOqom96AX40NrDNEFiBLOijdDDYMiu29OJhlkD
         l3GQ==
X-Gm-Message-State: AOAM533d4gze245OmvvZSLFOC96IwD1KpF1asEyql7Lvdr99IDevOSdJ
	jPwa68KnwQWX+Ij3FrCthBoLbI7n3ikL0g==
X-Google-Smtp-Source: ABdhPJy08DqxTsVMB68a3E866Fuu0Q1n7gQ7zoQ7bccYS1o9wBVD9WixiMQvjNvYPBr8GJtx+8+4BQ==
X-Received: by 2002:a17:903:2083:b0:13b:f43a:41af with SMTP id d3-20020a170903208300b0013bf43a41afmr269460plc.57.1632322909647;
        Wed, 22 Sep 2021 08:01:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id t15sm2767392pja.1.2021.09.22.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 08:01:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] emacs: Inherit pkgconfig
Date: Wed, 22 Sep 2021 08:01:44 -0700
Message-Id: <20210922150145.705595-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922150145.705595-1-raj.khem@gmail.com>
References: <20210922150145.705595-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was part of default dependencies before

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_27.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs_27.2.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
index a91c465c1f..193cd00123 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -24,8 +24,7 @@ EXTRA_OECONF = " --with-x=no --with-dumping=none"
 DEPENDS = "ncurses"
 DEPENDS:append:class-target = " emacs-native"
 
-inherit autotools mime-xdg
-
+inherit autotools mime-xdg pkgconfig
 
 do_compile:class-native (){
     cd ${B}/lib-src
-- 
2.33.0

