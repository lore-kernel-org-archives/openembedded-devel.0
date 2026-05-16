Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489A8CD4F3C
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 14:10:09 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6378.1778940608357475371
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2026 07:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20251104.gappssmtp.com header.s=20251104 header.b=dfbO7/3u;
 spf=neutral (domain: theyoctojester.info, ip: 74.125.82.172, mailfrom: jester@theyoctojester.info)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ee990e8597so2468679eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2026 07:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778940607; cv=none;
        d=google.com; s=arc-20240605;
        b=icA32GzglLC5CiqvF9WX1EPuq+2VuQLTasLvomWhuEeYU1GARSbrzx9HLN6vzVZS4K
         PsFV1UsDyjCTlpAYse3Ot3odWNScvgtv9jYQURvc1yYfSXPhUM3Xcl8/GNzBUyA1lK+v
         KLymRfCC8eUxgujNYQlG7pgsG+CFcv4xKWq5Ln/aQ9wl2R/4KypR5V9scLxlAgkb7/oR
         kFxn4CSwGQ6wMkobsWhSEpnBRY47fs7GGVrm4iQyqAnEKLa0ZRsT7yVGEK807at68bLM
         fs0/yqwIFmkHg5DCoarQLqzjP2pnT+Sgg29b1cvTYxReEhC8ogJxB291BNH4/Facf/Yb
         7lUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5+s8oihaKCLTDTIvXkzPyJagDHzLkRvXz07iqTAk68M=;
        fh=Vo0wlyPvnipkyiqChzSbjUuER4FKcYGIB7Ny2WHFyV4=;
        b=AZmuHoWkxqa3Ax+uOf3isDUEmTMJu3EfBTmcYs7fYzycvseP+8LbIzLZUHpJILvFOo
         uvblmdgzpo4CPqc35xXStrIvtFek7bpLRCbFQ6bRb3pU272xIeOOMQvAXNyxFfy9DKEI
         3iLOvTkGbvwecxHGg9s/zOkLm2DX5HeQ3TRI0qVGf8dzmYUxkCGBqPzfs7k7hcNjPIBT
         a8H3XYhKQ7AA7X3uP8f3UaOGT9Gk016ovARL4TBY3lzqUeEiJHujZ8d6k9acUd87/F3k
         5MNIagoUJ0+F4RYj7uSQ2abA9FIlcmMkortzpcPNvRpK5Z063NCc5/qacg3455c0YjQC
         l4Wg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20251104.gappssmtp.com; s=20251104; t=1778940607; x=1779545407; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5+s8oihaKCLTDTIvXkzPyJagDHzLkRvXz07iqTAk68M=;
        b=dfbO7/3uZr9TathuNx+bkRAOKOdyCVyFnlUA10R8gF1rhrltF+qlnIX07i7I693UZo
         2GH3yQ7w0liPPRcV1diRQXhLdF5ZcNQq2rP6Kvao6pS14HObF7qpMGTdtqCbM0hszL7o
         64231DK2GJKoWf26vi2vS+7LEsCjww43aXRqLkArjlRMsYDIEcAC0XuAFD87udv75+v0
         0GcggihUcRME983WxwrfhV2GsGM6qt2u675hnnv8oW7qjMSbp7K2f5oHhzPglaeJqqpE
         MhP2JEnJeI9zHFoyBXMorkzkij4EhhxWSc9hq0q2E5+FylOPXT3JWSdYlEP5v1J4l35O
         EzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778940607; x=1779545407;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+s8oihaKCLTDTIvXkzPyJagDHzLkRvXz07iqTAk68M=;
        b=n7cUINc8sAJWYGJxKYtbmzNlqGRemsT7CmcF2oU2fubIfB3PDhqdhcgAUTUuTWRc0I
         XkMBA2K2gjfMmwtUUQyrVUFDqzDaVcnrkGraaIZfKtNXhBUFlp1avikXRkuns40+ax47
         Mr76vCW9wGfJYATK6Kwz/1e02D5+l6m51x4/yGYv+OeaJcYksYeejx1eOVca+kinAUt9
         LAY6rWoQcDis1PsfjeTFqF5NzE1R5HYArBM664Bw66P+kPgQhoHU3wOYeLjLj/2WnlOr
         6BqbSBFTWy/Yuq24EQtw8iOoHp9sVKPqRUTsXKsqjdpmaKQqlQPN8R6WdMaKCeNiEHcU
         9PDg==
X-Forwarded-Encrypted: i=1; AFNElJ9fWozoZXnh6tHtUkMUX6BA7rsmQbYLW06N6hVHEerwW4Hk7S3uNtINqB8d62Cj3I7Hm+FMQ971tbkWmQpGaQ9G48k=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yye2IjtuV4D9OqoZBUqZwSUD/FtwH9dFsiw8Rh9HxAKjr3l3WVh
	SMrF7fdBgnaFZBDCsaYyXujX1GnJtl0K3/z/gHOVgpJZahNwHTOFPMn+zhJ0a0AOkcBiZgO8TLP
	srwZGQtv0fMvcyWOpNxip66VOIvLC/ds0zTrN1/+oiw==
X-Gm-Gg: Acq92OEy63ohCc/3w/U5joBlytBMMLwMJZGDnIJbj7VmZ4N1YbtTNeh3oufHjMsxkX+
	TYcd6TXaxz6jk+ZN3BgAqIeqQ2xQBTyTOPpXL3lcUbEQg2nphk/b5/jkG6KG3UvtZ0IrXmy61PC
	DJ0M6nlbZzPLLDRlMJl8EyLCEmY8MpQhnqgDuyBQ8OHfoF+XGsgFEKYdA4X1P13BteaybiZXARH
	bHRlxhVtikdcbRXvGVTnG6D8xJioSLRfOFZYAgi6CUa9TKov6DE6Gns9gplsmq9sICplzDfXfud
	sEog77GVuDNszv2uQKlj21KLn9Hbe06ypSfNx4BnXg==
X-Received: by 2002:a05:7300:a504:b0:2e5:8ec2:82c9 with SMTP id
 5a478bee46e88-303986a15f3mr4079539eec.26.1778940607396; Sat, 16 May 2026
 07:10:07 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Sat, 16 May 2026 16:09:40 +0200
X-Gm-Features: AVHnY4JOpMmOgJsnu88i-cow1E7fbcDMqOl05RBy-BoPq3EmO47iETOEwk9UNTc
Message-ID: <CAEt6NwroHb9KvVr3kO9VCL+bsSQsu16DE14JOS2vQwZsdZ4Zfg@mail.gmail.com>
Subject: OSS/ELC-NA meetup
To: openembedded-members@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2026 14:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127011

Yo ho!

We know that planning ahead is important! So if you plan to be at
OSS/ELC NA next week, how about also planning to meet your fellow
OpenEmbeddeders?

Coordination is starting at
https://discussion.openembedded.org/t/developer-meet-up-2026-elc-na/116,
thanks Colin Pinnell McAllister

Greetz,
Josef

