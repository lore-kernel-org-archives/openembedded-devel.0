Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE90CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 00:00:18 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.920.1778630413033692895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 17:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NZPTqCEu;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-47cba53479aso3808085b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 17:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778630412; cv=none;
        d=google.com; s=arc-20240605;
        b=UTiWHNqaP6lWBWUooc/aqCc5o2m6puit7+l9f3T21VhTOJKhgLqG4+W8epyF7RpUKP
         k2D4xTbzy6xEwFPtESpchbtpQIcxF7k7sCkWsjPrsOt/gMLKbBNnFOpVFGbvfGyv1QvZ
         CcifQvFxw+v84d5b5NfDPsSUUjDJ29k6OFtgDtuez7uwZXrPBPel7dVS8Tajl2RpvZ7l
         bRvKze6OPwMuUGwp6JGwj3Kh23t+dh7kANSXPXHyWGoAR+rS6SkLoXxM3El0bvxN/D4G
         0OYqFV2Yo93fvM47hYo1R0ZQ1D7R/fm6G7CzBf/zlJQ6eVpVLS4NCvjwMxFZDF1jkyDY
         NjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Seqm2kXvnpbUa9olWYo8S//MLzDkeP1Ul4v7j4DAAHI=;
        fh=XOI6TtVZPT4M4+St2buSvvvpyffvGrE/xpgLSZrQNok=;
        b=O3752gCVQjq0ZBDnSgKKAkijk5qpbQZc5UgLD8cPZu1t5phGiK14TmLoF18BaC/HZg
         ZmXRhSiWPgWyMgwQSQzYceRhC2qWPlBjE06Vh77Gu412VZln5IqUs3jrgOXWrjvdc5eo
         LWCW/iJpFS8nFgnmRUb6Un/dPIU5lt2JUF/NGIUKMfPMzqtPCTlHLoHNc5ghOyp34301
         qw3wy20Zb6b9k9R7GIhvJ0aASWCyJjDAtVuk3l+0vIlx2ckPq136pc1VGVeX89EtqZvm
         jwsxXhfiQVS+VJengVGNSo6NKCLAYZQglN5d8Qa2+FywIxeKV8eC1fqr9XYYrVl9yFR5
         WUfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630412; x=1779235212; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Seqm2kXvnpbUa9olWYo8S//MLzDkeP1Ul4v7j4DAAHI=;
        b=NZPTqCEucOm7GY62doBoOOKvCjvWpB/bbjCSYX+9CTKou65YncB4SMz0KKc4zP9pTN
         E423ccAeVXg3qDqJEecgLLYDM4ereHsUeKbP2PlVHRLXzZ7omiS38GToLDOKc/j9Cubn
         HCUq4x/NewgqjHkP46ypOJSwT+BqrHYIl2wZjp5nyNO1ukPxE613wWm0QC8nqIK3ABfc
         OvHUZ3j9BcpRKGpbxINPWed4CPXwOreU7t96FfE4rHWo4snenM+EFmf9O2DtFk43PHko
         PnagmgyreG2GdGVHK3nFgU4dghDVwNsuoA+5aP4TgEkHhJ0cgmYbQs/0JBIn1yAmT7rk
         aW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630412; x=1779235212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Seqm2kXvnpbUa9olWYo8S//MLzDkeP1Ul4v7j4DAAHI=;
        b=EOTZvs6nub4rxbXvcxeMTIiA6C9lkIEr5V9tQOJN2Li0ngaPKUGu6ESvqx32cPv7jG
         qDAvYTcdugzlqPFGSPL+VPHJTrajm+PxId5bDvKzNpqM/wGjLuqTt7cRp4TpAic4kbwn
         KMyZH8yO22TM2Mozf/1IUmbNY5GVKVurgQ14Vf/E/ywaJ35/GBa5pSM6zK/kYoVgX3jF
         8/45NVCm1HJLAsQFSPjAqR00S3NmLYdyuG5U0XULxSPn+p/nOkAMdvHiLQWAm1i7l9bD
         IscvtYERwY9JxrfGrN2psj6bLU+7popSoq1BDEjUVGTf1NZjFkGR2XJDSvyMfd+S0UcZ
         Uswg==
