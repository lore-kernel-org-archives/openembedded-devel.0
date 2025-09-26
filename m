Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7015ACAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 22:25:53 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web11.1183.1758925550816745470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 15:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KXBRMJSi;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-60170e15cf6so2528019d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758925550; x=1759530350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Beq6hzNkAnoDMxdJnv+5kWOwWyB2Qb68uLmpGtS4QUk=;
        b=KXBRMJSinKXhXZPB2hSbopEHkm9FRHZwlBTvEPizy+kGgakARtc6rftr/1FFZzway9
         1i+dCg9yjQXJw3hxphksCFVSzRpvVirvD9PLqn7/XiVNaE52bE++Enf1ZCHsQDzBXHmM
         ZI2mv9qInCAzcRFIN9PLmiRPRh9JSq18wLx4qm3tsKLpnBK95htgv7YGtFCBhKWDsIur
         RPxR579UzW6AGoOclmGvGTisuqwFXrpAMmY2a5EI7Mvrt6frY/2jqC7sjArOmkLYFrpF
         vVe1iVNWVzFfgsbIKWu8L4eAcCvFYAHwTt9Flfutx8YawBqx9aRPBDqsHXArAgMZRDtn
         ZwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758925550; x=1759530350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Beq6hzNkAnoDMxdJnv+5kWOwWyB2Qb68uLmpGtS4QUk=;
        b=l4xOybci3BfExWX8txwOfAGWIFelMCix6uqii8/26ZSkWxOtyNb79lBoQSnepJaZT0
         EGpoUceIMjy0B1ZWf+lu9QQ++xfm5UiDLet2d/ZPoQfq92/YKQPG2qEXzjmJpCY1OsXB
         2TQSiHolF8nwbquYQBegXwx//DgjP12ix0xIA6v1Wk4s9PXfpf4+AfG+ozSAwbAkLaEL
         +CyO40N3Dojyj9z6cUuHXUZX0xfMG47ELR+KfEtOwlGEHePUzcRvl87FLWqHLG5ZRkGg
         MCVfQoEedj/dV7Zeq/NF1k3cXllLVseuFuQt/VSPxX5HkfM6qnPsLCMAXxWXwIh2GZr5
         UCIA==
X-Gm-Message-State: AOJu0Yx8sqFqzR5GeqCnzyaG4jVaE0jrm8DZMStV9PzQObrkiOd6grng
	MczdGew4LZGL7uu9xA0aGC3d3fh05HF86U4g5wwjOKP67/W+UyIIHWjyxXARnLg1LIgsZEjtgcE
	BDnRFXrBXHw22jDn3prRc5+qFd4Ol/FM=
X-Gm-Gg: ASbGncuLUnorGb6RoTOR5rPHJldLnRMzDkSs99NwUqs+gLgAtrXE9SmhVrPfTdoBLRN
	gWnzMKrSI5lOaspZF3wEMdj7ZxLXycXafHqJvpXoZHSPLFpmDSFFen7fSjwJastcoVPBTnQejUu
	wRuSKnyKmva184TGW82Ts5NGlJHcjj8JrO/ZiRMJ7eAB7NPfK5PSf/fMKM+DG8jU24S/+JDSKgc
	9SYiJ4ylIPCElE+pbFOwKb7c2KwHglQR0SdHQG5aB1QpZcgUq3EVAVdlJ3NJH0OgTy5reEHhFY8
	PeTHT5mKLA9NI8zEiESRWNBEDyVX3T1T6uwsC/JnNyzihc6zhuNW4kDk4Q==
X-Google-Smtp-Source: AGHT+IGGGgnh6hjiJcAs44WE8Zk/shOmtYTN/4NuOsy6iN9Y93lhxikEJ46wqSQcW/AHxBKYvyPMGa8TEQyzagscHRM=
X-Received: by 2002:a05:690e:1652:b0:636:18cc:fefb with SMTP id
 956f58d0204a3-6361a70dee8mr7677784d50.5.1758925549770; Fri, 26 Sep 2025
 15:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250926142922.627071-1-mo.krautwald@mailbox.org>
