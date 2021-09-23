Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.1610.1632357898435561921
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 17:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EXeCUjAT;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id f129so4624680pgc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 17:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nF5pZV3ii8ccN5DjTmB7+fk8dJNxZ/Q3gncu6WxqlBU=;
        b=EXeCUjATBDi+gAqodHwe7v4IPn4Aef+5Q5k9XomJ8WKlww/fFB8iAiSpFkuyd+Kyug
         ZRjviUFKQsCQbzIK7A3WZc//rURqfhU13IKU/SGYs1K8t7in7d98BD0goCmFrZWky5p2
         bMzgJ85MrEnahbmJ3uGxTxf64V9zVmjusubeRkowI+ReyJD0GrdywKvk03aVTcEBS1GG
         yQN/b7QHzTflhESMgt2W/VDAIVREM7ISFtz8dFESL5i82raCyRELkeTRWdbHKlSWPaep
         CGsg+8YEpKvSF5ws6Es6uaDcIcnUeRjiqOkQhuD8RLX0Sf9697QwGH3Pw2xungJoYmaE
         /SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nF5pZV3ii8ccN5DjTmB7+fk8dJNxZ/Q3gncu6WxqlBU=;
        b=xIeUIb8uVU62LNoqE0HtzQsycT97oG2zzAixw3oWcgAGpZkctwCrFOR8WveA3+UUCB
         ovB9s2ty1GBOJTE0t2cWwoX1CPitlyk7G7Gs5qwFNUJNt3DABp/YoPDRJqb23Oo+FBAx
         rMIInU5pSb6XqK8WcCbp8IVzsXV05d/1qRqIG4Tz83Y/Ep+JIO5fvd7E02pDLVnvRbb4
         OeVHlvAX0o7E1zXqkF2JV6S+S/3neSdl1NdfZaKUA1UwaB9VMSwqLGZQi+6klL0TBkv/
         pB6rNQGy0NvWgkA5f27kMo9HYUs9BDXf7ZXTfwwZME5XCX6Ib50ejrjUkgkwfnWBRqh+
         LA0g==
X-Gm-Message-State: AOAM5330vQyOE3oJu4Aadx6gl9CE24RxlmnpIHXDoFh1ZtlNbuTLMK6A
	JbCogb9Ha3thy4Ji2d8cE456v4qsAnHR9Q==
X-Google-Smtp-Source: ABdhPJxZBiinWyDJ2PRYkQd+nXD3/kCTPzvJzLDyT8BmHBB/nqlbZIZrGmUp7iwXxaK6ogSREC2Urg==
X-Received: by 2002:aa7:8c45:0:b0:43c:75ed:5b22 with SMTP id e5-20020aa78c45000000b0043c75ed5b22mr1522789pfd.79.1632357896997;
        Wed, 22 Sep 2021 17:44:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id j9sm6720930pjb.33.2021.09.22.17.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 17:44:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-datetime-setter: Inherit pkgconfig
Date: Wed, 22 Sep 2021 17:44:54 -0700
Message-Id: <20210923004454.664059-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
Did not find pkg-config by name 'pkg-config'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index 35f541941d..92317c83fc 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -13,7 +13,7 @@ SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
 
 S = "${WORKDIR}/git"
 
-inherit gettext meson features_check
+inherit gettext meson features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "systemd x11"
 
-- 
2.33.0

