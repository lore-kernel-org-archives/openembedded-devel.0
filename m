Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4532C38A2D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 07:26:17 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.3892.1666855568167742197
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 00:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eMhbDWud;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id a67so1199488edf.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ1kqrMWgoAC7P7T8hXMjXCLTvkouft0aNRGtB/5n1w=;
        b=eMhbDWud2e37/0iztAvgQvBNdZi2gJW/9Nk3P9it3kQtZsbiZualbwCGrz5wiPlYnP
         A9BewmJ+ODw1066lUCAtpM15mu8Dp13uOcF5Cn1u3cjUrz47q0A928qRUjyUIcvRP4Em
         w0xOJoNtEkJUBofp1D0bA2soY1bvFHUWis/UBgAphn8L0SVcnS+noztZLaumxfljHG2r
         KrQgqNXqIavAgHUyjy6ATDUf1uyyEQIELu+WPpo3Hco/mchxXKZ/bmPnx+hvQBJEoIza
         L9xxjdxiAGH0ZutKxEpcA71f3qCcSLYf4uVBgsA+QIFOYx2TgXFgXX5QdrWa5wfwEtIh
         MqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ1kqrMWgoAC7P7T8hXMjXCLTvkouft0aNRGtB/5n1w=;
        b=w9e4SuKa+jLUlzNKYs71VoRR84z7rf8NSHk0V08bUHyXsPRRjoRwgN+Z/oTiEmFrZJ
         6JrX8HeC/+Sk7rKlIoBjaFB9ciQHbMKfCqaiPk1QEKken6ZONaGdnnyK4G64BSK9oWFH
         arDBiVcNj45/1rCUcOYo98lHrCLCFNpH5WWDhoCt2VMii5zNKtyhDnCZ8STQdafGJ7Co
         GbsGrIQaCOGx+IlEo2ePmqj1xSI/iw37LusMmrk6IFchyoRZQ3jEfGefX+AHPBCrheIJ
         YqrNyTg5O6AUCDwO7m/JXPVMasSy2FdOsgVTqiI4lZhIcG6DaoN4oR9vWs8fTjUOedWe
         /uvA==
X-Gm-Message-State: ACrzQf3WvGxG8E0RDeBmgpx0wYF7/g7I4n5M8ZL8DTnJnSBf0oZqwDiw
	CLtVfLYUL4XRr324dXZ7ol3QKvqDQyI=
X-Google-Smtp-Source: AMsMyM7PG+UQoj3f9tJKTiPEs2yKRv1K3jQcK6eh+0zaLYeWHl/i0udEX1VhCWfs4cSnYW0yXRGkKg==
X-Received: by 2002:a50:871a:0:b0:461:52a9:1da6 with SMTP id i26-20020a50871a000000b0046152a91da6mr28448857edb.94.1666855566299;
        Thu, 27 Oct 2022 00:26:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906561600b0078d9c2c8250sm356238ejq.84.2022.10.27.00.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 00:26:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] python3-wxgtk4: skip the recipe
Date: Thu, 27 Oct 2022 09:25:48 +0200
Message-Id: <20221027072549.3525217-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027072549.3525217-1-alex@linutronix.de>
References: <20221027072549.3525217-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 07:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99316

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
index 4d739b86f..842c57646 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
@@ -33,3 +33,5 @@ RDEPENDS:${PN} = "\
     python3-six \
     python3-xml \
 "
+
+SKIP_RECIPE[python3-wxgtk4] ?= "Not compatible with py3.11; needs version update for both itself and wxwidgets"
-- 
2.30.2


