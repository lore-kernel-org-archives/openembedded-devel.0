Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.21061.1610905026186633283
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XU1JNrzw;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id h10so8799624pfo.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KSmXD/vYLXB5RZPQEP2DfUhfwd1r9BWAHRjWDsB9aIs=;
        b=XU1JNrzwv7OZ9LOHiz9rbf7tkzCJ2U6/8P3jJ/UQZOJfcTDToRAMKBRGtdsb3xDoqL
         qNH4EBYCQPDHXEQ+0DkczGNvqF8/8WvlOH0byTT0rnCawsJlBUql1B1FKHnuTVBKfD5s
         2J0waHeoY9LL8sFvk5enzyTxnJxzDqQVe9zg1DQWOoaI3v99FUKTLXLgv8PUFYTTM3qj
         MdEWyk4Gmthjbz1IEaDExn1bKTfhpnvznZg88Dk+DM8aFkqhPemY5k7O4VqpnJaluHov
         sCt6T6cue0abzY1rfaVlms6pilB3iil7SJiSz1FEZIxBJV5BNxTHsgGOZzf1T2YTwKFu
         DeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KSmXD/vYLXB5RZPQEP2DfUhfwd1r9BWAHRjWDsB9aIs=;
        b=SP0dRMOaDWteUPJG830nbpiIus3jspv630pz2PBK2h7IWo0c/p0BkaQWlw5dIn+zLR
         QcsYWTWKcsxCkmtimhZTmABnss+BSwY1iOZi5evsZDLPlRcVXvw/QkeIVaY3pxWyoPqu
         iqoHtA3R5WVOodf5hK0a7K9+JC7SSwQP1e+bNJin7osrG89VTTpKr9igojr5Z6RQWfw3
         iZOutUKeqnhw1ms5AgQ6yPUZhNollhQPSqaqHnJPVci1byBSEcf0xNQMD7EIzDEzDYsf
         +tHcDv1U81CheXgRSi1x7Hrdpmk43Nl4qGiu7/tZXhyJjU6tM8fvlVD+1rNKaIHVet0J
         2kkA==
X-Gm-Message-State: AOAM533StqveV2lVbz0X8mvEWqoEWWzRtHitYfnaBKPN7N04lL8+M1pO
	YGLzZkjLo9fDOlnweYdGIBEPThsIBJ30PA==
X-Google-Smtp-Source: ABdhPJwkT+4DeSiuJdtT+47q5H5a4S3AeGLkAJLZkx9gq/wylcKJ5d5TVbOiKo3LmfNPIjDkob0ewQ==
X-Received: by 2002:a63:5c61:: with SMTP id n33mr4737981pgm.337.1610905025684;
        Sun, 17 Jan 2021 09:37:05 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:04 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 24/31] lmbench: Fix setting LDLIBS failure
Date: Sun, 17 Jan 2021 09:36:29 -0800
Message-Id: <a5d1580a4da90379f4ac6afc4826a95c9106320d.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: He Zhe <zhe.he@windriver.com>

scripts/build is interpreted as an sh script which may not recognize variable
assignment operator += and thus give the following error and fail to append
LDLIBS.

../scripts/build: 21: ../scripts/build: LDLIBS+=-lm: not found

Use the basic assignment instead.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a6a8fc75bad04be0842e22fb137d0e7a2dcb7279)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...2-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
index 353d80b3b7..1d5d9c12ab 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
@@ -22,7 +22,7 @@ index 34a1371..3786741 100755
  trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BASE}$$.o ${BASE}$$; exit 1' 1 2 15
  
 -LDLIBS=-lm
-+LDLIBS+=-lm
++LDLIBS="$LDLIBS -lm"
  
  # check for HP-UX's ANSI compiler
  echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
-- 
2.17.1

