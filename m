Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.1062.1611270144772784098
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 15:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lLkpBwxn;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id e6so2651318pjj.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 15:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l6TY7vKgEnntm1W2jQDYZdv1r0dmZT9BzyhUdVG69Ts=;
        b=lLkpBwxn+HPU+2Zkvv2v359y/YJQeCLJqdCJA5nFFW85mnhCKRGipEckzbcSfeCwGI
         RN7cT3a6A9/573NqlScSXynAV5SNQYxQhUDtOmt1GkbR0qM3JcNpRj4aR99yXezsAp2z
         cyrsEVeaRwYcf4E6ACPmu41tzD+OVnnnBml+gk//SwTDUSjPLMvDQhPehx+YPHUpz1dH
         RRlDXSQU+tZVO7SayRrU6S+f237Vb4ynQ9jsOiKUGZRBmZ79SqLC/YbiNPIC8Ml3Sz3j
         kpbOHlPP3/frp7fbDdgpoR3xMaBBA6DZz1MYAiU48yUSh8Gqlh8szM4rX0sKlNQhm6Dh
         RH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l6TY7vKgEnntm1W2jQDYZdv1r0dmZT9BzyhUdVG69Ts=;
        b=Zuqzk7piZJ4G0Xmz1IRkJPv0UQ247Ymrjbs8C2GkflCD0sg4G5UL52iOC/HAROhXYP
         xPoJD69zuh98p2amEHetMYsaK7xPxURQ5ycQQevgNzYz/ye4sUbSzrDITAMbguBKPTAV
         bsQmwwxrs1zAGgSwhb6Yg4/Su9c3kzQPmGxI0ioUOmWZtnkJYDalQBGr4n896KaZySjb
         9U6+CQvhJZx0faFtCbvmYEm7CqXvtxkYCXZcVB/BWq5SV+0O7P7K++1OfdNWKdJyxCey
         /GgXCdFH1wuXYOt8zKjvuss0xFVF/OC1PFBSloxmfBVCTOBclnhu3LKcfiNVJ7DyYPrh
         BsGA==
X-Gm-Message-State: AOAM533qDKSqCWeltOT+3/dsluABrt4vskCsqqGW5v7hJAoEZoh8U3EO
	fSZfLYjIlnl3ExrHtMIVerX6FvhIUDSNoVnrNss=
X-Google-Smtp-Source: ABdhPJzS3PSf2cOH+0FcPfLEHnsZsl97moKcCILp9cW+mOhozT1HB5n50W1YuBunNmVMmFdCL2XoynoTQ6ZeuOHd9nc=
X-Received: by 2002:a17:902:6ac2:b029:de:3560:391e with SMTP id
 i2-20020a1709026ac2b02900de3560391emr2001689plt.60.1611270144156; Thu, 21 Jan
 2021 15:02:24 -0800 (PST)
MIME-Version: 1.0
References: <165C61438689639B.32132@lists.openembedded.org>
In-Reply-To: <165C61438689639B.32132@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 22 Jan 2021 00:02:12 +0100
Message-ID: <CALbNGRSA74bM6+tbpbxoS9SME4G8XTZooGyxwVDz8-BZyER_ew@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/7] upgrades
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 11:55 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> Patch 1-3 are resends - patchwork ignored them first time
I saw they were applied - too late. So please ignore 1-3

Andreas
>
> Andreas M=C3=BCller (7):
>   garcon: upgrade 0.8.0 -> 4.16.1
>   xfce4-whiskermenu-plugin: upgrade 2.5.1 -> 2.5.2
>   thunar: upgrade 4.16.0 -> 4.16.2
>   jack: upgrade 1.19.16 -> 1.19.17
>   networkmanager: upgrade 1.22.14 -> 1.28.0
>   appstream-glib: upgrade 0.7.17 -> 0.7.18
>   vlc: upgrade 3.0.11.1 -> 3.0.12
>
>  ...lib_0.7.17.bb =3D> appstream-glib_0.7.18.bb} |  3 +-
>  .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56 -----------------
>  ...Use-SYS_futex-instead-of-__NR_futex.patch} |  0
>  .../vlc/{vlc_3.0.11.1.bb =3D> vlc_3.0.12.bb}    |  5 +-
>  ...ttings-settings-property-documentati.patch | 43 ++++++++-----
>  ...-to-var-libdir-rather-than-hardcod-.patch} |  0
>  ...atch =3D> 0004-fix_reallocarray_check.patch} |  2 +-
>  ...Fix-build-with-musl-systemd-specific.patch | 29 +++++----
>  .../musl/0002-Fix-build-with-musl.patch       | 23 ++++---
>  ...0003-Fix-build-with-musl-for-n-dhcp4.patch | 61 ------------------
>  ...ix-build-with-musl-systemd-specific.patch} |  6 +-
>  ...er_1.22.14.bb =3D> networkmanager_1.28.0.bb} |  9 ++-
>  ...-Use-SYS_futex-instead-of-__NR_futex.patch | 62 -------------------
>  .../jack/{jack_1.19.16.bb =3D> jack_1.19.17.bb} |  3 +-
>  ...1.bb =3D> xfce4-whiskermenu-plugin_2.5.2.bb} |  2 +-
>  .../{garcon_0.8.0.bb =3D> garcon_4.16.1.bb}     |  2 +-
>  .../{thunar_4.16.0.bb =3D> thunar_4.16.2.bb}    |  2 +-
>  17 files changed, 72 insertions(+), 236 deletions(-)
>  rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.17=
.bb =3D> appstream-glib_0.7.18.bb} (84%)
>  delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-=
build-with-Qt-5.15.patch
>  rename meta-multimedia/recipes-multimedia/vlc/vlc/{0001-linux-thread-Us=
e-SYS_futex-instead-of-__NR_futex.patch =3D> 0005-linux-thread-Use-SYS_fute=
x-instead-of-__NR_futex.patch} (100%)
>  rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.11.1.bb =3D> vlc=
_3.0.12.bb} (96%)
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanag=
er/{0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch =3D> 00=
03-install-firewalld-to-var-libdir-rather-than-hardcod-.patch} (100%)
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanag=
er/{fix_reallocarray_check.patch =3D> 0004-fix_reallocarray_check.patch} (9=
0%)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/=
networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanag=
er/musl/{0004-Fix-build-with-musl-systemd-specific.patch =3D> 0003-Fix-buil=
d-with-musl-systemd-specific.patch} (81%)
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmana=
ger_1.22.14.bb =3D> networkmanager_1.28.0.bb} (95%)
>  delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_fu=
tex-instead-of-__NR_futex.patch
>  rename meta-oe/recipes-multimedia/jack/{jack_1.19.16.bb =3D> jack_1.19.=
17.bb} (93%)
>  rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-p=
lugin_2.5.1.bb =3D> xfce4-whiskermenu-plugin_2.5.2.bb} (76%)
>  rename meta-xfce/recipes-xfce/garcon/{garcon_0.8.0.bb =3D> garcon_4.16.=
1.bb} (86%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.0.bb =3D> thunar_4.16=
.2.bb} (89%)
>
> --
> 2.26.2
>
>
>=20
>
