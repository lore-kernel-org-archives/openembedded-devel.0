Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09A6C7EE2F
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 07:15:02 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.6900.1724915694029970831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 00:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gb402Bpk;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-26fda13f898so233781fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 00:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724915693; x=1725520493; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOkuXUruNL6Fq85G3wudV5FgKbEPI9y+6TpSIAUgcXA=;
        b=gb402BpkRRjEGtPE2oEhbWD5hKsxNjliNeinVl4Clgt6jbMworBZ/XbE2IrdbJa5wr
         dbGHmdjJR7tWYQSGpWhDgc5zuH9oD8Cj/jONvlgx4ZMblnFRSsrofHRquvuIkFA3/Aqh
         1yUsZivJ3L/7LjuG9YyhY0ELSQl7FZ/o+0GbLeGqrJk0m6ITE7Z4Dccwz/oBZn5BxdKY
         IkeVl0KVUX6u+IG1izqYy9HhP9NJ7G5VoQ2iCNLDGYUn54BnG/gzqBxCLG0WVlcco51t
         MfBY/dEGD4CgJY4Qr1mDeF8fxnO9ixiPvaCGJR9fNidLtiZUsy3Jer+8fP6I1D2E4I30
         DyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915693; x=1725520493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOkuXUruNL6Fq85G3wudV5FgKbEPI9y+6TpSIAUgcXA=;
        b=nc6uKmjrcSK8SM2Z3Dr9dLPsUVLj/ciNdhsnMgMzMbIy8hD0fGkja97uTJJW8z9H3C
         ihT2ZrvY5XRT8SoVgHNUaPAy2liLTjg3gf9s6xc0DDs7S+izBO5oL/lnFgpgMc7kGDEj
         lumd5ghEb/HOAnaTXFycVhx3YPjLIWgzyR8r0PkyYuklYSX7ZldLUKJare0zRrdx3SYw
         Jv2bl+S1XRkU5wpvq2C943jVPvVB+LdmIq2MVfJbkZWuhdI1sN+epcrWr9sPxmiJfjHP
         9fZigAfaFUSWFhMaodCNP+Gao1iLw+eolU2a0+wWwFVQ9j0gXvHEhaN5qgUWqSCZ4swG
         eJsQ==
X-Gm-Message-State: AOJu0Yxxb4ZrNhX/bHaQzMuOKpsX8OiNG6hWw5J5aYFjH30bGgu5CeRV
	WMRusOb38SgCPgEtp5PFEH7J0W4+wVCjNUSpYI2kHyjYYn9GRGaP+rnTdozYnqMe+zqdG6fQ5+L
	dDy1WAMeIxxn+I8ZS2VE84CH+7/U=
X-Google-Smtp-Source: AGHT+IG2jDfDUlYBrUYLdfIXWTTbcVoJl7v/CQA12HBM0qSKoX6HY/ZFcxe7NIalzFm2xKZXo7jwqubCT9zYIlviH3Q=
X-Received: by 2002:a05:6870:b51e:b0:270:2c7:e19c with SMTP id
 586e51a60fabf-2778fd52625mr2417807fac.0.1724915693210; Thu, 29 Aug 2024
 00:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <1724912426-9977-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1724912426-9977-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2024 00:14:26 -0700
Message-ID: <CAMKF1sos+mxpioEQRznjmftqCEn31jZp=bqh7H3ZMRG_Q8AGWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lastlog2: remove recipe since it has been
 merged into util-linux
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 07:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112034

can you rebase this on master-next branch and resend

On Wed, Aug 28, 2024 at 11:20=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> The lastlog2 has been merged into util-linux:
> https://github.com/thkukuk/lastlog2/commit/60bea9dcee0fa18ea3dce0372a14f5=
e4f177ada6
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../lastlog2/lastlog2_1.2.0.bb                | 36 -------------------
>  1 file changed, 36 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
>
> diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb b/meta-o=
e/recipes-extended/lastlog2/lastlog2_1.2.0.bb
> deleted file mode 100644
> index 0b3ab1f82..000000000
> --- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY =3D "Y2038 safe version of lastlog"
> -HOMEPAGE =3D "https://github.com/thkukuk/lastlog2"
> -DESCRIPTION =3D "lastlog reports the last login of a given user or of al=
l users who did ever login on a system."
> -LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003e=
a2c"
> -SECTION =3D "libs"
> -
> -SRCREV =3D "6138dff6f2a5216065fa4833a223b56d98cb62f3"
> -
> -SRC_URI =3D "git://github.com/thkukuk/lastlog2.git;branch=3Dmain;protoco=
l=3Dhttps \
> -           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
> -"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit meson pkgconfig systemd features_check
> -
> -DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)} sqlite3 "
> -REQUIRED_DISTRO_FEATURES =3D "pam"
> -
> -SYSTEMD_SERVICE:${PN} =3D "lastlog2-import.service"
> -
> -EXTRA_OEMESON =3D " -Dpamlibdir=3D${base_libdir}/security"
> -
> -do_install:append () {
> -      if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib !=3D `dirna=
me ${D}${systemd_unitdir}` ]; then
> -          # Fix makefile hardcoded path assumptions for systemd (assumes=
 $prefix)
> -          # without usrmerge distro feature enabled
> -          install -d `dirname ${D}${systemd_unitdir}`
> -          mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> -      fi
> -}
> -
> -FILES:${PN} +=3D " ${systemd_system_unitdir} "
> -FILES:${PN} +=3D " ${libdir} "
> -FILES:${PN} +=3D " ${nonarch_libdir}/tmpfiles.d/* "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112032): https://lists.openembedded.org/g/openembedde=
d-devel/message/112032
> Mute This Topic: https://lists.openembedded.org/mt/108156758/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

