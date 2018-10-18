Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3441679C6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:55:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 189-v6so4983433wmw.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zyp2GMvyESHpikJrwMeYXtntOqRgUjpbt4wZ48GywbI=;
	b=QjCtGlMmILIaFRjRvMy7o+3JkrQe8U2bAoS2DJQS/NSZiZvb+Pkf9wRgZeqV88wsxn
	CLjydwVOIBs8DfRez/5rFNfzQ8bNLAv7hRYqG+IUf+5YpoGwfvUnw6dCB1WG3Vu1rfgi
	etCGvTDh5Um9K6WyFoSTApyj0azIE/a/j3KbGY49M7rB5J34FxRfEqkqibV2VC5y1ZxE
	YpNzy5+RSMXbNUgSIyp1x21DgV4C556hARBfAImnmJiy0w7epoGa3tnkQbc0UeqVPsyg
	piPvQhvgMB68TO/5pOzmGUgb1slUL2OK9Ec3l7Fqo6IeKAUBe3NY00imFVAatENlABAb
	1D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zyp2GMvyESHpikJrwMeYXtntOqRgUjpbt4wZ48GywbI=;
	b=OmsYjnsvR/3CerqVSeJt7v+moTV+LcxiVSW/JftGbcJbkyuoZpEiSaXwNHvq8ZdSc4
	FIah8pQ+/OxwN9IbWtRuG5E7Fy3/6sessPT7HTHc49E3L/dtyWqHR4qFQwpM7mHczI2V
	7JyLzMquthxQHkgrVeir5pOS0OXTLfEVakQS5nSDz35SGtvl9AXIuCtppdn5PalnujBn
	0ROU9ZWV0deCymOS+dGAtLHnvba7LIkheFz8af+2jcFIlNKH2W1AUoJyjbm+CKc9/XB9
	2NmMKJA9SRh3FqVli34M2wl0V/t5JxQYZ23BjAm1Q5LQr8Kwn2dbbJVEFt3r1RZItjwi
	1ajg==
X-Gm-Message-State: ABuFfogNje5dOgW1JwW/g1BmC9CQg53YlqktybITLUMnV1iozRddGlwW
	coNk4rg7ryS1KmC9QsMx0/EllPAZ1Cpj/DqJQnQ=
X-Google-Smtp-Source: ACcGV60+e6S3LNhzZlPAG/75perWFl+zA7QUZrnfCufWLaeThfzJYOe5o2OjfF/8l7M+24B/Yf8oa4VgTsaIbBqfqeA=
X-Received: by 2002:a1c:7c07:: with SMTP id x7-v6mr6823696wmc.32.1539860142492;
	Thu, 18 Oct 2018 03:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
	<CABPh3UO90oG9asuYcmbi6BsTg84Y1oSrfQFu+C16x-=rEuBfJA@mail.gmail.com>
	<CABPh3UOQCLzXK4CTGsQQw1YH_buPr=guuW+x6axW6nn_eCAw9A@mail.gmail.com>
In-Reply-To: <CABPh3UOQCLzXK4CTGsQQw1YH_buPr=guuW+x6axW6nn_eCAw9A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Oct 2018 12:55:32 +0200
Message-ID: <CA+chaQfcYFFVBMSC4D5yAeHy8_wviYy40C9vT1QHDfEsPfKLbg@mail.gmail.com>
To: nick83ola@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 18 Oct 2018 10:55:42 -0000
Content-Type: text/plain; charset="UTF-8"

Using u-a for the systemd symlinks to systemctl seems like best solution to
me, I've already suggested it in:
http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156597.html

On Thu, Oct 18, 2018 at 12:33 PM nick83ola <nick83ola@gmail.com> wrote:

> Another thing:
>
> previously
> ALTERNATIVE_PRIORITY[reboot] = "100"
> was
> ALTERNATIVE_PRIORITY[reboot] = "300"
>
> diff of the relevant part:
>
> 539,566c559
> < # TODO:
> < # u-a for runlevel and telinit
> <
> < ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel
> resolv-conf"
> <
> < ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
> < ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
> < ALTERNATIVE_PRIORITY[init] ?= "300"
> <
> < ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
> < ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
> < ALTERNATIVE_PRIORITY[halt] ?= "300"
> <
> < ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
> < ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
> < ALTERNATIVE_PRIORITY[reboot] ?= "300"
> <
> < ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
> < ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
> < ALTERNATIVE_PRIORITY[shutdown] ?= "300"
> <
> < ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
> < ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
> < ALTERNATIVE_PRIORITY[poweroff] ?= "300"
> <
> < ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
> < ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
> < ALTERNATIVE_PRIORITY[runlevel] ?= "300"
> ---
> > ALTERNATIVE_${PN} = "resolv-conf reboot"
> 570a564,566
> >
> > ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
> > ALTERNATIVE_PRIORITY[reboot] = "100"
>
> On Thu, 18 Oct 2018 at 11:29, nick83ola <nick83ola@gmail.com> wrote:
>
> > Hi Chen,
> >
> > regarding this issue:
> >
> > >On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
> > >> On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen at windriver.com>
> wrote:
> > >>> Upgrade systemd to 239.
> > >>>
> > >>> 3. update-alternatives changes
> > >>>    The utilities like shutdown, poweroff, etc. are now created as
> symlinks
> > >>>    at do_install. So there's no need to use update-alternatives
> mechanism
> > >>>    anymore to create the symlinks now. In addtion, I don't think we
> now
> > >>>    support multiple init systems at one running system, so there's
> really
> > >>>    no need to use update-alternatives mechanism here.
> > >> I noticed that reboot stopped working locally as I had busybox
> > >> installed together with systemd, and the busybox version ended up
> > >> being used as it was provided via update-alternatives.
> > >>
> > >> Looking for possible similar broken links, I found that
> > >> update-alternatives ended up pointing reboot, halt and poweroff to the
> > >> busybox binary instead of systemctl. Should we revert the changes and
> > >> bring back update-alternatives for them?
> > >>
> > >> Thanks,
> > >
> > >I think the correct direction to fix this problem is to make busybox
> > >only provide init utilities (reboot, halt, etc) when init manager is set
> > >to busybox.
> > >
> > >We current have in busybox recipe's SRC_URI:
> > >            ${@["",
> > >"file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
> > >'busybox')]} \
> > >
> > >I think the init utilities should be moved to init.cfg.
> > >
> > >Please check my logic to see if you can agree with it.
> > >We have two facts here.
> > >1. Init utilities (reboot, halt, etc.) are tightly bond to the specific
> > >implementation of PID 1.
> > >2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
> > >So we can conclude from the above two facts that it does not make much
> > >sense to have multiple providers of init utilities while we only allow
> > >one PID 1 provider on image.
> > >
> > >After all, we are using update-*alternatives*, things that this
> > >mechanism manages are supposed to generally serve as alternatives to
> > >each other.
> > >
> > >Best Regards,
> > >Chen Qi
> >
> > Can you elaborate more what we need to patch?
> >
> > because this update break all the systemd based systems...
> >
> > Also there's a following patch that add back an alternative for busybox
> >
> > 8421aede4fdd5132eb953a59099670f9ab1f7f01  systemd: add ALTERNATIVE for
> reboot
> >
> > What's the more correct way to do fix this?
> >
> > Best Regards
> >
> > Nicola Lunghi
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

