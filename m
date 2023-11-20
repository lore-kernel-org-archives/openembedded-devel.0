Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E97C5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.43626.1700452291604889602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UF7wIuOO;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b6d88dbaa3so2703989b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452291; x=1701057091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4R2QomP56WjZrU1t30jH6UfZ+MztlnsYBVMp59MtcQ=;
        b=UF7wIuOOBDdIrmSyMIFLgZ0A6N0KPSf5jPvtf9HCnyDyoXEXmV2/v4VCDbhDUXopef
         nSqTdiAa8H9MpRjx7bKAOhJH2UiLfaY0WslSyaPWxA6KWgV8gWAsnz0kPOaXyp1G6BnK
         BpgzUIaT0cV4PEom4FC+xQBCUVan7uRMwgatUkqpIOg/mjt3Q7t50F2S7khI2iSF3rfB
         /PI4djhhDKmjpVCj/MLVpARx7mh3NAo0EOLFHgPzLrB87VO5ufs3hfWibqSrJErA4usU
         LPFzUq97P5XQbLsEJDbRW3jkdPwfOEDBHszim98mJ5SUsS1Hpc/iEXzzWHFKQI/PkJvP
         aE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452291; x=1701057091;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4R2QomP56WjZrU1t30jH6UfZ+MztlnsYBVMp59MtcQ=;
        b=fw5u4YP1gnBLVyS6HijjX+LhTYG79QmwUoo7uruJZjIAXSyGYx5pcrQXpb+iUvMixF
         eDlWGVcV3Go2dNwzFuLFMTjHuHRvXQEkzGk9Ri8DyV19D+sISVnkpeDjsrcjqxxnLyDO
         whN/8Ys2RlE4A13+4XhL1raEWgA74JejsyfOGoZvrFumxAaJ+42SKqYd5q5tGtEV2KoS
         C3kSDVzEvDQ7ogxTQkuUDmwWcv9IsnJcC+l3Usg0DQMYKcm0MKsI7jhWFfHqcQXqHCO/
         6niuHPos0c0ohVZFiykZP0MwAZki1N5uwpSzb2TvD0XTegLNjgYV1SfGYMDDAuGGupl1
         9wCA==
X-Gm-Message-State: AOJu0YyOaX307VMVnpk2c0wGQyJ+Sj4VMe4NS3Ak38pvtjVzjjdnEiiy
	URUwGy/xg0ZcpUUvUoq/D1UiW7gOA25sqQ==
X-Google-Smtp-Source: AGHT+IGHZY/KzDI4uCEglVvbSKfy5PCHGMCClQGinHq1bmkcjQpK0pRwMPG+OGOOgau96TNVbtMtJg==
X-Received: by 2002:a05:6808:10d0:b0:3b2:ef9e:45af with SMTP id s16-20020a05680810d000b003b2ef9e45afmr9630397ois.13.1700452290817;
        Sun, 19 Nov 2023 19:51:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116185230.1445287-1-alperyasinak1@gmail.com>
References: <20231116185230.1445287-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] gst-editing-services: upgrade 1.20.5 ->
 1.22.7
Message-Id: <170045229001.1416826.12183489528857826205.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106946


On Thu, 16 Nov 2023 21:52:30 +0300, alperak wrote:
> 


Applied, thanks!

[1/1] gst-editing-services: upgrade 1.20.5 -> 1.22.7
      commit: 9bbf970c6acb9b71e1438616d82ac42cac3bb64b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


