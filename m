Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6ED780F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 10:03:42 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id t36so969979uah.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oKUWovnIrQnZHY30m3wuJRQzDKynQhDBiNkUFlJihAM=;
	b=gxd7fUPKtie7yn4KW7NLSeVvl9ahnINZHIJVMvKwoD4MfNtA3bCriDUw8JdQWyKWcQ
	aeSScHQSyFk+/N9toXfwZ8PJrdQYQZuExnFwyFdsvaqGOpDFZayb29vGed1ePKBwgZzt
	tKRVm/v3pnGHbNTIA8mRbJ+LRkJKI6tYT+P06FMePCXtBc5BqMRgf1mrQd8RVjtFKzQN
	zOy7DrLfgdwGKS+fF3O+21w32dg028kdFwVdGD6rGCNmeNBiDmmyEfAeC1+rsDxf+iv2
	DAdjD90KmJ2/rSc65JsWgXA/HZBekaeMXqHqtbA8jgPx03l5NS5+UnWJwgnhvaBYQqs3
	9lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oKUWovnIrQnZHY30m3wuJRQzDKynQhDBiNkUFlJihAM=;
	b=T5enS3HbBkeJExhx4wQ1liFjc43MtTJmU8oDkebIEyncRq98+vr24cwhIVEhVJxF7o
	gKnpPMwcYxUBjJoX7EUxWA24aUc3PnTcAydoXVH5i7SVLc6fvj3Bd/FWaryxVV18QK4i
	1g9YsMdeVKhySZHaKjjR9nG2TK8IIKXxKqq3ASY1PoiNV3pnLSO+9uuBH0Ty7oduLcFB
	M4bPx06b/rXvplBH5pCyVDBri1a5llf/dzHTxfLbT4lqwNB6YnnmAZUgURfTZOv+iXfr
	CnfPR2bi801f5NiWv3+ErYQUxHVcRIwNsIUYIA9jncXdgTi1bK3MQfLb9DTr3hgVXY6I
	zWlQ==
X-Gm-Message-State: AHPjjUglsZJa9P85VuH+aZYmu5KO3zT+3OBK63Ao7i4U5gZtYkVpLc9Q
	2USy3jdmU9BRlfj1wvi6qtrf5SFJTahdH5pMwww=
X-Google-Smtp-Source: ADKCNb6OEW+Hztfn7Se8odFUY/zjYnBN/+Y/1LMUfQcWmlVTqHhRqhmMDBHSo1MlRpIIAfxmF2vSLgBaE7uZ+m/KJoQ=
X-Received: by 10.176.83.149 with SMTP id k21mr18611852uaa.183.1505469823448; 
	Fri, 15 Sep 2017 03:03:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Fri, 15 Sep 2017 03:03:42 -0700 (PDT)
In-Reply-To: <CALbNGRQdYe0RVE3wT2i6btqCMtHaWzcyyGz+PLYG614-zCb6sw@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
	<CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
	<a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
	<CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
	<CA+chaQdS4NPaF=cqUGR12+Bxt1L2wzThxYZCQFEvK-DxrZ6Dww@mail.gmail.com>
	<CAMKF1srUN0TGPCdYRKuxKhBGDnPNVr3r35=Xb5UoJYuksQSfHA@mail.gmail.com>
	<CALbNGRQdYe0RVE3wT2i6btqCMtHaWzcyyGz+PLYG614-zCb6sw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 15 Sep 2017 12:03:42 +0200
Message-ID: <CA+chaQf1ZsbpeVeW_p+Qm--GueHsQNbijbRYFrWPNhVVGHQW_A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Fri, 15 Sep 2017 10:03:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

most of our prebuilt binaries (built outside OE, sometimes by other
companies) are built against libpng12.

Not because they must be, just because libpng12 was there when they started
building them and nobody revisited that since then. Now I'm trying to get
all those prebuilt binaries to be rebuilt against libpng 1.6 before we
upgrade to Yocto 2.4. If I don't get them soon enough I'll need to keep
libpng12 in one of our internal layer for a bit longer.

So I agree it's outdated waste of time, but unfortunately still mis-used by
some people.

Regards,

On Fri, Sep 15, 2017 at 10:25 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Fri, Sep 15, 2017 at 2:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Sep 14, 2017 at 8:58 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> If LSB isn't goal of oe-core, then why not move all this:
> >>
> >> OE qemux86-64@ ~/build/oe-core/openembedded-core $ find meta -name
> \*lsb\*
> >> meta/recipes-extended/images/core-image-lsb.bb
> >> meta/recipes-extended/images/core-image-lsb-dev.bb
> >> meta/recipes-extended/images/core-image-lsb-sdk.bb
> >> meta/recipes-extended/lsb
> >> meta/recipes-extended/lsb/lsb
> >> meta/recipes-extended/lsb/lsb/lsb_pidofproc
> >> meta/recipes-extended/lsb/lsb/lsb_start_daemon
> >> meta/recipes-extended/lsb/lsb/lsb_log_message
> >> meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-
> with-busybox-head-and-find.patch
> >> meta/recipes-extended/lsb/lsb/lsb_killproc
> >> meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
> >> meta/recipes-extended/lsb/lsbinitscripts
> >> meta/recipes-extended/lsb/lsbtest_1.0.bb
> >> meta/recipes-extended/lsb/lsb_4.1.bb
> >> meta/recipes-extended/lsb/lsbtest
> >> meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> >> meta/lib/oe/__pycache__/lsb.cpython-35.pyc
> >> meta/lib/oe/__pycache__/lsb.cpython-36.pyc
> >> meta/lib/oe/lsb.pyc
> >> meta/lib/oe/lsb.py
> >>
> >> together with libpng12, to some new meta-lsb layer, preferably outside
> >> meta-oe repository as I already have enough of this stuff.
> >>
> >
> > A patch to remove them is good since you already found this out. If
> > they get into a layer of its own
> > can happen later when lsb interested devs chime in.
> >
> >> On Thu, Sep 14, 2017 at 5:03 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >>
> >>> On 14 September 2017 at 14:49, Alexander Kanavin
> <alexander.kanavin@linux.
> >>> intel.com> wrote:
> >>>
> >>>> On 09/14/2017 04:42 PM, Burton, Ross wrote:
> >>>>
> >>>>> On 14 September 2017 at 11:33, Martin Jansa <martin.jansa@gmail.com=
>
> >>>>> wrote:
> >>>>>
> >>>>> LSB compliance isn't a goal of meta-oe as well, otherwise we'd need
> to
> >>>>>> add Qt4 to meta-oe too.
> >>>>>>
> >>>>>>
> >>>>> Touche.
> >>>>>
> >>>>> It still needs to go somewhere though...
> >>>>>
> >>>>
> >>>> How about modifying the LSB tests to make the absence of libpng12 a
> >>>> warning rather than an error?
> >>>>
> >>>
> >>> Then it won't be doing a LSB test...   The LSB is the LSB, we don't
> claim
> >>> to support it, but there's a need for a libpng12 recipe for people wh=
o
> want
> >>> to be close.  Currently it's just this one recipe that I'm aware of
> that
> >>> isn't already in a layer somewhere.
> >>>
> >>> Ross
> >>>
> One aspect I missed in this discussion: I there a recipe around
> depending on libpng12 which cannot use libpng 1.6?
> This is yet another case I get the the feeling that the priorities
> others have do not match mine: My topmost priority is to build working
> images and maintain them to keep them in working condition. Adding and
> maintaining recipes for sake of outdated standards is waste of time -
> at least for me.
>
> Andreas
>

