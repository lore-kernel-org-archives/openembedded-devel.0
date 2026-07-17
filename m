Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2F3C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:45:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8080.1784270740481478353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bY4uBEEP;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: lianux.mm@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad4170e8eso95986295ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270740; x=1784875540; darn=lists.openembedded.org;
        h=cc:references:in-reply-to:date:subject:to:content-transfer-encoding
         :mime-version:content-type:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crbvNmaAkyCQak/FtqzFVkkBidSFXrir8yNqrpWM7k0=;
        b=bY4uBEEPcq8NzQw9EYOqSnXuKEcgWRhttFdrRDzDdkeSw+RDfGRSAjSqlaWDLd/ZGs
         Vg/GjOL0WAS4nEufb7K08S9AKFU9Xzg8arI+QqLHgMvgD8xj4V7QRFr/EwKaQUZzs4ra
         nT5Hy93UHGRQXvfuSnUR2+eU3X0CV6/2BOGxWKPjZ8Y45UE/lNQ6+obUQs9aDDQfMMAk
         JRAtTfSCcLOMgrYlKXcY7UnoWIB2PAn5ufOXCYzUogX31L/cOXQY134dR2hGTU+dtTUz
         rumB+L3o3eD+ht6tue5ud+SGH/BUA3AqpoIyUnqdKsdv3xa6lfSWOXKD4+WylmYjSIF8
         WaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270740; x=1784875540;
        h=cc:references:in-reply-to:date:subject:to:content-transfer-encoding
         :mime-version:content-type:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crbvNmaAkyCQak/FtqzFVkkBidSFXrir8yNqrpWM7k0=;
        b=Hrl8Y+sbUXJoEUFfljvKT07XYsty4VUY1kHyyMJPb/g59kkFOP5GtT0nWsIELKvUdm
         HpV8mybHEJEcC8mewG3mw3l5IefNK7gle8l2J+v/CnqUkTBVcYYA+UOHOP1iSjcY8kxq
         uKdjh7c6A6+wxJges3SS8ikFLFitp/Y0FlaX9fBmaftbFgtR9LmnOrfQIgAxlMYo1wxO
         5YIdOtn31ybyGtaPS5+6GTJqVuM38L6bmcik23b/PjXdQdx5YUjwBbSf1QZvU/dvjoPE
         sI9zuvTC6rcVhwtkoH10loGXhVo6WpyGatDwg8E2zrJuGHCI5zRohssgF7yXRX17xdK2
         b5bw==
X-Gm-Message-State: AOJu0YyMnCJ7Rm2kKGJz5gkaakYg8eHA79XEFCsitCrmyut7TYaOyeTs
	Z+j0uOoDS7f6vDCsAP4o9Xu1svBLxstJqFgH/AD9aGQq+JvNpmlYzItR6rDvV9xE+wk=
X-Gm-Gg: AfdE7cl6edfe1NgOH9JH/7BbbPA6qJp+aBiplNvZyk64Mmxegwye3IttrWbRaKUv1r7
	7qejqbAVzvrSH7ylSSWxx7LKgjHsTMrlzUCiSiFbll4wR0Cn7dnlRgzRif2Kf6Lx5H7AgEyaeSP
	Yz/XwZbLuSXp4yk7jLX0Mna66jxnrHyih1fxe6U5vD9AnsG9P04APo55jQUhbMuDu1ErkwCU8nv
	/FbcBGQ6s6Z1pOkUqHHTwu8KAXRYEyzzvPkal2oCp/q2+5fScMsluo2PH6XGSUpyF/XrFQhtmMy
	fBxqBGS+e+oeYQybrDRAZAdv2RD2Pb17kXHO7Ttxm8hQnsShq8oZjvQY5yUmGV/Dmh6ac6LbX4k
	G1uirzgoG90uRZHQWfxQ/wZMKiRD98ylHsS4UXeiy8dJ3yzzVZ5Sh6E+YPKR/4mI0V18LI6RCza
	iHDO5rCxLvvKc=
X-Received: by 2002:a17:903:234c:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cf3494894emr14542675ad.25.1784270739810;
        Thu, 16 Jul 2026 23:45:39 -0700 (PDT)
Received: from lianux-2.local ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1348sm5180615ad.18.2026.07.16.23.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:45:39 -0700 (PDT)
Message-ID: <6a59cf93.4e95adb8.1c8022.48c0@mx.google.com>
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 1/2] wolfssl: upgrade 5.7.2 -> 5.9.2
Date: Fri, 17 Jul 2026 14:45:34 +0800
In-Reply-To: 
References: 
Cc: raj.khem@gmail.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 06:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128247

Hi Khem,

Thank you for the review.

I've checked the master branch and found:
- opensc (2/2) is already at 0.27.1 on master - no upgrade needed
- tcpdump is already at 4.99.6 on master - no upgrade needed
- wolfssl needed 5.9.1 -> 5.9.2, I've sent a v2 rebased on master

Thanks for the guidance on the branch policy. I'll target master for
version upgrades going forward.

Thanks,
Lian

