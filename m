Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.5067.1619260629373093882
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n9eFkhNF;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id k17so20647014edr.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0fglr+0lwKfEzfXOdR2F3FiwuEn9JauGiJQvVuHKA4=;
        b=n9eFkhNFZPPoCnzn5saAq62m+aYE00mZxOiN4Nmpm6QB2XvF2d9FZU3G6TqVSYdBLd
         QYJRUzjX8f5W2h8ABTj0m7BgWZsyOXTkSlIdRa7FZXaGPOj14+ZQmi54Y/pg4kamdO/x
         oXCZm5gXup5vPeKZC4V47R62kPJn4aopuwhh1jD2TE9cG0IeGi8mtIdd7TPJOlIirYyG
         If3kFBc9wLfVCJa6Oryenla39qM501sfim7NSZz2NJXUa7t3IKyTuIxHC6cYdhwP4eDP
         HkGDRj0RN+s8tFc5T8V4ydjYNxJYY0TO76IKrZNU5KVKmRorvPDCyIJTs4KAlYstWvjM
         IA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0fglr+0lwKfEzfXOdR2F3FiwuEn9JauGiJQvVuHKA4=;
        b=LcrDky6OL5gzL3s9tPUTPq78ujQpXNhycYg/eeVr9ELXbh3JH8W0pD+H+4pBMc0Bqg
         7mILNdq1jlzyBSUWdZvUsn97ZXHNR+emkieOgPnu+IbqU4lzC7vNmtX9NrD8xJmu/giy
         ydX2xAZNNpf5MamGMsrKJ/L7lG9PO2Ac/LgJrRq3gGqzMDe1ruJOw5/Y5Ajo1zqhvymi
         Z3eVNZvh50vZons8iHpuHjI16WuCtAVi6QN1C/eAtUQQ4ZVRQIPxK26aCsJIdt3ABlIY
         MByGq76eUel+ey5PEJGPbcASdotv5RdHguat43UmpmfUgZbBLDHCcL25578QxAu5Hqd3
         gm8A==
X-Gm-Message-State: AOAM530WMqJde9OUAI2uOm87X6c+PZhg1byOUwKOD4udNmcYvH8Gy/CD
	yEVwxgaoaiKiWRM60VNbHhISEBSw79Mr4bancjs=
X-Google-Smtp-Source: ABdhPJw/O8LdPX40iDKhXOZCCvT0UzpcMQSNKbLfIdLD3Und2qW9fDJmMpIgKkB5a2aT1kPw1/mnCsxSSaZ8L23/rtw=
X-Received: by 2002:aa7:c349:: with SMTP id j9mr1366123edr.230.1619260627750;
 Sat, 24 Apr 2021 03:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619258978.git.akuster808@gmail.com>
In-Reply-To: <cover.1619258978.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 24 Apr 2021 03:36:56 -0700
Message-ID: <CA+chaQeSzuwXe2YRgc68xek+ZygZ7D16Q3jj=jBrTico5TvCEA@mail.gmail.com>
Subject: Re: [oe] [hardknott 0/6] Patch review April 24th
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000084101e05c0b57e0c"

--00000000000084101e05c0b57e0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please take
https://git.openembedded.org/meta-openembedded/commit/?id=3Db5ad9c011db258=
1cc84e5daa139acf73a0f6f5c0
as well to fix
https://git.openembedded.org/meta-openembedded/commit/?h=3Dhardknott&id=3D=
98a26903f770aa8698770817bdaf6175367917e1
merged in previous PR.

On Sat, Apr 24, 2021 at 3:12 AM Armin Kuster <akuster808@gmail.com> wrote:

> These have been sent to the list already so shorter review cycle.
> Please have feedback by Sunday.
>
> The following changes since commit
> 2297d4ee04b47bc574f8879732d9e213ab7bf685:
>
>   wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/hardknott-nut
>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/h=
ardknott-nut
>
> Chen Qi (2):
>   tigervnc: upgrade to 1.11.0
>   python3-django: upgrade to 2.2.20
>
> Mingli Yu (2):
>   php: Upgrade to 7.4.16
>   python3-cryptography: Upgrade to 3.3.2
>
> Stefan Ghinea (1):
>   python3-django: fix CVE-2021-28658
>
> Ulrich =C3=96lmann (1):
>   v4l-utils: fix reproducibility
>
>  .../php/php/CVE-2020-7069.patch               | 158 ------------------
>  .../php/php/CVE-2020-7070.patch               |  24 ---
>  .../php/{php_7.4.9.bb =3D> php_7.4.16.bb}       |   7 +-
>  ...002-do-not-build-tests-sub-directory.patch |  21 +--
>  ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  36 ++--
>  ...{tigervnc_1.10.1.bb =3D> tigervnc_1.11.0.bb} |  13 +-
>  ...c-autodetect-availability-of-systemd.patch |  47 ++++++
>  ...ct-installation-of-50-rc_keymap.conf.patch |  40 +++++
>  .../v4l2apps/v4l-utils_1.20.0.bb              |  11 +-
>  ...3.3.1.bb =3D> python3-cryptography_3.3.2.bb} |   2 +-
>  ...ngo_2.2.16.bb =3D> python3-django_2.2.20.bb} |   4 +-
>  11 files changed, 130 insertions(+), 233 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>  rename meta-oe/recipes-devtools/php/{php_7.4.9.bb =3D> php_7.4.16.bb} (=
97%)
>  rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb =3D>
> tigervnc_1.11.0.bb} (89%)
>  create mode 100644
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodete=
ct-availability-of-systemd.patch
>  create mode 100644
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-ins=
tallation-of-50-rc_keymap.conf.patch
>  rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.=
bb
> =3D> python3-cryptography_3.3.2.bb} (94%)
>  rename meta-python/recipes-devtools/python/{python3-django_2.2.16.bb =
=3D>
> python3-django_2.2.20.bb} (41%)
>
> --
> 2.17.1
>
>
>=20
>
>

