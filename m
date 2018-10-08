Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3A5799D4
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 16:51:15 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id g2-v6so8070862pgu.11
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 09:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oGZx/zxSlYWHVVerOZHYeveBJ2wYxJioaZhgT11NLzc=;
	b=M1u2sTxi3DwRFevSb++pL1ebUe1NEUXl+ibOTet8dULqgz9ZsZ0b0k2WrFdvgs20pj
	Ly+oCMT2vDf92pkSqpV5KecfbFa5laDtsRknlODapj2dsrW680faiGjlQK4s9dI5FcgO
	5+muPrmDRrdHP0EVloMA8qBhPJ4ZKWiNYj+kGALTMORfCFQxkmcBCEu0ddHVBVMKRQ0I
	iOVQPuEZOzBCntSX4hEVtEt3yR+rabEx2yyp94bipz2r8f1A2B+T4fiy36XNm66vKMiK
	bUVvtF3xFL5vf8IQrzls9t4StUz0Lhp/J+rbJ15KCuh4n3q9GVXRr4m6RXIFvy96wbOc
	kV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=oGZx/zxSlYWHVVerOZHYeveBJ2wYxJioaZhgT11NLzc=;
	b=CASQhNUyvsUtvXSiqNRXu5dLpgUKC50QSc1r7LUOtoqez5I0D/Tq/3hbPiytSw8cro
	wUWNjQUiU+i1vR+MmxSXykMK/YNYx716BckFA6EAlj5qfaW2gqVC7ZaLBhmASZIvq+Hz
	2e3C1R07MWAq7lQ0hksBX4TDp7aiev4lCRibpPhmXswsBU8vyRyVobQ5mYvNJPV3GNJB
	gkNWDxvXIcJsZJIyEoWv44WiTDnPy55Dal5DRArLR2aOTbOGH/4DEni7HSbFrDE5yEkt
	Gi1NuD964u6K2B6efVdC93t41VyXeFDBlRH9qmfJVQN8hBuWna6b63QVzOL/V9zit0rL
	+BTA==
X-Gm-Message-State: ABuFfogysK66FlcKDtD5pFEa/Q1QiimEFC9ai9E8sZOu9ygflfGm4+vY
	GvhyeALlKrJUyw9OFOUgh+/R1dze
X-Google-Smtp-Source: ACcGV60Hb/Q04OJVIAYLamb3sTG7r2Ke4YWacFKEQlQKUENlcZWh8VgK2MT72NoMCEWhQY58qgwOdw==
X-Received: by 2002:a65:43cd:: with SMTP id
	n13-v6mr21770251pgp.185.1539017476837; 
	Mon, 08 Oct 2018 09:51:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:3c4e:eb69:ac14:ba02?
	([2601:202:4180:c33:3c4e:eb69:ac14:ba02])
	by smtp.gmail.com with ESMTPSA id
	t15-v6sm45812080pfj.7.2018.10.08.09.51.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 09:51:15 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1sr8XFvPcu-jU=hssJCEyBkP0GeZGYLT+F71ZMPD=Ve7Uw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4c77c609-54ad-fb02-84c4-fd118a107d9f@gmail.com>
Date: Mon, 8 Oct 2018 09:51:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr8XFvPcu-jU=hssJCEyBkP0GeZGYLT+F71ZMPD=Ve7Uw@mail.gmail.com>
Subject: Re: meta-openembedded thud release branching
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2018 16:51:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/07/2018 09:55 PM, Khem Raj wrote:
> Hi All,
>
> I plan to branch out for thud really soon, and it will happen in sync
> with OE-Core, once branched
> I will maintain thud and master in sync until final GA release for
> thud and then release for more
> invasive changes.
>
> At this time I am also looking for release branch maintainer for thud,
> so if you have interest and time, please sign up.
More than happy to maintain thud. I will post a patch once you branch

- armin
>
> If you have changes that you plan to include in thud, please send them
> as soon as you can, if the changes are invasive then we might have to
> wait until 2.7 development opens.
>
> All feedback is appreciated.
>
> Thanks
> -Khem


