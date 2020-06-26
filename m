Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.803.1593144802430411629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 21:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrn440y+;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id z63so7673770qkb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pbwLNWP6AkPiqYhfqMjnCDpqO0VBG7ogXRJjB3czauo=;
        b=lrn440y+e2W/YVKUXjS/ETIezOT581rseIDiozT8fAxd8m0j3rLNOCMBAhCqNlABQz
         vb9ACzqqyUYcmmG7YVY10Qx69iXxB35/xjU2qBBpjMO6F4+p91FDy36X2docMCpHyKxh
         TEm5yXTNVS493jY6UALweN/Ks5PsUxqhBim2BFvFwjv3fMTfF3fnQVXYL3fyDlELmFh0
         zhQzz1fq5PLVCH4ZBq2PkHzDz+95FSKjJP1dEWGskUD4Yf7K+YOY9VfoDCnEvQc+yIJP
         zB/TOQwSWbol97JWtWCZJxvtsnqZStP3wq5c9bK2bVxD8eIMf21UxepmBoFsXqHAVMq8
         TPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbwLNWP6AkPiqYhfqMjnCDpqO0VBG7ogXRJjB3czauo=;
        b=brs5NAHkxnSXDLzrWv+kMnr1Bcyv1t6lYRN1ovZMNbRKYBP65RWTq5T5CRCSE/TQ12
         TY1MedOnAC8v13pnwk+zL9oJkA1TLMfZcVwrh2A2IzTcxuo4x3bd/r8YYJlauNQ3ky1T
         NlX2mXi4q17dgDi8jGC5ovqHhgXh0U5EkDmLaY6VcukcYa31PB66HIm8sUUNs9ts92uo
         yezIR4N+ojV/bAQhq62KIa/VvNOjvxtUd/Acoa9DbWw9WvXWjECkOpIKRzT0c+Y7okeY
         tpSw4Xlf5jUb8ATy1T3PxI4y+dsNws3lecJNRq5ChzG9hJxoEk9Zb8A2a6xeGz12KSxA
         mjcQ==
X-Gm-Message-State: AOAM533QhC3bSzdFMXxCCWXLXtQclvuOJup9ttVZoB8dnfjK8AFrw5Hz
	armxD5J/Id0ufAzJi1evONz2stcQVOD99NRL1lw=
X-Google-Smtp-Source: ABdhPJwiA+036RnK1KOkQw/LU29t70y9VKYtFYyNDXH3sSzr68HMbS64P8qwFPD8nyW2M/u3MJ9r6Khk7lDU8l0XA6I=
X-Received: by 2002:a05:620a:2050:: with SMTP id d16mr992825qka.215.1593144801402;
 Thu, 25 Jun 2020 21:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593141198.git.akuster808@gmail.com>
In-Reply-To: <cover.1593141198.git.akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Jun 2020 21:13:10 -0700
Message-ID: <CAMKF1so4o6vsd3zyPKOu-w9CC=48ubfPSz9HYEEg6GWpFa3v=A@mail.gmail.com>
Subject: Re: [oe] [zeus 0/6] Patch review
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6a35205a8f4ed06"

--000000000000f6a35205a8f4ed06
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 8:14 PM akuster <akuster808@gmail.com> wrote:

> Please have reviews back by Saturday
>
> The following changes since commit
> 9e60d30669a2ad0598e9abf0cd15ee06b523986b:
>
>   sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15 13:30:34
> -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>
> Armin Kuster (1):
>   tremor: update SRC_URI as project moved to gitlab
>
> Haiqing Bai (2):
>   gd: fix CVE-2017-6363
>   python-urllib3/python3-urllib3: fix CVE-2020-7212
>
> Wang Mingyu (2):
>   libssh2: CVE-2019-17498.patch
>   opensc: CVE-2019-19479 CVE-2019-19480
>
> Wenlin Kang (1):
>   ipmitool: fix CVE-2020-5208


Lgtm



>
>  .../tremor/tremor_20180319.bb                 |   2 +-
>  ...-Fix-buffer-overflow-vulnerabilities.patch | 133 ++++++++++++++++
>  ...uffer-overflow-in-ipmi_spd_print_fru.patch |  53 +++++++
>  ...er-overflow-in-ipmi_get_session_info.patch |  53 +++++++
>  .../0004-channel-Fix-buffer-overflow.patch    |  69 +++++++++
>  ...er-overflows-in-get_lan_param_select.patch |  94 ++++++++++++
>  ...u-sdr-Fix-id_string-buffer-overflows.patch | 142 ++++++++++++++++++
>  .../ipmitool/ipmitool_1.8.18.bb               |   6 +
>  .../recipes-support/gd/gd/CVE-2017-6363.patch |  35 +++++
>  meta-oe/recipes-support/gd/gd_2.2.5.bb        |   1 +
>  .../libssh2/libssh2/CVE-2019-17498.patch      | 131 ++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.8.2.bb  |   1 +
>  .../opensc/opensc/CVE-2019-19479.patch        |  30 ++++
>  .../opensc/opensc/CVE-2019-19480.patch        |  34 +++++
>  .../recipes-support/opensc/opensc_0.19.0.bb   |   2 +
>  .../python/python-urllib3/CVE-2020-7212.patch |  54 +++++++
>  .../python/python-urllib3_1.25.6.bb           |   2 +
>  .../python3-urllib3/CVE-2020-7212.patch       |  54 +++++++
>  .../python/python3-urllib3_1.25.6.bb          |   2 +
>  19 files changed, 897 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
>  create mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
>  create mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
>  create mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch
>  create mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
>  create mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch
>  create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
>  create mode 100644
> meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
>
> --
> 2.17.1
>
> 
>

