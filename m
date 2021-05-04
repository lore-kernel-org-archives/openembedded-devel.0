Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.10222.1620152758219490994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 May 2021 11:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXCmY0RQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id m124so2884911pgm.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 May 2021 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98HV3uNH62HK5Rs+nsBxKu9m86NlpGpAUgIhgeR/Uiw=;
        b=eXCmY0RQqIvjVNSE8MAxPRUSNWkoKuFNer3yzRY3eBUCNNARql2cJ11ofk8edJcuih
         nRw9dlziOGOW2KBublMkBMHRbv+Xw0vAwd0U6czGNNqUHSQa3jrQcAJIGkIyAnXhE9Hv
         kduffW25u5oVWMuql96jNlBI1HWzYSWBNJY2Rx6Bx2NyhusK9Y+AhcnIuzZvf2MwYU6B
         kWgOAiL/mFBt+suV2qxy+kTBVyF8iOPZcsaFqQkp9B9ktYV/vIQOMFyeQEXE+bEgDRwV
         aljM+NX6VDwa2Yr6yOBWpEhJ7JykjS5NZ6E3xoD//FhVlKmT3NkdhsZePK7VrJoHEuTf
         GxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98HV3uNH62HK5Rs+nsBxKu9m86NlpGpAUgIhgeR/Uiw=;
        b=SIumxFSV7Yt08KeHaCa/1FKzv1UuJAjsyDtxOiYEZZBJFkQktOdF48SKteOY1EN1vk
         PYz1+AC44cKwiYtbuvGYneChbs5+Ehgc7O+l/DhUKpXbasoLTjFrP22lqLCybV+1UTX+
         D672yyTnmrwJ/QSimqqQQtrx+lFxWZLRafEb7/wrnkkiDV4fe33YGOl3BQwVsmrtZmZE
         LguJBWeBBlr3Qif5rpBK8pFJaOcK0qGGm4oFSRnUqVHZFD7d4BtiT8a2i+Hovn6j6hSe
         Aqj/HB1s5KzYrN1PqDpHO0ACKaNo23Yi4/2Ee9ZklW7L9TyxSARfJKRL96bauuhAqQha
         I4+Q==
X-Gm-Message-State: AOAM531plucERIGnE6drUnK177hbniFoOBnallCWp83FDSoxp6YJmlPM
	oAtMROcfXDnM9RSSv2u/hWxRI+JbIlDmCQ==
X-Google-Smtp-Source: ABdhPJwmBuA/6D0snA6SWarF3BCHJl6pXZ2PqbjemZQYoXg3MOmtrfhYtws8k0Y4ooki9yvkW1LE8Q==
X-Received: by 2002:a17:90a:7147:: with SMTP id g7mr28905531pjs.225.1620152757387;
        Tue, 04 May 2021 11:25:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id s3sm4555729pgs.62.2021.05.04.11.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 11:25:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] catch2: Upgrade to 2.13.6
Date: Tue,  4 May 2021 11:25:55 -0700
Message-Id: <20210504182555.2909462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-test/catch2/{catch2_2.13.4.bb => catch2_2.13.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.13.4.bb => catch2_2.13.6.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.4.bb b/meta-oe/recipes-test/catch2/catch2_2.13.6.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_2.13.4.bb
rename to meta-oe/recipes-test/catch2/catch2_2.13.6.bb
index 21004726a2..fd677a3e38 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.6.bb
@@ -6,7 +6,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x"
-SRCREV = "de6fe184a9ac1a06895cdd1c9b437f0a0bdf14ad"
+SRCREV = "5c88067bd339465513af4aec606bd2292f1b594a"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

