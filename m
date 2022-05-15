Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E388C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:50:00 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16871.1652622593540171941
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D1Cem88e;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id g184so11790848pgc.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AtxfOHqBq0/+Ge8tA50maxDo/hmSHsFzssRDEPkDNGo=;
        b=D1Cem88esXABZ9ydpSX1NHbPEdRHw9Z7mtAVp589VctEQrXDl+6GWTLV4/h0EN97it
         erUTZJV3vHUXsytg1K3ias2y4hg4ZoyTOWYuzYztJDsWU5mbDeah0+ICkNqmCo4kDmbt
         ngNms2kVNU9LMix8EyX7cL2TUg+2pKRWIhZ60c1ck6zyn/tXkqbupV3lduP7CVQv5TWd
         AosTx72oYnzBIopHmZFao5eiNYOW8z/Jez3KRfz54hT+FQqa3uE82fd6EXqCH4g4+3dK
         jCdaxREO22Wkf4BZNxOTpxDoL9t5LBMbwGLFDrCDRPLSxAv+VjcUOZ1kdVwtLg6YAYDW
         /hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AtxfOHqBq0/+Ge8tA50maxDo/hmSHsFzssRDEPkDNGo=;
        b=7IU/vMH00/SdkK5ZWPAvDFDebKjGlRR04Se9ln1B1DWpa6C8oPG6UYTm7zlJadd4jT
         36pevrcgCjLP16IbXXMupA0EUNRmykolLmD0A4tKeipKyf3ZVSOQTuUxPynDJ5Cx0ESa
         u6wvJY7QmRoR7EreNcu39z8Tk0hkW9MWjtFAqEouQ//15/vYAZ8042h8pCUca7qKM/XX
         va32jeg7Bfqhggid4fn50/7Waz6eyne5zDYgYBVTIiX+3yzBK3kHbqO9HDUTzcLMluTT
         oQEjI2xEw3Jz6lr6YkSd+wv39L0iIXU8iw92/m7i1/Z9BICzrniIsD40ZP9JSjCMXVWm
         hqLQ==
X-Gm-Message-State: AOAM530oVisDmN5kloAxEK8Pkn7jxFjukB4VtD6vxTPvW6Mq/URdXxTR
	YkXn6rhHJP0ty1whVV4tb1J8KiF+VsL/tQ==
X-Google-Smtp-Source: 
 ABdhPJysWy4K/zc3Z2b23GptmQM63lXVHG9Oe9MuK1L3pnW9XQHMpegs6G5iaQOz/SFBLmpeL7n0rQ==
X-Received: by 2002:a63:1c61:0:b0:3d8:204b:9fa8 with SMTP id
 c33-20020a631c61000000b003d8204b9fa8mr12018255pgm.589.1652622592816;
        Sun, 15 May 2022 06:49:52 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 20/22] devmem2: update SRC_URI according to redirect
Date: Sun, 15 May 2022 06:49:20 -0700
Message-Id: 
 <f1c04fd87fce279c50b185edb49982de2be4d36d.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97117

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

http://www.free-electrons.com now redirects to https://bootlin.com

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1c3465b4d79400e5a197328ec36a755b7b558aa9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index ba7aad8ab9..70d4135216 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
+SRC_URI = "https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
            file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
            file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
-- 
2.25.1


