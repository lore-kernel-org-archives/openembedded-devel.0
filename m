Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599FFC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:28:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.4991.1641292113598407763
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jan 2022 02:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=1Ti3rqe3;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id t26so75163941wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jan 2022 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kjyglB02PnlMMV/KWmWkyJDMKMMtZMktsmIkTMoDKY=;
        b=1Ti3rqe3vesXyLbus29gP6mseQA+b2qqMqL01RFECuYDTLvLg2DFjiaM7Zo1H0BzkE
         EvSPeXnHqSqIyuymRsu8OXNKkrzG2HbyvZcCHDAXLWwORw/ulTSOgFNLoW/+/M8iq0iw
         u83TkSHtM1vCoEk3fnNMt+kPLOBGMxD4/SuTLUdpc4cnUG5fTQYIU8bK3ujwRlNlN8Ea
         3nnkUwFrWKti/iEBqaAmaH/xv3cjLYZ2nwPbt4HSfkDevM3qSMHWWYvqIK2e2sx2nXyQ
         taxVsKXpRk5S3/acwMkchW8Cnk6RyQ1CXemhiWhSyHROYPvCopAQ38eiJ/bRi3YSorWn
         Sq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kjyglB02PnlMMV/KWmWkyJDMKMMtZMktsmIkTMoDKY=;
        b=DCQZ1xpTaBzjLDy1C8oWDj3VlXX4IVH1p2u6FQj6WbgPiHETNMKydCkHdAVN0vNRlv
         diLiikUsH9fzt0RFyVFfJtuLF4xawaU8qzfzBHmpwunlB4aN7VUbCo32fhYRd76NpwuB
         vOKF7PVDBDdwGhuWm4CAQf09RIvp6yMBp6IS037ObuQUp2eTsV3XevO1rSFxMXjuIe43
         zHY73wx2Jt1czJ5dBPzhciqpDqpNKa0a9aaWRdUd0aDbTQ5eyIPQxjDMo5qaMAnAAeVc
         j/WlRobn6Ci254onvFbcuPH8N3/Vifzf7bw59VsUr6Pzri4q4HcO1uZKLOP0l2DOBjco
         6hrQ==
X-Gm-Message-State: AOAM5315QPTs3YSh9SKy/ztb2HX4w2tYgKZJQNrY6jRTyjSPfUYmRj5Q
	q82LspcroUlIOiD2aedmUorWIKpRsG5pJ3yz/TVYNA==
X-Google-Smtp-Source: 
 ABdhPJyoQ1ccH52BmfNVyNqWa2nbFNa+EGFYmA4QD5UvZ3skV9yQKZhufFUuOUTx/Rg0dYH6q5M19Upm2a+nQs4m+qs=
X-Received: by 2002:adf:fc83:: with SMTP id g3mr41464049wrr.405.1641292111653;
 Tue, 04 Jan 2022 02:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
In-Reply-To: <20220103163754.32439-1-alexk@zuma.ai>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 4 Jan 2022 10:28:20 +0000
Message-ID: 
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 10:28:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94656

On Mon, 3 Jan 2022 at 16:40, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> ifupdown-ng is a network device manager that is largely compatible with
> Debian ifupdown, BusyBox ifupdown and Cumulus Networks' ifupdown2.

If this is a superior alternative, should this be merged into oe-core
as the replacement for the existing ifupdown scripts?

Ross

