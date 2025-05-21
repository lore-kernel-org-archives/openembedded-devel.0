Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DB1C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 17:51:53 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.5459.1747849905382790249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 10:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FpU6blNf;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2db78ef7f69so3394745fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747849904; x=1748454704; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ar+5Leg8e2VJrwVP7AURSRHZy82Zand5dMLQ3NG6Eg=;
        b=FpU6blNfMimUR9vKDHnDD2MncPnirM55gzXa+o2eg/JpfzDRzU5SSTU87XC+rM8sac
         maRj7tcbPEmExiONmvIT3oRAFmWCunVVfNppHjEBLV3So6bEtoduQ1DbxDzNnrC/2l5q
         FMtuEhnalDm2xF2MWToypWJkR0bwhhiFUokDrBv6gFlkFvzlD03TjtQzJb8zdx3DPB/8
         0FKdatL6lP7zZuYPHG6vj9WvKanS7q/QEkqtyI77eT3hCEXVlymyLucvXYGdXyqCi6h+
         +x/t7wFB4hpGVi5AsT4ydNq/IpNHdDSFsYCzx0fgfvoJGX4YnCXYK4F/fnkYpaI3MiJA
         WERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747849904; x=1748454704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ar+5Leg8e2VJrwVP7AURSRHZy82Zand5dMLQ3NG6Eg=;
        b=B+NJk3nGFbGlw04FjZTGMFsFGsq0tpggv/eItWQ8u5ggr8hj/8vHiAgk/rrbZz+JcB
         uSkbYA0E4pVB71VQ7RAsEeaVWnV3cfvqYqMmfiXexjZDtYG1HTRPsdMZwAbslHOzGYsD
         BlvB1pI/qfEsEBvOFQ9iO/wqsxU/iqALppojiuUZtUjqEHiVlMx7aaHpnC+2I77ztuzY
         Xb6YXvD/r+xGEZhMZ+G8s5aKoyIJoEjvTz1dS1wyu+YUGRW0IJl7NV34jAgKLlTDmOrX
         +gi8FvILidlg+v91bm9RobdzlOeLtgnSUAkyebBE9j9YIsvKe5gxwOLy0NG9ZeaFx5Z5
         xH/w==
X-Forwarded-Encrypted: i=1; AJvYcCX8Rov6cEe7bCvWgtktS/HNGXBdbiemlKSwjZiYrVpPKcDh6kr0Z/1/zYE2qACWUYvgAtfBN9DfiFD7ZJk8ns+Tyzc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/zVmR3q0TGqMvkT9SFqBjkIpVeAoeshnhovqFe4bbF+zyZH4u
	TOV+yxByxIu6XQH8raIoFu/ETsBeMtcturudFzE/4ve1d8JUzWLR2tqA1hOFtqBTUMOtg8MbMQj
	mBfL1fvwNbKRmxdFg+O2gGNZhvsWumdW20kRw
X-Gm-Gg: ASbGnctOFtFb7F1tnHPbI03ktvdT+bg32G4j47cCitRbxDE3P4zNM3dQkkn30D3BuM0
	F4BcxvBAQOXz9Za5QV00DCPqkROxsyUpEHXYSLdzkrVaucZmiNvnID1acfHncVBrhy4xGUvGWJK
	eh6VOJUIA8VQQA+K/FvyIbI0UyHt8KvbI=
X-Google-Smtp-Source: AGHT+IHHsUyx/g3VKDdY2YYWtcsCAq1c2w5sh7K4B25awq3W3OdSvAamYvEwd8ZSjR1cv2BrnLIMQ5hgaZu06BSBiAw=
X-Received: by 2002:a05:6870:e804:b0:29e:48d6:2e62 with SMTP id
 586e51a60fabf-2e3c1c2e048mr13879745fac.9.1747849904574; Wed, 21 May 2025
 10:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250519141525.3708957-1-jeroen@myspectrum.nl>
 <20250519141525.3708957-2-jeroen@myspectrum.nl> <CAMKF1sr_Ss+P2XnuwnJZ+5ZoJY_68+q-5Q0UwJfpR6XBaxsEbw@mail.gmail.com>
 <4568b2f3-6231-4bc4-be50-184bdef4050c@myspectrum.nl> <bded98e7-4576-49a4-a17b-5fd9e092f9da@victronenergy.com>
