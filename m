Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.11382.1621011977569048204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 10:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dcky0kKA;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id l4so45614840ejc.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JjLAuSMmyslDclT0dqfZ90knexvsDTJi4Z/kKcQeiV4=;
        b=Dcky0kKA1keptvLM82qVQWcoL34X8eyArwiB9B0lW6Jzx87zwjhApEmblUnfz3UE8L
         zYnJZ8g1Uio3nLUkwQbmXkypiteHIEPkgTK+BVGRKst8jlWgGf6vRUCPRaiYtKd0oOUB
         EuOSt67gZxNRnVLE6c4R48x0zJ3JEdy0nN78ZO0VB4dbIRWOVAkYw15aRt3JDr81181f
         th4AgXNEdZuC9sQM4CH/agZ0jQRFZ1cSygJaWPR8inp9mm+MmqYVvTYOom9ri8qPJu9a
         X8Ys6lr7VCplgDxvHVtsf3KIi6S6gmcggtLVIInNSrjJV8HjsEdIxouIEQLQKJ5OR8TY
         hQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JjLAuSMmyslDclT0dqfZ90knexvsDTJi4Z/kKcQeiV4=;
        b=PNNhl4nfvzXk8d4rQnTm/hM/A7gRanYbKtg3I+nUmPe354YjXYapkqWeMqyU2K1ATB
         F2fWH3zUR9WJ/l+cm3BIp45RJrgcc/47dJuMPyK8/el6uPSoFBeADQWWTQ68gYb0yuMv
         3JLWLV4G5ZxSS/1fmWvvNs1iVhKKNlUJ95RumClNKaatxrTQMdvAJuG5iWQcA9XyY+hc
         hkkRN2GIXV2mUa+x+4+QHAhFqAQr0OGsvVjdodM2Pf+VmeiT2PmBXDDhEpwGLwlvC1DG
         z1Rbzg1aCjzOT1/Tp+/6jJYZfqSjymghjdQ0WoAn3Q1mFEUqpa3qjzik1hn9j3OlNEo8
         DoHA==
X-Gm-Message-State: AOAM533Uq516hqIXMSsfAJ4YGrnOUnzq36URbYUgeaIyrtOKtTmtMAQQ
	TRc4dAx7toDtYbVaKzxQ0PsVQVnhuQGZHZOrtXI=
X-Google-Smtp-Source: ABdhPJw7gwAAMRDEMnQkXSuiRimNiOtKQasNzIaxa0NkKXJNEIiDpqcyZTUn1IiDJDsYAroTA4YBVhht0etVj054JIg=
X-Received: by 2002:a17:907:9612:: with SMTP id gb18mr50231792ejc.408.1621011975763;
 Fri, 14 May 2021 10:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210514140722.3503198-1-adrian.thomasset@doulos.com>
In-Reply-To: <20210514140722.3503198-1-adrian.thomasset@doulos.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 14 May 2021 18:06:04 +0100
Message-ID: <CANPvuRnkyhRY-g06Robcc4w4s82sUhc-PJ3yH=F=DDjE2wMw3A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] wireguard-tools: change path for wg-quick systemd unit
To: Adrian Thomasset <athomasset@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Adrian Thomasset <adrian.thomasset@doulos.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Adrian Thomasset <athomasset@gmail.com> escreveu no dia sexta,
14/05/2021 =C3=A0(s) 15:08:
>
> Fix error when enabling the wg-quick unit:
>
> % systemctl enable wg-quick@wg0
> Failed to enable unit: Unit file wg-quick@wg0.service does not exist
>
> The wg-quick@.service template unit needs to be in /lib/systemd/system
>
> Signed-off-by: Adrian Thomasset <adrian.thomasset@doulos.com>
> ---
>  .../recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.=
0.20200319.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.=
0.20200319.bb
> index f698b9a9a..e769f44b7 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200=
319.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200=
319.bb
> @@ -9,7 +9,7 @@ DEPENDS +=3D "wireguard-module libmnl"
>
>  do_install () {
>      oe_runmake DESTDIR=3D"${D}" PREFIX=3D"${prefix}" SYSCONFDIR=3D"${sy=
sconfdir}" \
> -        SYSTEMDUNITDIR=3D"${systemd_unitdir}" \
> +        SYSTEMDUNITDIR=3D"${systemd_unitdir}/system" \

There is variable on bitbake for this:

SYSTEMDUNITDIR=3D"${systemd_system_unitdir}"

>          WITH_SYSTEMDUNITS=3D${@bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', 'yes', '', d)} \
>          WITH_BASHCOMPLETION=3Dyes \
>          WITH_WGQUICK=3Dyes \
> --
> 2.25.1
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
