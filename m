Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.26899.1601867964222292649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S/SGf56p;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id q123so5883915pfb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HstfAmErUQ0oNOgYnrVc9cGRVtDLvx1tw7g8xYp3hVg=;
        b=S/SGf56pX/0SCCZH2vtv7Y5YyfCrx/cmg2p+TH0F3jEfoE9zahkspSLcxU5hHlHoIX
         hjoVCb1K1WlMLKM5+kls5UBVLEn122Ko8JG1+kEbXgFeYP4+yI/osYsMOVwEG09PG1Rd
         BpUXrNdT4rMXrt9TrVOSWwDVLz/LjUCAaHmFLXdOmW63PKElM5G6FiMcCDQYi0x9rEdI
         QK1A7RY9rlCoQ4/NyWsX0FSTadjaLOuPeNo/4WY+I9yrkMYyLpj/Xudea/K96WlhkFiR
         gIjM0jU7X5yZT0nlnBp6zbCPUD8QrBQCOjrkgbsyNQquV7xkAP/iEXk1lNMx1to1oCQ6
         vH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HstfAmErUQ0oNOgYnrVc9cGRVtDLvx1tw7g8xYp3hVg=;
        b=AIAiPSQlu9acAy3o8mU3tuK+oG6OVfk6WIiJGAB+AexUUqg1Jei1YQgXTMOs63hn03
         Md27tM75CplZtkTr1wVJF5+BeZ7p0/ZHtqr5OdfD8DIf7aEoW7polASgJxvut4Nniczk
         poYgpZJcAKMglWo2uF85+gAYO1RNDTtgUI0V2cz8BZjbjZ9vnc7c3ofEUMDikVFLT3RA
         HMZIa6v5MQeYXZxQJTEspztk+afHeuo9XduJL5WZhycwiNklvFkIB+FSnudsxQB422Bu
         S7UGIy78hYU1HbfIIHPkjfULvad5HgozJcILW+EAK7W6CJW3Q8ZbOeeOkjKKbQfhkKOc
         6HzQ==
X-Gm-Message-State: AOAM531goED3mFTD9HZ0ykydtRpNFQvzDM+J1RrS2rxsp2U1dF3LC3H8
	O9rg30Y+KhKcdPPpG5s62e59sEkT4VA=
X-Google-Smtp-Source: ABdhPJzHBf0nrK6++Hah988MAdDEg1F81ReE0PWuye880DpDNql2Ch8wFQ3GHEJp0VNeM14JJb1R+g==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id m184-20020a6226c10000b0290142250135efmr14089802pfm.79.1601867963601;
        Sun, 04 Oct 2020 20:19:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 1/9] haveged: upgrade 1.9.9 -> 1.9.13
Date: Sun,  4 Oct 2020 20:19:11 -0700
Message-Id: <4909600c4247f31cf25b381d5f155cb921c38c10.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This includes the following changes:

1.9.10:
 - fix ordering cycle with private tmp

1.9.11:
 - Fixed wrong version string in v1.9.10

1.9.12:
 - Fix a memory leak in havege_destroy

1.9.13:
 - Added support for --version
 - Updated systemd SystemCallFilter settings

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e82d252fa558ebb6fe0d07b50a4be6abe40a725)
[Bug fix only update, also fixes https://github.com/openembedded/meta-openembedded/issues/277]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb} (97%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
similarity index 97%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
index c1839b37a8..50326ea2f4 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # v1.9.9
-SRCREV = "6da706c8026b629d9bb7ebebc32239305a03da8e"
+SRCREV = "1283a65c541c4a83e152024a63faf7b267b9b1cd"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
 "
 S = "${WORKDIR}/git"
-- 
2.17.1

