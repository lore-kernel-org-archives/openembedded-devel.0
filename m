Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.4536.1620811844748941559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 02:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GVyiEDKN;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id s20so28465574ejr.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BTEsu6K59hLKTpP+/wrxuEMmi/2otPkg7teh9BeZSFQ=;
        b=GVyiEDKNmPkuWtpysVzbVgZeCkGtDJtN/Zh8i4b9TV5den64o9EZS3ZfD2Pm7qXJC8
         wH5mwsmf8M3QBiAFDmSBy0ZxwDsFVzdj3QeRMvmBMkPIST43cXv9usKIRSmDXxAEdHxm
         EJp9KOPdxuqPusScfMlrXMJQWMNB9PMdMZVCj7AzKTLqDYSm+DBdmmj4RS1zMw0OAoNP
         dj3VApaaq4cBMfl0TtXI5rWS87aahRZ18f1Fz/k6JLP+9PCj5Jvv7WLPuVEi4XJnmGAm
         Y0XI2J2t2z6YKvqqC3IAdaqL6JP/wVIaSFMkR7jrRLwX0c5Gx09WW4glf3Z3wivb8YwI
         5SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BTEsu6K59hLKTpP+/wrxuEMmi/2otPkg7teh9BeZSFQ=;
        b=lyvED+qWKI3yuijviSAlnf0RZjl/1/kXac8/C8seqXkywuML931JV9N4nmm6CKA3/R
         Gp8zf5HuGUnNb4oH86RX71vFyMJonqcMx49RseM5eiM4mOMRB7b9toUp/iRHi0g2qNzN
         5EBT1noaPC7XuHESscOzHooR3x5B9ad3tbtx1cEkxlwtbgVkOm5oaZ9hcDsUm1KKyRgq
         xvhUBW4YkbaKbZnragfU7xv6BEM7pZ+u2fBRxck7/5wXa/oLtVdAFdITZb9njDdYXpaO
         dHtUoaHPukyw3+XhLyuiNHNKgfuGoEsO1oX2RfaEMqhejtjE/tohvvbj7+xmneTCfd6Z
         FrPg==
X-Gm-Message-State: AOAM533iUVML80gWJnT1RAGaWx8GLFHR35B5e6CT+rWN5p4x0VDyfSfE
	OWXdrO456dIMyFcv9BGw9h8kCx3hSkM=
X-Google-Smtp-Source: ABdhPJzr330+kAMdQFWHo/Ikc/77/ProZ2KyIpAMUeA9bbzKT6MzvKDPlzmToASA/R+7FK7bH6zXNw==
X-Received: by 2002:a17:906:994f:: with SMTP id zm15mr37026581ejb.24.1620811842999;
        Wed, 12 May 2021 02:30:42 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n8sm3761751ejl.0.2021.05.12.02.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:30:42 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] ostree: switch from default master branch to main to fix do_fetch failure
Date: Wed, 12 May 2021 11:30:40 +0200
Message-Id: <20210512093040.48114-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* branch was renamed in upstream repo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2021.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.2.bb b/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
index 62467b01d2..c3505ab06b 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 PREMIRRORS = ""
 
 SRC_URI = " \
-    gitsm://github.com/ostreedev/ostree \
+    gitsm://github.com/ostreedev/ostree;branch=main \
     file://run-ptest \
 "
 SRCREV = "6a72674ec621a2282043c3a083fe1e45cd6a8761"
-- 
2.30.2

