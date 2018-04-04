Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1831974D3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:35:07 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id v18-v6so14014366ply.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lTU/lc843eTDAZHbbY27g9u6u+QMMU8nzeCA0FfLukc=;
	b=rOTHUyQXG9EdlgANZgvlrkbz6BY2kOKy+46lVco7hMq5IOIwGFZ6OKs7Pco/bX0gEQ
	RYRCb363x5nwPEQYNxQ9qrzSbTaHQ5+FyMOb9OHzGno2DRBsL9oOXgbTMqxDwTqArX21
	1KaP60gtnqUjxnrpQcuUQePMY99/wj3iygnLZMvyarhymVlU6O+3xmp3f8r9ygZBtu5x
	y1fLhUT2p7lYmPFf9fy97uyvcfwuQNqd//PVcF9oj0eguEAJ88Thqrv1pEnxHsT8/Al6
	kRf8ntUtYFvIMU/JGqJHCcPBa2RBG0x869+xTzZGE+kdykajvQmapqQxgLetP91zkpZu
	Rtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lTU/lc843eTDAZHbbY27g9u6u+QMMU8nzeCA0FfLukc=;
	b=k6jP8e306IaZmGGGV3RJ4K3x8Y+DaUktcYCtThUDvxmvIn1TKnzi+O/Ks8mCWwMBis
	N8zseZ7nGjnUgScwoNRNhnrGJgF7FtdjpdfgT43QsMLEtyOtcBx6zivVHoPTXh7j/l44
	5x1uoxP8+vaivYi+e6Oh1H1oeXa9HfmNu0sT2B833ZsCMfv5O7btd8LdHeMncrHSXjhK
	usFGBftFMpNinPpZ39OpNtol7AhS0IOIKlpBN9KbCBLxEXFn2HKav/XjO3E9oid0lGR9
	3nosYZp1MxxMaThfzq/RF6wuBFP48ajCN64xfLOJI9tz+qGK2EF0PvLQ6dTW4X8jrz93
	jBbA==
X-Gm-Message-State: AElRT7ELRYB8Ab0L3m7YydRGgd2Y5ylO1Wk2vEHSmOoXTfHosDJfKe5C
	hCVBu3HcKugArppK75rFozVbYQ7QUfKMDuZ/abM=
X-Google-Smtp-Source: AIpwx48VahoRl1oHNJFvp0LEprNnSKwCp+UiAjQEcay7gljlVYtqy2pO6dFPtQIiR2GRCY7tlPl0E3uhE0U8kerjsrw=
X-Received: by 2002:a17:902:244:: with SMTP id
	62-v6mr11400372plc.125.1522877708743; 
	Wed, 04 Apr 2018 14:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
	<CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
	<CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
	<CAMKF1sovNddJc9-mbbfjTryenq2W3NUgNumtj56EKyxDSXKzKg@mail.gmail.com>
	<CALbNGRRu2DXsWQXntne6OzT3otujYa+WGb0j++au0R_kXJNktA@mail.gmail.com>
In-Reply-To: <CALbNGRRu2DXsWQXntne6OzT3otujYa+WGb0j++au0R_kXJNktA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 04 Apr 2018 21:34:57 +0000
Message-ID: <CAMKF1soNi0qCc_DiOC-8_oa8TNZo-ssfKw47wPaYesjOAi-Kqw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2 2/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Wed, 04 Apr 2018 21:35:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 2:26 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Wed, Apr 4, 2018 at 11:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Apr 4, 2018 at 1:45 PM, Andreas M=C3=BCller <schnitzeltony@gmai=
l.com>
> wrote:
> >> On Wed, Apr 4, 2018 at 10:25 PM, Andreas M=C3=BCller <
> schnitzeltony@gmail.com> wrote:
> >>> On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>> ---
> >>>> v1 -> v2:
> >>>> - Drop disabling GI
> >>>>
> >>>>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
> >>>>  1 file changed, 8 insertions(+)
> >>>>
> >>>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/
> qtwebkit_git.bb
> >>>> index e8c0868..c8e8328 100644
> >>>> --- a/recipes-qt/qt5/qtwebkit_git.bb
> >>>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> >>>> @@ -18,6 +18,14 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-nativ=
e
> sqlite3 glib-2.0 libxslt gperf-
> >>>>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >>>>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >>>>
> >>>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
> >>>> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
> >>>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtim=
e.
> >>>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2
> (-mthumb).
> >>>> +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
> >>>> +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
> >>>> +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
> >>>> +
> >>>>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
> >>>>  # 5.10.meta-qt5.1
> >>>>  SRC_URI +=3D "\
> >>>> --
> >>>> 2.16.3
> >>>>
> >>> I've checked the links you are referring: Both
> >>>
> >>> * are related to webkit and from 2016
> >>> * deal with runtime errors not build errors as referred in patch
> description.
> >>>
> >>> So what do you want to fix exactly?
> >>>
> >> I have looked into this further and found that I stumbled for same
> >>
> >> commit 511a3764506ce6bbdc5e9441a8f4e9d862ea1102
> >> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> Date:   Mon Jan 4 11:04:16 2016 +0100
> >>
> >>     qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix
> >> segfault on armv7
> >>
> >> Curently recipe has
> >>
> >> ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >> ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >>
> >> Isn't thumb default any more?
> >>
> >
> > Thumb-1 doesn't really work since it shows up with register allocation
> > errors with gcc.
> > thumb2 is fine for armv6+
> >
> Sorry for causing confusion - what I meant: Isn't thumb2 default for
> armv7 anymore (particularly RasPI > 1).  If thumb2 is still default
> for armv7 there is no need to add it explicitly here. It does not do
> any harm but it is not necessary.



Distros are free to choose ISA so we really can not rely on the fact when
default tune was to use thumb 2 moreover it=E2=80=99s not default

>
>
> Andreas
>

