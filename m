Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.15783.1621809248258795963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aTyH2Vqg;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id n2so38752033ejy.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FZjwubd3ydVTSyIuP7u2D7afwKMUqAqEtEdKRb0HIfw=;
        b=aTyH2VqgePL+NtkEK3EWIw1GeT/ed6u2mzmn66anfMTRt98EYia03MnLFcdWV3rAyp
         SdrTxofdspitJDYz9maSEfOGkgbyau2AuSaFRmkasZt3a3S1N4ITlBDyh2p3LHzHY80H
         Dso+1s3Dhw9WE8r65fEprFPqHNw+qyk/gcW9QQ1ehqZBraUoz56IGcN193cTLlY65AJN
         LttT1hg5nmZYCjkgqM+IRgkSxI1RryoWdBh3LT2K4Hvzxq4nIF+rexEzOJa8b+4CgllD
         yZ8dXP1yrhfApZZML+NMbzNxuIlEjudaB+taZlOapOZtvxukXnB8p0rC2b4UEbP+KK7h
         Hi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZjwubd3ydVTSyIuP7u2D7afwKMUqAqEtEdKRb0HIfw=;
        b=swNVzFkkn2sQrirZwoJnu2wDj9ZAi7fcQZ85Q0tAlV5Q2bgyLv5X1vtdr6Aq4P1xRc
         F2e7HdTDL1z72ztMelVPJczxm0MbxJfpumLkonP7pVUZZ/qWQ6t+QsIF24gSse3F/xCU
         d7sU7HF7+3fWOLaahZveL3KvvfgzykQeRyR+t5JsvMAXvatLgRSZAJwKacQolqf1qvx3
         quqotus5OZusfWAN0DLkS+K9VSwwB73XT6IvTLVOwYs2Y55WNBlAkbjdjm+Z52n/AXOs
         h4uSzboWSUx1sicmufiwp4RdKU3Z+5BPWu55Bp8+/9M5sHTB9vki0JoRXEPoH3lw3Pwe
         1HyA==
X-Gm-Message-State: AOAM531e6efy+VzxnXQTKtBUz6ZTeeisS+dySaZ94pr7g2V2dIEZq2RY
	cBOt27HoN8qiheL+3NXiI1WlLLPZSac=
X-Google-Smtp-Source: ABdhPJwHjv1VuoQ+3/WCiEWxzn3t+oN1YrWk3KuYbGTLA4TxlcuqR2vFkgAAg3cSZy4HxkOOFEqUaQ==
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr19779229ejk.30.1621809246923;
        Sun, 23 May 2021 15:34:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:06 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/7] hwdata: upgrade 0.346 -> 0.347
Date: Mon, 24 May 2021 00:33:53 +0200
Message-Id: <20210523223353.2576671-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523223353.2576671-1-schnitzeltony@gmail.com>
References: <20210523223353.2576671-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_git.bb => hwdata_0.347.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_git.bb => hwdata_0.347.bb} (88%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_0.347.bb
similarity index 88%
rename from meta-oe/recipes-support/hwdata/hwdata_git.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.347.bb
index 738c32d63..43fb9189c 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.347.bb
@@ -5,10 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.346"
-SRCREV = "a2bff16032a68b089eeb169f09dea08094891c9c"
+SRCREV = "ae89c73d89bb9f416b25ad9e850e9606e66a573e"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
-
 S = "${WORKDIR}/git"
 
 do_configure() {
-- 
2.31.1

