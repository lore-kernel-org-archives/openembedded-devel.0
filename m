Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.10737.1593562059700781596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WbBaY7rq;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id p3so10759846pgh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OdiX2MeiAPuyHQZ6+LFpyv2UnhOMorP6LyEcBqv4nE4=;
        b=WbBaY7rqE4Hvz6MvF7sETY/cnNIjkRvOn6jPYH8UZ3XysI58/51QKcGjkTB51ktpnt
         WpFPr0snRLyX/40flBHQeqsbQtgLcrE14TEFOP2alGkGR/+Bn1aDzOwtdzAbwNnUqyQq
         Fo37p/sjIfS5JDb7qcmxc6k5Vi0wMpqnsb66ekvmXASBRFLuUSiqu+nwJ8bfHp1fb/Hd
         Tr5sp8VkDNSdkAjfvVP/Cg8nLuVUKcCqGHhms0Iu2j4f2VnB/qHJgHWV6biW/EjGIYzX
         neg07xrZxRiVnbExxnUc+3Zp2GOtMebLQ3h4Nm6ZQymrbUFRKxy+FqyyZPy4ski5m/B3
         6Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OdiX2MeiAPuyHQZ6+LFpyv2UnhOMorP6LyEcBqv4nE4=;
        b=ZXvoQ3iq4iNQ8rfM21bxHcR6IgocDYJUbtavDBdb3qgB0IVYhSf2oZkPgdR6vIL6aX
         ZegscbxKe1rQaAU/Y9NRkKXGQuJbuAfoRC5MN2p8RPffK3/RWnLBkp8Imrz08D5dwDOf
         VbK5mpBMLYHi9c/j+xkGOL2T9cnrFSKaS0An0ef61EoHd0XXF4TWC5johrE/LL+kxxNF
         3K15p7/IkUiydqo1s1TIjyDweF6xj5Mh6g18S/eZL+JUMnOL7IRNXxzgXChv/ul1Xcku
         ANCIZ7IiICjmtxPMSsEVuNIwNXRDqk3UEwD0OY5Oe6yIQkkZQH4bEtvK9cUtQIJa8yR9
         RUag==
X-Gm-Message-State: AOAM532/EsO37d8golhQ2N6rbaQMZgTJkYPR4F/P/y2XRPQ+abm2D5h0
	POlKBxyF745g0gsF9QL4P+JqOgO2vqY=
X-Google-Smtp-Source: ABdhPJwhkkmhbVdt+2QL9ACafUQ4aAn6b3Wd7N86ZLuPCZF6L6SkrcprDAxROMTgUiwaIhcDLwEeNg==
X-Received: by 2002:a63:4542:: with SMTP id u2mr16911851pgk.138.1593562059006;
        Tue, 30 Jun 2020 17:07:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 15/32] haveged: upgrade 1.9.8 -> 1.9.9
Date: Tue, 30 Jun 2020 17:07:00 -0700
Message-Id: <953e58adbc17d2cec2132c578da2e09c33b85786.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 339b7c6c34b33be852f8f5a5ee57660495b54cc6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../haveged/{haveged_1.9.8.bb => haveged_1.9.9.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.8.bb => haveged_1.9.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.8.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.8.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
index 403956efa1..c1839b37a8 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.8.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-# v1.9.8
-SRCREV = "8cd0266472aff59821718c4410e80f28978310f9"
+# v1.9.9
+SRCREV = "6da706c8026b629d9bb7ebebc32239305a03da8e"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
 "
 S = "${WORKDIR}/git"
-- 
2.17.1

