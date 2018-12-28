Return-Path: <athoik@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id B9F746C4E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 17:35:33 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w13so17799387oiw.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NpMy9RKV72fG4RRrpZ1dbZn5WgnN0Y0LjAd5J8CnoNU=;
	b=EiK10+7C5N7s4EDsX8tsOdfIjsSeQaoGJCYtxALF2styJnoLPqK096MmOElqcC33a+
	GizK7tUfJNjl/5VQKhLETkgfHK1+YeJRxUq6t/EL5CZ/k5pZI/9IJY7hhQc8xKHM/pOE
	9wLbcD9QijKR83dcuNl9dMTDAufIa479kl7VGFn43zYksq38PDNPFuRMYJ1SMBDo8iWX
	pQgYxsn3sWln6NjCps9cevtixnN/XGMmTW/m7r2dEwh8pu6oYH2xPJ9ebtwEMvQzsxTZ
	6skB4N3oYQQyJaI1JMv8ov1ClcrpuDDFhDLQPfzFyfrmsM2T/d8IV6IKw0Q4LW0Wbgw2
	s3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NpMy9RKV72fG4RRrpZ1dbZn5WgnN0Y0LjAd5J8CnoNU=;
	b=KKWd1jrRC5ys99r9D//cJC/qH+xBSnGE3jDIQPhvRISFwP2dZ5mLg2JBAb2PLROBqM
	GFSERfLYwne5CStfcSUMciy8ChvUbuCJdNXxTeBTqR5462ECqqjljL41r/50X29aANMp
	Cr1wMidHCns9VdsZjXKm9PZKIcB/bxF3DpRbSnIQbtYgWHXO7Bh8wel2qDcup9I7QeT1
	gf5kSeQD6i0NCKal+Fo6WFH9pZ7Bqx5TxwHrfKQSaQeHAHD9/saNL3qswhbG436gMrOW
	uTxVhmlvFSgnwKRtOLEXnUkVrO03gsixSqZyTcB5/ww0QVMxVJggYx1F0NZPJwop2WU9
	qDjA==
X-Gm-Message-State: AA+aEWbDko+8+fzkW73dWHq1iiZweO8EUEkLYF0PJPwp3p6dLE3miMLC
	+9Kuc/Y29UwO3/mODafCFmtccnkF3h6bChZmcw==
X-Google-Smtp-Source: ALg8bN7VfIMtVL0jyZo2yLVsmEZpsCRyIs2ikDpjiSSuHXKElBsRvGgdCIrwQwKw+KN2HnPjJpgn2ltBiO6YVPXMQ2k=
X-Received: by 2002:aca:1e17:: with SMTP id m23mr18793445oic.332.1546018534381;
	Fri, 28 Dec 2018 09:35:34 -0800 (PST)
MIME-Version: 1.0
References: <1545978520-30261-1-git-send-email-athoik@gmail.com>
	<CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
	<CANDbA3fwBSiK6zL-+-OH3BNJE0bvD1cWt+HqdmGSofW6-OWbtw@mail.gmail.com>
	<1ceb5a5d-cbd0-3b43-8115-a7502e0e7729@gmail.com>
In-Reply-To: <1ceb5a5d-cbd0-3b43-8115-a7502e0e7729@gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Fri, 28 Dec 2018 19:35:23 +0200
Message-ID: <CANDbA3cabGWeE0Zdf2oKmUsSFiM1rbL_efUCYpNEshkNPwq9rQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Dec 2018 17:35:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 2018 =CF=
=83=CF=84=CE=B9=CF=82 7:13 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.khem=
@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
>
>
> On 12/28/18 5:24 AM, =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=CE=BF=CF=
=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 wrote:
> > =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 2018=
 =CF=83=CF=84=CE=B9=CF=82 8:51 =CF=80.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.=
khem@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> >>
> >> On Thu, Dec 27, 2018 at 10:32 PM Athanasios Oikonomou <athoik@gmail.co=
m> wrote:
> >>>
> >>> Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".
> >>
> >> have you build tested this patch on a musl platform ?
> >> if not please try one and report back.
> >>
> >
> > bitbake faac was tested using TCLIBC =3D "musl"
> > (39e933936e11e186f21dacf4bccedddaa0a122df)
> > for machines qemuarm and qemuarm64. Build was successful.
> >
> > Please let me know if above test case is enough or further actions requ=
ired.
> >
>
> Thanks for confirming.
>
> >>> Previously not required mp4v2 library was dropped on 1.29.9.2.
> >>>
> >>> While being there also fix issue with multilib build on aarch64
> >>> using FILES_lib${BPN} instead of FILES_lib${PN}.
> >>>
> >>> WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: Fil=
es/directories were installed but not shipped in any package:
> >>>    /usr/lib/libfaac.so.0
> >>>    /usr/lib/libfaac.so.0.0.0
> >>> Please set FILES such that these items are packaged. Alternatively if=
 they are unneeded, avoid installing them or delete them within do_install.
> >>> lib32-faac: 2 installed and not shipped files. [installed-vs-shipped]
> >>>
> >>> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> >>> ---
> >>>   .../faac/{faac_1.29.bb =3D> faac_1.29.9.2.bb}        | 14 ++++-----=
--
> >>>   ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 -----------=
-----------
> >>>   2 files changed, 4 insertions(+), 38 deletions(-)
> >>>   rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb =3D> f=
aac_1.29.9.2.bb} (56%)
> >>>   delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/00=
01-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
> >>>
> >>> diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/m=
eta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> >>> similarity index 56%
> >>> rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> >>> rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> >>> index d36f2f4..4fc1121 100644
> >>> --- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> >>> +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> >>> @@ -1,29 +1,23 @@
> >>>   SUMMARY =3D "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
> >>>   SECTION =3D "libs"
> >>>   LICENSE =3D "LGPLv2+"
> >>> -HOMEPAGE =3D "http://www.audiocoding.com/faac.html"
> >>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb85=
4063f7e7 \
> >>>                       file://libfaac/coder.h;beginline=3D5;endline=3D=
17;md5=3Dfa1fd6a5fa8cdc877d63a12530d273e0"
> >>>
> >>> -LICENSE_FLAGS =3D "commercial"
> >>> -
>
> why is this dropped. May be document it in commit message
>

The faac author didn't provide further information, commit message
contains only "removed unused library"
(https://github.com/knik0/faac/commit/82bfa6eba494c0374aaef91b61a1876d695d2=
ead).
The bitbake recipe didn't use also that library, it was disabled with
EXTRA_OECONF "--without-mp4v2".

I can open an issue on github page and ask why it was dropped.

