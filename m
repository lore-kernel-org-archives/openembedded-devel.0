Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7747EC25B4F
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 18:05:05 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.41421.1715537101746043939
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 11:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1uIsnkT;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5aa3f0fcd46so2187170eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715537101; x=1716141901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXv4kvyVYmOFjnqtDQ39d+rmmwVqK4EMwpClFFfGsLg=;
        b=g1uIsnkTkZXJbJN+Liy3BdQVlCwiRij9L7CshMBk5+rGb4zVzVo8L9/SJknbaEXuv3
         uf4grEC0QzxY9w+dOl5sy6KVj7HA/tr2bhZCGYQ1/OausaApQtuqzyBoCaur7hOB+ZUw
         mqlrbIVHn9bBK8wk9BIY7PsYOLsqP8LQN0ihC4bcm9tP/IjM4U3e9/lS+UncLIxmbLMp
         ioY8vwnPbrjA7oOWIqmZVY6t9sg76U3wmxaHxYCZHqYQVQiMz3y47VCCuCqKsiaZ7+RK
         nV8mTPDb8ZydRm83aYRGOyK4PzHvwodHvFS/SUbAk9RnZazF0jlixV4N3ZzKsU7ivMpq
         ISkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715537101; x=1716141901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXv4kvyVYmOFjnqtDQ39d+rmmwVqK4EMwpClFFfGsLg=;
        b=MBJt/HnqLfNyL3PO7nC/Insq+u8HNgx7QBdHEbWKiqob8RAfKWk0Is1kZ913twrta3
         rK06SU9TzqEcGNIEO3Z9rXYNZwktQtAs8rpkg5XejhMrVT1hwESiWageSsWZ2OE/hoK/
         KGXGk+vMehUnKX4TkJrZ3IBRV79vjHS0ykz5vKU6owbSulPBf97a5Nw3atCo4Ywfl8CE
         TLdt8P/6O3r8vuNZXoTQ6HMO8kW+dK8blgyk7aylyC0N0phFw3rwrnKBFFAbysWNujQv
         ITWiOJO8Esq9CuRGesubbphkXpcdDaTIhqXtWGMJSyDNAxKXkfdQ+z4jLb3GaHA730Pp
         3wIg==
X-Gm-Message-State: AOJu0YxdNujmx6q6g19FVpcNgfRHSpfgnaOXxbWf7FgIKIWH76d6xHgK
	tOfmC/TcVBLiIp8sEznUcbDEv5R99plI6Cqk3bMA9vHNxjYCnF3n39To/8Y8kn6Y/5WxpmC7YBx
	LjarvaTjdWW9qsAg1FpgRt5+/dtc=
X-Google-Smtp-Source: AGHT+IFHXrGH9zC+bV6GaL0nooRQMU27lhlL1WwZDSBc2RkhK9A2dfg/RNbDLD9fU7seLgf5Q/nGdIAMmG2JZYr3Uik=
X-Received: by 2002:a05:6870:8552:b0:23d:49b4:6783 with SMTP id
 586e51a60fabf-24172f6b2b9mr8004426fac.48.1715537100699; Sun, 12 May 2024
 11:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240512091524.90050-1-f_l_k@t-online.de>
In-Reply-To: <20240512091524.90050-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 May 2024 11:04:34 -0700
Message-ID: <CAMKF1sqftMvKFVDkrDbAzzs=32ADVxNiqC4OgVZmYASRAPMoxw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] glib-testing: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 18:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110327

fails to build

https://errors.yoctoproject.org/Errors/Details/767428/

On Sun, May 12, 2024 at 2:15=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> glib-testing is a build dependency for malcontent, where building the tes=
ts cant be disabled.
> We can only disable the run of installed tests in malcontent.
>
> Normally glib-testing gets included as a subproject wrap which is inappro=
priate for
> yocto/oe. Thus we need to provide a recipe for it.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-core/glib-2.0/glib-testing_0.1.1.bb    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
>
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb b/meta-o=
e/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> new file mode 100644
> index 000000000..0f6ea7643
> --- /dev/null
> +++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "libglib-testing provides test harnesses and mock classes to=
 complement GLib classes"
> +HOMEPAGE =3D "https://gitlab.gnome.org/pwithnall/libglib-testing"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +SRC_URI =3D "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protoc=
ol=3Dhttps;branch=3Dmain"
> +
> +PV =3D "0.1.1"
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
> +
> +inherit  meson pkgconfig
> +
> +DEPENDS =3D "glib-2.0 gtk-doc-native"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110315): https://lists.openembedded.org/g/openembedde=
d-devel/message/110315
> Mute This Topic: https://lists.openembedded.org/mt/106052376/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

