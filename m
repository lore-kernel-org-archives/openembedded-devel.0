Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3645F7897A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 20:28:02 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id o197-v6so875222ybg.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BLfiCb5Ml2m5No7gHTKjLcpPTOP8NlI6qpaQbvFJk/4=;
	b=eJifVPdoQvshVWwux6VyBFiMoD8bgU+UT9dTAnPJm959UkjYU/zZ5Ywj6hCEvxCcZM
	84UPBbw2yzzKIaBVjoIyQ6iT4xtQh3o8GbENwtqS82dyA3qQYYxxbaUsOAqrPvYpx/6X
	yFb5oTpTHlqxSIQgJWQt5fn55GYHzjHOV56HTAYgSzz2X764mx7bmilLR4jhdu5qe21K
	zD6ODnYo9U4jjl0FVcP7AfGcPPnZJTlr2pv/mYSzKyjt5FzzQIEHpyYnnsVBiADaYc9c
	Hgn6DTUmtSWwhG6PU4fD/t0EI9tRSxDmvTVXLx1sgrg4WdHHagK88DqwAiJFxVtAYExs
	cEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BLfiCb5Ml2m5No7gHTKjLcpPTOP8NlI6qpaQbvFJk/4=;
	b=GrWx7SwbOXdOMW6nOxI1785/NgAand8sb7lZpf/QBmOBNdgoG8+QEqQsKZHcf95OOc
	3U1zr7ks6e4SEXcBjplkfd4S0tQzDiPoPpzGn5AMZKeXZRUMw68y2nBrr8Gr3n4WohPb
	PkzhI8foFljaKOp0DVdKPBwsO7UsA2atQ32LuQNOC1uaom4ZN7UVhZdi7ZyEUdWfkPuG
	sJXlTYzw5Uhye712xw80vqvYn8DYNn2h0I6RQYBlorDdMPWtJ7oc2o/qSnRUD2SHHC1E
	T4BMORHw5myd0qhylUgMjLxZ6agaWUG46crwLlhmJGBQk+KvOuuhrqwCDJZF4K2Uthho
	+8OA==
X-Gm-Message-State: AElRT7HZ5opiq2D94E4LJ3Mt06Zbig1nKF6x9d4JJFBPMjGJzec2dFfU
	Mszu2FQ27KULY4gn4dQiNH2Kh7XpayjfORbQQpY=
X-Google-Smtp-Source: AG47ELtGAIRYUnTgnohWHNsZX5J3bKSBwZjZ6FrtBV5eMKWJiHzFDSvsxh/ks8dKPHZSctvMZdCSvCMgmflxZEVYebg=
X-Received: by 2002:a25:d0c6:: with SMTP id
	h189-v6mr11239995ybg.185.1521664084225; 
	Wed, 21 Mar 2018 13:28:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Wed, 21 Mar 2018 13:28:03
	-0700 (PDT)
In-Reply-To: <CAC-M0MJn=c00dS1ZFMSjMzK58grbuMtiPq1PMqW8DUVZHA+pMg@mail.gmail.com>
References: <CAC-M0MJn=c00dS1ZFMSjMzK58grbuMtiPq1PMqW8DUVZHA+pMg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 21 Mar 2018 21:28:03 +0100
Message-ID: <CALbNGRSvE2u_7o=Xq_=Ak+sZu5u6kTZJwh9D_xRGHjPP-F9=Wg@mail.gmail.com>
To: hunter hu <hunterhu.ca@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-xfce question
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
X-List-Received-Date: Wed, 21 Mar 2018 20:28:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 21, 2018 at 8:50 PM, hunter hu <hunterhu.ca@gmail.com> wrote:
> Hi Andreas,
>
> How are you? I have a quick question about meta-xfce layer.
>
> After adding the meta-xfce layer into my Yocto build, building the
> core-image-minimal-xfce image, loading it on my device and booting it up, I
> am still facing a console login window, after logged in with root, I am
> still ended up at the cmd line interface.  Tried startx command, but failed
> too.
>
> How do I make the image boot into the xfce UI desktop env from here?
>
> Thank you for your help,
> Hunter
>
Hi Hunter,

First of all: please no private emails - if somebody else has same
problem, I have to answer again (so I added meta-oe lo CC)

I see the following options:

* enter startxfce from console (disadvantage: you are still root
operator and dbus connections are blocked as root so there might be
issues)
* add a display manager (e.g lxdm) to your image. That does the job
for you to select/login an unprivileged user (you might need to create
one)
* I bet there is some headless manager/script available doing the
(auto)login stuff. I don't know such because I am always using  lxdm
(or sddm from meta-qt5-extra).

Hope that helps

Andreas

