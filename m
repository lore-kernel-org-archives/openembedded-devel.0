Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.57686.1598892702209898532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 09:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wp5kKtdQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c142so886300pfb.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l1tu6ywKoBm9vHofKiMuSleI0WAjuUY8maOdQpWuew8=;
        b=Wp5kKtdQxD2L4ens0pmWRk0gQj+3IKJaTON/GZRLL4FQeGt7V0P0hmBbbSJz3dpiVq
         kO1xuXZ69EpmJca6KFNqeLWRyHlprBQ7xHZJy5vDuIYxwfcCaoDe2rLyuyiuNijV53bn
         8D0Q1kqA1TtC4gm0gQK5m221ZulwVgxkBgVuTh+Ll3q6h/fi9/n5OprmrKackHG1oPId
         ww+aqGrUIJpBMiTdhbOEiALvh7+ce3cGCr/06zPiw1ofFVZ1ogje0p4AIQi9YqeceE47
         rqUboSyNzwBdJGw+JH/ISqc9AmB/bQeRQc3zv07UOr4I9M7XGhS+quZq6i1sQsRqNiCs
         qGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1tu6ywKoBm9vHofKiMuSleI0WAjuUY8maOdQpWuew8=;
        b=KfnBlj4ZzMJxXRI41jbY0eX6XgkqB02LFcMbZ2zGrJIwAIOFAZV2g64ev2l/ZTwwmD
         em6FfHyFeTQAVOQ+rkGqveRzA3XgZ9bRRelWGQWP6TlUhfrcQMSKzC9C7IeS+xsBo3Oy
         yxDF4wDBCb7Bts2U7gLnB5oIpcK9NFF1H3ckY+IQYUVCn/UV8aQaeSoD9bmahEkyPwYD
         aG3tMH6j2DeUy3OsSsaAICnb8RXHvC0vpGxJwAMUm4eSXVCFCdjE4VgUGjPB2lYFgS+h
         YWSsmEI8ZUUk7jc5WquEshZv325qs3bcfxUnpZQESueJGVqkuUplWdBy65PvqwIfuIet
         WfHQ==
X-Gm-Message-State: AOAM532ioS97k/OGQtA/G9zshdkMS9OKBicS3SoYv2cllGVmIisGjuxa
	T5SU8fjBTyVyXBs4ocn5gf7I4x0aFxjnqg==
X-Google-Smtp-Source: ABdhPJwCCWMq8MutRcihOVDR5oFFo8pLosfPmtiCbyp4omz+2NXo41KFfWKKc2f72Zw1dLkMWA4MGQ==
X-Received: by 2002:a63:9d82:: with SMTP id i124mr1883434pgd.336.1598892701371;
        Mon, 31 Aug 2020 09:51:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id in12sm115323pjb.29.2020.08.31.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:51:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] imagemagick: Create symlinks for magick-script
Date: Mon, 31 Aug 2020 09:51:35 -0700
Message-Id: <20200831165136.2817032-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831165136.2817032-1-raj.khem@gmail.com>
References: <20200831165136.2817032-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This link was missed out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 804faf02e1..70cb237d9e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -46,7 +46,7 @@ BBCLASSEXTEND = "native"
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN} = "animate compare composite conjure convert display \
-    identify import mogrify montage stream"
+    identify import magick-script mogrify montage stream"
 
 ALTERNATIVE_TARGET[animate] = "${bindir}/animate.im7"
 ALTERNATIVE_TARGET[compare] = "${bindir}/compare.im7"
@@ -56,12 +56,13 @@ ALTERNATIVE_TARGET[convert] = "${bindir}/convert.im7"
 ALTERNATIVE_TARGET[display] = "${bindir}/display.im7"
 ALTERNATIVE_TARGET[identify] = "${bindir}/identify.im7"
 ALTERNATIVE_TARGET[import] = "${bindir}/import.im7"
+ALTERNATIVE_TARGET[magick-script] = "${bindir}/magick-script.im7"
 ALTERNATIVE_TARGET[mogrify] = "${bindir}/mogrify.im7"
 ALTERNATIVE_TARGET[montage] = "${bindir}/montage.im7"
 ALTERNATIVE_TARGET[stream] = "${bindir}/stream.im7"
 
 ALTERNATIVE_${PN}-doc = "animate.1 compare.1 composite.1 conjure.1 \
-    convert.1 display.1 identify.1 import.1 mogrify.1 montage.1 stream.1"
+    convert.1 display.1 identify.1 import.1 magick-script.1 mogrify.1 montage.1 stream.1"
 
 ALTERNATIVE_LINK_NAME[animate.1] = "${mandir}/man1/animate.1"
 ALTERNATIVE_TARGET[animate.1] = "${mandir}/man1/animate.im7.1"
@@ -79,6 +80,8 @@ ALTERNATIVE_LINK_NAME[identify.1] = "${mandir}/man1/identify.1"
 ALTERNATIVE_TARGET[identify.1] = "${mandir}/man1/identify.im7.1"
 ALTERNATIVE_LINK_NAME[import.1] = "${mandir}/man1/import.1"
 ALTERNATIVE_TARGET[import.1] = "${mandir}/man1/import.im7.1"
+ALTERNATIVE_LINK_NAME[magick-script.1] = "${mandir}/man1/magick-script.1"
+ALTERNATIVE_TARGET[magick-script.1] = "${mandir}/man1/magick-script.im7.1"
 ALTERNATIVE_LINK_NAME[mogrify.1] = "${mandir}/man1/mogrify.1"
 ALTERNATIVE_TARGET[mogrify.1] = "${mandir}/man1/mogrify.im7.1"
 ALTERNATIVE_LINK_NAME[montage.1] = "${mandir}/man1/montage.1"
-- 
2.28.0

