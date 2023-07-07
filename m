Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BB3EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:57:47 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.5531.1688702262872249904
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Pai/y1Zz;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1b449890ef5so579632fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 20:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688702262; x=1691294262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWQZ2b7FCW7JG3veP8BHZXdDO3uP91s/ENRynnfXlNE=;
        b=Pai/y1Zzek6R02qdXSYGN8CwoS/CU91EPcJ/oEEPvCJnbutwMhI3WVW7My3ibKrUQx
         Gcq4iCacnCbig7Z4UJQZcrEC1mQ/ipn1TCTZEX70EcCFWs+IEpTji39ZhhqONBlwVx9N
         w0xCBFjcsut6d3C2m83G+4Vg1Fb/o45xce046PytWMJ21FbhXqtsKu7Ole1jRlPaW3pX
         pJgRwG5fDVPwBZ9rKSF6XS72bZno4C9TZ14MFIiXhmWe1BbF2tQuMFqKi1EB1zNaMwBq
         xT380+MtU6B5h/e8X7wUIHYAr/6Np7YL5Ggm5BKtPLX7JEuWpHcS/yPwJL/drw+uFQWD
         iuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688702262; x=1691294262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWQZ2b7FCW7JG3veP8BHZXdDO3uP91s/ENRynnfXlNE=;
        b=SgrEZaDE5zriNIhr0KQ5hXuhFbSxic38iM9wrun6BUJEchlCjhI2paSEay3Ay+jpPB
         IUWULy8AMKEfOuRayOgKvvhTywzmu+FTnAcicTpoXNX/T2UhKRlR+ePq6WUJ0+MGTk9r
         CALFZOWCoZPw3OJWWXrNEAbFCgFHJf89Wo1NbWsjvPAbfEfWeCb6vdgH2fd3qGr29BNb
         yAlpvJ/Qg2Fm/8QTvXpti3+ODKhKJY/IH02eHb52+BFcL5cKgg8mGwNZD+MYfoLjLzWV
         bI4f3AVAJPT25EvTeeW3a5wTz1R3vTXhZlo4tPVAT4Z7mqbjk+phrCxJWnvNRSQt3QIU
         SAnQ==
X-Gm-Message-State: ABy/qLYoAnIKz4T4Rck6mo7qbkU3yxb3f3v6/TVnGl/Y/Dwp2FAJ2GKR
	gHo6YJ4UIRqH0JjuXmX9DcgiY1lE068tNcjgcBs=
X-Google-Smtp-Source: APBJJlH0pzdOgLaW/i/3AmlgsElP0YJOx4sdp/6gXooKDZ+kb631ARdELhFp9v9Lb2jYVoycS2La6WUVx+9fkNbWzUo=
X-Received: by 2002:a05:6871:294:b0:18b:1936:30ee with SMTP id
 i20-20020a056871029400b0018b193630eemr4319308oae.56.1688702261829; Thu, 06
 Jul 2023 20:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com> <1688699627-2519-8-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1688699627-2519-8-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jul 2023 20:57:15 -0700
Message-ID: <CAMKF1srRmosHF7J0DPr+rFBwAcnVS7qKO85Ok6C9o++Lp_Lk0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] passwdqc: upgrade 2.0.2 -> 2.0.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103709

