Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB0CD2127B
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 16:23:50 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.26582.1729268620678582966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 09:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GPeEc5hm;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5eb6abc6345so1116022eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729268620; x=1729873420; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwIprFKqg6W19sSJHWoYAsFCiHBLhcIQpb3qr/S4s4Y=;
        b=GPeEc5hmHtfJ2hmSF+vAQ89PlUoI/6wEh1Cz9RE30E47Lao2iIGAV8yF2WmC8NUCXL
         LCTne6ggLfWpJMKZ7U+kv2xP8OKR2FuHVGE5VMH30prwzMpGeqZkiymP0fU91CSEDOQt
         UH/A0q5H8rumIIvdMN03NkUDVhA5Ku6sQWOBqoqJ4ELjhDotjNC1cf51zuBvQZBTSU7t
         qdEDA9t+DlghD1aUgDjwR88cUvcYg/28QGgpnsV4hogQX/QAgzhChkkXd66/2gcpdhgD
         +DorK6wNDU1ps5teQlhb3WnJ1qTYZJhYwoV4S3IdGZ4T/TStyuEDmI8msfF6aUKaQHvg
         R+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268620; x=1729873420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwIprFKqg6W19sSJHWoYAsFCiHBLhcIQpb3qr/S4s4Y=;
        b=mZsMxkYmZtho67MiRf3T7KkXn0O2v4bMEFBtS3wQH3m2v99KsfSu6Y7sarSw4vuBb3
         vVQPulyn9MF2Ei0eKCKEqD7iIViTCwL39Yz2FqM5NaRbCO42P5PGlUI+8C1YVYzIDVEt
         Vum05pb5bRUbL2PwRCv0uEoK4CCxoM4cqBq5XfodCY6IoCdqoXgiTiOB9GsxIP+iB5Bw
         pxhrvyoQ5UV7gWDRFnZ1WQtnwb+cHvIMFTbzbCSwjRVCDEV6/+BDMmIs2h4aqwWzQDnU
         O7hIAzxdqZpCq4GaXdcO+Zj9KVHac+eHRxChla0CiPn9PI8ylQGM/3gCXT6WZqA5fFLl
         X5Sg==
X-Gm-Message-State: AOJu0Ywcecbce7pWzcthXzJZkqPqBmJ0WXgakHe8dabLZsGPIP0wxTpO
	w0RvZnXULYARfTusz1YcVpEscYdwT++bIwx+kWSh8ZLNhzvPIj8c0uoMdx5xh9ukaVRQygRgK4j
	kN3X8kOEUqJRHrOnN4TtGRs5YIDs=
X-Google-Smtp-Source: AGHT+IEFO+N8tzKoZE8uOCjRPZcOmHLPeVGMy12dT8JhOuIFwxIG69w28OdnV4syZydMbQfMltucfB3vdwCF+ryT4Es=
X-Received: by 2002:a05:6820:c91:b0:5e5:b652:9d14 with SMTP id
 006d021491bc7-5eb8b3a7e37mr2554853eaf.1.1729268619471; Fri, 18 Oct 2024
 09:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241018131724.3051-1-f_l_k@t-online.de>
In-Reply-To: <20241018131724.3051-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Oct 2024 09:23:13 -0700
Message-ID: <CAMKF1srcCF_yCHMuqaeCT2UxC_ZgKN=S_bVzCsQMmHQRidt+sw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] snapper: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 16:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112984

On Fri, Oct 18, 2024 at 6:15=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Snapper is a tool for Linux file system snapshot management. Apart from
> the obvious creation and deletion of snapshots it can compare snapshots
> and revert differences between them. In simple terms, this allows root
> and non-root users to view older versions of files and revert changes.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/snapper/snapper_0.11.2.bb | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
> new file mode 100644
> index 000000000..2759cdafb
> --- /dev/null
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "Snapper is a tool for Linux file system snapshot management=
"
> +HOMEPAGE =3D "https://github.com/openSUSE/snapper"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
> +
> +# Build separation is slightly broken
> +inherit autotools-brokensep pkgconfig gettext
> +
> +SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;bran=
ch=3Dmaster"
> +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'api-documenta=
tion systemd pam', d)}"
> +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
> +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
> +PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxslt=
-native docbook-xsl-stylesheets-native"
> +
> +# Avoid HOSTTOOLS path in binaries
> +export DIFFBIN=3D"${bindir}/diff"
> +export RMBIN =3D "${bindir}/rm"
> +export TOUCHBIN =3D "${bindir}/touch"
> +export CPBIN =3D "${bindir}/cp"
> +
> +
> +do_install:append() {
> +       install -d ${D}${sysconfdir}/sysconfig
> +       install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconf=
ig/snapper
> +}
> +
> +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/zypp=
 ${libdir}/security ${datadir}"
> +# bash is needed for the testsuite
> +RDEPENDS:${PN} =3D "bash diffutils util-linux"

It would be good to package test binary and resources into ${PN}-ptest pack=
age
and then attach the needed rdeps to ${PN}-ptest package also look into
inheriting
ptest class which should provide a basic build block for adding ptests.

> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112978): https://lists.openembedded.org/g/openembedde=
d-devel/message/112978
> Mute This Topic: https://lists.openembedded.org/mt/109081580/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

