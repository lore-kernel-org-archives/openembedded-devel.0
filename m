Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386F0C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 13:49:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.31616.1698932977068205000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 06:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Drzjj/RJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso540694f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698932975; x=1699537775; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YNXLJhHR6yIc0XDD+PVlpiHTcS3s6YgEckF3tJngbls=;
        b=Drzjj/RJC/pf7iegzLo3iVjC8Q+1KWqVwC6ZfFTNPMwq4GJ8zu5cxUZIATZl6QzEXG
         FyPiGCXwgeZNBaO072mQpJDc+zhk+HBtBAtSjr0ProF+4l5qN0MWNxPw6XS5FEo0cgAG
         bNm7rKIigGCxBVOA+9/sPc49zPzhj44auYmKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932975; x=1699537775;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNXLJhHR6yIc0XDD+PVlpiHTcS3s6YgEckF3tJngbls=;
        b=LoXGuax3/SU2/rETUbSOKv00wfn3J5bh9UJxPzMf2yZWUMnE+p+cauFeq4vwgHcW/k
         mSPGc+gz3IDcGg7IOWiw/LF3dOmyy11d5A/xp65L2kiDtQNjpcfBDJmwuUKwI7o5k++J
         iSS/1AR1DH4haaU4qBIIu7h24buOPFIYUFr/7xL4BEC3S51jBfbP3efB4Li/UHLAvUf7
         1X5VqH3vRmHU9FbEtqtSsGXlmAReVjG8zZ4Ymgkg8FguY7OU6M7ucskb5e823qnYWosd
         uorHPIwoQFsLhR4SJr4txJXT0jvhY5EjHQ2EbkZqAwyS1wSduHZ6mwv/DJAJPp8oA8+h
         HE4w==
X-Gm-Message-State: AOJu0YxprhC6Cj5xgA/QnzGDcAatTdUMvjjX1P8kr32c89ZlKQjt02eZ
	niS3t3ectBTbMrplKXDWazqyFA==
X-Google-Smtp-Source: AGHT+IFj3a9j8N1GeU4THWOKCWKSc3a+b323vwOquYO2jXn7GtJk3UluLm2HkoD3HIOf9j5UquHzkg==
X-Received: by 2002:a05:6000:154a:b0:32f:7ae7:da49 with SMTP id 10-20020a056000154a00b0032f7ae7da49mr14421542wry.51.1698932975424;
        Thu, 02 Nov 2023 06:49:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c187:f0:bd0d:8811? ([2001:8b0:aba:5f3c:c187:f0:bd0d:8811])
        by smtp.gmail.com with ESMTPSA id m11-20020adffa0b000000b00323293bd023sm2538811wrr.6.2023.11.02.06.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 06:49:35 -0700 (PDT)
Message-ID: <9353bb8c5660859357ba062c7d5924051d249b83.camel@linuxfoundation.org>
Subject: meta-openembedded CVEs, patch stats and AUH
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel
 <openembedded-devel@lists.openembedded.org>, Armin Kuster
 <akuster808@gmail.com>,  Marta Rybczynska <marta.rybczynska@syslinbit.com>,
 Ross Burton <ross.burton@arm.com>, Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 02 Nov 2023 13:49:34 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 13:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105837

Patch Metrics and CVEs
----------------------

I'm now pleased to say we have CVE and patch metrics being generated
(Thanks Yoann and Ross):

https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/

which for example generates this:

https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-statu=
s-master.txt

(268 CVEs)

This doesn't work for the LTS branches since the layer override being
used to generate it on master won't work for kirkstone/dunfell.

Those reports are generated live onto the site daily but aren't emailed
anywhere at this time.


Mirroring
---------

I covered mirroring for meta-oe layers here:

https://lists.openembedded.org/g/openembedded-devel/message/105754

Basically it works but we need to decide whether we can fix the
warnings to keep this enabled for dunfell/kirkstone.


Reproducibility
---------------

We can now test reproducibility for meta-oe on the autobuilder:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155

In order to make this useful we really need a list of known issues so
that we can then exclude them and start showing regressions.


AUH
---

This is now working and generating updates. It takes a while to run and
generates a lot of emails.

https://autobuilder.yoctoproject.org/typhoon/#/builders/159/builds/8
(18 hours so far)

meta-oe summary:
https://lists.yoctoproject.org/g/test-list/message/425
TOTAL: attempted=3D206 succeeded=3D42(20.39%) failed=3D164(79.61%)

meta-python summary:
https://lists.yoctoproject.org/g/test-list/message/426
TOTAL: attempted=3D92 succeeded=3D50(54.35%) failed=3D42(45.65%)

meta-perl summary:
https://lists.yoctoproject.org/g/test-list/message/434
TOTAL: attempted=3D7 succeeded=3D5(71.43%) failed=3D2(28.57%)

meta-networking summary:
https://lists.yoctoproject.org/g/test-list/message/767
TOTAL: attempted=3D43 succeeded=3D8(18.60%) failed=3D35(81.40%)

so around ~350 emails of which ~105 were successful upgrades. I'm not
sure whether we want to enable that to send to openembedded-devel?
There are lot of failures and there are a lot of recipes where the
upstream status couldn't be checked. Is anyone interested in working on
improving things in either of those areas?

There are also various backend improvements we'd love to make to the
AUH code now we've seen how it works in practise in this role.


Summary
-------

All things considered, this shows what our tooling is capable of and
we've a good baseline. Whether/how we enable/use this going forward
depends a lot on whether people are willing to step up and help
maintain/process the results. It can't/won't be Khem/I trying to make
and keep it all working so this is where we need help from the wider
community.


