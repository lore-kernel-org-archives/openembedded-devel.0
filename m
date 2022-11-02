Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B959C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 10:00:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.4245.1667383210297073516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 03:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aheiaxwC;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id b2so27367271lfp.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b86V8pgupBmf2W1PvYbP3R5cPqD4S1d9ll4REgate9c=;
        b=aheiaxwCU3pWmf+pcq37aHJ8q/BwBXqvjLsWz9/OyHyuPFOIYO36MvuGxm2jds5nYT
         7jojqT6IOoyHb8+FoY3fFi22sPv7VR71kSsm+c7N0rbBDe7/gy0nHSEDOIZtqL+ld+g1
         /5u35p8HOt2pD20Aa2yx6Zuu/xAgekTqBk6tvHRROZSyJ8RBEBMpBWBfjqKYauL/gIsI
         kBhQoUaJYUU7Hbi4lAM2aWzVPIkRoTq/zMed16RM5jN4uOG2K5jfhtKuiYfNnA8jLKL9
         8xzul1cOQZSvEMDbpJyYZVGYRS+8i/AHVFcC+oesm9A03ITOh9zELj3X2YxDmKLgF2FL
         8SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b86V8pgupBmf2W1PvYbP3R5cPqD4S1d9ll4REgate9c=;
        b=E0YfQ7qDlpkPGxMc7BLcxzXPblfCZgJTt3Wbp+I+9QjahMbmqKIi5pNyVms4GU4v3E
         VC7YKs794Ln0pZ7yxInaOZ3zTelL1DsdIUIp9Y1/Etjv3Cd5pBWJnvTBLWJqwEH+bnJi
         lBpW5Y+Z/EHsx6FNJgjFkhIC9zrIHqK5unp+02KLqi80w4Bo8b86E4z3BNJ5ja1+oMMg
         o84Vhr+pXXr4E1PsfEvunt7bSASl4wkRzjAt23GLvepJDHUBF0sZBW+jC2CZZGiPU4a9
         Vr3/+cw/n5eyTvSv2uJblJjv+oLjol0ZTHIunsVGap8c8snQpd431uNjixBesIyEbNhg
         uVsg==
X-Gm-Message-State: ACrzQf1x05+aRpk0MQ+0zcg4SnLaMFsGp52Cz2NXzezhXPM4+vbjXU3/
	mbQaPZEDjAQL1h6HXJ3pKeklqKyceL282A==
X-Google-Smtp-Source: AMsMyM49UfpEBGqBvKP7EcIRlNdv9uiTm70kmuEddniPuX3gkkCAISivwRjYIoYMcpN5U0cOJQSeGA==
X-Received: by 2002:a05:6512:b0a:b0:4ad:36f:f39 with SMTP id w10-20020a0565120b0a00b004ad036f0f39mr9248223lfu.164.1667383208438;
        Wed, 02 Nov 2022 03:00:08 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512305000b004a054efd0cdsm1954717lfb.36.2022.11.02.03.00.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 03:00:08 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:00:06 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v3] fwupd: fix
 ${datadir}/polkit-1/rules.d permissions
Message-ID: <Y2I/plrTBY3npaN9@nuoska>
References: <1723BC06A8F8A78E.15522@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1723BC06A8F8A78E.15522@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 10:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99418

Hi,

This is for master, langdale and kirkstone branches. I'll fix the
subject prefix if I need to send another version.

Cheers,

-Mikko

