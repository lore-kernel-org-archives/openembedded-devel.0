Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D2FC6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:13:15 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.4719.1663834386201245160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fNbCzeiu;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id x27so13480198lfu.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=otnBxYiHyCSflOvg4yhb9o+AnufGQms9Dr+v00jQeZM=;
        b=fNbCzeiuGnHSBvyj3FlDiiH1lVJ7+DtfgNezfvgJ6MqLHg2Ej/o3wA8XP6hyRwbzT9
         wDErYx1obiiXJGWn7AVwvLoanXv1xvMhNmBS5yuvfmD0OF33TExCfjhai0sFk5YPiySW
         RrDf1u4SYuqnXa0aiW+rVxJCAdcTBadYMCWxmOXGEUHbJ1IDLO4h8mn9A7ZCls2IQN0G
         rYy1WOcKYm/9o9BnXMFB5n5NEKhw2jaaHJJz9TbVEFnWXEw0FHRyzzbJ+ainsJUKjRss
         Z1f3kikRPisA2RnXi41FrdeB+klARSfEPHX1h4YzcP8zX3TDeIeZRTEWoiRCr1hvPuYn
         DUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=otnBxYiHyCSflOvg4yhb9o+AnufGQms9Dr+v00jQeZM=;
        b=eWSqbSVDWBZhZ2U29Vlb5MfZMktFaP5LkH1lOH0uMhUCv79nS80QwAQGVOXZPL2jBn
         XnIWoCNk6hpje0470zKTMzksk9gLcYquj3I1DTUwhGvUle5QS5Dp/RTp2g+WSlu3dfE8
         OQo3PLVVkuI20R4qCYon9BMO8KtK9iC+eOeayvUrf4fS75PkZkqhoqRlx/vw9WCQ7Loe
         dxe+i12aFrEk80h4ShkrtmzLcC/V3TvA4TbUAL/NI8+w+6jAx6oP2dXGhkhl0WvUHf0Y
         OBlRyaaXg0UHGnwuqbX1MK7xqVgQWdPemPtKKtNtsGtpwNslBlqYTesyli8BHp03aW/n
         C/2A==
X-Gm-Message-State: ACrzQf34FHWKl0GmF/59AO27JRIyTU9MXmeNHuK6J+hTf76yUBNWaUJN
	hvetqxJtIIZnNGC74/zdJtsQBzxbUCQ=
X-Google-Smtp-Source: 
 AMsMyM4jYN1h9IESVMNIaO1NzX97F+L8IopKtm5Q3kkIAd6JpXDHDhbdu6jmNjYU2EOKLIJzSIwSGw==
X-Received: by 2002:a05:6512:2207:b0:496:db23:c2a3 with SMTP id
 h7-20020a056512220700b00496db23c2a3mr726176lfu.447.1663834384149;
        Thu, 22 Sep 2022 01:13:04 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:1a0d:35fd:99c8:8f16:a655])
        by smtp.gmail.com with ESMTPSA id
 d3-20020ac24c83000000b0049aa20af00fsm822371lfl.21.2022.09.22.01.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:13:03 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [kirkstone] [PATCH 1/1] lmdb: Don't inherit base
Date: Thu, 22 Sep 2022 10:12:55 +0200
Message-Id: <20220922081255.14964-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922081255.14964-1-liu.ming50@gmail.com>
References: <20220922081255.14964-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 08:13:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98922

From: Richard Purdie <richard.purdie@linuxfoundation.org>

base is always inherited so remove this code which will soon cause an error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a755af4fb5ca2e158b00214bb18e27ba69c200fd)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index f23960f40..a76d388d7 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
 
 SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
 
-inherit base ptest
+inherit ptest
 
 S = "${WORKDIR}/git/libraries/liblmdb"
 
-- 
2.25.1


