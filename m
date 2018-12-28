Return-Path: <athoik@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA416BC98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 18:34:05 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u18so17898393oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uTapjfUP3ovnwJOcPYJqau7ARWOC1QJlbGvr3L05rxI=;
	b=HVRwPG8PSxrQP2fwFGaJbhFNfr97g4VUh3W5stVXdlwcY5V6aNz5YtKy1cYK4+AQQV
	hnx4C75dUjIb3M37ym+kUTtxd/WLbQILifEnv09rpUDMcvJdLNX58pTj1D0szYBE6Gz/
	iG81wrMZ/TqGznTVGQG9V4NiHDsvUcK7pdFc/JOPPZwF+7Tn/IJVPBxT8e2YG2RX6ZNO
	jjj9idw89Vm6WwetYNEgb0MpShghdDMapX+jRFCjkF/dlTh35KamS7JJ94Mg3IP14ba+
	dLxo6EwWoaXpk7qV3Z4BM6DG5kcXL1WRYAAcIs+Tk4hd0arWbjbm6pmzyFQGL4U53PDX
	IVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uTapjfUP3ovnwJOcPYJqau7ARWOC1QJlbGvr3L05rxI=;
	b=mIIWZIhqzzZTVwd+xezZGRMIBO2Adw6Gt8Knla99ZiGEDjDDWPGpPeBB43ZEbg/t4H
	ViqckZVSz5uME7vQDXs4OXwQIyYgKTwLVIh7m+vN+YwYp/7Dvru8XRcfPqiZvnUmgb1s
	pjnK6CuReK4DscyJU34P1JtcQOULsrnD48+1JvXOOdo7gEXPvXIVcxTTBrTCrfRWj16C
	V2yKtAhMG6OuThYXevdUXS4aAHtTse73M6doZpoLrEWFs6zGHB23+NsiQIWXVN+Ih2Ao
	kXmMtsHgOR01tq0CluMq5EzM4FDLmjJz31g4zNZ3kO9RN6ggtXE0lkXQxMnmbzT3+SUT
	aMDQ==
X-Gm-Message-State: AA+aEWYgTYRIykyzUt7Rx//Ev2M4iWZ4oJXY463GgPJNZEZtCDS1ykLd
	/cS/sSejV9mGpDpG2VHCS7/ehA9Z0L7RTyDO7A==
X-Google-Smtp-Source: AFSGD/VBV3pqJImwviicqZEQAHgOilDp3AtbElpzieAbYm6bfvr83Kb1AORPQNntsxLc22ocY1VRBBW1zgm2JrsKNxw=
X-Received: by 2002:aca:6545:: with SMTP id j5mr18633333oiw.70.1546022046070; 
	Fri, 28 Dec 2018 10:34:06 -0800 (PST)
MIME-Version: 1.0
References: <1545978520-30261-1-git-send-email-athoik@gmail.com>
	<CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
	<CANDbA3fwBSiK6zL-+-OH3BNJE0bvD1cWt+HqdmGSofW6-OWbtw@mail.gmail.com>
	<1ceb5a5d-cbd0-3b43-8115-a7502e0e7729@gmail.com>
	<CANDbA3cabGWeE0Zdf2oKmUsSFiM1rbL_efUCYpNEshkNPwq9rQ@mail.gmail.com>
	<CAMKF1sp9UU5wuYpf3RFkBdAVR1G+S6aCQS_uadOOgAkVsuS_FA@mail.gmail.com>
In-Reply-To: <CAMKF1sp9UU5wuYpf3RFkBdAVR1G+S6aCQS_uadOOgAkVsuS_FA@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Fri, 28 Dec 2018 20:33:54 +0200
Message-ID: <CANDbA3fRGRCshSK67KFkU+ZUdkCEumY=Qhrp_KqW6ip46RYz7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] faac: update 1.29 -> 1.29.9.2
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
X-List-Received-Date: Fri, 28 Dec 2018 18:34:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 2018 =CF=
=83=CF=84=CE=B9=CF=82 8:04 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.khem=
@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> On Fri, Dec 28, 2018 at 9:35 AM =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=
=B9=CE=BF=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 <ath=
oik@gmail.com> wrote:
> >
> > =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 2018=
 =CF=83=CF=84=CE=B9=CF=82 7:13 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.=
