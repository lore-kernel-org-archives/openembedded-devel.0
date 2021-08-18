Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.61566.1629323793251551424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 14:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H03lbR4A;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q2so3771750pgt.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Aug 2021 14:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=re1TdaPl+BtM1eAkmG8dJje4cwUG1Lr8dRHaeX3CF14=;
        b=H03lbR4AcmZA2QbuQGF81Z29hlEiLpJNE94hJvENBOAjPjuiF+DtdvzGMSib4U6wqj
         GHYBBlMNEr8degq77cMUtIUIiAefPUgAn2jlGKEsaH6jrXyKYr7sy/HiQo4V5PGTGVHv
         /PJFNfroxOzhJos75CmOxD2+Wewrj5w9iYx5vokGZQedoDMHQjlKTtKHEg5vsLU8Cstt
         1G2vBZ/voSxOA1i0jjccMMEYk16fBmMsDMrUlUpXLlkI/XPXIZQRAn1muA/H6w1nG3qz
         5UuoYCJVcMYB3n6YrbkYwemH+jRFe3sy7TktmXADvSxMWsMXGS/IPmd/xwpXu2bHI9yU
         KEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=re1TdaPl+BtM1eAkmG8dJje4cwUG1Lr8dRHaeX3CF14=;
        b=RgbAKpSdNeaUWtUcDx94kzOL+hY98SIsL0/QDoF9gWAlpblplpsK9RAARKsFC2aMRd
         z1oWuEVwz2FXoqL27zKWDuWaFBfmpMYRXY2e0zI4gObfiREjE+8xRBjCppTqTL3ny0Ci
         kF0YrQLG7Jwc+ChEULYD6OAfIZLYDbR8tzyjbn3e1UE6f5KrEJVN+IZIOukhVzRXgqRw
         UOYE+NneJq1oc+5Bpz31u69JEeNhWjn0PiTsWqdyqE3NgB+odOO7GbkA0WJaGvFOvHG4
         nhKhU0WpIC9MV3iG2rc8Eq4FNP5RJmhX14iNE44x9vsQwL/Dv0uDVuLwjcyO8BDA6XvV
         ILnQ==
X-Gm-Message-State: AOAM532WQdDE+cKdBDwXA2TOUQpA2iLKVYFCRkGa0P2mvS/HDtcEwI5E
	c9TZbatMHgqR/c2bRXQOWQn2b8oJbflaGg==
X-Google-Smtp-Source: ABdhPJzuzMqIvmwxZkkYcnWVLnsBV2uumuAHet779h2JfrwM/94G28jQZTwMz+3c1QMlLuzeo3d2AQ==
X-Received: by 2002:a05:6a00:1ac7:b0:3e2:2d05:3b31 with SMTP id f7-20020a056a001ac700b003e22d053b31mr11692239pfv.2.1629323792435;
        Wed, 18 Aug 2021 14:56:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id r18sm846623pgk.54.2021.08.18.14.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:56:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mpich: link explictly with libgcc
Date: Wed, 18 Aug 2021 14:56:30 -0700
Message-Id: <20210818215630.1491048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libmpi.so does need specific symbols from libgcc eg __multf3
on x86 irrespective of C library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
index 3fe32f8c94..1fa916c0e8 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
@@ -31,8 +31,9 @@ PACKAGECONFIG += " \
 "
 PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"

-LDFLAGS:append:libc-glibc:x86-64 = " -lgcc"
-LDFLAGS:append:libc-glibc:x86 = " -lgcc"
+# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
+LDFLAGS:append:x86-64 = " -lgcc"
+LDFLAGS:append:x86 = " -lgcc"

 inherit autotools gettext pkgconfig

--
2.33.0
