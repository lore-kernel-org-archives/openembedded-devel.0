Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B1AC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:49:36 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.19181.1691678975491779924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SAULSkq4;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a74d759be4so807318b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691678975; x=1692283775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJhe2RjyWU8sCal8Xt9v1QJS2HsPFH46Cg8wZCCNP/I=;
        b=SAULSkq4kBcT+iV/o3kC5yJ6mAAyo0pOESyWGCplAJjvhm7HwnVgcf6E5oiAT+/tn4
         wfH8Z0sehOntLfeO/22BkuAkPFrJWZdXM687QqDW6pvn9opTJ+oMJRux5DLGdDKGT5y+
         8ppfs548Zj8dCeB0Lezxi+D/tGDUrj8QfhmQsG46S7n4NwnN4UFT/74E1ShGKEdeLdBC
         t3uNJauCIWu/760TmBWibnZkihuaSewVsVez/fQ8mmi4fgB2z4yiXzyvSIenxUpUbRAM
         T79xuwPVkR4mUaXDZELf/yDif/YjUsYpGdu5b/2A5eRBwaSmxUOG/xLpk341vWlvN0l/
         EHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678975; x=1692283775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJhe2RjyWU8sCal8Xt9v1QJS2HsPFH46Cg8wZCCNP/I=;
        b=WIaJuUmPri0Gp9o6mGTGZQYOEqgX6mZpdEe82UTf/DKWn9aVyS6aJMK/sX7MBnkZFz
         wEhUHMuBqMuaGywC5e+to7cFlLC06lTS9pX4TyNOZFqCRYFZsjRgn83NPNcmea/q0VUk
         lLdl6VbEGNExO/brm3PL7DU8D2VD6WuZUDrWtiwARa5W95+MgL1FbWq5EoEjRyZGFvmk
         I5MV1FKrtZH+nKFH4wYXju67fX+fUN24KrTfUgHnAUQWbq5Yrf6/9zq4It+kiO70d/Gd
         eh0pEEVOp8iDhlzZgYkegknr+KvAq6vSpg0Y6ItkGEyk1nY+FTwbDML5DIOusH4zDVPy
         5eWQ==
X-Gm-Message-State: AOJu0YyOF9UN1WEXNiL1anNNKIEVrfJ/bJlaGoaDxgGyx+eW94vgl+3W
	yQF+KOV+WliVklhBAztZxvZm/CQUtQBgjikLuoc=
X-Google-Smtp-Source: AGHT+IGMr618cDuTokgksWQQrzzYrFrrd+Yr9w73Y+klir3pQ9zRkzR1oRwZfoCmUoWcD+83QIQagr+grp8zaY2BXtY=
X-Received: by 2002:aca:1113:0:b0:3a7:83a7:ae71 with SMTP id
 19-20020aca1113000000b003a783a7ae71mr2757872oir.54.1691678974615; Thu, 10 Aug
 2023 07:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230810130340.14130-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20230810130340.14130-1-sudipm.mukherjee@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 07:49:08 -0700
Message-ID: <CAMKF1sr=a51pAYGHV289bKNUWkpQ8Xi=6xzUYXwer4iPJxEyCw@mail.gmail.com>
Subject: Re: [oe] [PATCH] recipes-extended: Add initial recipe for qad package
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 14:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104324

I have fixed the commit summary to match format

recipe: short summary of change

On Thu, Aug 10, 2023 at 6:05=E2=80=AFAM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> QAD is a daemon used for automated remote testing on hardware which can
> take screenshots and can inject mouse or touch and keyboard events.
>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  meta-oe/recipes-extended/qad/qad_git.bb | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/qad/qad_git.bb
>
> diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-ex=
tended/qad/qad_git.bb
> new file mode 100644
> index 000000000..e2a59139d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/qad/qad_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Simple, REST-API compliant daemon for automated testing"
> +DESCRIPTION =3D " This is a simple, REST-API compliant daemon which make=
s \
> +automated testing on hardware possible by removing the need for physical=
 \
> +intervention as Q.A.D allows inputs to be injected via http/https reques=
ts. \
> +This both eliminates the need to physically interact with the rig and al=
lows \
> +for tasks to be carried out entirely automatically."
> +
> +LICENSE =3D "MIT & GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D402cce7fbcb6ea9ab5a0378dd7f40=
806 \
> +                    file://openqa/COPYING;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263 \
> +                   "
> +SRC_URI =3D "git://gitlab.com/CodethinkLabs/qad/qad;branch=3Dmain;protoc=
ol=3Dhttps"
> +
> +SRCREV =3D "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
> +
> +S =3D "${WORKDIR}/git"
> +PV =3D "0.0+git${SRCPV}"
> +
> +DEPENDS =3D "cjson libmicrohttpd libdrm libpng"
> +
> +FILES:${PN} +=3D "qad"
> +inherit meson pkgconfig
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -p -m 755 qad ${D}${bindir}/
> +}
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104315): https://lists.openembedded.org/g/openembedde=
d-devel/message/104315
> Mute This Topic: https://lists.openembedded.org/mt/100662750/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

