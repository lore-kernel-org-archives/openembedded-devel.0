Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E890C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:37:11 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23082.1786336627947606250
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DvYhWzXz;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-44aeefa1c00so1115221fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 21:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786336627; cv=none;
        d=google.com; s=arc-20260327;
        b=aPE0ohR6Z3jEeGiGZvWt7ZjudtvqAVGFXWr4Zpm1oRBQpH65J3Wh5zhh4fIVQAEj80
         Y8IEKebMH4RmzVfYRimTrvf6tEBXdB/RVYX7OkmFsjmisaq5s1DwHM7k24Z7CV2M3q7G
         P9wC2SG9IUXZbezR+KfmAuZ5oEXJeNvfOTkYns9VyPyJXHavXvdd4twc2KMIC5caGiN6
         TqRLyjiKTrQPTl6kukMVSeIzF0nxpbZbaSRp5rBl1VAar4JMNkgJModkL5SPwvo9C9fc
         n1trc+eprWIagNPGcAIUUx1Be+247HpnWD93OVgNiVZJNdVuSd6x+sD1v6kef5zoHmNP
         3KcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qBM/KFFHOCwNQYiujbEM/rKU9xEy5ZL3yRu2Cp+k9aI=;
        fh=dzABH9JnyN3KCs6Dy8pFwSEYSF0uh86waDF4uJXR4Ek=;
        b=i4h/cZo6Ngbc8ko3bk4Ba8uUPas1dIB4Wjq30CXhRLIp29KJ9IzI9z+cDxHaijor6z
         z6EZd8sMZBh0owwjtOmdoXSCZM4c2shlTFhlN/TkdIsFB46WNY3f2esVil2uIYSmassn
         /MxnW1k6jgbYTPUSm/vzCQbrkSx4GbuI3Du2pvTqzSrZDRfdZnmTLUMrO7Xb+2iLSow1
         6k/fppkFXxTyv56yN7q880t32hZ6D3sUY8BmOIuNqmhzFwCD3yhebcBMUVKBwALAIxsT
         rcBmwOlo3SkZOeft8HqjLTJBTBG+rQTAlhmEipGtJrIbAf7/l0TStfKuHHCIFmObFgO6
         zLJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336627; x=1786941427; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qBM/KFFHOCwNQYiujbEM/rKU9xEy5ZL3yRu2Cp+k9aI=;
        b=DvYhWzXzo9J2Z1TQTuJL05JPD/NibWDPLc657azEKfSDsHmw+jUmGvdWnHOuWnysvT
         AhY1eicdvGq0YBhhGCzGu8RnflCu/isLMHPwTH6NVpNI1mOOY4oEb1lGva3wLQI7Vo+9
         dsFOKWnnS0O2ikoxuGTAmI05QUhNbxArF2bOObT0V3xko5hTTW0zuVVMGuo/u55bdTmU
         fPxepD+2zvsO9uraxnd8uUhTjuhMVpCcnxrN5KsFIeLsqcfX+14M0TANQs/LGaDrOC50
         BStT8eSz6XEoqhSO451ui7gCT9RlNIMfNb5WRJ7eTVpCV9hlF79DFZ7oYnkPgH7cZaU3
         OU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336627; x=1786941427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBM/KFFHOCwNQYiujbEM/rKU9xEy5ZL3yRu2Cp+k9aI=;
        b=bXuxjjJ26lXRubUruTHThnmuKxB1rLrtqwJFVPv7shy+PJybj4c5sS99THcu/+Svh6
         PXu4wRgIwzGy3wQspEzqovNsBirEIYhcbsbMFgphVHvF+HQJB1x3J1BqFLemgA+cCCJE
         yDB9WKBBNy+Lpafq1RDuHYCdRIOXtTqvF1tDsYfw+LcpfcUBZueo9jKF3s1YIzCBfCfT
         UXdJqLaEbh7BOOzZ/c/AoOZMGGuUmksXojNf2hLZaZ7RDjMYEtqbeEPg10mW98AzMlZE
         7Nr9pHfgrto0Alpvq1Df+Oxt/nwROih8762+E1u6m+Cob/yzKJcdnMcVUnPJ+QOONJQ9
         mE5w==
X-Gm-Message-State: AOJu0Yyjqp/4gk83xTdSvAJ4oG8UCwCVlH82Ex1PHuI8b95FWFF5SczX
	ojsOo+p/vA1eEasBPgv8mcJVwVfao/lh27MoCE53d9tXBWzH4Fp+ts3WBdMXYJF9YKOuKa7veCz
	KdBJkip8jmRIWqumn3ETq9Lpa882+0SE=
