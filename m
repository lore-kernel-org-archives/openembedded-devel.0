Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id A643860053
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 18:04:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v11so24098574qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Dvq3SunGzfv73MoV8vZb0Ec4KXIeVXcgRRXMCxm7um8=;
	b=Uahmyg4VRlk/O5EJLUzgLA80SpmoQ9Y2CljGLEoed4ZWFphBCNcgwDawhp2Zh46C/B
	mPaf62Dc0Ts/dNJrAkaiS/1136Q3K7Mlx+6EejWW0aKQ27x+mkXgKWZ2y9YVFvNv0w4D
	TeVMd/qotvPAGgjCMirZk1h8Bo3MPTjdkP83dQk/QbUtm0yByUB6j3ywBbT3wm5UPj+2
	op0eiNda0Dp23uxM+bo0eJW0ezySLNkySlGy8u+SAnIlJwNZlG3JLiThy/7H/EqahUnm
	vaWa4YyEbZKo0xuXhqUJ0o1x8qXRHgh3k9jMn6M4h8VNsHr0pavTd/3elwevQV/aH9/g
	IW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Dvq3SunGzfv73MoV8vZb0Ec4KXIeVXcgRRXMCxm7um8=;
	b=l3uuwluUYa376VEdTf+dCy6N5Qu/Swt0F17DrOcZUNnhZiMECUf3gkLyC4TBf5ODON
	v1+BUsq7KdWoX9AwN34znu7FfjMbzGe9bIWSzq7616MIIqDNgymz7LIJgpq+DP0WoIgX
	txAY+4td9y0si/vZePaUQaCkSHRYb5qQNXGQ7JF1pnOueYouzK3FVhs6BXVIZEFNcIWP
	hYak+IU72paJ2ORj9abIGb9v8tsqKQRlg2IM8Zq1YK8oHW9gcIgXJ8Nc6YYAJMMVP2Ny
	8KtZ987w8vaU0xuY9CeTH5RbdtVmMR8mAhcBIPSg4LJgCef0ZmEHJvizN+gXW/SX8S7m
	oipg==
X-Gm-Message-State: AJcUukcTwXS3iZLmG2vSkcKWZ+arXVunTmuA5kxslIokl//Prbsr3Xcv
	j8AZEfoOPFWTL5eUoCPwN2IgYc9dW/kkOvGCp+E=
X-Google-Smtp-Source: AFSGD/UWuJ3NuAaeJEpeY3uVQsXyrHFrKHZu151AdLS89iL5pgbLsIi8UUWwYToIqrz7k0oIgw4SeHrl9YzUAfhz92Q=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr27117295qte.29.1546020257172; 
	Fri, 28 Dec 2018 10:04:17 -0800 (PST)
MIME-Version: 1.0
References: <1545978520-30261-1-git-send-email-athoik@gmail.com>
	<CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
	<CANDbA3fwBSiK6zL-+-OH3BNJE0bvD1cWt+HqdmGSofW6-OWbtw@mail.gmail.com>
	<1ceb5a5d-cbd0-3b43-8115-a7502e0e7729@gmail.com>
	<CANDbA3cabGWeE0Zdf2oKmUsSFiM1rbL_efUCYpNEshkNPwq9rQ@mail.gmail.com>
In-Reply-To: <CANDbA3cabGWeE0Zdf2oKmUsSFiM1rbL_efUCYpNEshkNPwq9rQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Dec 2018 10:03:51 -0800
Message-ID: <CAMKF1sp9UU5wuYpf3RFkBdAVR1G+S6aCQS_uadOOgAkVsuS_FA@mail.gmail.com>
To: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
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
X-List-Received-Date: Fri, 28 Dec 2018 18:04:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 28, 2018 at 9:35 AM =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=
=CE=BF=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 <athoik=
@gmail.com> wrote:
>
> =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 2018 =
=CF=83=CF=84=CE=B9=CF=82 7:13 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.k=
hem@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> >
> >
> >
> > On 12/28/18 5:24 AM, =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=CE=BF=
=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 wrote:
> > > =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 20=
18 =CF=83=CF=84=CE=B9=CF=82 8:51 =CF=80.=CE=BC., =CE=BF/=CE=B7 Khem Raj <ra=
j.khem@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> > >>
> > >> On Thu, Dec 27, 2018 at 10:32 PM Athanasios Oikonomou <athoik@gmail.=
com> wrote:
> > >>>
> > >>> Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".
> > >>
> > >> have you build tested this patch on a musl platform ?
> > >> if not please try one and report back.
> > >>
> > >
> > > bitbake faac was tested using TCLIBC =3D "musl"
> > > (39e933936e11e186f21dacf4bccedddaa0a122df)
> > > for machines qemuarm and qemuarm64. Build was successful.
> > >
> > > Please let me know if above test case is enough or further actions re=
quired.
> > >
> >
> > Thanks for confirming.
> >
> > >>> Previously not required mp4v2 library was dropped on 1.29.9.2.
> > >>>
> > >>> While being there also fix issue with multilib build on aarch64
> > >>> using FILES_lib${BPN} instead of FILES_lib${PN}.
> > >>>
> > >>> WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: F=
iles/directories were installed but not shipped in any package:
> > >>>    /usr/lib/libfaac.so.0
> > >>>    /usr/lib/libfaac.so.0.0.0
> > >>> Please set FILES such that these items are packaged. Alternatively =
if they are unneeded, avoid installing them or delete them within do_instal=
l.
> > >>> lib32-faac: 2 installed and not shipped files. [installed-vs-shippe=
d]
> > >>>
> > >>> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> > >>> ---
> > >>>   .../faac/{faac_1.29.bb =3D> faac_1.29.9.2.bb}        | 14 ++++---=
----
> > >>>   ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 ---------=
-------------
> > >>>   2 files changed, 4 insertions(+), 38 deletions(-)
> > >>>   rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb =3D>=
 faac_1.29.9.2.bb} (56%)
> > >>>   delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/=
0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
> > >>>
> > >>> diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b=
/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > >>> similarity index 56%
> > >>> rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> > >>> rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > >>> index d36f2f4..4fc1121 100644
> > >>> --- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> > >>> +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > >>> @@ -1,29 +1,23 @@
> > >>>   SUMMARY =3D "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)=
"
> > >>>   SECTION =3D "libs"
> > >>>   LICENSE =3D "LGPLv2+"
> > >>> -HOMEPAGE =3D "http://www.audiocoding.com/faac.html"
> > >>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb=
854063f7e7 \
> > >>>                       file://libfaac/coder.h;beginline=3D5;endline=
=3D17;md5=3Dfa1fd6a5fa8cdc877d63a12530d273e0"
> > >>>
> > >>> -LICENSE_FLAGS =3D "commercial"
> > >>> -
> >
> > why is this dropped. May be document it in commit message
> >
>
> The faac author didn't provide further information, commit message
> contains only "removed unused library"
> (https://github.com/knik0/faac/commit/82bfa6eba494c0374aaef91b61a1876d695=
d2ead).
> The bitbake recipe didn't use also that library, it was disabled with
> EXTRA_OECONF "--without-mp4v2".
>
> I can open an issue on github page and ask why it was dropped.

Thats good. My question was also about dropping
LICENSE_FLAGS =3D "commercial"

