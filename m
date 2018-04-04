Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9F125746DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:55:49 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id g197-v6so5248089ybf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K5U7pdzg/uj2N2h/b0RdTxFJ59bX/e0UjjlRFJF15U4=;
	b=tNjVpv8yVEKFPoABsEcWLLOQRIROKSH4TxWbRPkgxhq6DtkdrUPhCFEinYWRfDJmhf
	cGV3KSqs0We6KFm61KDSsKxANqPld+uIp+EcwkoYr5m+Yoj+BoovCUX8Aag97zXkwERA
	ueCoW9HfrLC51iFydosqXR4vSBaPF+BCJq25f5IU0wXQQx3vSzGxP8kh+qmkFQ4HK/8P
	OWbv9lvx18S1Kb6/MVkQqCmSrG5amt0su8inrE3yA/qhFLZL5lOAWgo//DlaDGe63SSM
	P0aIr6sPd8zveTFfSo0HWdxu6BKQ2tDPke7DQMCbov5tFxno+6BuMqnlI3LTISh55KSN
	8Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K5U7pdzg/uj2N2h/b0RdTxFJ59bX/e0UjjlRFJF15U4=;
	b=LllguhVIa3fWukFPlLkRVu4B0M4aqaGc7iwpvgBhV7s2AJUPR7RPvBUeBUb/8zqohf
	G4ZtkcDHXJB9Fb7OtiwA0dvkW1FIDJB/EmEtMV+1JK6oJOU7XGxqhiv1oVCAM0XKb4FJ
	cUBicBflYIezx8sf6uSSKhSoammlj3NIT5WC+s2IP9MgNFy7O+qgWFjqWAborGPTuvHQ
	KNgWqTV0NS4Dd1kP+OznZl5IJa3yhNxr4+mjP9DB1o7BU9Rcjv159A1WqiAiXnMO4fNs
	IgYg0OhTkyRLfRaYQ0j126EC1ssvXxygcAKvaXs7EA4omhU0At30HdaaQm9pNlLhtBrT
	Bg2w==
X-Gm-Message-State: ALQs6tBEHCgJnZ0p4rtEvjXkYIGVE6zZs17yhh2zS7rY4FmRN6AiPPT0
	EXgL7dntIlzrilZUN1sKR4NJvfH7E7RCY8V8ZFM=
X-Google-Smtp-Source: AIpwx4/y8jtQL9T79uWtKvVKDmb040UhhuyZBZDepFL7WF/jbOKnAdSuOkk7pb4K1/uk+5GMiNku8sElS/VhrmJW1aA=
X-Received: by 10.129.48.3 with SMTP id w3mr3064846yww.247.1522878950125; Wed,
	04 Apr 2018 14:55:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 14:55:49 -0700 (PDT)
In-Reply-To: <CAMKF1soNi0qCc_DiOC-8_oa8TNZo-ssfKw47wPaYesjOAi-Kqw@mail.gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
	<CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
	<CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
	<CAMKF1sovNddJc9-mbbfjTryenq2W3NUgNumtj56EKyxDSXKzKg@mail.gmail.com>
	<CALbNGRRu2DXsWQXntne6OzT3otujYa+WGb0j++au0R_kXJNktA@mail.gmail.com>
	<CAMKF1soNi0qCc_DiOC-8_oa8TNZo-ssfKw47wPaYesjOAi-Kqw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 23:55:49 +0200
Message-ID: <CALbNGRTKERBe3VEqgPh6C+h_VqWhwzQu-rOrcvQoDU5pJR3+4Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 21:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 11:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 4, 2018 at 2:26 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
> wrote:
>>
>> On Wed, Apr 4, 2018 at 11:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Wed, Apr 4, 2018 at 1:45 PM, Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
>> > wrote:
>> >> On Wed, Apr 4, 2018 at 10:25 PM, Andreas M=C3=BCller
>> >> <schnitzeltony@gmail.com> wrote:
>> >>> On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >>>> ---
>> >>>> v1 -> v2:
>> >>>> - Drop disabling GI
>> >>>>
>> >>>>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
>> >>>>  1 file changed, 8 insertions(+)
>> >>>>
>> >>>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb
>> >>>> b/recipes-qt/qt5/qtwebkit_git.bb
>> >>>> index e8c0868..c8e8328 100644
>> >>>> --- a/recipes-qt/qt5/qtwebkit_git.bb
>> >>>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
>> >>>> @@ -18,6 +18,14 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-nati=
ve
>> >>>> sqlite3 glib-2.0 libxslt gperf-
>> >>>>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>> >>>>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>> >>>>
>> >>>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
>> >>>> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
>> >>>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on
>> >>>> runtime.
>> >>>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2
>> >>>> (-mthumb).
>> >>>> +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
>> >>>> +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
>> >>>> +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
>> >>>> +
>> >>>>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>> >>>>  # 5.10.meta-qt5.1
>> >>>>  SRC_URI +=3D "\
>> >>>> --
>> >>>> 2.16.3
>> >>>>
>> >>> I've checked the links you are referring: Both
>> >>>
>> >>> * are related to webkit and from 2016
>> >>> * deal with runtime errors not build errors as referred in patch
>> >>> description.
>> >>>
>> >>> So what do you want to fix exactly?
>> >>>
>> >> I have looked into this further and found that I stumbled for same
>> >>
>> >> commit 511a3764506ce6bbdc5e9441a8f4e9d862ea1102
>> >> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >> Date:   Mon Jan 4 11:04:16 2016 +0100
>> >>
>> >>     qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix
>> >> segfault on armv7
>> >>
>> >> Curently recipe has
>> >>
>> >> ARM_INSTRUCTION_SET_armv4 =3D "arm"
>> >> ARM_INSTRUCTION_SET_armv5 =3D "arm"
>> >>
>> >> Isn't thumb default any more?
>> >>
>> >
>> > Thumb-1 doesn't really work since it shows up with register allocation
>> > errors with gcc.
>> > thumb2 is fine for armv6+
>> >
>> Sorry for causing confusion - what I meant: Isn't thumb2 default for
>> armv7 anymore (particularly RasPI > 1).  If thumb2 is still default
>> for armv7 there is no need to add it explicitly here. It does not do
>> any harm but it is not necessary.
>
>
>
> Distros are free to choose ISA so we really can not rely on the fact when
> default tune was to use thumb 2 moreover it=E2=80=99s not default
>>
Got it - but with a bit more love on patch description I wouldn't have
wasted your time:)

Andreas