--000000000000f6a35205a8f4ed06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 25, 2020 at 8:14 PM akuster &lt;<a href=3D"mai=
lto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">Please have reviews back by Saturday<br>
<br>
The following changes since commit 9e60d30669a2ad0598e9abf0cd15ee06b523986=
b:<br>
<br>
=C2=A0 sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15 13:3=
0:34 -0700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openemb=
edded-contrib</a> stable/zeus-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/meta-openembedded-contrib/l=
og/?h=3Dstable/zeus-nut" rel=3D"noreferrer" target=3D"_blank">http://cgit.o=
penembedded.org/meta-openembedded-contrib/log/?h=3Dstable/zeus-nut</a><br>
<br>
Armin Kuster (1):<br>
=C2=A0 tremor: update SRC_URI as project moved to gitlab<br>
<br>
Haiqing Bai (2):<br>
=C2=A0 gd: fix CVE-2017-6363<br>
=C2=A0 python-urllib3/python3-urllib3: fix CVE-2020-7212<br>
<br>
Wang Mingyu (2):<br>
=C2=A0 libssh2: CVE-2019-17498.patch<br>
=C2=A0 opensc: CVE-2019-19479 CVE-2019-19480<br>
<br>
Wenlin Kang (1):<br>
=C2=A0 ipmitool: fix CVE-2020-5208</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">Lgtm</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)"><br>
<br>
=C2=A0.../tremor/<a href=3D"http://tremor_20180319.bb" rel=3D"noreferrer" =
target=3D"_blank">tremor_20180319.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...-Fix-buffer-overflow-vulnerabilities.patch | 133 ++++++++++++++++=
<br>
=C2=A0...uffer-overflow-in-ipmi_spd_print_fru.patch |=C2=A0 53 +++++++<br>
=C2=A0...er-overflow-in-ipmi_get_session_info.patch |=C2=A0 53 +++++++<br>
=C2=A0.../0004-channel-Fix-buffer-overflow.patch=C2=A0 =C2=A0 |=C2=A0 69 +=
++++++++<br>
=C2=A0...er-overflows-in-get_lan_param_select.patch |=C2=A0 94 +++++++++++=
+<br>
=C2=A0...u-sdr-Fix-id_string-buffer-overflows.patch | 142 ++++++++++++++++=
++<br>
=C2=A0.../ipmitool/<a href=3D"http://ipmitool_1.8.18.bb" rel=3D"noreferrer=
" target=3D"_blank">ipmitool_1.8.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0.../recipes-support/gd/gd/CVE-2017-6363.patch |=C2=A0 35 +++++<br>
=C2=A0meta-oe/recipes-support/gd/<a href=3D"http://gd_2.2.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">gd_2.2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../libssh2/libssh2/CVE-2019-17498.patch=C2=A0 =C2=A0 =C2=A0 | 131 +=
+++++++++++++++<br>
=C2=A0.../recipes-support/libssh2/<a href=3D"http://libssh2_1.8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libssh2_1.8.2.bb</a>=C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../opensc/opensc/CVE-2019-19479.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 30 ++++<br>
=C2=A0.../opensc/opensc/CVE-2019-19480.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 34 +++++<br>
=C2=A0.../recipes-support/opensc/<a href=3D"http://opensc_0.19.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opensc_0.19.0.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
=C2=A0.../python/python-urllib3/CVE-2020-7212.patch |=C2=A0 54 +++++++<br>
=C2=A0.../python/<a href=3D"http://python-urllib3_1.25.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-urllib3_1.25.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python3-urllib3/CVE-2020-7212.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 54 +++++++<br>
=C2=A0.../python/<a href=3D"http://python3-urllib3_1.25.6.bb" rel=3D"noref=
errer" target=3D"_blank">python3-urllib3_1.25.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A019 files changed, 897 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru=
-Fix-buffer-overflow-vulnerabilities.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru=
-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0003-ses=
sion-Fix-buffer-overflow-in-ipmi_get_session_info.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0004-cha=
nnel-Fix-buffer-overflow.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lan=
p-Fix-buffer-overflows-in-get_lan_param_select.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru=
-sdr-Fix-id_string-buffer-overflows.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch=
<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh2/libssh2/CVE-2019-=
17498.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19=
479.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19=
480.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python-urllib=
3/CVE-2020-7212.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-urlli=
b3/CVE-2020-7212.patch<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000f6a35205a8f4ed06--
