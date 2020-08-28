Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.46414.1598631015645237548
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 09:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OxSbf0xg;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id a65so1422795wme.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 09:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NUaoW0ahzTl724oXHA+/PQY1iaNZCcmMuFF8M72mBYY=;
        b=OxSbf0xg/f4YzNGPYCpWdzATzy5YJf3Mf1W2uc70dYMTqgEptlsPewaHTMiP2cr51v
         u29a9ckSebnc4eaate60sWxa36e1VlLGKK3tBBZ7BxKS5AYyC7OmVkeqGAW6xPZXHE8g
         p4josbg42yK0fGKdWHiHwxK82w2SEAMvdCsGWet0U5D/Lk3OuybvdLYzPhKO5+Gkcu/a
         A0aTb/Vmul9sB6zHwO+kVKrgKv8wx6CGbdDB1VvgTm6iC4LdUksNIQR4N6nusudsrurn
         RmU7GvqNM4HTPhX4WMyIg9Bx7oOUFpdLcMP1BPsAtX2GQGdJaO/h1ERtPSLmxejM7HwC
         Roag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NUaoW0ahzTl724oXHA+/PQY1iaNZCcmMuFF8M72mBYY=;
        b=DHWRy2B8Ky3wjRiA3oZ16ftyAB/i77D3i5/jBBPHqKhsqwCoTzkAn0aNGJNYyD2KRa
         dyVqrgMdPT2oKwafeuqlwcHUMGgguNVemm49AqZtXLIXihkn3UUtinPhz3leO+M0lj9j
         NLXcoDYnaVDFHHtdo4APJr1ua+ZfXhQvzNc94QfpYAu4UvuVF5/iBqzRNa1DCPwWVmjV
         YoGapYUplvJHyY55rBbmKraY4bcaz36DvFxLgscApY0ArGUxdtU72KLAD6A8RLtRG+ee
         wNSrzUCykfIpx3MIPDaw5k44CdQsQ0CCop+/vFXS/ICf6kjRid+DYqp4fBt72psH+ekz
         3cnw==
X-Gm-Message-State: AOAM533yHqol4ixnXd4gnmDydK3lb5UGEwj85IKkBxJhGZLqbZVdwPxO
	UHKPDgUwNr+LtYf5yPqAvAD4Wm24mV0=
X-Google-Smtp-Source: ABdhPJwDfkLK9V6Nnt4FvCSn6SOrttLN9OT7lb1T71flY4DCKVt6KwA2KsFdMP44LlhIKhKExy5/Hg==
X-Received: by 2002:a7b:c38e:: with SMTP id s14mr2306403wmj.124.1598631013648;
        Fri, 28 Aug 2020 09:10:13 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r18sm3080978wrg.64.2020.08.28.09.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 09:10:12 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-pyparted: upgrade to latest python2 compatible commit to fix build with gcc10 -fno-common
Date: Fri, 28 Aug 2020 18:10:09 +0200
Message-Id: <20200828161009.2351244-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* this is one of last python2 compatible commits, before:
  https://github.com/dcantrell/pyparted/commit/c4949263538784036a5917195f956f8fcda9cf20

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{python-pyparted_3.11.3.bb => python-pyparted_git.bb}    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename recipes-extended/python-pyparted/{python-pyparted_3.11.3.bb => python-pyparted_git.bb} (88%)

diff --git a/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb b/recipes-extended/python-pyparted/python-pyparted_git.bb
similarity index 88%
rename from recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
rename to recipes-extended/python-pyparted/python-pyparted_git.bb
index 86caf2a..1f36924 100644
--- a/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
+++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
@@ -11,8 +11,11 @@ LIC_FILES_CHKSUM = "\
     file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
 "
 
+# 3.11.4 tag + gcc10 fixes for -fno-common
+PV = "3.11.4+git${SRCPV}"
+
 # upstream only publishes releases in github archives which are discouraged
-SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
+SRCREV = "104ca13567c08c1188b126a395c4602841aae2c6"
 SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
 
 DEPENDS += "parted"
-- 
2.25.1