X-Gm-Gg: AR+sD12E7QfFdqd9+6t6q6AvI+l/cQnw+Net2dhBEzOEqkd3XUn1AH+FtkcN6t2ziXx
	bnkYNLnd9RZk31E3HNyhq3zbJmEY5IzO57s4XDIXl5wSnaaAdy2tw+VB5zSYg0BqMT0WR7hBjl3
	b0ezr5bNz1AogsUO5qrGIzBn5h8R5LwcWOYxfVnjBzCD8zJJM9kg+r/pi+ckL3oQZo8JcEk9m3k
	VqB5VJfy2iRIBAszobsyNeAPIQn9cislpcBYJ0kGOz8zcSaKh7kiGc0Bu37w/blmTboq0vDeZ2J
	TUAW2ABQYqY5LIvfM1SnCYf7+pDOAXl6ruxs3cDRqKyn434=
X-Received: by 2002:a05:6870:5592:b0:448:aa9e:b051 with SMTP id
 586e51a60fabf-45a160d397dmr7983082fac.14.1786336627063; Sun, 09 Aug 2026
 21:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
 <20260804194003.3158916-27-ankur.tyagi85@gmail.com> <CA+s=J=xVmVDry8gq5DmkCMXC2swsffZFxtzE5e-6d5yTL-d2BA@mail.gmail.com>
 <CADySD0Em+FRNvXCDVyxx5jKd64WdxoP-ToLRq-dQyUAOmB01og@mail.gmail.com>
In-Reply-To: <CADySD0Em+FRNvXCDVyxx5jKd64WdxoP-ToLRq-dQyUAOmB01og@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 10 Aug 2026 16:36:56 +1200
X-Gm-Features: AUfX_mzSOZvNHWJtRDyDhU3JS36sIvkcA9wCgvsiD38f4flsk6WTel6dVq1d7Yw
Message-ID: <CADySD0HE376Oghkm8bCJm4P8TYH8SCZxyEvP_yBt3kX==jS5-g@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][wrynose][PATCH 27/36] libupnp: upgrade
 1.14.25 -> 1.14.31
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 04:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128876

On Mon, Aug 10, 2026 at 2:09=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> On Mon, Aug 10, 2026 at 1:48=E2=80=AFPM Anuj Mittal
> <anuj.mittal@oss.qualcomm.com> wrote:
> >
> > This causes mpd build to break:
> >
> > | Run-time dependency libupnp found: YES 1.14.31
> > |
> > | ../sources/mpd-0.24.9/src/lib/upnp/meson.build:29:4: ERROR: Problem
> > encountered: Your libupnp version is known to be broken, see
> > https://github.com/pupnp/pupnp/issues/528
> > |
> > | A full log can be found at
> > /local/mnt/workspace/wrynose/build/tmp/work/cortexa57-oe-linux/mpd/0.24=
.9/build/meson-logs/meson-log.txt
> > |
>
> Thanks Anuj, I will look into it later today.
>
Hi Anuj,

Sent a patch to fix mpd build error
https://lists.openembedded.org/g/openembedded-devel/message/128875

> cheers
> Ankur
>
> >
> > On Wed, Aug 5, 2026 at 3:43=E2=80=AFAM Ankur Tyagi via lists.openembedd=
ed.org
> > <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > From: Khem Raj <khem.raj@oss.qualcomm.com>
> > >
> > > Upstream changes (ChangeLog):
> > >  * 1.14.31: fix for CVE-2026-41682.
> > >  * 1.14.30: revert an inadvertent API change (25d4bd0b).
> > >  * 1.14.29: CMake builds from the release tarball now work.
> > >  * 1.14.26-28: SONAME/CMake build fixes and assorted portability fixe=
s
> > >    (e.g. OmniOS POSIX asctime_r).
> > >
> > > Version-only bump (git tag release-1.14.31); recipe unchanged.
> > >
> > > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > > (cherry picked from commit d98bc9596101d3eae2921cd93f1a35b72869edf6)
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  .../libupnp/{libupnp_1.14.25.bb =3D> libupnp_1.14.31.bb}          | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.25=
.bb =3D> libupnp_1.14.31.bb} (94%)
> > >
> > > diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.1=
4.25.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> > > similarity index 94%
> > > rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14=
.25.bb
> > > rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.3=
1.bb
> > > index bcecfd3b8e..6ba21971d0 100644
> > > --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
> > > +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> > > @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://pupnp.sourceforge.net/"
> > >  LICENSE =3D "BSD-3-Clause"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D394a0f17b97f33426275571e1=
5920434"
> > >
> > > -SRCREV =3D "da7cf950f22357545061961b7e5610e08690b0cf"
> > > +SRCREV =3D "79ff958ed1012e60faba84981481f76cea43c7f2"
> > >  SRC_URI =3D "git://github.com/pupnp/pupnp.git;protocol=3Dhttps;branc=
h=3Dbranch-1.14.x;tag=3Drelease-${PV} \
> > >            "
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#128774): https://lists.openembedded.org/g/openemb=
edded-devel/message/128774
> > > Mute This Topic: https://lists.openembedded.org/mt/120599957/3616702
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [anuj.mittal@oss.qualcomm.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

