Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ECFC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 18:10:38 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.24776.1736791828297322025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 10:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uj3IRlh0;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f4c111991bso2314729eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 10:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736791827; x=1737396627; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3A8yotqinyrNyJyqggy1cbBnKu2O4M2KUybEvAMV5I=;
        b=Uj3IRlh0T0ULh+Hh2Zr17d1cWoR63Y7ShCr6/KQAQN92owS0vt9Gg8zbptq/9qGbup
         KhuSvDMtJjQXg8b00fEOZfGPMicxA1Go1jJjdqlkIVmeO8eBqIIbFgvxgshHvYKuqfZj
         YU4irieeQckyxtc0B7hOYgC7Ad+MiDPp3ZlB12XZMJWvDKwbC84u3rIjC6gEtC8aGysD
         F1fyGZtt0zw/y50RyUXy3zt2oguyDDspqDCAupzz/DWJCcE94ggUhII+AUxHrZMWcuCg
         uuyzDVqEPWhW25t4BDUG0Y7hADYvr4W3XhC1Xzsb60T2PKqdLYmCDGjzBftfX0EdV81+
         04aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736791827; x=1737396627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3A8yotqinyrNyJyqggy1cbBnKu2O4M2KUybEvAMV5I=;
        b=Y+IWTanjlxn9TTv28po3DEHlNbLow5dIElywKOV6j1KVoUePJB9wiuI4JlySpify6D
         Wz9AOJx9pt+6zhaoU/kQuXzu5cCMgggQKM//9ZzAEEpAC2sRxgkJDT7TQErMt1Mnftci
         TSZpgW3cpDOIP7uriRVrzw7rhurfoKdTCRxjHJhZf57L7HiJOqL5UiIsa694BwVevC/u
         FlVHoYRq9UR7P6NwfWmHJ85sTvKfoSBkdJ4gD/NR3j5aGqvOLisyOYZAduf7EXh2qrsa
         EzLDpE/T0AnyhYeraQ1GbEpGHWCUP+EATecwuwPVIwO9q+HtthJYymEX6Dp+nFWnEQa7
         5/9g==
X-Gm-Message-State: AOJu0Yy1e6Bp8cVX+29tPX5QjwP7CKOo7Fks6EqM+WTodgqom+aHk1nt
	oCl5VYNnkStAFTDw3hvKDnO55sG4/tpGx3HpCuuzKJ8nVceiiH2dfDVNuHDa+06gEI5ypJkk7J6
	2FNKTAi6INj267xN8A6rEnWlsex9DP0rk0CE=
X-Gm-Gg: ASbGncub1btTFT3r4gKtYAfXdyB+RQLvj6i3bsY7xmcIImi5usqsIRtWScGQ/IXKVk4
	ZNEkO8ZFoS/h81AtuBhs5m5dM/w4vkSY+Xol0
X-Google-Smtp-Source: AGHT+IE5u1sUyi0cygNn5in6iHz1BqBLav3jCKBkcibQf4IWDJNUtiEwutD+G017BmostD50rLB6pGftzCqe5KxXq98=
X-Received: by 2002:a05:6871:5e10:b0:29e:37af:a943 with SMTP id
 586e51a60fabf-2ad80907cc8mr11743577fac.18.1736791827095; Mon, 13 Jan 2025
 10:10:27 -0800 (PST)
MIME-Version: 1.0
References: <e26acb8229abc26b88bcaa76a54829e9be2b2ee5.1736613424.git.joerg.sommer@navimatix.de>
In-Reply-To: <e26acb8229abc26b88bcaa76a54829e9be2b2ee5.1736613424.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jan 2025 10:10:01 -0800
X-Gm-Features: AbW1kvYC6TBvmkXlcs9O4BhQfLTsctC0ba7p77RjlsSpX5LJRn4MZRhmYt7fDsk
Message-ID: <CAMKF1sqWVybooyT3XgLFpESU4JeWS8yQJ6XAUTu-=y-EAhfEmw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] spectre-meltdown-checker: New recipe to
 check hardware vulnerability
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114838

seeing this

ERROR: Nothing RPROVIDES 'msr-tools' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-oe/r=
ecipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
RDEPENDS on or otherwise requires it)
msr-tools was skipped: incompatible with host aarch64-yoe-linux-musl
(not in COMPATIBLE_HOST)

Perhaps this recipe should be limited to x86 arch like msr-tools

On Sat, Jan 11, 2025 at 8:37=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../spectre-meltdown-checker_0.46.bb          | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-security/spectre-meltdown-checker/spe=
ctre-meltdown-checker_0.46.bb
>
> diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-me=
ltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/=
spectre-meltdown-checker_0.46.bb
> new file mode 100644
> index 0000000000..c2996415ad
> --- /dev/null
> +++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-=
checker_0.46.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "Hardware vulnerability and mitigation checker"
> +DESCRIPTION =3D "\
> +    Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, S=
pectre, \
> +    Meltdown vulnerability/mitigation checker for Linux & BSD \
> +"
> +HOMEPAGE =3D "https://github.com/speed47/spectre-meltdown-checker"
> +BUGTRACKER =3D "https://github.com/speed47/spectre-meltdown-checker/issu=
es"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2;e=
ndline=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
> +
> +SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=
=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
> +
> +S =3D "${UNPACKDIR}/git"
> +
> +# binutils: readelf,objdump might be used for deeper analysis
> +# coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
> +# kernel-dev: /boot/config is used
> +# perl: sometimes used when other tools (dd, rdmsr/wdmsr) are missing
> +RRECOMMENDS:${PN} =3D "\
> +    binutils \
> +    coreutils \
> +    kernel-dev \
> +    msr-tools \
> +    perl \
> +"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit allarch
> +
> +do_compile[noexec] =3D "1"
> +
> +do_install() {
> +    install -m 755 -D ${S}/${PN}.sh ${D}${bindir}/${PN}
> +}
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114816): https://lists.openembedded.org/g/openembedde=
d-devel/message/114816
> Mute This Topic: https://lists.openembedded.org/mt/110555586/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

