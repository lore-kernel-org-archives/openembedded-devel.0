Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 325B875279
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:27:33 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id z16-v6so11560330uaz.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 13:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M3oj8nCh1CTIldaQx8n75JbXOpNG8jiBrCv8vu8sfh4=;
	b=o2eY9mO7vifxhMr1GVzFhm7oDHy0vh1Bh/0ZgqMOZo+4M9RLkyLvxc+ENBO52ksbAr
	sayJ6AYTSk7/BuU4Ggj/85Hy09npky6RqsBVzeH5mw2kRXdurxGw3gFFMqEsK7bThiD7
	DuJE/lNnW27HfGa3GzAzw5/klpzphQvS1eOYJVHjD4kHa8I5lcBD9XRRPhPdKcLjb/oX
	Whi/2LXByScPURgZkE58mXryOYMYWcWCR12mP+SdB+M9nycDKIHLbmpwPRzWACJ11rVN
	uIaZsNofDfxE8SHkcpkwNgJZ7Rg5eGaDj4dKA25ZVqwAv014gcYtmM59RXOCUuHW0U4T
	zbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M3oj8nCh1CTIldaQx8n75JbXOpNG8jiBrCv8vu8sfh4=;
	b=BddJhzx24n42VI08cfaGzywjahwwgDzW2YpoU+/peb5DvubqmAUPBsgG1/C3QuUdcm
	yoZGnDeqfFdRbU+ZYMWPFN1vDvJ3RRGZaNWK7O59mziVxketqeMGxL9lqkirKhdz11Ur
	TYYKTHPQOVO1dabnuquXrkrWQ6wvgCFWXxJCATBqKflcVvgq00eh4RsGFJfYwnwFTqD8
	z57FCPylbTxIXJ5Zbh8J1B2u7E9GcN6VfLc4XDlQYLsRJXcHZpVJWJCjPaZpqVu9SyQN
	xIzqoLAkBy1hQN4dD1UPS5JVT7Q9n+mYAwuatqwrukNxvKl+9ytjD5Evs6Q83deyUAXQ
	eyzg==
X-Gm-Message-State: APt69E1qRg+zqJSSJTrcqok07Oineunzdtw+MvI4EM92kqgC2MEQSiMc
	z6W2Dzg2VMzn3dEU2xP41tYlYGcEaYH6cDj7pA0=
X-Google-Smtp-Source: ADUXVKLfZiKynWMPdrsBFEH/WFj6nZOy298yPZucC+ZYjeNayOLov2kXyNtVUgWca0Ff1ZAJgPIU+xhqjNb4gH4XkaM=
X-Received: by 2002:ab0:304e:: with SMTP id
	x14-v6mr8672380ual.80.1529353654793; 
	Mon, 18 Jun 2018 13:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
	<c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
	<CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
	<CAPuovEJx-ghUsXH0NFR8Vc1DJL8AyHXJAbL38oqkrtqbQiAOTw@mail.gmail.com>
	<CAMKF1spbkMcboLaBfw0bv_bf_v5_d=qDHB3ag7pCEL1E5Ni3sA@mail.gmail.com>
	<d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
In-Reply-To: <d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 13:27:08 -0700
Message-ID: <CAMKF1sogyeHq=MMu+b6aOhue-nbm6JvBX4QXvwKgSfzcEUCM3g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:27:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Mark

On Mon, Jun 18, 2018 at 11:55 AM Mark Hatle <mark.hatle@windriver.com> wrote:
>
> On 6/18/18 1:47 PM, Khem Raj wrote:
> > On Mon, Jun 18, 2018 at 11:09 AM Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> >>
> >> On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.com> wrote:
> >>>>
> >>>> On 6/18/18 12:50 PM, Khem Raj wrote:
> >>>>> Hi Mark
> >>>>>
> >>>>> It seems your distro is not inheriting it globally. Here I have
> >>>>> INHERIT_DISTRO ?=  "debian devshell sstate license remove-libtool"
> >>>>
> >>>> So is remove-libtool a recipe or a distro option?
> >>>>
> >>>> I'm asking because doing this half-way is causing a lot of confusion.
> >>>>
> >>>> If it's a distro option, then the recipes should work without it being set.  If
> >>>> it's a recipe option, then the recipes that need it should use it.
> >>>>
> >>>> Right now it doesn't seem to be working with these recipes because they don't
> >>>> package the .la files UNLESS it's enabled.  So the fix is either to package them
> >>>> (by default) or inherit the remove-libtool.
> >>>>
> >>>
> >>> since we make it as part of meta/conf/distro/defaultsetup.conf
> >>> its a default policy,  its perfectly fine for a distro to disregard that
> >>> however, then you fall into a non-default case. I am willing to accept
> >>> per recipe patches but I would recommend to consider it as a distro
> >>> feature for your distro.
> >>>
> >>
> >> Andreas,
> >>
> >> Can you revert your "various classes recipes: Remove FILES entries for
> >> dbg/dev packages" then? If this is a distro feature then these recipes
> >> need to build without the QA issue and without the remove-libtool
> >> distro feature being set.
> >
> > This is in default features so I would not recommend revert, distros
> > not using this feature are in best position to fix it, as I said
> > before those patches are acceptable.
> >
>
> I'm confused.  If you say it's a default option, and if you DON'T use it, then
> you are responsible for fixing this.  I take that as you want patches to fix the
> issue.

I want to encourage folks to use the default distro policy as much as possible.

>
> The revert will return the original code that packages the .la files (if they
> exist) and is the 'patch'.
>
> Right now we have a broken situation where it doesn't work, and a ton of
> .bbappends would be needed for a custom distro, and these bbappends would make
> it difficult to pass a Yocto Project compliance test.
>

I understand that, thats where I said, patches are acceptable to fix
the fallouts for
custom distros but we should not block.

> (I don't really care either way if someone includes or doesn't .la files in a
> distribution -- just that since it's even an option -- both sides of the option
> should work.  I'm also fine with saying OE only tests one side of the option,
> but that means patches should be accepted for the other side.)
>
> --Mark