In-Reply-To: <bded98e7-4576-49a4-a17b-5fd9e092f9da@victronenergy.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 May 2025 10:51:18 -0700
X-Gm-Features: AX0GCFvaCXD9Yn6BKsYWMaCh4atrx7tr3zcsn8dnT26wMDQbAG5R2NKIzH5jDjs
Message-ID: <CAMKF1srTWcsL2UEnbhrhk55rd9_+1f5tyAqiTDVT8JnLsf06BQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/2] socketcand: add recipe
To: Jeroen Hofstee <jhofstee@victronenergy.com>
Cc: Jeroen Hofstee <jeroen@myspectrum.nl>, openembedded-devel@lists.openembedded.org, 
	marc Kleine-Budde <mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117576

On Wed, May 21, 2025 at 10:37=E2=80=AFAM Jeroen Hofstee
<jhofstee@victronenergy.com> wrote:
>
> Hello Khem,
>
> For completeness, this should be fixed by
> https://patchwork.yoctoproject.org/project/oe/patch/20250521091721.262221=
0-1-jeroen@myspectrum.nl/
> Marc fixed it before I could send the changes to him.
> A bit odd I didn't notice this earlier, but so be it.
>

Thanks for quick turnaround

> Regards,
>
> Jeroen
>
> On 5/21/25 09:39, Jeroen Hofstee wrote:
> > That is odd, I will have a look what is happening there.
> >
> > On 5/21/25 09:17, Khem Raj wrote:
> >> Fails to build with gcc-15 -
> >> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2442453/raw_=
inline
> >>
> >>
> >> On Mon, May 19, 2025 at 1:34=E2=80=AFPM jeroen via lists.openembedded.=
org
> >> <jeroen=3Dmyspectrum.nl@lists.openembedded.org> wrote:
> >>> From: Jeroen Hofstee <jhofstee@victronenergy.com>
> >>>
> >>> Socketcand allows to transfer socketcan messages over tcp/ip.
> >>>
> >>> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> >>> ---
> >>>   .../recipes-extended/socketcan/socketcand_git.bb | 16
> >>> ++++++++++++++++
> >>>   1 file changed, 16 insertions(+)
> >>>   create mode 100644
> >>> meta-oe/recipes-extended/socketcan/socketcand_git.bb
> >>>
> >>> diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> >>> b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> >>> new file mode 100644
> >>> index 0000000000..764a87f874
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> >>> @@ -0,0 +1,16 @@
> >>> +SUMMARY =3D "Socketcand, socketcan over tcp/ip"
> >>> +LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
> >>> +LIC_FILES_CHKSUM =3D " \
> >>> + file://LICENSES/BSD-3-Clause;md5=3D4c00cf8b0a04a9441d8fa24850231d00=
 \
> >>> +
> >>> file://LICENSES/GPL-2.0-only.txt;md5=3Df9d20a453221a1b7e32ae84694da2c=
37 \
> >>> +"
> >>> +
> >>> +SRC_URI =3D
> >>> "git://github.com/linux-can/socketcand;branch=3Dmaster;protocol=3Dhtt=
ps"
> >>> +SRCREV =3D "7b5e91ec656b33c325db2f9136daebb9e357bb65"
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +inherit meson pkgconfig
> >>> +
> >>> +PACKAGECONFIG ?=3D "libconfig libsocketcan"
> >>> +PACKAGECONFIG[libconfig] =3D
> >>> "-Dlibconfig=3Dtrue,-Dlibconfig=3Dfalse,libconfig"
> >>> +PACKAGECONFIG[libsocketcan] =3D
> >>> "-Dlibsocketcan=3Dtrue,-Dlibsocketcan=3Dfalse,libsocketcan"
> >>> --
> >>> 2.43.0
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#117480):
> >>> https://lists.openembedded.org/g/openembedded-devel/message/117480
> >>> Mute This Topic: https://lists.openembedded.org/mt/113200001/1997914
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe:
> >>> https://lists.openembedded.org/g/openembedded-devel/unsub
> >>> [raj.khem@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

