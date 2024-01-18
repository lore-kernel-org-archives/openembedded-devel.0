Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D578DC47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 15:37:05 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.14769.1705592220878796991
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 07:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqsN1jsY;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6dde173384aso6426887a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 07:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705592220; x=1706197020; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdtGyafFewlDScxVsqIEuqEUUeJENirGnDt66rZkDqU=;
        b=ZqsN1jsYnKAv+X8E0/hetWQQj0+oVSUxGND1rhhkY+xOOiYUuLsciOzZ0W1xuStlpc
         YbUdLNxkLZ0BXFdZuF9fFlCdVvUNGX16wITjxoDvYX/XulEJqXvIO+wpWeLPVWzzDlql
         FVEjozdUN0sxK1LRVLN2nUF1SKzrILPvJafTus8ceJ/cug36kTG0kvTpeiGkXC7GZp3C
         M2fE5epHvT/VyhNsR4dyqux1rTo+48zuf0TbpiialVTYjGrLeaeESQNjdye4yqFjzrSO
         EEEOyzOGHk3gxxCY6NqNMKPJQZVwUCD0Xd0+O+WckhsSLtUJGjEo99mc2SgdS3Zfm6LO
         FeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592220; x=1706197020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdtGyafFewlDScxVsqIEuqEUUeJENirGnDt66rZkDqU=;
        b=T9BZGRPVb9EqHlwVMT+yvRcWMqbmAc3qVFSodWNktfy303vZvTLhOEGOoNhxZ/8qLe
         n8M/2AWzcT+cDUNh3V5gWIIgVYomSG34goA14PhjZS6ZSwzOYdp7dePK6kn32UPujYAu
         m3gv4VpuNZjcPYyfzk3NgvRNJHQu751ttXVPnqUa96zNJ8lRFkQX5UkDUMUi4AcDIXnL
         nXDUnecm4W/kwL0kPdRG1sQJ2j/Euf5p8O9OAkdbSLVF9asbkgubCQ0cZEE/irFgAEFD
         bY7KUKx44g4mxg2EXehDIuEY7APIWB4Q0a87QqoVTtppI8BCem7NL2oUXcii6iLBjbBo
         VGPg==
X-Gm-Message-State: AOJu0YwA4KAZ4kaU/pf8j7LSUntY28uvZKtq9i78FPArhrq4obsAfaNd
	3/jegiQBhFJrU6y3zSWxqJpzXgzqgD3GYhBYB7JTYP6LH119Esa3LJqVqRdqjOEsNkW8ZGKbSX7
	uBfdJe2FBCM4Z8ZCSyxrRxKGxXbBCC7JYqo40ow==
X-Google-Smtp-Source: AGHT+IGhQPxKv7w+5PXyHQpjZv4EiOXm3AlYIS+Kf0B3qiAK8CroT4oBGDUEiGRXTIMX0XztSmjDaCSEGqxvRXnGLA0=
X-Received: by 2002:a05:6870:f152:b0:206:b992:136e with SMTP id
 l18-20020a056870f15200b00206b992136emr1026008oac.68.1705592219924; Thu, 18
 Jan 2024 07:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20240117113911.15322-1-paul.leguendekerneizon@savoirfairelinux.com>
 <20240117113911.15322-2-paul.leguendekerneizon@savoirfairelinux.com>
In-Reply-To: <20240117113911.15322-2-paul.leguendekerneizon@savoirfairelinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jan 2024 07:36:33 -0800
Message-ID: <CAMKF1sqAtNYPjLRkv1RAn_Sx8A=f8EihK+xXTORujH0st4gw7Q@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH 1/2] cockpit-machines: add recipe
To: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 15:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108345

this needs to match the constraints on cockpit recipe or we get these error=
s

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3532/step=
s/12/logs/stdio

you might need to add

    REQUIRED_DISTRO_FEATURES =3D "systemd pam"

    COMPATIBLE_HOST:libc-musl =3D "null"

On Wed, Jan 17, 2024 at 4:13=E2=80=AFAM Paul Le Guen de Kerneizon
<paul.leguendekerneizon@savoirfairelinux.com> wrote:
>
> `cockpit-machines` is a Cockpit plugin used to provide a web interface
> to manage virtual machines. Since Cockpit version 242, cockpit-machines
> has been moved to a dedicated repository.
>
> Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
> ---
>  .../cockpit-machines/cockpit-machines_304.bb  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-webserver/recipes-webadmin/cockpit-machines/cock=
pit-machines_304.bb
>
> diff --git a/meta-webserver/recipes-webadmin/cockpit-machines/cockpit-mac=
hines_304.bb b/meta-webserver/recipes-webadmin/cockpit-machines/cockpit-mac=
hines_304.bb
> new file mode 100644
> index 000000000..b787a5cf6
> --- /dev/null
> +++ b/meta-webserver/recipes-webadmin/cockpit-machines/cockpit-machines_3=
04.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Cockpit UI for virtual machines"
> +DESCRIPTION =3D "Cockpit-machines provides a user interface to manage vi=
rtual machines"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +DEPENDS +=3D "cockpit"
> +
> +SRC_URI =3D "https://github.com/cockpit-project/cockpit-machines/release=
s/download/${PV}/cockpit-machines-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D "b9b41d728d68ae9d21c229765e00793ad018231903c84ed6=
53c21d25444714e3"
> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +inherit autotools-brokensep gettext
> +
> +RDEPENDS:${PN} +=3D "cockpit libvirt-dbus pciutils virt-install"
> +
> +# Default installation path of cockpit-machines is /usr/local/
> +FILES:${PN} =3D "\
> +    ${prefix}/local/ \
> +    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xm=
l \
> +"
> +
> +BUGTRACKER =3D "github.com/cockpit-project/cockpit-machines/issues"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108327): https://lists.openembedded.org/g/openembedde=
d-devel/message/108327
> Mute This Topic: https://lists.openembedded.org/mt/103784069/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

