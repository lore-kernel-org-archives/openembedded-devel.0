Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAD57C1EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 17:50:41 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id x9so3331646ybj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+DAOQ6SO6Y6dZzqDrDlCXpp15w95XjCozw1vofvFYyM=;
	b=ZZ90lwKsvMgOrf/WstYavsgbvNoe4cDT8i1goM1obfZbwnXlqam1L1y/ITdNvg3r+w
	Glvt24zz5nN6s6de4mSDaAAApKkhuJvie+Gfqxno70cVvw9+hMj/5cA7JP0LTYjLw5Z/
	2i2AsoeOohBdZP1Frx+JyrCY56gaq1qM3gvKKtFkHahqfxZiSe51dbBFZTgAuXUFK3wc
	G0wiUpKjOvZPS6ZYNz+8ng5A5kryJfUYkY+OyknWypEmfbONC5ZFSzUpo/tDqvbMzr5k
	hu+ssQU9AMgaA8fNs1jhVPYQTGzPXP6mEqLC9JW+egOzvJXgflJsmffnu7xcHl1rx1o5
	36YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+DAOQ6SO6Y6dZzqDrDlCXpp15w95XjCozw1vofvFYyM=;
	b=FSew/sfkbDaD5cDRKosD2Y3LCCgUTicGjA30eL/K5QTm5zxMUoqz8GbC5WJLSoK/hX
	2xFduFaFnzH6WC+yFyWa1Ln8sL33XKddx0C5mVMASmMxfaiNMxH/mKvakh+zUJcEkC3/
	kop6fqogL8Q76ceXUJ2dXCXvJmYnGC3PjCmIrIxXboI81xT3Dip1jmSLLEDBk+PixJpb
	OPf2eVzI9h4eFTEeu1MBs9HSDLeZv6LwLfidrGzvkDSkpmQV7g389FoMUB4lpAdCi5n8
	qopOplz3DOug4Sk7dKUzSHXCcxYnUORr5oS6kyY7jBFvyIUVT5yZZIfgAujUgU76G/FO
	0rdg==
X-Gm-Message-State: AJcUukcaPyaj1S+0POx/d5C3oU+/2YIHIptN9AHhaOJviSs0/cd1pvi8
	ysp2F26+nraYW3RLmObzbUBlydgae2kzYGWEG6I=
X-Google-Smtp-Source: ALg8bN7x4/lNZaPYUxTrJorkX3nOlSnCIHd+Tpi6AH+HGa49VXqQyc8to9JUhtQoKuBFnQQStQICYYM6pGfXgu/RxkY=
X-Received: by 2002:a25:9003:: with SMTP id s3mr2961753ybl.486.1547747442531; 
	Thu, 17 Jan 2019 09:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-2-stefan@agner.ch>
In-Reply-To: <20190117162629.47677-2-stefan@agner.ch>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Jan 2019 18:50:29 +0100
Message-ID: <CALbNGRTMjFogycr0vsaLDxLeQi-ZVvHb6bu2pm9QebwaWdH3bw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/5] networkmanager: introduce polkit package config
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
X-List-Received-Date: Thu, 17 Jan 2019 17:50:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
Hi Stefan,

sorry but don't like this patch as is:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Currently polkit is enabled if systemd is in package config. Those
> two things are orthogonal: NetworkManager can be used with systemd
> and without polkit just fine.
Did you test this (=change networkmanager connections settings) as an
unpriviledged user?
>
> Introduce a new polkit package config and enable it depending on
> whether polkit is in DISTRO_FEATURES.

* it changes the current behaviour and the default suggested by
configure.ac: 'we usually compile with polkit support.' and
meson.build sets polkit by default.
* as far as I know there is no polkit DISTRO_FEATURE in metaverse yet.

I suggest to add polkit PACKAGECONFIG if systemd is in DISTRO_FEATURES
- if you don't want polkit you can add a PACKAGECONFIG_remove =
"polkit" somewhere.

Andreas