X-Gm-Message-State: AOJu0Ywdaqs8o1JVDRuKp/i/fwK69HLK+kEWRu2Cug6SZMnBj0SizKVw
	k7gJ/OsqAFkFrAagAAlIeFykpOzl7v2NcDKU+TY0dfIgXCLgK1hu3NXexxxlhP4jLW9n3HSOZ6b
	1vhCnucCr+nYZyTKdD1DvSZyLrvEQbxE=
X-Gm-Gg: Acq92OGCV49kBlCMRo6bF5jv2RRr88L6zLvXpVDJasaq2J/r+Sxde24L53qCcEBIHck
	j5oBr1ZmNGMKTm6ixGURbO0evSbNcVvFKCXbyq/nLgOvqnAwaIbWzm9Uj85tuxVfty4ZUeVj+xU
	sD674pRmOdbCMiWbhPMJ4ushqEc2rd4yypPPBDhaOaEqmxTdJ93YbgYu7Fz329pdbtZjcixsEfW
	p91/pUraboRixlicEbxaSU1A+vgc7U9x0kw3ZHv9qYQEg6CEbDguKHsX37CUdHDLxh1Vc6ewQHj
	aXFRfcpNzA==
X-Received: by 2002:a05:6808:6613:b0:482:462e:6a8b with SMTP id
 5614622812f47-482b2cb394amr883976b6e.28.1778630412159; Tue, 12 May 2026
 17:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260512163727.3832144-1-ross.burton@arm.com> <20260512163727.3832144-3-ross.burton@arm.com>
In-Reply-To: <20260512163727.3832144-3-ross.burton@arm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 May 2026 12:00:00 +1200
X-Gm-Features: AVHnY4KO-8IiSh43biJQnn3N3wO7GgXP8ABPe1WYE1lQ_aldTbWOMPvptt_ycYs
Message-ID: <CADySD0EJ1NrpB7KdQOKaSMkdFsMbRuy9bJ0onwu4hY6gSaAdPg@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/3] libhandy: add recipe (from oe-core)
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 00:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126877

On Wed, May 13, 2026 at 4:37=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This was previously in oe-core but is being removed as it is no longer
> used by anything in that layer.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libhandy/libhandy_1.8.3.bb                | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
>
> diff --git a/meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb b/meta=
-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
> new file mode 100644
> index 0000000000..cf2c64f8d0
> --- /dev/null
> +++ b/meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "A library full of GTK+ widgets for mobile phones"
> +DESCRIPTION =3D "Library with GTK widgets for mobile phones. Libhandy pr=
ovides \
> +GTK widgets and GObjects to ease developing applications for mobile phon=
es. \
> +It was developed by Purism (and used by several official GNOME projects)=
 \
> +to extend Gtk by providing mobile-friendly widgets and make the creation=
 of \
> +responsive apps easier."
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libhandy"
> +BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +SRC_URI =3D "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=3Dhttps;=
branch=3Dlibhandy-1-8"

Can please include tag=3D${PV} in the SRC_URI

> +SRCREV =3D "9b0071408ce86a3ef843806fddd723a85f6f2416"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +
> +inherit meson gobject-introspection vala gettext gi-docgen features_chec=
k pkgconfig
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +
> +DEPENDS +=3D "gtk+3"
> +
> +PACKAGES =3D+ "${PN}-examples"
> +FILES:${PN}-examples =3D "${bindir}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126874): https://lists.openembedded.org/g/openembedde=
d-devel/message/126874
> Mute This Topic: https://lists.openembedded.org/mt/119281126/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