On Thu, Jul 6, 2023 at 8:14=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> makefile-add-ldflags.patch
> refreshed for 2.0.3
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Added pkg-config file.
> -Changed enforce=3Dusers to support "chpasswd" PAM service in addition to
> traditionally supported "passwd".
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...rkmanager_1.42.6.bb =3D> networkmanager_1.42.8.bb} |  2 +-
>  .../passwdqc/passwdqc/makefile-add-ldflags.patch    | 13 ++++++++++++-
>  .../{passwdqc_2.0.2.bb =3D> passwdqc_2.0.3.bb}        |  2 +-
>  3 files changed, 14 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.42.6.bb =3D> networkmanager_1.42.8.bb} (99%)
>  rename meta-oe/recipes-security/passwdqc/{passwdqc_2.0.2.bb =3D> passwdq=
c_2.0.3.bb} (96%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.42.8.bb
> similarity index 99%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.42.6.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.42.8.bb
> index 3196b0c244..5d9c6f4274 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.8.bb
> @@ -32,7 +32,7 @@ SRC_URI =3D " \
>      file://enable-iwd.conf \
>  "
>
> -SRC_URI[sha256sum] =3D "8c388ac3775ac6bceb605fae21be2c3e261cafe6067994a8=
9f0dfa4610ed0279"
> +SRC_URI[sha256sum] =3D "0337e7583d2ec5ade2ba2e8c625d2f09eeccda1d22836ee2=
9aa72925d399c353"

Please separate the networkmanager update into a patch of its own.

>
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
>
> diff --git a/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldfl=
ags.patch b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags=
.patch
> index 6e4803f4f3..4e9659aa58 100644
> --- a/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.pat=
ch
> +++ b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.pat=
ch
> @@ -3,10 +3,15 @@ Add LDFLAGS variable to Makefile so that extra linker f=
lags can be sent via this
>  Upstream-Status: Pending
>
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + Makefile | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
>
> +diff --git a/Makefile b/Makefile
> +index 404f036..a9b18f0 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -68,18 +68,17 @@ XGETTEXT =3D xgettext
> +@@ -75,13 +75,12 @@ XGETTEXT =3D xgettext
>   XGETTEXT_OPTS =3D --keyword=3D_ --keyword=3DP2_:1,1 --keyword=3DP3_:1,2=
 --language=3DC --add-comments
>   MSGMERGE =3D msgmerge
>
> @@ -21,9 +26,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>         -Wl,--soname,$(SHARED_LIB),--version-script,$(MAP_LIB)
>   LDFLAGS_lib_SUN =3D $(LDFLAGS_shared_SUN)
>   LDFLAGS_lib_HP =3D $(LDFLAGS_shared_HP)
> +@@ -90,7 +89,7 @@ LDFLAGS_lib_CYGWIN =3D $(LDFLAGS_shared) \
> +       -Wl,--export-all-symbols \
> +       -Wl,--enable-auto-import
>   LDFLAGS_pam =3D $(LDFLAGS_shared)
>  -LDFLAGS_pam_LINUX =3D $(LDFLAGS_shared_LINUX) \
>  +LDFLAGS_pam_LINUX =3D $(LDFLAGS) $(LDFLAGS_shared_LINUX) \
>         -Wl,--version-script,$(MAP_PAM)
>   LDFLAGS_pam_SUN =3D $(LDFLAGS_shared_SUN)
>   LDFLAGS_pam_HP =3D $(LDFLAGS_shared_HP)
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb b/meta-o=
e/recipes-security/passwdqc/passwdqc_2.0.3.bb
> similarity index 96%
> rename from meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
> rename to meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
> index 8462701b31..8694052e61 100644
> --- a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
> +++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
> @@ -30,7 +30,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dac99c8678577=
a1c2f9f04cccee411d5d"
>  SRC_URI =3D "http://www.openwall.com/${BPN}/${BP}.tar.gz \
>             file://makefile-add-ldflags.patch \
>            "
> -SRC_URI[sha256sum] =3D "ff1f505764c020f6a4484b1e0cc4fdbf2e3f71b522926d90=
b4709104ca0604ab"
> +SRC_URI[sha256sum] =3D "53b0f4bc49369f06195e9e13abb6cff352d5acb79e861004=
ec95973896488cf4"
>
>  # explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
>  # this package's pam_passwdqc.so needs pam
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103695): https://lists.openembedded.org/g/openembedde=
d-devel/message/103695
> Mute This Topic: https://lists.openembedded.org/mt/99999658/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

