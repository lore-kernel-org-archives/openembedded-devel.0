Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670B3CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 21:00:14 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6442.1762290013245955952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 13:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ru3V2FVd;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-44fba97bf37so1383738b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 13:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762290012; x=1762894812; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzME+JcSdgJ4LPl2OV67wD1NezBmcgPfN9gQcCA4TIE=;
        b=Ru3V2FVdvd6HROtPukXTeWY4n4lbYsNhit65BGGB78vp2LSXrvDcFPkm07qunPfVuj
         d6oUozIR/G3SFpkI6owj7TlmyXs8wTuJObfkkBmjP4DDfXyzURHXjZFB3CL2Mf01cefi
         0dwmffdILeAtiIVajAXG/SPNcUeZf0pqGV9MMZIuAaBWxGV4jbwq31WHB3K0+HsrxUXE
         ux1yIwbIyc9H2Y9M1RFZ/Vp8U6Of/4n2IImf4MUyVu0ngKgy8krfOgXq9RpeylnQ3QtX
         6N2ZsaPSYGtuu8DITD1ZuYfC5LxBwTlF6rpnBupY6eq//NM4jeoK5IdI9kicBGuUHbQO
         Om2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762290012; x=1762894812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzME+JcSdgJ4LPl2OV67wD1NezBmcgPfN9gQcCA4TIE=;
        b=sieWNbVKzdnwmadzmL2BDv3Ky9542pIXop/AFQbtpdDWUHyui32SgELbdgeRygXFrZ
         GgSnIYguo3ia6AOQtZzboxBXC+JEuGIGH0UsXYuPCZXv/thsMv9kCAi3suN38WSQyzCo
         EBMGEy/n+giRbGxlK8VwSoxyZELkKgu4XnG1QHsdeFB2XKi6onYSuR1wACEfUqI9obZv
         0tRWqQHgH78WX/tOE8XrxHIAeg9USWn/JzphFisGGB5kh6f2NVByXUZt2PnWqjiihaNW
         YVwAV26NfaXkXrHlrdP7o3pkpwhe8Yj/aVo05OHCpsj+sd/Fb7SkWbtFHIwh41yxGBAJ
         NzwQ==
X-Gm-Message-State: AOJu0Ywi+cbqIRE38+zgJDGsnROGzD/jESKWCo5MReWkYzdtKxJMmS9c
	juin9phydFsw+YWVjsPN+Y3fffcsg3VckWXSKgiq8c/VQ16Mj6XwhH5gsCQ34kNGtEmoDasDTgP
	h2fmBj+CqoKgUjKZH4o6ThIOSuvp+ZX8=
X-Gm-Gg: ASbGnct1p79hSdBkk+b2tBGZgBo6R6HOB6Uyly2rp6utbiyfd6Xto8kUI6+/xFGlkCR
	+SMYQZygTH68psDp677ZQtCfcnBFGSVnR0bTwByLvzj8bYLkV3quaNnmmslggqPDDZQmSjMqDJD
	iCNabrpgrInfQhhae6pSYjnTOqfr16kvOYKkPeRHFmg0Rl+Y2X6z6q3h0rMb4xlj+pTk+WtNU+N
	ErfkB8/19J2UalwXxStvVrQrOf+uRWvLGx8fIMVb4anfMYLrI1R1iZegEqG8Oc=
X-Google-Smtp-Source: AGHT+IGtz69R7Wfs5fWY2Uxu139h6JPjFp8n5mso7311PLjDOEtG4ciBLjq0KmiGZu5BPoO74KdbdqTOnrVWl3Hn43E=
X-Received: by 2002:a05:6808:6a85:b0:43f:5fc5:e04b with SMTP id
 5614622812f47-44fed34397fmr369951b6e.15.1762290012427; Tue, 04 Nov 2025
 13:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20251104193437.1797870-1-ankur.tyagi85@gmail.com>
 <20251104193437.1797870-2-ankur.tyagi85@gmail.com> <16996f11-c1e5-4014-b3c6-8bd359be8ee3@gmail.com>
In-Reply-To: <16996f11-c1e5-4014-b3c6-8bd359be8ee3@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 5 Nov 2025 10:00:01 +1300
X-Gm-Features: AWmQ_blQ0dQ9h8Z9A3MAtSB1RdFHAP0p9Lg0NEdO72OrIP7ngbmV5HkY6wn7MFQ
Message-ID: <CADySD0EqCxz-Z-_=GVenDpLvKpMoShKMHUqfF2=ZusBJwPbzmw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/2] redis: ignore CVE-2025-46817,
 CVE-2025-46818, CVE-2025-46819
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 21:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121308

On Wed, Nov 5, 2025 at 9:07=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> On 11/4/25 20:34, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Fixes for CVE 46817[1], 46818[2], 47819[3] are included in the used ver=
sion
> > [1] https://github.com/redis/redis/commit/fc282edb61b56e7fe1e6bacf94002=
52145852fdc
> > [2] https://github.com/redis/redis/commit/dccb672d838f05c940f040c27b74f=
de6fb47b2a7
> > [3] https://github.com/redis/redis/commit/2802b52b554cb9f0f249a24474c9f=
ba94e933dbb
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/r=
ecipes-extended/redis/redis_7.2.12.bb
> > index 9016254731..6527fb6996 100644
> > --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> > +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> > @@ -23,6 +23,9 @@ RPROVIDES:${PN} =3D "virtual-redis"
> >
> >  CVE_STATUS[CVE-2025-21605] =3D "cpe-incorrect: the used version alread=
y contains the fix"
> >  CVE_STATUS[CVE-2025-27151] =3D "cpe-incorrect: the used version alread=
y contains the fix"
> > +CVE_STATUS[CVE-2025-46817] =3D "cpe-incorrect: the used version alread=
y contains the fix"
> > +CVE_STATUS[CVE-2025-46818] =3D "cpe-incorrect: the used version alread=
y contains the fix"
> > +CVE_STATUS[CVE-2025-46819] =3D "cpe-incorrect: the used version alread=
y contains the fix"
>
> I have submitted this yesterday, but why I'm writing this is because
> "cpe-incorrect" is not appropriate status for this - cpe-incorrect is
> for cases when the actual CVE is for a completely different software
> than the one built by the recipe:
> https://git.openembedded.org/openembedded-core/tree/meta/conf/cve-check-m=
ap.conf
> - this also determines how it shows up in the final CVE report when
> someone runs the cve checker. "cpe-incorrect" is marked as "ignored",
> instead of the the more appropriate "patched" status.

Got it, thanks for the explanation.

>
> >
> >  inherit pkgconfig update-rc.d systemd useradd
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#121304): https://lists.openembedded.org/g/openembed=
ded-devel/message/121304
> > Mute This Topic: https://lists.openembedded.org/mt/116123103/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

