Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0D8C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 20:48:23 +0000 (UTC)
Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44675.1790542101630191519
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 13:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Upw8/v1S;
 spf=pass (domain: gmail.com, ip: 74.125.231.99, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-4906fabf6deso1727049fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 13:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790542101; cv=none;
        d=google.com; s=arc-20260327;
        b=jALMStSABIDdLaJvDBM7yBKdyuRpka2oVdfkdk1EDeaPvihHDCRCYX9zLb4DZ/Y22Y
         QceX782jPKbMT/5Q2X60jqkjZ8UHISOOo5zOP8Nf3HXI5ouSzlWKa8qY8Jk/vhrCdHfd
         G4i/V7lqfE+DUr0lTIMVuk+jgOh6P7fHEiylIiSaxOsTei2f9LlDMPkk716oIjNCIu9R
         knhP0t2MltZ6tO0ADw5b0kBQq9KmOghLQYtDM9E/ZChp70UXIGlUKrP57KHqUV1GPHO6
         PiGGpKfhi15cAP6IUMsOdVCVrs9AyVqi8eTBvJKF1Xb8u/GgRiDQLCvWHZBHTsdEXBfY
         Fwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qp1ocTyOCOgSD1OriDVJ6wxqW5WGvkoB/E8mkjgrfE=;
        fh=zABElKLQhBo6sajsySJxqEgPo2ywlapBDtJvPbj7xuw=;
        b=CT/YN1NCpjuiZKjyWbRE5bbffvTmHDQ5CGJ8SdzSZ/ThZEjt6m05Inl6TP3WwmnIt5
         14oxI7tZwTXNsz3OREJUfOqrmwKNRmO71W8sCXZiBOPPmj8BYnmksQvIdEDKLlCd/qLQ
         eYxe0vWDYmhNUbqF9iQScNQWqwmBusymuWzcR0UNGGydlemepuL98DNpdhgeq42A8sTJ
         HdR6TFBzQtc3OEyoV0Fbl9jpx8abJXRiqx0XBCSynkRNIrg+xyjGcmS5nh9iEg0CLvZ2
         D+tP9ESIeSRCMhqQETrXIb2BrzNamzuWDtbbV3XI703jVW++Ve3vpMfy56O2HweHCNlN
         VFVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542101; x=1791146901; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qp1ocTyOCOgSD1OriDVJ6wxqW5WGvkoB/E8mkjgrfE=;
        b=Upw8/v1SydWgBaH8Clc095s5I59w+BKNGRHN34BRM+o/h//sB6nTd5L9oRhx6AYE3L
         gf4XVQoCd30y2EPEOXN95D5Fbpn8qVOY66jh2Xo6sK6Os4ysrIjcsbOCc6Y9eNBs+ITi
         mG6IhJ+9VkWewjcBuACanKLGN5GPn0fsaAkUBzWtKKO55er/P7tqP/E1PRR1qmPBsE8B
         l/ffa82znHIRuJfjBL1YXBaoAL3nWk1PFbRavxUBop5fzeDTvvRAF5a2TuveHJK6MKGM
         MIzgrzAzZthBaPFZA9jx5gwRWo1WpNc9pI0EgA4EV0wlUIIpYaCouuaPhlIyA720eZEl
         jSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542101; x=1791146901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qp1ocTyOCOgSD1OriDVJ6wxqW5WGvkoB/E8mkjgrfE=;
        b=nvAJPNtKAGaJoEnDmVXz2i7pUhtg9vXvCygeKYdaeD8PH6yt8w2lTDcmwGLAclmLy6
         Zeyf5xpuMuZdzS/Qc9FMiMeaSExGElHzos4WbyBy6fVDubKQW1ejiyck+oelEKrzi40f
         ItUTaZaKdJfJ8pU4ZpX6bfP3VwaufbnRDb/bBBRe5x8hTA8tgizH5j1ZSFQMysyYZBIF
         lwcCd8cUyfILSUJeNxDq/a//ETDSmKd65QrKYIZ9Txf8LxQLEUbpBNDnVlN/opPGYatV
         Iqd1wQxmTdqz+QXxMOmomCJLx/WJJtIXBe/nuYMbh07yLLlK1VGWuAMzEd453ZlSZwAi
         0Akw==
X-Gm-Message-State: AFq9FYLHg3baUqu5nE2ErDlUYTpKGu4zxlJyNvcrS6Qdnk58HkMgPH6s
	bHaHEYwHFlAEFb7FsIcF4xL7oY2HGHJm+GGejKMXi4W/vPYWrKyc0Th7JpejYA9OfywXmCoqjZr
	43UoZH/tU7tcKMRSKT8hFw/TGzi/mVGw=
X-Gm-Gg: AYBFou2GD0LTw22vzWjGbMHQ6k0zyrjQ87lfkOmdRxmWdSBEOVae95+4qM6pbn2Bx4n
	lFwgyXfMRw0GcqbP/ZfQbBMi+rQeM/E0xwyb/SKA6/44YCxc2WhABsf1c3bqX2BVZyxX4zygsHO
	FuZv613yV4NpdXpbjdiDvYHPymCh57GMlKVbUkJ+SxLJnOlNBMyS3sbwogc61wBO1KzEc5D6lyW
	B+krNtf7hyDySe+UbBY9gskeCO2+HwunL0MMm7stUbynzUh+GPpsDy7WoVCKlZFmZkzcDoDlkj6
	VSYglp7rS1Qyaon8ChJURjSxW/7Lhr9T3KeWqDiHEeRAJqFWpioHdvX2Ea9QclYjijQEBg==
X-Received: by 2002:a05:6870:1767:b0:48f:e0f6:c030 with SMTP id
 586e51a60fabf-491e7423ed7mr10645075fac.46.1790542100795; Sun, 27 Sep 2026
 13:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com>
 <20260927155132.1277867-2-khem.raj@oss.qualcomm.com> <CADySD0HxUjVOhMcz1OVMGqidxqoZqK38+MaSJg+7SZZz=1+OQg@mail.gmail.com>
In-Reply-To: <CADySD0HxUjVOhMcz1OVMGqidxqoZqK38+MaSJg+7SZZz=1+OQg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 28 Sep 2026 09:48:09 +1300
X-Gm-Features: AclHuK_rYz3MVRSbKh1aiQJtzP4piZSYhu8uCZoEaVd1sCnkvxaVe7CFnZF-BLM
Message-ID: <CADySD0F2fccmSz2eXGXTbOLRzYzC_juDxF2ZR_OUavgjkdx5Cw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] v4l2rtspserver: new recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Patrick Areny <patrick.areny@notiloplus.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 20:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130382