In-Reply-To: <20250926142922.627071-1-mo.krautwald@mailbox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Sep 2025 15:25:23 -0700
X-Gm-Features: AS18NWBgF5vuKNA9lgFjLPtoYvxDxLiOWgt37St2WTN29XV5Lusmn9Jpqv-PoYQ
Message-ID: <CAMKF1srhRdQf2iCj1xoxoEBLBW0h59X7Mm9t=3-o=Jg8uRJ5-w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] package pipx
To: mo.krautwald@mailbox.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 22:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119944

Its showing some build QA errors

WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-de=
vtools/python/python3-pipx_1.7.1.bb:
/mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/py=
thon/python3-pipx_1.7.1.bb:2
has a lack of whitespace around the assignment: 'HOMEPAGE
=3D"https://pipx.pypa.io/stable/"'
WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-de=
vtools/python/python3-userpath_1.9.2.bb:
/mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/py=
thon/python3-userpath_1.9.2.bb:2
has a lack of whitespace around the assignment: 'HOMEPAGE
=3D"https://github.com/ofek/userpath"'

secondly, the commit message could be made better

<recipe>: Short summary

Details of changes

Signed-off-by


On Fri, Sep 26, 2025 at 7:31=E2=80=AFAM Mo Krautwald via
lists.openembedded.org
<mo.krautwald=3Dmailbox.org@lists.openembedded.org> wrote:
>
> Package pipx und its unpackaged dependency userpath
> ---
>  .../python/python3-pipx_1.7.1.bb              | 21 +++++++++++++++++++
>  .../python/python3-userpath_1.9.2.bb          | 14 +++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pipx_1.7.=
1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-userpath_=
1.9.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pipx_1.7.1.bb b/=
meta-python/recipes-devtools/python/python3-pipx_1.7.1.bb
> new file mode 100644
> index 0000000000..2a04624c1d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pipx_1.7.1.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "pipx - Install and Run Python Applications in Isolated Envi=
ronments"
> +HOMEPAGE =3D"https://pipx.pypa.io/stable/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D35c8e045b3a9ac6e7b19f25cb6cc0=
8bd"
> +
> +SRC_URI[md5sum] =3D "7b2bd7c1397e74e7e7beb04b121702c4"
> +SRC_URI[sha256sum] =3D "762de134e16a462be92645166d225ecef446afaef534917f=
5f70008d63584360"
> +
> +PYPI_PACKAGE =3D "pipx"
> +
> +DEPENDS +=3D "python3-hatch-vcs-native"
> +
> +inherit pypi python_hatchling
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-argcomplete \
> +    python3-packaging \
> +    python3-platformdirs \
> +    python3-userpath \
> +"
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-userpath_1.9.2.b=
b b/meta-python/recipes-devtools/python/python3-userpath_1.9.2.bb
> new file mode 100644
> index 0000000000..b6d6280866
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-userpath_1.9.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "userpath - a tool for modifying a user's PATH"
> +HOMEPAGE =3D"https://github.com/ofek/userpath"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D35c8e045b3a9ac6e7b19f25cb6cc0=
8bd"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db2d8ecec3b363659695a29c2d=
11c8a88"
> +
> +SRC_URI[md5sum] =3D "0bcebc971ce7fb38aa3fde3b137d39e2"
> +SRC_URI[sha256sum] =3D "6c52288dab069257cc831846d15d48133522455d4677ee69=
a9781f11dbefd815"
> +
> +PYPI_PACKAGE =3D "userpath"
> +
> +inherit pypi python_hatchling
> +
> +RDEPENDS:${PN} +=3D " python3-click "
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119930): https://lists.openembedded.org/g/openembedde=
d-devel/message/119930
> Mute This Topic: https://lists.openembedded.org/mt/115449692/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

