Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id C70DC77D40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 19:26:59 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b187so41081185oif.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=3y1LkvcLWy+AVlA5c04EX6LLJJlzwjW0lQ/3JcXhegM=;
	b=nmKkpFu0jrrQkSrD3UDcuoTbUbokXsWpH1cY+qO5/BNbxW0HOthSYQLrRWSkZxDyve
	c4TaTs45zId0N+Y00AKEvwsSHZoWtfPw5Xwhz6xIbwClpTFJOaIk49k+4HDk4+8UjBxI
	+VF2tQb11QeiXCYj+EW8GS3xaWfZXtRt6oCN0WsR5c+1yzM9SbU4iJRT1Kov+UBUDpjG
	FsJ42JFtIh7PlnP4oy7SD+OJGQkV/T7gVRyWm2y/3G+WM4wv/IwvG4AUz0Bn0u2STpNB
	x/3vZvn9+Ock8bzeHJpgTE38AtZydBnNBO75QhQm21PTWAwvXAggN6RNxffX6oUEQUQ/
	fpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=3y1LkvcLWy+AVlA5c04EX6LLJJlzwjW0lQ/3JcXhegM=;
	b=bM6hbgatu0cMaoo25oonaS+1DUKEtYSquXZR3ydGI1O7poVyS/oNB/Ocf+oyZCj4ye
	HxcozAN5YJLaD0Sfko87Sr747G70+5lKobGns/myqEe9p7Qstz5qAt2NcuRgH1nMc/lR
	XGh/MAqXyH9/uc+6tMfblyZ8rjNC/fkYyVBJJVkmDjWjqhwKTEmc6ttFS/VyguYnvXgN
	fMvxN169ysqjMJNn3dhw2wAD01HF5RVV08qfogg8mN7C3fauv9+s9qhnCmOLGur3RyGv
	DH3H82U8wvtK+7r3E/0WV0bkYHlEOSkv7hEffg1Da4XHQdXnMhvJQscMoQhOPdFV0Hiu
	1zfA==
X-Gm-Message-State: AFeK/H1stIdlZMBPOrUNPLkP+YTj0Ujh2cf2zqM0esXtpTG6QS5eM2+x1ON+MY80DvmOrA==
X-Received: by 10.202.71.149 with SMTP id u143mr1015190oia.76.1490902020486;
	Thu, 30 Mar 2017 12:27:00 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44])
	by smtp.gmail.com with ESMTPSA id e66sm1062962oih.0.2017.03.30.12.26.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 12:26:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id f193so41092688oib.2;
	Thu, 30 Mar 2017 12:26:59 -0700 (PDT)
X-Received: by 10.202.244.203 with SMTP id s194mr1045948oih.162.1490902018674; 
	Thu, 30 Mar 2017 12:26:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Thu, 30 Mar 2017 12:26:58 -0700 (PDT)
In-Reply-To: <36e2ad5b-466d-b6c1-7c84-1f5b5c1a66c3@balister.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<a5b043f0-b0ee-a74b-fd55-4f8d20669cba@denx.de>
	<20170330132447.GU15664@denix.org>
	<a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
	<20170330180636.GV15664@denix.org>
	<36e2ad5b-466d-b6c1-7c84-1f5b5c1a66c3@balister.org>
Date: Thu, 30 Mar 2017 16:26:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq7wn=Zw01-4yJpDLDhbivhrOrYirM-30MLbJU=6LxqOg@mail.gmail.com>
Message-ID: <CAP9ODKq7wn=Zw01-4yJpDLDhbivhrOrYirM-30MLbJU=6LxqOg@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Thu, 30 Mar 2017 19:26:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 30, 2017 at 4:12 PM, Philip Balister <philip@balister.org> wrote:
> I've got a machine under development that boots from the 2013.01 recipe
> and a bbappend. I don't think it is a problem moving to .03, but I don't
> know. I'm not sure how many other BSP's have done the same.

If it is a full mainline machine it should be smooth; otherwise
sending the patch to enable it in mainline is the best long term
solution. Keeping a patch on top a recipe is a decision which ends
with the maintenance burden at the developer adding the patch.

External layers should not delay the additions or upgrades of recipes
of OE-Core. If maintenance is a concern, upstreaming is the best
choice or fork the U-Boot and keep the fork with an independent cycle.

> Meanwhile, I understand the desire of others who have work upstreamed in
> u-boot they like to use with the next release.

And it has been a way to endorse the upstreaming effort to reduce the
maintenance work.

> How many u-boot releases are there a year? How do they line up with YP
> releases? Should we carry two u-boot versions, similar to what happens
> with the kernel?

Every two months now. I see no reason to carry two versions. OE-Core
provides the basis and every BSP layers can maintain their own
versions.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

