Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1087FB62
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:47:47 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d13so510633qko.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F2+J1KvnDq6P6JJIXqA6T/KeaMNuz5ofhhu47shobSw=;
	b=InkUmEQyhCKereNYi5PBdu5iLPX6tWhxoGD+hofymOOpjZGp1XxqagNUXdDacvO9LJ
	scZzpXNs4iVHo8C6fmUj9xGKo9qkG/WGEoPmADGfjUwt3WfPM6YFht1bw6sSaA4Wvx0I
	iypWKaL20y+vAtIDXMZUzm8yVZwaFRSkqZ7ngHiBvkOuIv7pZ452pzRNIPm4UoBPX8T+
	5qnMrfl+C1POs5tN/6UMHhyxiBnU49NX99u3lQx1oEYIy1clpGb1+FhRr9Yc02LPNTlo
	eEe2k9zUqmHxRQFm77h/l2eN/lrFQBRxlY0bbYXQaGXkWeRWxYJlmTxO6LxWzbneFTT1
	uVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F2+J1KvnDq6P6JJIXqA6T/KeaMNuz5ofhhu47shobSw=;
	b=Pfajd68O3VXhZl+FmYU4WnsAc073s+jQo4Bg/SyYUPeAuS1YQ8w5bwwzXIH/r0i/ee
	xMcrefNHQOPbhMk38Z7/+wdOAdsdIw+2C+cmB+XwzOp8t3d15R06dmNm/nZqUiGSEFHn
	miASV/ijRnLhJrCOaDKSebK6ArQgadYPV1vlhp2ajlguooCmFkfWrDOr4W+5gH8I+kii
	mVFU8/BAglULIym6/U+qsWGJhraDqvkIFaD+XYWKhAolbtXVqyiObj8JEAzK6SGhMVHQ
	yf/RQeuqYpQ8Ox8l/ZWWa4mUqwoNBxKmzkIfNgsDd67FZVC2GLs23Ix70omU0zZULk9+
	TwxQ==
X-Gm-Message-State: APjAAAV5xOdSHmuHylkPAqJWo52Dg9Hfh8jqYVI/793VGKe3AaEQoLpm
	OVt7Ub+Tcni/i4bFZsDi4Kze4tmvzKqdzLUNoX1Gx7Dd70k=
X-Google-Smtp-Source: APXvYqwGBu8kqwELOoEwVpeGQBET67lsN1LJ9xNxyv3jQY+qVIVYI6SKz/3slEjushqI41NocZg7v4Jq/SC0ncyx24I=
X-Received: by 2002:a37:9d15:: with SMTP id g21mr9374456qke.71.1572385667965; 
	Tue, 29 Oct 2019 14:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191029090657.30771-3-bunk@stusta.de>
	<CAMKF1sqRRmqEaLMcYDrO-Ae8XcuDNqVJKVnutG4K4rfUp57GuA@mail.gmail.com>
	<20191029214201.GA5048@localhost>
In-Reply-To: <20191029214201.GA5048@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:47:21 +0100
Message-ID: <CAMKF1spEtDo_P+KdBfJJs11qi5Sj9-q2Dt4z0rwO566P2mj6xg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] mdns: Mark as incompatible with musl
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
X-List-Received-Date: Tue, 29 Oct 2019 21:47:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2019 at 10:42 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Oct 29, 2019 at 10:23:46PM +0100, Khem Raj wrote:
> >
> > this is fine but please adjust
> > meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> > accordingly as well.
>
> I already considered this, but when I tried building this packagegroup
> for musl it failed on some netkit recipes even without my change.
>

thats fine but please do remove these recipes via _remove-libc-musl regardless

> > secondly, ntp also has a packageconfig for mdns its disabled by
> > default so not a big problem, but it will be good to error out if user
> > enabled it when using musl.
>
> ERROR: Nothing PROVIDES 'mdns' (but /home/bunk/yoctomaster/yocto-test/sources/meta-openembedded/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb DEPENDS on or otherwise requires it)
> mdns was skipped: incompatible with host aarch64-test-linux-musl (not in COMPATIBLE_HOST)
> ERROR: Required build target 'ntp' has no buildable providers.
> Missing or unbuildable dependency chain was: ['ntp', 'mdns']
>

thats good then

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

