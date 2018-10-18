Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 99E207980A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:33:01 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l58so29255379otd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QjVSfxoSBYybRAmbPc8FISUwFKiN53C4VB64QHcjByQ=;
	b=d9N3BIVV9rVN0CyYlST4y4UX3Xz48EtHkV+kesUlczsxT9y7DB23T28GXWxbl8bn7O
	kMarYPivJMOfsPpcLLyi2HjV5SixClB0E9K8BPJv8wNWeyt8BYKZsjQk1pyzVgKHXEVj
	G5ktBLBl05hKUY3L6/3VFpg38Ie+f+OuWOk/2NJfNlgCgz7/Aqilp+JZraJQgyZ4D/7p
	AD8zZv9BbMjJlh3Y7OAxd3ACvQJc1YAcC+GtpBXsTsucEsWUAEmOkkHcnu4p6AyyMS40
	nFlN3kGlXcn/BQqd9qr38F4IF6I+FAFBvz9g/xHzCgAyMORlI8ACCOvbBhmKre1YHD+U
	LGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QjVSfxoSBYybRAmbPc8FISUwFKiN53C4VB64QHcjByQ=;
	b=i6d1MuWF8UZUptsguOuYO8BmhVMouqZ6a/2tojvKFXSSXbJG2Bs16s7h59tFIeKwov
	73wLQSm0mWKDtJNT90D22TQHNvti9ig128/Wi4PC7fHd5l2FlmFjGzJjf7a4EyKk8ep5
	6h08/Plen83S0DS982nGEinpig28rWYMKzgMuh6g1texUx3tpPy2A8F0E2fAoilEU5mE
	HiaAxt7ictCthTOheOEdvlNCdiyMyNdFj1vVx28TXvdsoXj9oBw1zwMH2AbKYgeKr9yS
	ZJRkGZ186HnFvNGM8PRe2LFXpQcvu2Zxk1+IsPvYmOtQCq3K185MThXepuILa3i9K2nH
	X8tA==
X-Gm-Message-State: ABuFfoikGW0sDYXbR0TVNSbXl+4HcX7RRUHkSFfeZBaIyNWwjoP9kAXD
	AmqebRLQxlrwyzVPyOvDRySeV3lxg3V24XPUWAw=
X-Google-Smtp-Source: ACcGV63CPozHHXnityMTGXiz++C5gimrJCEUoEZZbG1r5MfsoLZSORgLvYB8aSvtRZoa5mzwCWUigzk8a0jWmCipaH0=
X-Received: by 2002:a9d:2372:: with SMTP id k47mr18115451otd.98.1539858782530; 
	Thu, 18 Oct 2018 03:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
	<CABPh3UO90oG9asuYcmbi6BsTg84Y1oSrfQFu+C16x-=rEuBfJA@mail.gmail.com>
In-Reply-To: <CABPh3UO90oG9asuYcmbi6BsTg84Y1oSrfQFu+C16x-=rEuBfJA@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 18 Oct 2018 11:32:51 +0100
Message-ID: <CABPh3UOQCLzXK4CTGsQQw1YH_buPr=guuW+x6axW6nn_eCAw9A@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 18 Oct 2018 10:33:01 -0000
Content-Type: text/plain; charset="UTF-8"

Another thing:

previously
ALTERNATIVE_PRIORITY[reboot] = "100"
was
ALTERNATIVE_PRIORITY[reboot] = "300"

diff of the relevant part:

539,566c559
< # TODO:
< # u-a for runlevel and telinit
<
< ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel
resolv-conf"
<
< ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
< ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
< ALTERNATIVE_PRIORITY[init] ?= "300"
<
< ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
< ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
< ALTERNATIVE_PRIORITY[halt] ?= "300"
<
< ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
< ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
< ALTERNATIVE_PRIORITY[reboot] ?= "300"
<
< ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
< ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
< ALTERNATIVE_PRIORITY[shutdown] ?= "300"
<
< ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
< ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
< ALTERNATIVE_PRIORITY[poweroff] ?= "300"
<
< ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
< ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
< ALTERNATIVE_PRIORITY[runlevel] ?= "300"
---
> ALTERNATIVE_${PN} = "resolv-conf reboot"
570a564,566
>
> ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
> ALTERNATIVE_PRIORITY[reboot] = "100"

On Thu, 18 Oct 2018 at 11:29, nick83ola <nick83ola@gmail.com> wrote:

> Hi Chen,
>
> regarding this issue:
>
> >On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
> >> On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen at windriver.com> wrote:
> >>> Upgrade systemd to 239.
> >>>
> >>> 3. update-alternatives changes
> >>>    The utilities like shutdown, poweroff, etc. are now created as symlinks
> >>>    at do_install. So there's no need to use update-alternatives mechanism
> >>>    anymore to create the symlinks now. In addtion, I don't think we now
> >>>    support multiple init systems at one running system, so there's really
> >>>    no need to use update-alternatives mechanism here.
> >> I noticed that reboot stopped working locally as I had busybox
> >> installed together with systemd, and the busybox version ended up
> >> being used as it was provided via update-alternatives.
> >>
> >> Looking for possible similar broken links, I found that
> >> update-alternatives ended up pointing reboot, halt and poweroff to the
> >> busybox binary instead of systemctl. Should we revert the changes and
> >> bring back update-alternatives for them?
> >>
> >> Thanks,
> >
> >I think the correct direction to fix this problem is to make busybox
> >only provide init utilities (reboot, halt, etc) when init manager is set
> >to busybox.
> >
> >We current have in busybox recipe's SRC_URI:
> >            ${@["",
> >"file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
> >'busybox')]} \
> >
> >I think the init utilities should be moved to init.cfg.
> >
> >Please check my logic to see if you can agree with it.
> >We have two facts here.
> >1. Init utilities (reboot, halt, etc.) are tightly bond to the specific
> >implementation of PID 1.
> >2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
> >So we can conclude from the above two facts that it does not make much
> >sense to have multiple providers of init utilities while we only allow
> >one PID 1 provider on image.
> >
> >After all, we are using update-*alternatives*, things that this
> >mechanism manages are supposed to generally serve as alternatives to
> >each other.
> >
> >Best Regards,
> >Chen Qi
>
> Can you elaborate more what we need to patch?
>
> because this update break all the systemd based systems...
>
> Also there's a following patch that add back an alternative for busybox
>
> 8421aede4fdd5132eb953a59099670f9ab1f7f01  systemd: add ALTERNATIVE for reboot
>
> What's the more correct way to do fix this?
>
> Best Regards
>
> Nicola Lunghi
>
>

