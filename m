Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC383C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:14:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.28370.1658157240294307091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FCmq9Mu/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v16so17484360wrd.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=aOnB5yUYdaqvWkbASp20bIaU3jt3XdaLVFy1x5Eaj4g=;
        b=FCmq9Mu/XvigE6vZvCAk02kYfLt3gbLPHfi5itJivDU3MvmxmGE0dApU5Fhz6J/IZp
         AHTfREPJIAbktnKqKBBUvFgugbBkwFhtuOfcz3KU+jh1k1PwqcEMzYLXHseU7MKz7pju
         Jq7UGaZ0HiVmi7238yJ5J91o3ocfEcmJRJlx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=aOnB5yUYdaqvWkbASp20bIaU3jt3XdaLVFy1x5Eaj4g=;
        b=vJhCIrM/e8dNnNytm5VyPUkk7DcT2TOC3aGyMTkyP6UAjdvz72ghzqsZjm2n0sYQfU
         AO0dzgxJwlcCXCVZ2jKzQ45w45aP7UlRI19NKwYbgO0IZ6r5Ap2Zjcc5QH5a9peNxSqf
         NLCtpjYb1KePNuVM/uVMyBJNOGNZ9AIdbNSbEH3SVUC9m4N6gpFXsCJ0hq9At5z4zoQa
         uSntlVj2wpZplg//ZBxr4VhrtEN1WLh+0v0LQYnLYG2qT3w3c/6mbb+LaKDVP1M7bLw6
         wHzsDKnBpbkYau3DF5p/xu6vpOiTKAcWhOwYoB58mz/ORRbTzf2kM1a1FQTTQG5SKqd9
         M7/g==
X-Gm-Message-State: AJIora+LGi1zoeAS2gifMM1r/hG5TFeCUBNi+h1a3tk/ctGoA+loT9OF
	RfV0ruInIRovNLsaAol21Diw5Q==
X-Google-Smtp-Source: 
 AGRyM1uhn1kBZMtb8tcszpb0tIYB8pTTunwQjF/8swzNuXQWoBqqCp8ni8YvIpkWDKPtJqzi+6RYUA==
X-Received: by 2002:a5d:440f:0:b0:21d:888b:a65b with SMTP id
 z15-20020a5d440f000000b0021d888ba65bmr24146679wrq.655.1658157238660;
        Mon, 18 Jul 2022 08:13:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ca2:743d:43c8:8a3?
 ([2001:8b0:aba:5f3c:5ca2:743d:43c8:8a3])
        by smtp.gmail.com with ESMTPSA id
 g14-20020adff40e000000b0021bbf6687b1sm13080222wro.81.2022.07.18.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 08:13:58 -0700 (PDT)
Message-ID: 
 <316420e66a626dcaa2c57cf2cb4ac17fe079a5c4.camel@linuxfoundation.org>
Subject: Re: [oe] buildpaths warnings in meta-openembedded
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-devel
	 <openembedded-devel@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Jul 2022 16:13:57 +0100
In-Reply-To: <7845f900-1c43-235b-32a8-98ca009fd8fc@gmail.com>
References: 
	<44a7b736269f3ea568febae5f0d16033347cfe61.camel@linuxfoundation.org>
	 <7845f900-1c43-235b-32a8-98ca009fd8fc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 15:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97879

On Mon, 2022-07-18 at 08:02 -0700, akuster808 wrote:
> Richard,
>=20
> On 7/17/22 23:52, Richard Purdie wrote:
> > OE-Core recently enabled buildpaths in WARN_QA. This is so any
> > reproducibility issues are highlighted by the build much earlier and
> > for a wider cross section of the userbase.=C2=A0We're now at a point wh=
ere
> > having issues show up earlier to users is feasible and very valuable.
> >=20
> > We've managed to sort out OE-Core but meta-oe still has a number of
> > issues. I've listed the ones from the last autobuilder run below. Note
> > that where multiple files in a package trigger a warning, this will
> > only list the first occurrence. To reproduce locally, after the first
> > warning shows, the object will install from sstate and now warning will
> > show a second time so you need to use "-C package_qa" to test under
> > some cases.
> Any indication this new QA check will be backported to the stable branche=
s?

I wasn't planning to, it has needed a lot of fixes in different places.
Where there are good fixes for existing code, we might backport those.

Also, just for reference, this QA test already exists even in dunfell.
It just isn't enabled and has bugs. We might backport the bug fixes,
those would be safe enough (they're in the test itself so isolated).

Cheers,

Richard

