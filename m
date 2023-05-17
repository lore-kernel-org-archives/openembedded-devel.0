Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5B4C7EE22
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 05:30:27 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.42958.1684301420953069224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 22:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PWHsq2K0;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1967cd396a1so222623fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 22:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684301420; x=1686893420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWF25+H4cChTXVtX5i/a/tKG40qigB5kisBguwOGI2s=;
        b=PWHsq2K01pKgPwujLq1B7oJIl8tUZrLku/f3bb2wnyQQ3J8rR95QfgDQYJTLOkKUeq
         yH0DR1Ajq4WC6xN4DUL/WBhdMcsK2MkfBcMHhllKqYJPCozy+fY+oRoqNHZWoOGTHg1R
         lrJ+0LSQQjKaf1rLipYp0cz2mt+m94gobfOXH+jeppneLMxC5UyCEOUBypi8fQg43kiq
         s7X6emh2QlGZ2Nq7s7Rr1LPtCWO/6LacXVyKaTUBDN5MGdSwdJkb6YBjxgCz5u8qi9Vd
         nGQw2ruQl4taGiiOxGWhkjI9a96vJt5mdNqjHSA2V+QcXhYdBtwPuDUJ2S/8SBizAnbF
         RlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684301420; x=1686893420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWF25+H4cChTXVtX5i/a/tKG40qigB5kisBguwOGI2s=;
        b=MJlscyoeKy+STJUK4FzNktlqxBqNZ2QLPcAE90VNv+WnGBZgQUFbRnd6rX7k2MjpML
         YOMKajObv4YX0Te6vwkwlX9UbN87Fy7dMolwtqBvFTNQ5ae3xoLaDBgy4klk9DwjCV/n
         iWWIffOvL4lJ6zsbxb/pD3qMpyYEExc0HWIAOfOvuopvAGilC5C+vmrdm7XemqVpq2V7
         qn63d2cKcyImn/87ovCIPYqAa5UoHu4KCXunmEwR/BLjwLZhnq053lDnv6/fGZ9eCx35
         NLF3XmlynB8sSCmQTjPD4lOlNHhymt7t/RkC7MSqcsG/ic0+TrnIaIxE81yL6pgrH0/q
         svfw==
X-Gm-Message-State: AC+VfDymvMr2UPOow9XVnmxy9+fUZ4B87SLXBbRQseDkcAzT/1ABnadR
	4aZUwVAa3A3q8oCI55Zdzzd0pRtsR9BDcV0DcCWMP4Q/4TQ=
X-Google-Smtp-Source: ACHHUZ4z0/RCi+w7gK4opn6ptSmCZCjCnkZl5rlX22DLoSdBPAkJ0TlvAyCR8H7/IPkyfKQIRpkihJf/aLMfopMVrzA=
X-Received: by 2002:a05:6870:b791:b0:199:fdc0:b662 with SMTP id
 ed17-20020a056870b79100b00199fdc0b662mr1361072oab.47.1684301419944; Tue, 16
 May 2023 22:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
 <1684069442-12244-4-git-send-email-wangmy@fujitsu.com> <CAMKF1sodK_ZGVmHGb0Xrs+-TKUAHK3ZtZcBb+q1zakqiVfFzAg@mail.gmail.com>
 <CAMKF1srVUA3gfuMYhLXG3WhsLZzifmchhubzNOjL8n9=GWJoeg@mail.gmail.com> <d8531078-1797-2a7a-5f98-4dc89b95c3b4@cybercomm.nl>
In-Reply-To: <d8531078-1797-2a7a-5f98-4dc89b95c3b4@cybercomm.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2023 22:29:54 -0700
Message-ID: <CAMKF1spy8+vxfDrkCWjogn=nDFhu-zdZaHHV0J2=rxMC2R-ROg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 9.1.0 -> 10.0.0
To: Hains van den Bosch <hvdbosch@cybercomm.nl>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102639

Hi Hains

Thanks for these fixes. There are more failures seen with clang16 + libc++

https://errors.yoctoproject.org/Errors/Details/704259/
https://errors.yoctoproject.org/Errors/Details/704258/

On Mon, May 15, 2023 at 1:41=E2=80=AFAM Hains van den Bosch
<hvdbosch@cybercomm.nl> wrote:
>
> Regarding  spdlog, you can update to latest git or apply back-port patch:
>
> https://github.com/gabime/spdlog/commit/0ca574ae168820da0268b3ec7607ca7b3=
3024d05
>
> For Musci player and Gerbera I've created patches to fix build with
> latest FMT, but needs review.
>
> Introduced with comit:
>
> https://github.com/fmtlib/fmt/commit/fce74caa15b24cbc0fcafe4706692cb06cb0=
b815
>
>
> Patches:
>
> MPD:
>
> https://github.com/Hains/openpli-dm920-python3/commit/688ae121bd3928925a8=
656bd4aaf3857d8e8a8ed
>
> Gerbera:
>
> https://github.com/Hains/openpli-dm920-python3/commit/584b0ae72f0e1a3628a=
5e20b251fb4ec18cae208
>
>
>
>
> On 15-05-2023 07:14, Khem Raj wrote:
> > and also mpd - https://errors.yoctoproject.org/Errors/Details/704170/
> >
> > On Sun, May 14, 2023 at 10:13=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
> >> Please fix spdlog as well to work with fmt version 10.
> >>
> >> see - https://errors.yoctoproject.org/Errors/Details/704169/
> >>
> >> On Sun, May 14, 2023 at 6:04=E2=80=AFAM wangmy <wangmy@fujitsu.com> wr=
ote:
> >>> From: Wang Mingyu <wangmy@fujitsu.com>
> >>>
> >>> License-Update:
> >>>   Add " and {fmt} contributors" to Copyright
> >>>
> >>> Changelog:
> >>>   https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst
> >>>
> >>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> >>> ---
> >>>   meta-oe/recipes-support/fmt/{fmt_9.1.0.bb =3D> fmt_10.0.0.bb} | 4 +=
+--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>   rename meta-oe/recipes-support/fmt/{fmt_9.1.0.bb =3D> fmt_10.0.0.bb=
} (77%)
> >>>
> >>> diff --git a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb b/meta-oe/recip=
es-support/fmt/fmt_10.0.0.bb
> >>> similarity index 77%
> >>> rename from meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> >>> rename to meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> >>> index 34896153c2..a8e6e563da 100644
> >>> --- a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> >>> +++ b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> >>> @@ -2,10 +2,10 @@ SUMMARY =3D "open-source formatting library for C++=
"
> >>>   DESCRIPTION =3D "{fmt} is an open-source formatting library for C++=
. It can be used as a safe and fast alternative to (s)printf and iostreams.=
"
> >>>   HOMEPAGE =3D "https://fmt.dev"
> >>>   LICENSE =3D "MIT"
> >>> -LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Daf88d758f75f3c5c48a96=
7501f24384b"
> >>> +LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Db9257785fc4f3803a4b71=
b76c1412729"
> >>>
> >>>   SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=
=3Dhttps"
> >>> -SRCREV =3D "a33701196adfad74917046096bf5a2aa0ab0bb50"
> >>> +SRCREV =3D "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
> >>>
> >>>   S =3D "${WORKDIR}/git"
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#102594): https://lists.openembedded.org/g/openemb=
edded-devel/message/102594
> >>> Mute This Topic: https://lists.openembedded.org/mt/98883938/4454664
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [hvdbosch@cybercomm.nl]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

