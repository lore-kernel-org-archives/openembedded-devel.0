Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF11C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:54:04 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.14314.1645545243620351764
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdfcayJj;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w3so38011739edu.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EKp39yaeLavz4MK1SeH5arsiVdYKxKt0P6eUytOF+QE=;
        b=SdfcayJj0g/HP3iMZ3wQGCHFj41oL2UjqkwYq0x89gGQrfohptI5GOHpWKEZlMNI5O
         vXEBVvUYTpK+46UI2T4ERnb56Ia1y1hjWO9RT5vxeZPCjxxHiBLlOFwGSK8NKa0u+9oI
         6CO1bZwGA3QX9jRhQL006AqQZUcQh6WC1WtbNJtZORCt/F+CLs025JdhXi0otS2zP97u
         bgfPCWhaTa2pSpAmpaxcLQ9k2PE5QGigqrGWukUXxtvrQHv7+hia8x9nC6jGNrluE+4o
         XdFqHwdR5JBcigP+aB+eDK5RNwXIIYakIzT/YVjk91JmM3NrbIk21uN1PVfUICBWz79c
         GqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EKp39yaeLavz4MK1SeH5arsiVdYKxKt0P6eUytOF+QE=;
        b=BIq4FAFt1MXyKyxOnNQo4JwET83qvUq81ecavMdbR4eDp8jEoFNpVbaKZXZs1MPip5
         Oe72BUgrk/FaMcQtQCSUq48oUVb2vMRhTvmzsenCrr990w/Hg3BO1xa7n1bO4VUMSChI
         wAw3/UbzaRhRl4Nyx9oYpLl348Ag1XebR6zYWhblzaada8ZWFHQYxUdunPmAkQvtGarD
         W3wf5OKNYPCVpwr0qozucZnjdVSJs+ws0JgFVug8CmXy9GLr9yQfWYUeqEgfWl8M8jsE
         7Zi2xegiUPs75QHtCxfZD2H4yonq4PgK/dj4f/o0gedGjfM2m/xuvJv0mSHWMO+MILa2
         Gshg==
X-Gm-Message-State: AOAM530JRUOtD0TzS6bKhDo98kQsmCvLN4jKw5IN748SG3xmb8irI0KF
	UQbiDCkj18UlSctdjLLWN55sgfPPDEEOPw==
X-Google-Smtp-Source: 
 ABdhPJyprnA+odKaY2SJKeZ8pCnylyfinoFGPal1vwWeQl19CH9e6lh35FGgF4INc8F2/3wPXDaZYw==
X-Received: by 2002:a05:6402:742:b0:410:a427:3634 with SMTP id
 p2-20020a056402074200b00410a4273634mr27247651edy.304.1645545242269;
        Tue, 22 Feb 2022 07:54:02 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 k16sm3852931ejv.176.2022.02.22.07.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:54:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 3/3] layer.conf: update LAYERSERIES_COMPAT for
 kirkstone
Date: Tue, 22 Feb 2022 16:53:49 +0100
Message-Id: <20220222155349.2206837-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222155349.2206837-1-Martin.Jansa@gmail.com>
References: <20220222155349.2206837-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 15:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95447

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index c91335d..38ef579 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 = "1"
 
 LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python2 = "honister"
+LAYERSERIES_COMPAT_meta-python2 = "kirkstone"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.35.1


