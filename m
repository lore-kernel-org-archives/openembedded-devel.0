Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6769CEFCE6
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:08:11 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96366.1767722888947497249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E1p4+4tV;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4557f0e5e60so805849b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767722888; x=1768327688; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZQeWkQ5jTL5b+gPM/6xVus8VS9NAA+C1XJ6pvGV4/M=;
        b=E1p4+4tVw6aREuIFD6Sgh1L+nwYnj9kUDuFIlTrGz54Hk0DdU3ONKDq0bi8EdUY81e
         KI8B7OaaOXyLW0FR6JXfExSTR1YEW4pqWdZZ6GCHfbsp3eHo/6CvhLAScjgz5OI09V9r
         aHuUvMhTrjHkVzLiOO5tWE3eHNH5zaVBZahVbjY8ZkqHZTu1F4VJy5QxppZ6DGx0zx11
         eVjJBwRao8B9+FNHV6Us00hAvZQNlGMev213VlRX9R7K4oomujQ8X/Uk9GURTUOkhAFL
         41VG8kGYE5XZl7E9n/BbeObYO+VCaZE0RxPSSEOEztXX5kGZGTE+x7tlYkI7wbszW3bQ
         kNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722888; x=1768327688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZQeWkQ5jTL5b+gPM/6xVus8VS9NAA+C1XJ6pvGV4/M=;
        b=bopvmOFVoQxp4QSWiZTf8wFlcaD0ZZbCcZf3fttiYkC1n8T6st6fKoOTN8DUBwQG6K
         fWJW0b+b99F7N1VlHOTX8ls2SAgAc1b5PQkFSwULunc9vokrys8Jg5TF1Ztq05xE5v5Z
         5aHDrIij6hG04Kb+1bNo+aUITYMbruXzLRO6MxBRxTPnsPgjyHq3oy+pTk2nW8mocQ/O
         753d2tDBGPqHdXa1+wT4EhaK5huf3g3UuTMlUoJAGkfWOUbCBOImVyY+XaHGgajE85wX
         Od+MSpYtne9AMR9VFiMmj2nfd5M7LVubFZKimzOUGPf7HGKp+g6iZbFyk7NN3p8BVCLq
         sUxw==
X-Gm-Message-State: AOJu0YyGA4Dauqqw7YtiynE60ivh0bF+mXSQHg2hbBZv8EJD8d7yOENj
	4UA1NL+h4vJJGVZK5UUEjld2r6XetEZUYM99iw3n7pOs+CLHVBKNeZ4AB+SdoBQQUz/vl/AZzML
	gKi6p9OsTVAx1XUsNycY1S7cJbA1Pbsg=
X-Gm-Gg: AY/fxX65eK7lE6+nAj20TsYG8tFoCM5cxYb3Z6ladY4U0+LlLuDrCOXSOcVLg3scph5
	sKIjcDBrAy9hg/h/H2cQ9lMCkt3v//n0nVeX8bi3ztDLejIHecgwNjvXSWt/UORBxqHUH2RYM5N
	hJGRZ5vmIeVNsEcjZUrdUliomaQOQ5ED0UynouDbot+gWYPfn1VO6XF1OeVB0VziM0mwDRCAiwz
	FVX0AYkrsCqw5tHrKDmZ4RwBWPMk1du4VauaLgsUecdZJzBYhZWxB3mrXFxJtZIbnhiFuE4e9wb
	rAfgrgA=
X-Google-Smtp-Source: AGHT+IH9kFpCzt+GbxISU8RUdatzFnBPABOm+vI+k35YGX/06nR9Jo6fWgrlda9XmudADFgZ4q5l2z21CmaMWXN7gek=
X-Received: by 2002:a05:6808:1506:b0:450:c752:7a73 with SMTP id
 5614622812f47-45a5b02c048mr2298437b6e.16.1767722888123; Tue, 06 Jan 2026
 10:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20260106104151.2027936-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260106104151.2027936-1-viswanath.kraleti@oss.qualcomm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 6 Jan 2026 23:37:57 +0530
X-Gm-Features: AQt7F2pUEiSiPNadodQ8JXFl4r3XdFGWFELfvoxkdDAwqnaVYXONCRnW9rSczRo
Message-ID: <CADySD0Eh7VSPwP2bmE=oF2X3nXunP9ZmZHsPuZJQM2YwK=Ph8Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/2] libqmi: upgrade 1.34.0 -> 1.38.0
To: viswanath.kraleti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 18:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123183

On Tue, Jan 6, 2026 at 11:42=E2=80=AFPM Viswanath Kraleti via
lists.openembedded.org
<viswanath.kraleti=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Changelog:
> https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-38/NE=
WS
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  .../libqmi/{libqmi_1.34.0.bb =3D> libqmi_1.38.0.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.34.0.bb =3D> libqmi=
_1.38.0.bb} (91%)
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-=
oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
> similarity index 91%
> rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
> index 8dc7ec3773..6bd02a2d54 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
> @@ -12,8 +12,8 @@ DEPENDS =3D "glib-2.0 glib-2.0-native"
>
>  inherit meson pkgconfig bash-completion gobject-introspection upstream-v=
ersion-is-even
>
> -SRCREV =3D "3f07d6e5b4677558543b3b4484ea88ad92257e92"
> -SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;pr=
otocol=3Dhttps;branch=3Dqmi-1-34"
> +SRCREV =3D "e3d79ed3f7fdc6a7fa8b374860b1c23a8f172812"
> +SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;pr=
otocol=3Dhttps;branch=3Dqmi-1-38"

Please also include tag=3D${PV} in SRC_URI.

>
>
>  PACKAGECONFIG ??=3D "udev mbim"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123176): https://lists.openembedded.org/g/openembedde=
d-devel/message/123176
> Mute This Topic: https://lists.openembedded.org/mt/117103074/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

