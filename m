Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.21058.1610905023251636805
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=shco6dlp;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id f63so993305pfa.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VKnD6PTKNn+W7DHzdPEvLDh2KJU+Cx17QAWXrsTcGt8=;
        b=shco6dlpgrnEHq5ayi6GxBH+nXHrC40amsEzEc93vxXBDfNyLIJ9nuddvLzrtOomC9
         uCUxyVCOFuOY4OoeGxpaGX5aU06uk+DfUdfkFGTtRDMR4u+LZrweR/iD2ytx7o9na9a3
         gtR1bVi1O9TiUBaWdaSa+mfHoLl5o6veTGoDyE0huMjB9YQczvLp02norLndmCkzyfar
         kxcctYCtujXSeenHeZHBFynsaBbNku+YPDFkX+OyjVYwmwwBd9CC93Dkgj/NizBo4OxY
         xLwwhEQA3GHJkuazxWCw7rWbHjGkNtPGjFXrrpDah5PhJ/aCSqgtA8YPE1WAUZHd59Wu
         oDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VKnD6PTKNn+W7DHzdPEvLDh2KJU+Cx17QAWXrsTcGt8=;
        b=cX/e8lMJNW2Nhb771GVPReGa1an1cw7Q3/mKSWXWGE4dJO/w/lkMUZAYdJJnldiiNK
         vlUV6DREOVgJ9Z8FIfv7TkmJYPxyxT1S9m641XuJ10wrIkRp+QkqesDkBjqglKwNhFaU
         olN6n1dJAVeWnD66665pLIbZot9EAy6Vc+w3fh+W3ZJin6emGbYvtspOOjka0xQFWgjB
         W2noIU4uOaKnYoAopyNSG48lLjCxUpB5WY3sKePvbTseRPjgUXToSBzgiid6xaeTI2oc
         RarC0+Kvb5NIt4k7m2/3Ef8Wd5w+Zg7JliQNeMi8Z4I2sb2e14+3rVNqsWGPgK/b3FmD
         Am2A==
X-Gm-Message-State: AOAM5319bDCGiH5HRn1U2zihIpeLTRrr6Eh6pB8j2N8WM/oZ0ioSZimf
	YXWeOyPKYRNbaZtPANmfJ0XM1SZD24gm9g==
X-Google-Smtp-Source: ABdhPJwhIS+NH8pRWn4sBYl2MZQd4h5kZ2JJt6SaRm5d52zHDgAlErAK0MNn8JbE6oS2Pn/4pbS0lQ==
X-Received: by 2002:a63:e24a:: with SMTP id y10mr7707447pgj.413.1610905022718;
        Sun, 17 Jan 2021 09:37:02 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:02 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 22/31] tclap: align version to tag v1.2.2
Date: Sun, 17 Jan 2021 09:36:27 -0800
Message-Id: <461b240e765a14c2cfdfcca82ec45f050f476e04.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Chencheng Zhang <chencheng@wittra.se>

This is to update the tclap v1.2.2 with several bug fixes.
See:
https://sourceforge.net/p/tclap/bugs/23/

Signed-off-by: Chencheng Zhang <chencheng@wittra.se>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f03ad4971ed0b7cf34550a90ee3c0fa18f964533)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
index 46a9408031..47ab2fd7b2 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tclap.sourceforge.net/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
 
-SRCREV = "75f440bcac1276c847f5351e14216f6e91def44d"
+SRCREV = "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
 SRC_URI = "git://git.code.sf.net/p/tclap/code \
     file://Makefile.am-disable-docs.patch \
 "
-- 
2.17.1

