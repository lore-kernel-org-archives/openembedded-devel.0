Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06D0EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:02:48 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.201.1689372164579618270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hXM4eHDi;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1ba4460f0a4so824418fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 15:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689372164; x=1691964164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/v4CCMwrm59AVAXMgVlAcpdEBaQwMqleZkcSWNr7hE=;
        b=hXM4eHDiTZpZ5FmX16/j+lQm5zVDGXTtkeYpHBONXnVH1Oq9YDfSUY0XrOdTyeAJYF
         r/K5uDu2nBV3uoCYEn7oUy+rvH0tZIZ50IvJ0sWMMeQ5Sq6JHLOQioqylFR1a3a/5M1b
         gP1LK6B9NExuQqx3YsaViixTwA7I2iZ6RtA9uJwvPwLDYlDZkDj6YSZfJoXkVJJsXq/N
         YDgu6fmDB0tN2O5qn+P2xJTyPwxzxThCCtmehCcKPRBLy0tGK28XYrc+22u1OmTM8s0Q
         A0Fw0PmDp4dWPpTeKxYqWSaAvnhR7l/r8dqbC6hCAFk7T+uMLPaEOJWQbf2B71vuEtkJ
         qDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689372164; x=1691964164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/v4CCMwrm59AVAXMgVlAcpdEBaQwMqleZkcSWNr7hE=;
        b=cmh+UarXJHiRshzi7iwxikM93AuI4YagkuGKm39L/4VpRZhB0dI3RaAaW9dRKTJi0R
         sWuPHYMPIWtj+Zi4h2rj3dCxRXGnQgOYHHCPZlEwYYISQ0k0jQsQxGUppHJMxRnH/QnK
         x+u9nqTycPVBxFpUogQuWsDuigRaOlb+nVd27twG+cWJh1KkOQ2Z2I990RMo4o5p96ZZ
         UtW6hgjTxcQH6C4iih9BhIEYRUKpDZkszxG4XR6YFXsP+UA1WY1icZ6VrDWPdplKZNjf
         IspcAXypoyR5cFnc4C+DS5kkUKrfJQVZUJNdcV8K7BOmxStBu57vsA5q2AGs8Di8ZJIp
         KH6w==
X-Gm-Message-State: ABy/qLZcJepr0VcjK/+pRw7eiDDQ0F+vSMOP4Or4NxuPRBAJL6f5ChI2
	Lux/SJbIMrqvIyZlONxviOSh24mwL/DWd9unnG94Z0rSFz0=
X-Google-Smtp-Source: APBJJlEvhhgpCWiheGYEnj9Qkir9O6xmY/nV2UVZIhZsj/EdddzKNLSJ/kLNkEGNDHVV5GYWTRNmyrpcYZRxrsdqfZo=
X-Received: by 2002:a4a:6f1a:0:b0:566:f211:5fc4 with SMTP id
 h26-20020a4a6f1a000000b00566f2115fc4mr273956ooc.5.1689372163675; Fri, 14 Jul
 2023 15:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jul 2023 15:02:17 -0700
Message-ID: <CAMKF1srq2ACQjEsemGa4YceBb2NbxDHLxKGHJRdK38h4YS+hmQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lastlog2: add new recipe
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103869

fails to build with ptests on

tests/tst-y2038-64bit-time_t.p/tst-y2038-64bit-time_t.c.o: file not
recognized: file format not recognized

see - https://errors.yoctoproject.org/Errors/Details/716657/

On Thu, Jul 13, 2023 at 6:01=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../lastlog2/lastlog2_1.1.0.bb                | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
>
> diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb b/meta-o=
e/recipes-extended/lastlog2/lastlog2_1.1.0.bb
> new file mode 100644
> index 0000000000..cc60a46899
> --- /dev/null
> +++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Y2038 safe version of lastlog"
> +HOMEPAGE =3D "https://github.com/thkukuk/lastlog2"
> +DESCRIPTION =3D "lastlog reports the last login of a given user or of al=
l users who did ever login on a system."
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003e=
a2c"
> +SECTION =3D "libs"
> +
> +SRCREV =3D "585153a577788c590370d20e40263b61238dfab3"
> +
> +SRC_URI =3D "git://github.com/thkukuk/lastlog2.git;branch=3Dmain;protoco=
l=3Dhttps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd
> +
> +DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)} sqlite3 "
> +
> +SYSTEMD_SERVICE:${PN} =3D "lastlog2-import.service"
> +
> +EXTRA_OEMESON =3D " -Dpamlibdir=3D${libdir}"
> +
> +do_install:append () {
> +      # Fix makefile hardcoded path assumptions for systemd (assumes $pr=
efix)
> +      # without usrmerge distro feature enabled
> +      install -d `dirname ${D}${systemd_unitdir}`
> +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +}
> +
> +FILES:${PN} +=3D " ${systemd_system_unitdir} "
> +FILES:${PN} +=3D " ${libdir} "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103858): https://lists.openembedded.org/g/openembedde=
d-devel/message/103858
> Mute This Topic: https://lists.openembedded.org/mt/100132957/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

