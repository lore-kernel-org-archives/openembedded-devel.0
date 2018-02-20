Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id BA179785A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 23:17:39 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id i15-v6so4547756ybg.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e0k1rtjeonnCY5M0kzz45BuOOLK+ibfu9w6/QK5a9Ro=;
	b=heea+E9KEbzVYvESe5f1WOwyfNckjIA+LbwyA2RxbWhnCrEEDz7xkYlqQPUoi9Pf0a
	O+2k6PXNpF9UwP5uNqs1Lj+PsNfdvpN8lFzmVpSVz4oh/A10g3+ZyiZuNbKscmvNYi0b
	YfzGoFax0TpCv8tVkZ/attf9jMKNS2oUm/YSNn4tpfPiEbfuQ7r0wKlT8ZcEsD1+B0t/
	fsFZAMUrxAgN4LsBAiACOSlQWGVzUD5VMyZwvcKZyH2GhNvX6+1G/JlO3yD1GyHT3i9P
	89nw7ZbP73HNVbqKkzaKRtbXR0npL/ZrAjNJrrsSDgHNGDe5O4lQtuO4AS1ueW0DSAYc
	wAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e0k1rtjeonnCY5M0kzz45BuOOLK+ibfu9w6/QK5a9Ro=;
	b=EZfqve3xM7CiEpMBU6lwQhTIkSrfxnA3/NkYLFVMkC1DosrZn+GauHavOW7W4wUeCU
	xOHaCTWXlGtI3MTOrax//LSwi9hOcBLUasxiUUpHdHF4DIW3yl+wyUNwbzU4RDZKgSQ4
	MM++sVJxz2+HoYNUcyaKCfnNqwAV698Oh3b67dZQ3oF6ryK9vvyeZ6UWqX5Wlp30tZYz
	LdZApx+UbNzVUlcxu0L1g/DUcDZlwhJmdLbmicm2LfV9vWZ9s3sWS/ZOAinChnfsX74Q
	zLQDP0rASNOyBqIOtBzUxCSfQbuZaRRB0Db9TTmY+CTdSn7a3rp2mQY8KMj/MMR/8Jyn
	HJCg==
X-Gm-Message-State: APf1xPB8qVFizp5Ag5nTtj8pMgC4oyQAAgtDgW2TlF49r7CgCu9wUG8h
	yjcC4JVIIDHaXJFQdJTUf9NZauZOHYxssgtZ58I=
X-Google-Smtp-Source: AH8x226rAvGaJLnaw2DEmF3ACy2HbsYmF6+v0jlYRE8dplQzZtY1R8Hxa3PFK0HuC/PaNQ5mJp+X6h16Xs3c5VmfqPY=
X-Received: by 2002:a25:2103:: with SMTP id
	h3-v6mr1050793ybh.180.1519168660726; 
	Tue, 20 Feb 2018 15:17:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:c787:0:0:0:0:0 with HTTP; Tue, 20 Feb 2018 15:17:40
	-0800 (PST)
In-Reply-To: <CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
	<1519163708.24236.337.camel@linuxfoundation.org>
	<CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 21 Feb 2018 00:17:40 +0100
Message-ID: <CALbNGRREYeaHLe9WY_D-fPgyMO-DY8cEEUcSn3t95w3JjcMbGA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 20 Feb 2018 23:17:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 11:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Richard, I agree with all you said.
>
> But I still don't see how replacing meta-oe git repository with 10
> different git repositories helps with anything.
>
> It won't give you more time, it would only cause more work to already
> exhausted and (re)tired meta-oe maintainers.
>
> It won't make the layers independent.
>
> It won't improve existing tooling.
>
> It won't improve automated upgrades or testing.
>
> Yes meta-oe needs to improve and it would be great to have layers as those
> fancy colorful boxes from Yocto documentation, which you can willy-nilly
> add to your BBLAYERS without any dependencies. But that's not how it is now
> and splitting the repository alone won't help with that. If there are
> people willing to make it work better, then they can improve it in existing
> git repository and when it works well and there are really independent
> layers, then we can re-evaluate splitting the independent ones to separate
> repositories for easier consumption.
>
> Regards,
>
>
And it won't reduce efforts in sending patches / creating releases
(and this in times where resources are limited).

Reading all this, the only intention I can see is to kick out what
core-boys call bit rotted - regardless if working perfectly fine - and
hoping it will die due to extra efforts. Ah and don't forget to create
a layer oe-core-trashbin.

Andreas