On Mon, Sep 28, 2026 at 9:46=E2=80=AFAM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> On Mon, Sep 28, 2026 at 4:51=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Patrick Areny <patrick.areny@notiloplus.com>
> >
> >     v4l2rtspserver is an streamer feed from :
> >       - Video4Linux devices that support H264, HEVC, JPEG, VP8 or VP9 c=
apture.
> >       - ALSA devices that support PCM S16_BE, S16_LE, S32_BE or S32_LE
> >
> > Signed-off-by: Patrick Areny <patrick.areny@notiloplus.com>
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >  .../v4l2apps/v4l2rtspserver_0.3.8.bb                 | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_=
0.3.8.bb
> >
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.b=
b b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
> > new file mode 100644
> > index 0000000000..1a15a0cd0b
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY =3D "V4L2rtsp streaming server"
> > +LICENSE =3D "Unlicense"
> > +LIC_FILES_CHKSUM =3D "file://UNLICENSE;md5=3D911690f51af322440237a253d=
695d19f"
> > +
> > +SRC_URI =3D "gitsm://github.com/mpromonet/v4l2rtspserver.git;branch=3D=
master;protocol=3Dhttps"
>
> can please also include tag=3Dv${PV} in the SRC_URI
>

nvm, its already addressed in the version upgrade patch.

> > +SRCREV =3D "b12cf350dc573ab0ff9d1b51a21daf3c218b614e"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit pkgconfig cmake
> > +
> > +DEPENDS +=3D "live555 log4cpp"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#130373): https://lists.openembedded.org/g/openembed=
ded-devel/message/130373
> > Mute This Topic: https://lists.openembedded.org/mt/121457183/3619737
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

