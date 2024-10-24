Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F8AD0BB58
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 03:29:24 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web11.6373.1729740563759206216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 20:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=DipPeiGl;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729740560;
	bh=ys+m1+//6U+xqWsciKUhbfqgB6KnqWRACRHnhmE6tOo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DipPeiGltcSUy1vtGU+Eh3fRiAGswmxlGESAF3foLmE1UWz8bH3grVFgXEOXh9DuU
	 pt3NQsv/AT8lSImmG0QlIecCJI+wH6/XkD6C7IgkAh1aHNR8WE0lYtDcm3QjiOO+gg
	 BV04TEuHCJlgLT2SwI9kakiMxCCqWJlU/cNSnlacjL+N0NNdvQofIJrNeVfcS/t3zg
	 zUIcP7q0DJzdWCk8nudKQ9eNX2TKu471TLHspt4jm41Dvi5qAuw1HHKM7PzogpaM8k
	 1dBC9slsHduct63op1AM+W9aoDjMrLfuQ1fBPvFgup8N8bJQFGdnNxLyHDSuGOz195
	 5aNeBSq7oUoTw==
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2F5FA6929A;
	Thu, 24 Oct 2024 11:29:19 +0800 (AWST)
Message-ID: <3c4cb581f42351870fb443e10899909f657c00ba.camel@codeconstruct.com.au>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Khem Raj <raj.khem@gmail.com>, Chanh Nguyen
	 <chanh@amperemail.onmicrosoft.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, 
 openembedded-devel@lists.openembedded.org, Phong Vo
 <phong@os.amperecomputing.com>, Thang Nguyen
 <thang@os.amperecomputing.com>,  Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>, Thu Nguyen
 <tbnguyen@amperecomputing.com>
Date: Thu, 24 Oct 2024 11:29:19 +0800
In-Reply-To: <CAMKF1soiY46pbuUF0tKYBdVh=NzP2BG0wp3+TssTwZ1LYa-jKA@mail.gmail.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
	 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
	 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
	 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
	 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
	 <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
	 <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com>
	 <CAMKF1sq71MZCZZzW31kv5j6Rt68FfZkea4w-yPSZkEuykf0Dew@mail.gmail.com>
	 <CAMKF1soiY46pbuUF0tKYBdVh=NzP2BG0wp3+TssTwZ1LYa-jKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 03:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113157

Hi Khem,
> There is a new build failure seen with musl+clang
>=20
> https://gist.github.com/kraj/cf85e1d301b557c791ecb410f58298ec

Ah neat, thanks. I've added a couple of fixes, but currently untested
for the musl build:

   https://github.com/CodeConstruct/mctp/compare/main...dev/cross-fixes

Chanh / Khem: if these look okay, I can merge to main.

Cheers,


Jeremy


