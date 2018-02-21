Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id BE8DE784F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 00:07:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b8so6852770oib.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ucQZVvDjZSHiBrC/2drHkpf2spPDKXzdHrcTNrN0pBE=;
	b=DxJQGaYCrbMahvBmfa/ahgz3nkQxuZF4FP0KhEiGqcZ9ruiUjUywI7/2D0i7UfHq0Y
	0Wpo60PAwuuUl8ik5pu0yHW/6spWTkpJo7X8ptiXq2bFnAAajUO2ND00XsyMGL8G21O6
	2lawLYxI/0ZMhD2tlZABNDcsKali2TdxaVVp84YhKRBHsGrRjmkWycngQu/BWdtOoCHu
	NjtlVsy8ckTUIPVE4Fu7ADN/iOzpjmG7kjXvrZeVzM5zMXhkPQ1aWC37fHidpA0ruyMi
	Fs4L+NPK9Bu2N53MP5TcvVrz4obxdMlBJg37ClhF78h8KBIzQJ8ysA7PHXC20Pzmy104
	bucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ucQZVvDjZSHiBrC/2drHkpf2spPDKXzdHrcTNrN0pBE=;
	b=Sel0cLQSTUaEtlCt4kVLQY+mrY1oTfTntp0VAJCI/K2xIkziPfVM0lgiilAhTpL16Z
	HAwVh+7EtLKubW/SZMetg5oRXLKUTacFj3dMY+1s76WkEZqOwAtl6kFPpvv/26oxFCk6
	GtO/hyANueoSdxXOtKrs8mfrRpHV6bOM6pNks8rHl/k0p39btX9eXSOe3yHkif7XUghH
	W+2Tih2xYd1aRkqpfggMEIRvX8EWYERpDKfaPBB+sfGkCWWR2dlRZUaTk6OXkpp+ska5
	tJcA2QMEdwAd9/E/NB2p0zV4YS2kA2AHVJU2I1Hz+EeqxPoJMgu5GqLlM63nuOvGpTQZ
	0BMg==
X-Gm-Message-State: APf1xPCgXUjdDHkEvxZHR0kg/asNuiyp83NhzckhU8rikQZCBRKGEq+M
	Q+fzvWtqXAhMkRv/oIWP29KOZJog
X-Google-Smtp-Source: AH8x225JFVJGK6uVJOTzNodh0KbCs89MIRUXJArg0+k4Cl7C92uQeSxVeXym+UzDFVPF5Fj/fgrbdA==
X-Received: by 10.202.19.24 with SMTP id e24mr1002755oii.142.1519171657271;
	Tue, 20 Feb 2018 16:07:37 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178]) by smtp.gmail.com with ESMTPSA id
	p41sm14293774otg.33.2018.02.20.16.07.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 16:07:35 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id b15so7153983otf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:07:35 -0800 (PST)
X-Received: by 10.157.49.84 with SMTP id v20mr1116707otd.103.1519171654928;
	Tue, 20 Feb 2018 16:07:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Tue, 20 Feb 2018 16:07:34 -0800 (PST)
In-Reply-To: <1519152750.24236.330.camel@linuxfoundation.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
Date: Tue, 20 Feb 2018 21:07:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
Message-ID: <CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Wed, 21 Feb 2018 00:07:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 3:52 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I could combo-layer pieces of meta-oe into poky but I'd imagine that
> would create more problems than it would solve too and given the
> general dislike of combo-layer, I think ultimately better layer tooling
> would be a better answer and more acceptable to everyone.

Poky creates more problems then it solves
>
> Cheers,
>
> Richard
>
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

