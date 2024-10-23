Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA14D2E034
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:38:19 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.4851.1729676296861923352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=NuFEJx9Z;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729676294;
	bh=+dgLUah2WrsAyY7yWMDQ02jF9Ei+6GbvtA7MxTcvXEo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NuFEJx9ZKu+dceqMd2nRarlvxRSBScpr2bEnfXDzQic7V9jFwxZ1xvThKAyHxwRpC
	 eeQyaKBYRqDJq8iahEYTDsvLmQUIdE3l1okk6+mlQFUIT5iA9sMLuqPuGGdjSpxPF0
	 uhvsFE470CeRqymszbijFeAltgmYtwDVMzeT+48Cxy5dcj4++NBmeHo0d3JzeTNRc7
	 nTyNk/JmawtARExuLBNQA9tmmFFH6eDo3ZLsEtpKfYOOKO/SBmYPzM4UW4PP8U3Oyt
	 xEWY49SBbYIAMasYPe+0WngA6gUqejRKmhwaUheKqpjBHjQzxbtUyGqWxm8THOl6fP
	 Ep9/vDsodT1SA==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 47E1269423;
	Wed, 23 Oct 2024 17:38:14 +0800 (AWST)
Message-ID: <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, raj.khem@gmail.com
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, 
 openembedded-devel@lists.openembedded.org, Phong Vo
 <phong@os.amperecomputing.com>, Thang Nguyen
 <thang@os.amperecomputing.com>,  Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>, Thu Nguyen
 <tbnguyen@amperecomputing.com>
Date: Wed, 23 Oct 2024 17:38:14 +0800
In-Reply-To: <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
	 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
	 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
	 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
	 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 09:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113144

Hi Chanh,
> I saw my patch v3 was merged to the master branch of meta-openembedded
> https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a9746=
7b1d7dd77b4fab537bc311e3

Ah, neat. Khem had just mentioned that he had merged v2, not v3.

So, all looks good here? unless there are other build failures?

Cheers,


Jeremy

