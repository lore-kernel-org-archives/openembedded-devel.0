Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id A80BB782A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 00:10:26 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id e10so7477815oiy.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=A+X2DWTVzjOOYwfsxOKhJwZmic3sTpWKK95GCYzoPIY=;
	b=GZhTBjNZVgHbY6asLgPD/Hh7r9oURUxD2lH9xvu+DFssRaukHVQaFhV5wTmDV2ZapL
	sIrpBOe+GQ2iZUEzQH4LJmG+WjUEBm8sDzaJJUD5IiZixUdHvp3AI21dMhgSAHCdxHJJ
	wmogyqwVs8kIJGs2p+IuAyl+WPmIEtIi29UH/3Ia25Iqvt7Jc/IJusYxcmMZkcneQwGD
	/Y2nev3WkXsZHcCtX9IA9nMK16eQZDCj+oX8kWrKYpKM41JPqV3i3/LKiIbq8fsbAa7o
	1K2SRcsVlDvaweVv99RRErmyvRlGBKd8sZIc2+o1kxHAjHN8rQrg+clVCzG45BEcuXY2
	N9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=A+X2DWTVzjOOYwfsxOKhJwZmic3sTpWKK95GCYzoPIY=;
	b=RfJrKWLzHhf+lqHMc130MALdzQ1bNnHMJaSmBXgiODDeNid8Qmvi2peYG3MBF7G6cF
	2oljJ5EyDUqR0YVDZsoG2L1yal+SWK+BJOiq2kqxsP1KuswpOYR9J6CT0m1V7qx+WX+m
	VRfNNmy6Ge9y8FFAcWq8nPwxW0bA2ylf71yyrQUJiWx8SAgotws9EwEymsc9DnSkDQDb
	ZiiJV6TayiU5Exsfqq+eDSKmgfPuATvsZ7v6/c9bIzPAOcvl8Wu0kspwLd80j8Dy4RP0
	qQDx8WgutxeFfc4O6RSduivYkE3ZNuoWsrxzrQPEZth33EiC7AQ2ED7rIgJM9EboA17z
	mSTQ==
X-Gm-Message-State: APf1xPBB/NBvg+Kh5NvT1haweTeMSoE95dC/dsYByOAhtzFTtmKzYKg6
	vTN2L6eCf7g9AQ9nQ3UcdvuKKy2a
X-Google-Smtp-Source: AH8x225JwFpuifGitAEUNfPHNeG3kvo2blqgvyPvzV+zsCwLfw/1WE6s93PS3X9X3Xrxm0kQFWGg/A==
X-Received: by 10.202.9.19 with SMTP id 19mr137869oij.152.1519171827222;
	Tue, 20 Feb 2018 16:10:27 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169]) by smtp.gmail.com with ESMTPSA id
	f30sm15095206otd.38.2018.02.20.16.10.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 16:10:26 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id e64so13110582ote.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:10:25 -0800 (PST)
X-Received: by 10.157.63.184 with SMTP id r53mr1047188otc.168.1519171825617;
	Tue, 20 Feb 2018 16:10:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Tue, 20 Feb 2018 16:10:25 -0800 (PST)
In-Reply-To: <CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
Date: Tue, 20 Feb 2018 21:10:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
Message-ID: <CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 00:10:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 9:07 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Feb 20, 2018 at 3:52 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> I could combo-layer pieces of meta-oe into poky but I'd imagine that
>> would create more problems than it would solve too and given the
>> general dislike of combo-layer, I think ultimately better layer tooling
>> would be a better answer and more acceptable to everyone.
>
> Poky creates more problems then it solves

... send was too soon ...

Poky creates more problems then it solves.

 - it causes confusion
 - it avoids the urgency in adopting a setup script
 - it does not use the layers as we market as being a good thing

So adding more things to it, just makes it worse.

The setup script is more urgent to be discussed then splitting meta-oe.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

