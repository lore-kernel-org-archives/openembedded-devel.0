Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id CBC197E601
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 20:35:43 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id h126so7010912qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AkkjL8nkeKTmgZMk41sdRM84KdTjRz9MMyrxmvlEy24=;
	b=LXO92DD+2mXpHaDDRZQt6xpAms1VXdTPk0dFnxS4vlpSOkfsrkc3YP2m9qb4Y0vsfV
	CWZQLi3sAzdvq4EdMc+DOpnypLx/cIWdmsCZTd34HWVXY+406luzJPlmZsPI/+AD544J
	wbSSBxTCR/YczkKPJIhw/wUspLHk/rder0W3Dmg+R8O1IMKDjjvWGnOUcMR83VvN6Ilm
	//R8bB0/T1k66YauTQzudGG5feK/Jzw907XFXhrByj/BV81Hfyda3KHen9inX/Kk8uz/
	ahm3+Z2V6S2KwZ2k26NxJeVPoV5ApUOqGPUMcJb5mOE5qWQXpt/Na8JF0NaciEx21reJ
	Qi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AkkjL8nkeKTmgZMk41sdRM84KdTjRz9MMyrxmvlEy24=;
	b=EOVls0Q1/OOdj3iQEhxjs9SP4/JlG/tb4euYj6Uv6YKY2IHxCZryd9MwN5yNpRWOT6
	adkE2zmRpXsgLMVG9YmO1uQtdr0Gg5IO2vcVSVFoxoevEoidQHe8c6HA9BSRupXKiOru
	UmBch5ejO80S0ZSSK8RO2SAZv/wZ8W3RaOUiGKLwyiQauKrTF/R5Ll2P8+/pJPjF5roS
	jhGMqUNK9iaY9UgXRDLnTlO80y9yENlLEWT/CUcxqN8jrW3mG337oTIlUA5NDafvnskY
	AsT9ZbjsXf5uF/8Spyjh7RqxwluxUw7atjQSLcIK2k3zwEipw02A/3uuH8evo5yayskw
	epQQ==
X-Gm-Message-State: APjAAAVxm7nbz+y7FccfOXCMGNMg9d2nHaEFw2q+9kOl8PCo98EuKFJP
	LmEle0vLkdw+9LPSnkbKyxOv7JqAa7hVmo4ixDk=
X-Google-Smtp-Source: APXvYqyeuTkMHizeJYcgKuGPeF6UHuY4mUMkKgMV/5ULGHR4Y9sFtIlYY3u5tpsqlHBUy+6+yWhm09rvXnDbel/3JXE=
X-Received: by 2002:a37:5cc1:: with SMTP id
	q184mr12327865qkb.212.1570221344191; 
	Fri, 04 Oct 2019 13:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
	<20190926223206.26850-2-schnitzeltony@gmail.com>
	<CALbNGRTwfXEP0skCASQRq86R78ugkZw5NJGMFTgKhtL_Ohu0hw@mail.gmail.com>
In-Reply-To: <CALbNGRTwfXEP0skCASQRq86R78ugkZw5NJGMFTgKhtL_Ohu0hw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Oct 2019 13:35:33 -0700
Message-ID: <CAMKF1sqYP5bee9=mcwLpiRU8rcbMWEdGz21y8iENkBtJm+a6nQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH v2 2/2] xfce4-panel: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Fri, 04 Oct 2019 20:35:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2019 at 1:31 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Fri, Sep 27, 2019 at 12:32 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
> >
> > * important bugfix release: systray draws icons properly when
> compositing is
> >   disabled
> > * while at it renumber patches
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> If xfce-patches require review these days: Kai can you take a look?
> If not: Ping

Since they have been pending for a while
I still wanted to give them a go for a build and see if all is okay. Still
waiting on Kai to review them

>
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

