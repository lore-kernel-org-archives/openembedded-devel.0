Return-Path: <yann.dirson@blade-group.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 791CF797CF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:43:23 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o21so27728287otb.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x7ZzIb8I2R7/9QHSxHjnlwg4qo7fnjMFJeV08VZJc6Q=;
	b=bQSL+LnGlJ5RRZMgyAE+ez6unCniW7wtWSgE9epQzldhjGYma+AdicTPaicyoi15m6
	GyFmuczbo+WmfkyNqJUX3fI/p+xL0I3Dv45aPGO6Qy5R5vLBTjaugfCznaqCmjcRjA0G
	DPEYAEqndMvOFH52mNXd0b4SSYXxAS8FxHfMhxZzFMGsVnhal6bTx7Rd144rADj3rdZH
	uSv8jsLmlsBWEFwyqc55xeujrWUjREn6DoiiPEaLmvgeMyZajjSuACIBPKIXHW3rbYgu
	6J/rbs9eVDtJk4v9kiRRo3ft9UaKMLKlV34TxUVYQb6DJEAkCMIwugyq7nIG41n0FByg
	CmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x7ZzIb8I2R7/9QHSxHjnlwg4qo7fnjMFJeV08VZJc6Q=;
	b=XzEG3jmij9ojFd3ZNmmuP/abIfIDES55fcu9Lsh1LK4rrX41dhyDR5sWRxRVXIrNmk
	d3HA6GEPCCsVMvVeehj9p2ZFnSi5rBBGxb30yOVMlxHDP+py1HcQUalDab1rrOdUn6a+
	AOPaE22+cUr6Fr5wZFvO79U611nzbSXHBOrI6Zvm1YClJriWo1+jkf4h9iZdDvs7wjpG
	DcDy2DhQAagKj5NaDU7JmpwwQVHFiqDBDLIVm+HfQQ5bjKYl+tdqGGVSCPqUa8meW+Tp
	1iDQ8hk7X5ealMhKuUOTccP43wI9k2ta0ajtK2wLIlW8tJbyYrOw8qkAgNt/PjlnAi+r
	hJhQ==
X-Gm-Message-State: ABuFfojXavZFUur2zDS5KHpT27zEN2TCXg2d10qdwyJLAFs4Xs9T4ZDL
	uir0Bh4KgE7KpV8ZqRGzNoo93g28oBayj40+hU7UaA==
X-Google-Smtp-Source: ACcGV61qckOLNmk6i7LwDkOmFBllIKCKL40b/hxVFNRwaY4lzVaYW1kP6mMEgYKtzp27tGcjk/pswumTG7Ud8r1iFk4=
X-Received: by 2002:a9d:4359:: with SMTP id y25mr18567701oti.80.1539812604398; 
	Wed, 17 Oct 2018 14:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181017205647.25447-1-yann@blade-group.com>
	<58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
	<CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
In-Reply-To: <CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 23:43:12 +0200
Message-ID: <CA+4=imY1Kom-GkBuCPp7CNLjd3havHPGgnpV_tQr1oW5DPm8AQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yann Dirson <yann@blade-group.com>,
	openembedded-devel@lists.openembedded.org, peter.kjellerstedt@axis.com
Subject: Re: [PATCH v3] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 21:43:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While digging around this, I noticed that BLUEZ is set depending on
DISTRO_FEATURES only, wouldn't it make more sense to check
COMBINED_FEATURES instead ?

Le mer. 17 oct. 2018 =C3=A0 23:34, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> I wouldn't say that supporting bluez6 as BLUEZ value before
> RDEPENDS_bluez6 is defined here is really better.
>
> Whole bluez4 support here is a bit useless considering that all bluez4
> related recipes were removed more than a year ago with:
>
> commit 007498ac72e26e9f7064de74f7fe96e91ae6c969
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Mon Jul 24 19:25:35 2017 +0200
>
>     bluez4: remove bluez4-only recipes
>
>
> On Wed, Oct 17, 2018 at 11:20 PM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
>> > -----Original Message-----
>> > From: openembedded-devel-bounces@lists.openembedded.org <
>> openembedded-devel-bounces@lists.openembedded.org> On Behalf Of
>> yann.dirson@blade-group.com
>> > Sent: den 17 oktober 2018 22:57
>> > To: openembedded-devel@lists.openembedded.org
>> > Cc: Yann Dirson <yann@blade-group.com>
>> > Subject: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
>> advertized on distro without bluez* support
>> >
>> > From: Yann Dirson <yann@blade-group.com>
>> >
>> > Otherwise the build fails with:
>> >
>> >   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>> >   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>> >
>> > This restores some truth in the "Otherwise install nothing" comment in
>> > the recipe.
>> >
>> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> > ---
>> >  .../packagegroups/packagegroup-tools-bluetooth.bb            | 5 ++++=
-
>> >  1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> b/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> > index 0ede5e57b..207c7c1ae 100644
>> > --- a/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> > +++ b/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> > @@ -34,4 +34,7 @@ RDEPENDS_bluez5 =3D " \
>> >
>> >  # Install bluez4 tools or bluez5 tools depending on what is specified
>> in the distro.
>> >  # Otherwise install nothing.
>> > -RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
>> > +RDEPENDS_${PN} =3D " \
>> > +    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) =3D=3D 'bluez5=
'
>> else ''} \
>> > +    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) =3D=3D 'bluez4=
'
>> else ''} \
>> > +"
>>
>> You can simplify this (and support any value of ${BLUEZ} just in
>> case someone decides to add bluez6):
>>
>> RDEPENDS_${PN} =3D "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ') else =
''}"
>>
>> Also, the second argument to d.getVar() has defaulted to True for
>> a long time, so no point in specifying it.
>>
>> > --
>> > 2.19.1
>>
>> //Peter
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

--=20
Yann Dirson <yann@blade-group.com>
Blade -- 38 rue du Sentier, 75002 Paris

