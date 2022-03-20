Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748F5C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.16396.1647763710196973502
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WTHx1/4c;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id p8so13032854pfh.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jWwZ4ghkRdRM4mq5Wo7BSEiXVXtAlqZdP/wmbyYTeeY=;
        b=WTHx1/4cFJpsZSoTwNoM2oN/smOcfwNQa1735kQ5R26/mv7neZO9LAMfU5PzxTH++U
         J8cnLbsiWKlgAyoRYr2pAR/fIfArS0yJYrSe70yDRdWn6wKdPg0GOr4RiFdquVHK51zI
         5CLuv0cZVEs++GjOjPJJPLDygB/rfbDffrBvTMtqBaFEzUeodxDs8FTj39zRux88vcj4
         cWDPgd4zWBSUm3/PQQwVc677NhD86T6/MkJEDN3ABgWwAhUEVmGuRFJlMMpDolmNqPfH
         avjtlpb2K52NykpQ8dXAFQE+ONBtuiEL0oFf3xOPNXk4lXH9T+sTZrvLzovzgiW9U/65
         TfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWwZ4ghkRdRM4mq5Wo7BSEiXVXtAlqZdP/wmbyYTeeY=;
        b=k9LTGHvwLZzu7yAmhUN9AFOVHX7wWmX+Qcy6hHQ9C8MPf0i0csMblO6O0x1dDRcc8w
         HurQtS7KI+FF/zmVfW0uOIdyXimVNKe+x97QzFy3LItLu/JZl9zFLfV/uEIqWi7NXF7y
         xCTeWmc86o0ZHJu6E2dgkQqZreVX5dRrJDc9QS1fs1MFF86YzwHcMzY6sca/IbE7PHU2
         uviq4M2CQd2oYgB5OWNSbJ7EU83MA50yUGlEf11tdGVBdJ4lUa/Iq6iztz3ox5rskOSc
         hV6KJu94gHLWXEixhV+7EkrRPpcFwLsf2NPzxgea4ue0LF9L9DtEDolBUv3Xc+Yw+FpE
         ZzwA==
X-Gm-Message-State: AOAM530fY0diNwfyvuqZZKSQXch7vI/C0QVZvPVUF2fsU+DhDtkoMHQz
	gXqHY/scOiyYZ2bFRxF7B/OFaW+K/WNl6Q==
X-Google-Smtp-Source: 
 ABdhPJy8NFmtcrlX6gJCmxhRkZR2666eZSr6+3FdfOIjSuE5M1d/eN5343vX9s3HceYqARnNJ1lBFA==
X-Received: by 2002:a05:6a00:2484:b0:4fa:997e:3290 with SMTP id
 c4-20020a056a00248400b004fa997e3290mr685141pfv.37.1647763709420;
        Sun, 20 Mar 2022 01:08:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/17] luaposix: Fix INST_LIBDIR to honor libdir var
Date: Sun, 20 Mar 2022 01:08:14 -0700
Message-Id: <20220320080815.825928-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96080

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
index f6578ca093..a71bbebf70 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
@@ -20,7 +20,7 @@ do_compile() {
 }
 
 do_install() {
-    ${S}/build-aux/luke PREFIX=${D}${prefix} install
+    ${S}/build-aux/luke PREFIX=${D}${prefix} INST_LIBDIR=${D}${libdir}/lua/${LUA_VERSION} install
 }
 
 FILES:${PN} = "${datadir}/lua/${LUA_VERSION} \
-- 
2.35.1


