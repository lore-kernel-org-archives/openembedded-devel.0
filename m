Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.163.1602007036180493287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 10:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3Epc2HH;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c23so6636520qtp.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OMu0KwLXGtPI0japFC5AuGcpLuTqQhjM72AqH2HAHrg=;
        b=h3Epc2HHBaD4IO1w6Yp/H+CsiMT3uqtk0mOsCxgz50VJOSEkIvLvK9SDXKXlQmFSbM
         i22z9xq2gm+ZZuo8+OdJIqfDxCG46l72fn0Z03PbhyAJ04piif1ZUcQX21AyNO2wLMeP
         Snkt12jFHOybsolBNzDYhoFoxlT3z9PDl6bKE8/6ASy8anYhGKFkxQ9Wva8siEBm3kEZ
         olMtQfcmk5jSxbunpwfH8DKD0IoJ2gMqIEcEcs7JkrUAnUfZDLOOLd2vXEjhj2IE8hDi
         psXWyODHSSBwnRNbrbP+rGOXnKbbCbYbbCFVgbImktt6sNlI/Fg/a0LXnghoStqIqnMk
         xHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OMu0KwLXGtPI0japFC5AuGcpLuTqQhjM72AqH2HAHrg=;
        b=s/xG4u94JG9nwRJvTD5TIvsTi2FpVYFircpPpOjnfSIAOcjWvV/ZtbJ8XWkWKFrq+e
         1n43JO/Qweau7OCmywU4uhF8zSWdcwDmgKX1Qk6LuWb7PrqV/JalCBl8et5Wej9CGBA+
         kqD5ZML6KVOaapWAvgozXN5+/0itMBp/OrLDfVPvZvGirxJ4JLSHblIOb5lfys0t9xgG
         o8BxqMemw55Qdl257fIYynz2svnfsdJ0+vrc/yfimMdgvL6bX91Bep8XU5/ffK/Se2zp
         cQF4w0iDbjD/kH9kfLUQM+K5bGLXvH20JzDjIyNXXq92YsbN/Fz8eWWtI/+cEaoVUnzs
         JrOQ==
X-Gm-Message-State: AOAM531J0tKurDFlZW4v5DEhcB4a/kSbtmf9N30vovj5P2MWhbjAU+Wb
	xicjjPFlDwHMf6mtgI5QzCz2MrAxpGd6WCxAt00=
X-Google-Smtp-Source: ABdhPJyxGPRr+xj+C+ii06CKG1UYTP2HHR4R/1GrFUvo3ijgpppI0jOQ0b+gTBldEfYEX8mvz+1/GsmT/tXccaGSpkY=
X-Received: by 2002:ac8:3975:: with SMTP id t50mr6436618qtb.53.1602007035135;
 Tue, 06 Oct 2020 10:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
 <10765.1602004777092046892@lists.openembedded.org>
In-Reply-To: <10765.1602004777092046892@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Oct 2020 10:56:49 -0700
Message-ID: <CAMKF1sr0viCV=BMXRnA0dKNuk3B1YMSQi8TiTbSJWK-LsdaS1A@mail.gmail.com>
Subject: Re: [oe] wireguard-module broken in dunfell
To: veilleux.cedric@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

does adding

RPROVIDES_kernel-module-${MODULE_NAME} =3D "${PN}"

help ?

On Tue, Oct 6, 2020 at 10:19 AM <veilleux.cedric@gmail.com> wrote:
>
> I had the same issue and could not figure out what broke the wireguard-m=
odule package.
>
> I had to resort to bissecting changes in meta-yocto.
>
> I finally isolated the change that breaks wireguard-module:
>
> 87c9d29635 package: get_package_mapping: avoid dependency mapping if ren=
amed package provides original name
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D87c9d2963576=
38082f5a7131a87365285fc813c4
>
> It seems the package renaming that wireguard-module does (PKG_${PN} =3D =
"kernel-module-${MODULE_NAME}") no longer works after the above commit.
>
> At this point I do not understand the change regarding renamed package n=
ames and dependencies enough to recommend the appropriate fix to wireguard-=
module. I have been able to workaround the issue by renaming the package ke=
rnel-module-wireguard and thus avoiding the rename altogether.
>=20
>
