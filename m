Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.114056.1597940319020157582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 09:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id m22so3169936eje.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 09:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tgXP8Z4L71fe0d8mNH7vSQjxmDIJ2UXm3Qr7Pyt85ps=;
        b=Er8MulNALFo9QMwBCmWEbnCbNN+geWJ7/34mqVJ5D65717TT6mKR+HyVWLDmubceNR
         9tpgW4L2RW8nxbVglear0wz/Lm4HUefdJjngaFxcqorYEesvGLCBYiWLeA540E9alhRT
         3zUuhy/9OoVSfx1RbBvBcE51E3aSwV+C9GnLU6BJ4CLNfRmrGm2TGNP9Zjlx8T4oCxFA
         ynGk5Kqn223XWuvl5WTGenW2ggpUP9lQ99j0gXfuf51b/fUoEdWKM6lIa0u54NVDUf/L
         vMECqbYDRJM9PMJzF0ZgJaxVuXC9gzDqvjnOTTPYtPuGAjuXg+CI7LVxdONALpMPIHxG
         mZYw==
X-Gm-Message-State: AOAM5331lgYFe8lftVeuwjRHNbD9AGwXOGmSeGJrkcEXMI6qB61r8Rrh
	WJNCSUEYEFo63Q8qSpdKhBlVj0EkkmrwBZFoerc=
X-Google-Smtp-Source: ABdhPJy0gNyNAo2rkIMvctWk5F7z8jIH1P3/q5jibA84vOVo2kEOF67fzuJMoqyIroFMH5htaV0Vcg==
X-Received: by 2002:a17:907:2126:: with SMTP id qo6mr3951180ejb.536.1597940316980;
        Thu, 20 Aug 2020 09:18:36 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-ThinkPad-X1-Extreme-2nd.fritz.box (ip5b402d63.dynamic.kabel-deutschland.de. [91.64.45.99])
        by smtp.gmail.com with ESMTPSA id s21sm1747624ejc.16.2020.08.20.09.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 09:18:36 -0700 (PDT)
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] asio: extend recipe to add native support
Date: Thu, 20 Aug 2020 18:18:25 +0200
Message-Id: <20200820161825.11048-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows usage of asio for native packages

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
index f381d12fb..dfc3b798d 100644
--- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
@@ -25,3 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 PACKAGECONFIG ??= "boost"
 
 PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
+
+BBCLASSEXTEND += "native nativesdk"
+
+EXTRA_OECONF_class-native += "--with-boost=${STAGING_LIBDIR_NATIVE}"
-- 
2.25.1

