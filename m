Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F31F7FA18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:54:18 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j9so28265346qkk.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 23:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/eV5jXmDYyjb0/VYxVh8plyyeWhb4PTnOdMPJ2tivSQ=;
	b=sjWZvFC/JUnVdfPCXfkS6tD3y9ZDy5quRPXMhDa2Y/R4fTxOg2C4dmWsrnuKxrcBRW
	I1/s/JgUY0WLEmbydUoctkKSH/CN9yJfIHXc55BXXiET/QAvFkT8P/Kb40UiTRG+AO98
	rzieod8vGNIja9kptSuo2cVkU+8q3QNeFRc0IbTjzy9JPWJ45Ap5D5J4Qhe14eoNlcFU
	thHTiTyDp0M3W36xbi34s1710jsNYXmaL4TVHIsRki6IqfKaSXApTQ1Kkqgo8L1XUpr0
	Pm2x/wVVai5m7EvWMeDDAfccVESVDLp03h7beT27zcm6rMXl/z7IB3bkQUgbrAzjaslB
	eqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/eV5jXmDYyjb0/VYxVh8plyyeWhb4PTnOdMPJ2tivSQ=;
	b=BgGA2LKXwFe9Y5vVTfUkmC7rl0QfJ9DB1gnZPeyPvKQint5bC95MQ5aoHDv+PDMWbN
	RQwB4iJGcqLKNbVk3UjwQW3nXFbiVjPw2UfLm0/AJE3h2BL2qOaR+BKAGcNIhakiATyV
	8OtHlplGyAc3p5Yd2nxNkWtPP0Y5ibNpjGO/y6UDHDrMhyio5yAA4kM5OWiCm2Xg4gOh
	drQEgmtYu5nPYfJQPbAXeUj5uWTYYwfBBSj+ezKOGgHeE3N+cTSRe7r9V5n77PfSfEuB
	YSbUmW1fs6tib4oc4jbzYFX7UQXwT4AIycCG7Q+HvyF4bepfWDjCirwokLuVJGVZvpq2
	Xk6Q==
X-Gm-Message-State: APjAAAUTag2I4n4AXv1Em8a72BRHUGuf6llUt+PaCzvpfLzCtcfi527f
	gz3IOvd9xSRRR3iFAWdxrJMkQA5Ox2KMvTWuCVI=
X-Google-Smtp-Source: APXvYqykyMwQQQ90i23IjoajKo8Z4cFE1uszbJ8leF+1mAXw2lgnrKY4dn5pnj6NM2KzQ8/L1w6RRshgOdxeb6cEO/Y=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr58702900qkf.337.1577778859436; 
	Mon, 30 Dec 2019 23:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20191231010652.3206534-1-raj.khem@gmail.com>
	<20191231010652.3206534-5-raj.khem@gmail.com>
	<20191231073853.GB934@localhost>
In-Reply-To: <20191231073853.GB934@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Dec 2019 23:53:53 -0800
Message-ID: <CAMKF1sqYRT9y0RGeGxtacYBj8QOdOj4H1DWrQGjmt5XfVb8ReA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/8] sanlock: Upgrade to 3.8.0+
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
X-List-Received-Date: Tue, 31 Dec 2019 07:54:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 30, 2019 at 11:38 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Dec 30, 2019 at 05:06:50PM -0800, Khem Raj wrote:
> > The original SRCREV was at 3.7.3 even though PV was 3.8.0
> >...
> > -SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"

right. this needs a v2. Somehow it gott the wrath of rebase and squash
somewhere.

> >...
>
> This looks like 3.8.0 to me.
>
> > this upgrades to latest on top of 3.8.0 to get py3 support
> >...
>
> This should also add +git to PV.

right

>
> cu
> Adrian

