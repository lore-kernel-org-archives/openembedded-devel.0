Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id CA1F1745C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Apr 2018 07:04:20 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id d1so26546103wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2018 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tnzOBsP3ZLKRNcVDThUsfj7gEv5hgFvN+G5RDdqMH+w=;
	b=BNSs9i6mm3ZMwu1QWOutaN5DwkHu2YRc8y9+Bw44QM0yEG3K/DcqgvxYr7ebWpFlHv
	P4yOHij1eeuF9Kjj3NCCIZkhLDhUpj9Rj4dCWFnooNzHz0H9v/Qsw/CjsJIMTLPm7VzU
	Qn2Dmw2tPSeIo6awSE606/Chy0pZl1BygOX8JnI/MmnFqqn2exHj3qgqq8rAWHx0008P
	qdyJoL3yV/y7o5BEm/fn8qTPaa0M7Qh/zIjMkxZOIM5ZDtt+UbYk9E1bYnkwAxiqqGG6
	QES1CIk6OLhUAzMdHixZIfmUo1FP+UA8p40n12w2EuLVXfKxy2D2DOeeczeDFh/YwfKz
	cm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tnzOBsP3ZLKRNcVDThUsfj7gEv5hgFvN+G5RDdqMH+w=;
	b=jGZoF+gUlSy1xT7wBL+Aw+blNCIGsCzmuU8oLxJgpfC7ZhJUDuKGHXq7zG7Y8QtLx8
	fgNcrUTjTY1APUQkJj/RJaeUYFicc6Bq4lwsqHRqLqDvtRAEfjm9UFK1zl9RVLSspxx+
	2FALO2RNKEuJs39vmmjYz2wW1XONDexRkrLrkHfRTyHVNi4zJ9GGFQ76CfjbB7mW6tyV
	yrgr+CaWYkeGW4gFevYuA/2ViRK2mfxmFl35Z/5pmIqDpIU8ecx4x1k31Cz9S2SXlCKr
	zUUWNodl42EtWphKwBdKnLqZL6pvAYxox6HUO4cU+7NFPHAtE2IeeKLLzndwDMI7Q/vH
	0TQA==
X-Gm-Message-State: AElRT7HZl9WBt0fS8MNnmg+D+JCrzkCPQe+SBysyC0BkdouYLMqkvroC
	h43SVYE2qvfjFhrXb8J29Vn7qPPaODGWMciyyXo=
X-Google-Smtp-Source: AIpwx4+KXGloVOrh/TzUxKn6eU0/uP2fWDqGY+XiIthGu4SZm9erfirn9VrAAY9/ioNaJnv2gjRkacfP2ASnouDK5EA=
X-Received: by 10.223.149.70 with SMTP id 64mr14578949wrs.223.1522911861070;
	Thu, 05 Apr 2018 00:04:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Thu, 5 Apr 2018 00:04:20 -0700 (PDT)
In-Reply-To: <CALbNGRTKERBe3VEqgPh6C+h_VqWhwzQu-rOrcvQoDU5pJR3+4Q@mail.gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
	<CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
	<CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
	<CAMKF1sovNddJc9-mbbfjTryenq2W3NUgNumtj56EKyxDSXKzKg@mail.gmail.com>
	<CALbNGRRu2DXsWQXntne6OzT3otujYa+WGb0j++au0R_kXJNktA@mail.gmail.com>
	<CAMKF1soNi0qCc_DiOC-8_oa8TNZo-ssfKw47wPaYesjOAi-Kqw@mail.gmail.com>
	<CALbNGRTKERBe3VEqgPh6C+h_VqWhwzQu-rOrcvQoDU5pJR3+4Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Apr 2018 09:04:20 +0200
Message-ID: <CA+chaQfSNwNGy63TSKPZNwjOsfcjESswAjSdw7HHFAf9kuzXUg@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Apr 2018 07:04:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ARM_INSTRUCTION_SET isn't set to thumb in default config, so even with
thumb in TUNE_FEATURES it's not actually used anywhere in default config.

On Wed, Apr 4, 2018 at 11:55 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Wed, Apr 4, 2018 at 11:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 4, 2018 at 2:26 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> > wrote:
> >>
> >> On Wed, Apr 4, 2018 at 11:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Wed, Apr 4, 2018 at 1:45 PM, Andreas M=C3=BCller <
> schnitzeltony@gmail.com>
> >> > wrote:
> >> >> On Wed, Apr 4, 2018 at 10:25 PM, Andreas M=C3=BCller
> >> >> <schnitzeltony@gmail.com> wrote:
> >> >>> On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com>
> wrote:
> >> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >>>> ---
> >> >>>> v1 -> v2:
> >> >>>> - Drop disabling GI
> >> >>>>
> >> >>>>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
> >> >>>>  1 file changed, 8 insertions(+)
> >> >>>>
> >> >>>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb
> >> >>>> b/recipes-qt/qt5/qtwebkit_git.bb
> >> >>>> index e8c0868..c8e8328 100644
> >> >>>> --- a/recipes-qt/qt5/qtwebkit_git.bb
> >> >>>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> >> >>>> @@ -18,6 +18,14 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-na=
tive
> >> >>>> sqlite3 glib-2.0 libxslt gperf-
> >> >>>>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >> >>>>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >> >>>>
> >> >>>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
> >> >>>> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
> >> >>>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on
> >> >>>> runtime.
> >> >>>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2
> >> >>>> (-mthumb).
> >> >>>> +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
> >> >>>> +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
> >> >>>> +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
> >> >>>> +
> >> >>>>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.1=
0
> >> >>>>  # 5.10.meta-qt5.1
> >> >>>>  SRC_URI +=3D "\
> >> >>>> --
> >> >>>> 2.16.3
> >> >>>>
> >> >>> I've checked the links you are referring: Both
> >> >>>
> >> >>> * are related to webkit and from 2016
> >> >>> * deal with runtime errors not build errors as referred in patch
> >> >>> description.
> >> >>>
> >> >>> So what do you want to fix exactly?
> >> >>>
> >> >> I have looked into this further and found that I stumbled for same
> >> >>
> >> >> commit 511a3764506ce6bbdc5e9441a8f4e9d862ea1102
> >> >> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> >> Date:   Mon Jan 4 11:04:16 2016 +0100
> >> >>
> >> >>     qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fi=
x
> >> >> segfault on armv7
> >> >>
> >> >> Curently recipe has
> >> >>
> >> >> ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >> >> ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >> >>
> >> >> Isn't thumb default any more?
> >> >>
> >> >
> >> > Thumb-1 doesn't really work since it shows up with register allocati=
on
> >> > errors with gcc.
> >> > thumb2 is fine for armv6+
> >> >
> >> Sorry for causing confusion - what I meant: Isn't thumb2 default for
> >> armv7 anymore (particularly RasPI > 1).  If thumb2 is still default
> >> for armv7 there is no need to add it explicitly here. It does not do
> >> any harm but it is not necessary.
> >
> >
> >
> > Distros are free to choose ISA so we really can not rely on the fact wh=
en
> > default tune was to use thumb 2 moreover it=E2=80=99s not default
> >>
> Got it - but with a bit more love on patch description I wouldn't have
> wasted your time:)
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

