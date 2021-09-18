Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.864.1631984260964464595
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N96RtoxD;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f129so12937764pgc.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dd+oMxbqaFW9/OLsiTGT4KgwHQTJxHiyy6+KNy2uOmE=;
        b=N96RtoxDLxOX9KzA//GQ/lKNAwGuCZBVfCSAp1sLTO1ZwP/1VLU7NCbrxMMyYxNfQO
         mZSf/BkDqz2V7IrwU1TTfL/CZUAvplNs7GUD8+n/BD9x1UhkHFp1Bb+LeFKa98DXk8EA
         QEOWVT6ZIYC6PHw6utArW9ozlyA7gAZWAcxvp155hp8kEDTffMNrgxQ04G8a3sWOXkvi
         +JuYw0p1fz18jrbzdvvqs8itXxUI+lfpRMGmez9sYZLz9j9IF1N5K5jlhDCZcquuRUiQ
         SNAexsSWNTL5FXh4cZI+ijPX6aYxnhfDH28DAJKWpO3lJxaIZa65yQpaE2G6QBuexwtk
         AtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dd+oMxbqaFW9/OLsiTGT4KgwHQTJxHiyy6+KNy2uOmE=;
        b=ErLYhVNH8yETerd4JEok9qNzyYbS5dHHjfpY0Ly9xmPZdMJYFxk8nffVVYt4LcMRhF
         C4ZI3Ly1Fu+Awo++lIl/7FoyTx3uvPuXG2OCbUuu+JY4/gwXxWXv/huldnX5wtCapXDZ
         sqbxJCkObuyRsKEoX9foY5gE7kEyWDPaF63jZQcspPV5/AHpCIncA5YY+J79jPcIeE2b
         1BQdbH/HOV/gJyH5Yw70D15ekPPmoqQpQ33BkTUfokMcmHaP8HPN0FkdmBWUweh5Px13
         Ldhxtniid7TAlykZ9a9QvCtxN7FCL97GtFbDHnAunTbrmzNc2B40/nE3QPB2k2NFM4/4
         zrFw==
X-Gm-Message-State: AOAM5333YtPtr7MPsCFouiEgBxdDaCBuU0SvezleumjbOv1lVzYdjczn
	id3EyzhTxSUpYy2H3qZt75v9t85QFZ0=
X-Google-Smtp-Source: ABdhPJzv2WagXj66f77uMBFZJ5OwJ0zCjrf8yN9hTI/eCPMIb7HWVaoy/IdQ6BmSh8cCiO5KZsz1SQ==
X-Received: by 2002:a63:da18:: with SMTP id c24mr15365142pgh.226.1631984260070;
        Sat, 18 Sep 2021 09:57:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/18] python3-cycler: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:21 -0700
Message-Id: <20210918165738.2581429-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
index 91df9875fc..edf3246bc0 100644
--- a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Composable style cycles"
 HOMEPAGE = "http://github.com/matplotlib/cycler"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
 
 SRC_URI[md5sum] = "4cb42917ac5007d1cdff6cccfe2d016b"
-- 
2.25.1

