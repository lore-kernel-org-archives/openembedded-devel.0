Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE70C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 13:40:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.78011.1724766019783040228
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Aug 2024 06:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zvcpvi4P;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53345dcd377so7339779e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724766018; x=1725370818; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UQPZbDmcKdHVpPq+G7WcojJHWqGCK/UKOV2cCrjsII=;
        b=Zvcpvi4PxeIOJ/714MIHrdBsy1NZB5cFZehbw0uWHhqT3vCGEcEj67r9iN+C5GkqQp
         lwTSZ6pqJLQJPGiiFitiCjPtyRhzicU8o/U2kFgbpmeOsnxDJMuw0BlOWVdyrRH6cNB3
         UGoif0kB9EQOSIsEMq9lZz6l/FRKJS2Kgly7mItP7WfgobDGwyWctIpGRx5Bc8rvykZN
         gRooJ8pnbHHK5vanu/RrR2ihDR5kwLuaQ3ksde5VtlVaH4W8+RvmjRVdKPALub9ZD6It
         Qpm81/+nEHjDpBrRIhUUP0opvg+dHHn5HmBl476220yOjjEBkskJmNt5RbSQBB8uk0Sj
         EsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766018; x=1725370818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UQPZbDmcKdHVpPq+G7WcojJHWqGCK/UKOV2cCrjsII=;
        b=Y+MN/2Cp5YsrIqqqqVPGNaS4cUoCL55aYaugPS1ch42BNAmYfrB9IP0tH9tUSeTgp1
         wZloz1DpKFEBV6CtGhtone2GczRtARWoFmumLS121L3y3dgNH8m5D0rD/BtJEm5H1jKC
         j83eguHsU0OcnDKne/Jt30r47Qedse47OI2yRa8SC2Gy+lL37osvD0q5S68h95xCf/W9
         SBZA1HNXBNGEnghc8L4IbwiAo0lKE9fOtGIschwvtvSaFtpqD2F1lHkjhkPJ0DkDVUcb
         Pv3hTZAtN7PGvuv7BsDN8WwMTTna5qKyDxas8EF5+mPfcT8syYNr9EXZ57QTgYTQmqaS
         zulQ==
X-Gm-Message-State: AOJu0YzqgOcLVuz/jCYrCFdXN/XiY4IVsGONMtUv+NuW6sFi9Nd2lSEX
	Ei00TEVWZoRdsrqzDhZBNCz4dzXYfjeUCZ853mbb6duQz4AljaaBpCWd8h9lsHntDbWECFZ/Q7A
	+1zZ3C+wf+hVOCcQfA4NHn20EDnE=
X-Google-Smtp-Source: AGHT+IG46oJFJVucvQPGsM2u/d+xJnKpwf8/x3dahaCCYeSyV92Ljz4l6fKYxzvOYyet+G8tJGy53PgrWkeUepUhI5I=
X-Received: by 2002:a05:6512:b0b:b0:533:4b38:3983 with SMTP id
 2adb3069b0e04-53438773dd4mr7468372e87.20.1724766017082; Tue, 27 Aug 2024
 06:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240822123031.1156755-1-thomas.perrot@bootlin.com>
In-Reply-To: <20240822123031.1156755-1-thomas.perrot@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Aug 2024 15:40:04 +0200
Message-ID: <CA+chaQe8TZDhMbOJo=SMc7kNg2WKW=mcakdhPmghsskxt5CAww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vdpauinfo: add recipe
To: thomas.perrot@bootlin.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 13:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111976

As this depends on libvdpau and libvdpau has:
inherit features_check
REQUIRED_DISTRO_FEATURES =3D "x11"

the same restriction should be repeated here to avoid:
ERROR: Nothing PROVIDES 'libvdpau' (but
meta-oe/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb DEPENDS on or
otherwise requires it)
libvdpau was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)

Will send the fix shortly.

On Thu, Aug 22, 2024 at 2:30=E2=80=AFPM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> vdpauinfo is a command-line tool that can query the capabilities
> of the system's VDPAU implementation.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
>
> diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/re=
cipes-graphics/vdpau/vdpauinfo_1.5.bb
> new file mode 100644
> index 000000000000..99afe745079f
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Tool to query the capabilities of a VDPAU implementatio=
n"
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/vdpau/vdpauinfo"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b6e110c362fe46168199f3490e52=
c3c"
> +
> +DEPENDS =3D "libvdpau"
> +
> +RDEPENDS:${PN} =3D "libvdpau"
> +
> +SRCREV =3D "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
> +SRC_URI =3D "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=3Dmast=
er"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111904): https://lists.openembedded.org/g/openembedde=
d-devel/message/111904
> Mute This Topic: https://lists.openembedded.org/mt/108036779/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

