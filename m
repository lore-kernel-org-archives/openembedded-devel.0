Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.4465.1620811892492286509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 02:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FdmSOKM0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id r11so2209500edt.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wRQBlQUlECQjHIk+QgZ+xSGWaaIQ/wuzz8FZyk1zYfg=;
        b=FdmSOKM0I/cvN2vBMkdPBfVCE4COKVLz7nJav8Ze7Fb795xBeTPKF84nh3pKHN2CKD
         C/DrLTfRT1jp/jXBhjOI0aNrGgY5w2+7kmDPlByN5GD+DFtEFmABq26Igk4VdkH3DsLN
         KOq9ZhlP/7/J1lCWYwF5JaLMWf8mfsa5uDrlfskc8TjGwOlPijRRNxpLwCpAy+QXA9iM
         A9Ke1Cz8nFtudBkhELGnd1yUxz8AV9sSYfDrDh4n5FZVF8wTOUtYhhzTgeByMNFyh10A
         KjekCFJLbmYkXqANPvT84kwKLmAXP2aqnnV9SH8WXrZ0ChvC65ccJJ43m9OGP9lxMccv
         JD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wRQBlQUlECQjHIk+QgZ+xSGWaaIQ/wuzz8FZyk1zYfg=;
        b=ML/3mQJuP77ViADJ52z1pMd0uCMIhdBfRmNlvx1oh2IBDTjDFANGX7DRZ+figdBVQr
         gDbmmoA3XMtZiD5Jt4tn/vIy0SMyNSKK5m8HpC6g2N2jGtmWlIBRM/adcWNOF4RktdXh
         cqR9j26SX9C6gepUjqykOS1T6+w0azu6fd4+3VbxZ1B0qkKkF7awwb2XFkKEQXTAN6Pr
         SkT//l082m+CIoxn1mSuHlhQkVuMFHDvVPpDjCSDiim/b+hPqltSE9of5Qs9VbRzF8i6
         TjyhiFX2+CMO5u5eQYvamavo28UndBsrYrAbZmYwdHiXptQ0/w2WtGn0Eq9OOpFQFUkW
         01Jw==
X-Gm-Message-State: AOAM530hmoS3Svg2/jFzrBFOc8dBARYEVf0CnwEKaoP19vWIVDoOtH8j
	oDKLai8gmzEKeuPt1qcuf82J+o8kKvg=
X-Google-Smtp-Source: ABdhPJyyYI6ijWZzf+vZWmZW4xtq4TDpzwQByxpeBB2alkNpYxdEqYVLiZNU0+IAJggsHTCssA/G4Q==
X-Received: by 2002:a05:6402:2d6:: with SMTP id b22mr42401241edx.274.1620811891050;
        Wed, 12 May 2021 02:31:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i6sm17434869eds.83.2021.05.12.02.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:31:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH] ostree: switch from default master branch to main to fix do_fetch failure
Date: Wed, 12 May 2021 11:31:26 +0200
Message-Id: <20210512093126.48464-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* branch was renamed in upstream repo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2020.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.7.bb b/meta-oe/recipes-extended/ostree/ostree_2020.7.bb
index def122b02e..63c76d335f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.7.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 PREMIRRORS = ""
 
 SRC_URI = " \
-    gitsm://github.com/ostreedev/ostree \
+    gitsm://github.com/ostreedev/ostree;branch=main \
     file://run-ptest \
 "
 SRCREV = "32a3a1297312e566df3141c6c7e3b99709e474b1"
-- 
2.30.2

