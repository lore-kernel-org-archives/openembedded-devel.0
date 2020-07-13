Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.11829.1594608983612352269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O13Rc3mL;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id j20so5384090pfe.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=s3aLqezacXDp82DOsHTEIARI/bmvL2cvg0FppqlYCuA=;
        b=O13Rc3mLJb//ffNiIrfbn6RlIUeUBVjwjqzfY9N3xE+YK8iUPz2qXbDaGjG2iBdGc4
         Um5AwC5WNP6XgJg692WKmDshAH4iA2QKiSmLNt6jO4Tn4v7vOGITxQOS9PgSDFwqXsj4
         zzQ3ZuI6gteDo09qPzpxyAAuQ4pVvcoeIZlfUm1QDBrb+2Y8FFAGmVAIyyEwURjy8OFy
         nYrTsAwz68StzwhX5j/WVh765bmkt5vd2QdmB7PIEAznRYq4J1+nN1tPovIuRkOyBXRQ
         0ByvOwH3j7B4/VwhH79LzaU3DG/TFRGUS0UvncLpHMoelgxADiGDyiRwgowgvLBmFzKd
         vJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=s3aLqezacXDp82DOsHTEIARI/bmvL2cvg0FppqlYCuA=;
        b=T5wELZX3wIc51KjnhgMNxnlE/AY5Dxlx2zdIdF11NoZW3EBSdfM7NkT59LzugHDSol
         jjPoUnnK+qAC1XiTq2LjYWveIY5yr47KIxtUSSAGbRx3U7BvCZa7lZ3G48HVrD9Hr8Ro
         BTMbZShiJku3DvOovVTHw9kL7Ofb3c7o3sPhU0MIEDx/vyptTQ3I+QlVlx0oPBuYskbc
         nSehwY/6BjkyMDui/xPaKcsDwJgPk18876IJKA4l2ebFTzN2TXQhfzKlN3jtUqnr3Nbs
         lV3+xRgc5AeSUcaton0Ff9on2Hf0LOfIkDJbNSNkLTPTZdK96rvnDUj3aWt7hdKFQvba
         eHbw==
X-Gm-Message-State: AOAM532cBUxJ+3Mytl926O9Z97InFa4MFRJRAn5ARKblIkLfFyj2hl9F
	CKJiKbejKdOMCS1hvnZDcRAZwMPwUn0=
X-Google-Smtp-Source: ABdhPJy2vcIql4oSuHGtLzsipIrGjDGpMY0bxXahbIC8DAWWLqNU6xGMWzZEFW3QcENwd5mGUmXQ5Q==
X-Received: by 2002:aa7:9292:: with SMTP id j18mr29787462pfa.128.1594608982952;
        Sun, 12 Jul 2020 19:56:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/18] libmcrypt: set CLEANBROKEN
Date: Sun, 12 Jul 2020 19:56:01 -0700
Message-Id: <4deb89233f0c6fc907edc69d232e6e9ece454280.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Changqing Li <changqing.li@windriver.com>

reproduce steps:
1. bitbake libmcrypt
2. add bb.note('hello') in do_fetch of base.bbclass
3. bitbake libmcrypt

do_configure failed:
Making clean in doc
make[1]: Entering directory 'build/tmp-glibc/work/cortexa72-wrs-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/doc'
make[1]: *** No rule to make target 'clean'.  Stop.
make[1]: Leaving directory 'build/tmp-glibc/work/cortexa72-wrs-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/doc'
Makefile:316: recipe for target 'clean-recursive' failed

error occurred in autotools_preconfigure, since we have build one time
in step1, we have CONFIGURESTAMPFILE, and also BB_TASKHASH changed after
step2, in step3, after do_fetch, ${S} is renewed, but with main Makefile
exist but no Makefile exist under sub folder, so above error occurred.

set CLEANBROKEN to fix this error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e2d3ecaeb03027dd34875486ad00c58f921a5595)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index be413a1c71..46e694be4a 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -13,3 +13,5 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcrypt/files/Libmcrypt/"
 UPSTREAM_CHECK_REGEX = "Libmcrypt/(?P<pver>\d+(\.\d+)+)/"
 
 inherit autotools-brokensep gettext binconfig
+
+CLEANBROKEN = "1"
-- 
2.17.1