khem@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> > >
> > >
> > >
> > > On 12/28/18 5:24 AM, =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=CE=BF=
=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 wrote:
> > > > =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA =
2018 =CF=83=CF=84=CE=B9=CF=82 8:51 =CF=80.=CE=BC., =CE=BF/=CE=B7 Khem Raj <=
raj.khem@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> > > >>
> > > >> On Thu, Dec 27, 2018 at 10:32 PM Athanasios Oikonomou <athoik@gmai=
l.com> wrote:
> > > >>>
> > > >>> Remove not required patch and extra EXTRA_OECONF "--without-mp4v2=
".
> > > >>
> > > >> have you build tested this patch on a musl platform ?
> > > >> if not please try one and report back.
> > > >>
> > > >
> > > > bitbake faac was tested using TCLIBC =3D "musl"
> > > > (39e933936e11e186f21dacf4bccedddaa0a122df)
> > > > for machines qemuarm and qemuarm64. Build was successful.
> > > >
> > > > Please let me know if above test case is enough or further actions =
required.
> > > >
> > >
> > > Thanks for confirming.
> > >
> > > >>> Previously not required mp4v2 library was dropped on 1.29.9.2.
> > > >>>
> > > >>> While being there also fix issue with multilib build on aarch64
> > > >>> using FILES_lib${BPN} instead of FILES_lib${PN}.
> > > >>>
> > > >>> WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac:=
 Files/directories were installed but not shipped in any package:
> > > >>>    /usr/lib/libfaac.so.0
> > > >>>    /usr/lib/libfaac.so.0.0.0
> > > >>> Please set FILES such that these items are packaged. Alternativel=
y if they are unneeded, avoid installing them or delete them within do_inst=
all.
> > > >>> lib32-faac: 2 installed and not shipped files. [installed-vs-ship=
ped]
> > > >>>
> > > >>> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> > > >>> ---
> > > >>>   .../faac/{faac_1.29.bb =3D> faac_1.29.9.2.bb}        | 14 ++++-=
------
> > > >>>   ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 -------=
---------------
> > > >>>   2 files changed, 4 insertions(+), 38 deletions(-)
> > > >>>   rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb =
=3D> faac_1.29.9.2.bb} (56%)
> > > >>>   delete mode 100644 meta-multimedia/recipes-multimedia/faac/file=
s/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
> > > >>>
> > > >>> diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb=
 b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > > >>> similarity index 56%
> > > >>> rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> > > >>> rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.b=
b
> > > >>> index d36f2f4..4fc1121 100644
> > > >>> --- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> > > >>> +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > > >>> @@ -1,29 +1,23 @@
> > > >>>   SUMMARY =3D "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AA=
C)"
> > > >>>   SECTION =3D "libs"
> > > >>>   LICENSE =3D "LGPLv2+"
> > > >>> -HOMEPAGE =3D "http://www.audiocoding.com/faac.html"
> > > >>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7=
bb854063f7e7 \
> > > >>>                       file://libfaac/coder.h;beginline=3D5;endlin=
e=3D17;md5=3Dfa1fd6a5fa8cdc877d63a12530d273e0"
> > > >>>
> > > >>> -LICENSE_FLAGS =3D "commercial"
> > > >>> -
> > >
> > > why is this dropped. May be document it in commit message
> > >
> >
> > The faac author didn't provide further information, commit message
> > contains only "removed unused library"
> > (https://github.com/knik0/faac/commit/82bfa6eba494c0374aaef91b61a1876d6=
95d2ead).
> > The bitbake recipe didn't use also that library, it was disabled with
> > EXTRA_OECONF "--without-mp4v2".
> >
> > I can open an issue on github page and ask why it was dropped.
>
> Thats good. My question was also about dropping
> LICENSE_FLAGS =3D "commercial"

You are right, my mistake. I will create v2 ASAP!

