Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC119CE8E76
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 13:34:27 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.14669.1729776859743300131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 06:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WeKWDwRk;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5ebc4e89240so445008eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729776859; x=1730381659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJJffFZHduwBFvVhfhCzB9c4ug+lC+2EXZipiWQeaR4=;
        b=WeKWDwRkuvSZ8RD10pI+/02TUag4w5A6xt7eL5Wx/g39PPQMzZy18/Abs1zeF0NL5O
         FIg51S79uvNKz2/PkXzup6uaVFthIDzPTUAETRwRthVRqL7mYbF/1LreFP2fWoi0ep7v
         6n2FX5Up7fUJxUD0SS6JS4oWjWXmYSI+fDh/K6VvSMCpWENA70bWqnncdP7LfLvvdgnz
         nrlIjcNr3+vUjii0k6try9dSkVu0vPHdXQ/nyOF4LJISP68H1LOgQbG9Y3+dJuaweuB2
         zcUDrN9C5PqsFgh5w+UkQI+DjyWpP/vnTQEoFxYiiiBAuWyYcvY0k4ynjRvUcHi0oTHs
         yRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776859; x=1730381659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJJffFZHduwBFvVhfhCzB9c4ug+lC+2EXZipiWQeaR4=;
        b=VI1KJnHddwQ9OEuzo6iYmqPZ8DW/7B0xzMupyk9+FRKHD1AbXK8YAyqy1SKDNyqPL+
         PZF+2URbVZwvudOFLgop87wyVKBVhqkw5WrQiGKKkuU2Owua6JyuCakwjJ65vLAnprf5
         qNzXm4WXcb5Y4sXB26KLxa8bx1hqqw0Xs2+UnsMB/HVoZ0JBgzBsGr+Fx6yEBSGlkQJx
         668Hrf1AJQdKBGZ8rQF9h8JbLLW9FHP+EVxn0XcT+YoJQdhGUFd6GwXZZa0GR513/0ep
         aLsaK+KjSHH5L97R/qcnulvp0Ytzr+YK94Rgccv5yOXkzFfsnXy6l1UX3xUx+qvpnVRp
         8KZw==
X-Gm-Message-State: AOJu0Yyzxi87RP/JNLQZtW7Ng6q+aUvukmiSRrGfc4qBz2jCWP2NhmaO
	3UG5UkPYNZ/zuwecCjCzAsLjgSlLAJF+q4pIIIqXIN1MTrpS4BKI1s8jfihoGnPdvVfEAhBKtG7
	uqkBEt/kvFuOkZNBxmSwYGs4C80YjljuI
X-Google-Smtp-Source: AGHT+IGgsV5rchD2zZTQLu2HtlbegbRjVSUCrIkLujd7cOerKf24grj+k//cgRDjFG15cmA/2sD3HR/OvJS3x5RuGPg=
X-Received: by 2002:a05:6820:1acb:b0:5e7:cb2e:dfec with SMTP id
 006d021491bc7-5ebee9974bfmr4209364eaf.8.1729776858052; Thu, 24 Oct 2024
 06:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241024130612.21656-1-schonm@gmail.com>
In-Reply-To: <20241024130612.21656-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2024 06:33:51 -0700
Message-ID: <CAMKF1srGS1Nh6=ZzpQF_gUQThXWXVqP5WNQn1on=gTUnkgcqkA@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH] libdigest-hmac-perl: upgrade 1.03 -> 1.05
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113168

On Thu, Oct 24, 2024 at 6:20=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> This new version brings an updated copyright date and a new maintainer.
> This distributes under the Perl license (as it did previously).
>
> Update the HOMEPAGE and SRC_URI to use metacpan.org instead of search.cpa=
n.org
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  ...gest-hmac-perl_1.03.bb =3D> libdigest-hmac-perl_1.05.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-perl/recipes-perl/libdigest/{libdigest-hmac-perl_1.03.bb =3D=
> libdigest-hmac-perl_1.05.bb} (57%)
>
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb=
 b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> similarity index 57%
> rename from meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> rename to meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> index 41b4e78c5..7b5980287 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> @@ -1,17 +1,17 @@
>  SUMMARY =3D "Keyed-Hashing for Message Authentication"
>  DESCRIPTION =3D "Keyed-Hashing for Message Authentication"
> -HOMEPAGE =3D "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
> +HOMEPAGE =3D "https://metacpan.org/pod/Digest::HMAC"
>  SECTION =3D "libs"
>
>  LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D17;md5=3Dda=
980cdc026faa065e5d5004115334e6"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D6;endline=3D9;md5=3D6321=
739e9ccbf74ee5dd2eb82c42d609"
>

The checksum changed and the number of lines for calculating the
checksum as well. are they still conveying the same license terms ?

>  RDEPENDS:${PN} =3D "libdigest-sha1-perl perl-module-extutils-makemaker p=
erl-module-digest-md5"
>
> -SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMA=
C-${PV}.tar.gz \
> +SRC_URI =3D "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-H=
MAC-${PV}.tar.gz \
>             file://run-ptest \
>            "
> -SRC_URI[sha256sum] =3D "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ec=
fb8985ba96da4a59"
> +SRC_URI[sha256sum] =3D "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a9=
92e87c4969fcdc7a"
>
>  S =3D "${WORKDIR}/Digest-HMAC-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113167): https://lists.openembedded.org/g/openembedde=
d-devel/message/113167
> Mute This Topic: https://lists.openembedded.org/mt/109189678/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

