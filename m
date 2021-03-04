Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.4013.1614847738433416684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rnLtagI3;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: wesley.lindauer@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 130so12347626qkh.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 00:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H7jc6pI6/85BO9rkllXnVvgUdVcRS2/OdUi0ewF1Gc0=;
        b=rnLtagI3u7PAJfxXbXEc6N28yCdxsjSF8ELQb/Dog0kG5/Ck7P0ukJ02Qld0ZoTNz8
         1TE1IvmC8+LRi5qkThoEb6k6ikYiU1oRn44cP7qYJ0GyjxOD6x4fDYqBukOjNINw5Gkm
         v871d30gjFza4vdBdyiaP2KBA1mUldFZgEA3GuEe/fune7S61dCzB++bzUTP6w4naxKd
         SJLRHiFTVd260RDvIBKuPluBynubVuCJua3ds7ZFMZbAwYSxbztZXM9LrJghf1bZRHA4
         nk+a1kP4thLJjjUzWWkEMPSlUlHl3H0DYc3HFxPkSbu/35nYZOGtBbHZkt1Bjnku9knb
         62rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H7jc6pI6/85BO9rkllXnVvgUdVcRS2/OdUi0ewF1Gc0=;
        b=gppuEOCmh/wkU7BEpenKn/3fRbzc5/cIXvJeN44kUuhZTM3nSV6pShk+KBBoM+cTJz
         h43DAkKDdhCNjhU9SQa/WeTqtODbwCwsKvEAsSyIouYcOc7qlAOZUp1TD04pvkvLNokM
         qulDuVAhbZqrjBYIXGbm/oeG43Msq2Xzfuu/2nmkLpTakX1g8h+tSSqLoAkq9en4NK0m
         0MboCJdyS5O4mGcAmW0UN92/vPwUPnnvRFMFzT78TM77MiacRGD8WMqr6koA73DLDaBw
         XL65erft/KrCJkLx13G9S+/oDMyjLPd+JI2CoJAOagfvFigTT+pPnh7R3vRWXeheEZtA
         EHmg==
X-Gm-Message-State: AOAM5326eUNIx6NzadbVfBCyd9IvEJc23xJB9vvjiBXkjVkC6IAChfCa
	6GQGONOhkJItJan87dM2eQrpsTO2kXY=
X-Google-Smtp-Source: ABdhPJxXOdyDjhUWfZbseBueW4hYS/YE2krEwal9UFH5gxhaNtKl82e3iOm661am5cgnf7UBzVeWFg==
X-Received: by 2002:ae9:dcc4:: with SMTP id q187mr2932772qkf.5.1614847737417;
        Thu, 04 Mar 2021 00:48:57 -0800 (PST)
Return-Path: <wesley.lindauer@gmail.com>
Received: from nova.wlindauer.baselinux.net (cpe-65-24-166-29.columbus.res.rr.com. [65.24.166.29])
        by smtp.gmail.com with ESMTPSA id g2sm19038245qkd.124.2021.03.04.00.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:48:57 -0800 (PST)
From: "Wes Lindauer" <wesley.lindauer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wes Lindauer <wesley.lindauer@gmail.com>
Subject: [meta-java][PATCH] ecj: exclude BB_NUMBER_THREADS from sstate hash
Date: Thu,  4 Mar 2021 03:47:56 -0500
Message-Id: <20210304084756.43481-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wes Lindauer <wesley.lindauer@gmail.com>

The sstate-cache for libecj-bootstrap is not shareable across multiple
machines because the parallelisation configuration of Bitbake is being
embedded into the sstate hash of libecj-bootstrap.

Exclude BB_NUMBER_THREADS from the do_compile sstate hashing to avoid
this issue.

Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 recipes-core/ecj/libecj-bootstrap.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index 8f84fd0..2f3cc97 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -54,6 +54,7 @@ do_compile() {
 
   fastjar -c -C build . -f ${JAR}
 }
+do_compile[vardepsexclude] += "BB_NUMBER_THREADS"
 
 do_install() {
   oe_jarinstall ${JAR} ecj-bootstrap.jar
-- 
2.21.3