--00000000000084101e05c0b57e0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please take<div><a href=3D"https://git.openembedded.org/me=
ta-openembedded/commit/?id=3Db5ad9c011db2581cc84e5daa139acf73a0f6f5c0">http=
s://git.openembedded.org/meta-openembedded/commit/?id=3Db5ad9c011db2581cc84=
e5daa139acf73a0f6f5c0</a><br></div><div>as well to fix</div><div><a href=3D=
"https://git.openembedded.org/meta-openembedded/commit/?h=3Dhardknott&amp;i=
d=3D98a26903f770aa8698770817bdaf6175367917e1">https://git.openembedded.org/=
meta-openembedded/commit/?h=3Dhardknott&amp;id=3D98a26903f770aa8698770817bd=
af6175367917e1</a><br></div><div>merged in previous PR.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 24=
, 2021 at 3:12 AM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">=
akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">These have been sent to the list already so shorter rev=
iew cycle.<br>
Please have feedback by Sunday.<br>
<br>
The following changes since commit 2297d4ee04b47bc574f8879732d9e213ab7bf68=
5:<br>
<br>
=C2=A0 wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)<b=
r>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openemb=
edded-contrib</a> stable/hardknott-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/meta-openembedded-contrib/l=
og/?h=3Dstable/hardknott-nut" rel=3D"noreferrer" target=3D"_blank">http://c=
git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/hardknott-nu=
t</a><br>
<br>
Chen Qi (2):<br>
=C2=A0 tigervnc: upgrade to 1.11.0<br>
=C2=A0 python3-django: upgrade to 2.2.20<br>
<br>
Mingli Yu (2):<br>
=C2=A0 php: Upgrade to 7.4.16<br>
=C2=A0 python3-cryptography: Upgrade to 3.3.2<br>
<br>
Stefan Ghinea (1):<br>
=C2=A0 python3-django: fix CVE-2021-28658<br>
<br>
Ulrich =C3=96lmann (1):<br>
=C2=A0 v4l-utils: fix reproducibility<br>
<br>
=C2=A0.../php/php/CVE-2020-7069.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 158 ------------------<br>
=C2=A0.../php/php/CVE-2020-7070.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 24 ---<br>
=C2=A0.../php/{<a href=3D"http://php_7.4.9.bb" rel=3D"noreferrer" target=
=3D"_blank">php_7.4.9.bb</a> =3D&gt; <a href=3D"http://php_7.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">php_7.4.16.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0...002-do-not-build-tests-sub-directory.patch |=C2=A0 21 +--<br>
=C2=A0...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch |=C2=A0 36 ++--<br>
=C2=A0...{<a href=3D"http://tigervnc_1.10.1.bb" rel=3D"noreferrer" target=
=3D"_blank">tigervnc_1.10.1.bb</a> =3D&gt; <a href=3D"http://tigervnc_1.11=
.0.bb" rel=3D"noreferrer" target=3D"_blank">tigervnc_1.11.0.bb</a>} |=C2=A0=
 13 +-<br>
=C2=A0...c-autodetect-availability-of-systemd.patch |=C2=A0 47 ++++++<br>
=C2=A0...ct-installation-of-50-rc_keymap.conf.patch |=C2=A0 40 +++++<br>
=C2=A0.../v4l2apps/<a href=3D"http://v4l-utils_1.20.0.bb" rel=3D"noreferre=
r" target=3D"_blank">v4l-utils_1.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
=C2=A0...<a href=3D"http://3.3.1.bb" rel=3D"noreferrer" target=3D"_blank">=
3.3.1.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_3.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography_3.3.2.bb</a>} |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ngo_2.2.16.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ngo_2.2.16.bb</a> =3D&gt; <a href=3D"http://python3-django_2.2.20.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_2.2.20.bb</a>} |=C2=A0 =
=
=C2=A04 +-<br>
=C2=A011 files changed, 130 insertions(+), 233 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.pa=
tch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.pa=
tch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_7.4.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_7.4.9.bb</a> =3D&gt; <a href=3D"h=
ttp://php_7.4.16.bb" rel=3D"noreferrer" target=3D"_blank">php_7.4.16.bb</a>=
} (97%)<br>
=C2=A0rename meta-oe/recipes-graphics/tigervnc/{<a href=3D"http://tigervnc=
_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">tigervnc_1.10.1.bb</a> =3D=
&gt; <a href=3D"http://tigervnc_1.11.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">tigervnc_1.11.0.bb</a>} (89%)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/000=
8-configure.ac-autodetect-availability-of-systemd.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/000=
9-keytable-restrict-installation-of-50-rc_keymap.conf.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-cryptography_3.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography_3.3.1.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_3.3.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_3.3.2.bb</a>} =
(94%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-django_2.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_2.2=
.16.bb</a> =3D&gt; <a href=3D"http://python3-django_2.2.20.bb" rel=3D"noref=
errer" target=3D"_blank">python3-django_2.2.20.bb</a>} (41%)<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000084101e05c0b57e0c--
