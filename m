Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.28897.1613379002665740540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 00:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iEXnT8XU;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id y26so9783854eju.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8++6PiYWiaLw4u89XvOMJ/udZi9CyxZqFhXAsJR/RuE=;
        b=iEXnT8XUIt7xtMtTO4feOnImcHiRin6zXjC6nvIZlNjKVcwtuDNLymicI/5i7EoNqh
         coMe/AxIPaopmNE9FkRFvVZh4g+RkqEAAm0czeiKK777jr0TT925WCUzTdkkxksw548h
         mqZizByzYr7Z9XEoSngC+gOebwm1bHapDhA3TudQBo8a6fBpsc/5/VROMXPyl6I9fJ2l
         J/Loq0DSLhjs9nusDkhvQ4tW2ic6ysD0/y4BILlCNLIa/wbc3VN0tUUV1e4JgqzJxkb0
         2l1PXEI1CmCsnyYC4/VFVe8LI4SwGJ/sDAY/zUfShxEymH7w258Vtdc4aL2d/AIzeS8A
         AoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8++6PiYWiaLw4u89XvOMJ/udZi9CyxZqFhXAsJR/RuE=;
        b=kkkl25t+ANO+BOCrOLowwRkxou/odFlato4dBf5OIhbZwakb3NOyV9Rpvi1ApGyY5C
         UwHUMoWHyWu96HiEHpMRqSjHt7pZ1pigOvpFKeXaARkNShsqGXz+7nYH5yUYXH4/fmKI
         IShyvwKOP8E6dWXGnAQ0WV4ebA/rhnDHCHjv78iUTyy9UPNpJCcgbqddDVjIADxm/DSa
         5KQM4073vyoV7qSqi+Uzdn0veBwMfeFidX0UNh7Z5NfxHjMa1XTNWL+oU3eSJUDvGvUV
         zBUCmbL5rKmsH8oU8MOPi1/1RdxmFS+zl/M4GaXQcn2WTikhKfDogjMpcBq8YjnwBHKx
         atSw==
X-Gm-Message-State: AOAM531m8HxgsCMiocJzX5K+FEhsjwHTcLNih10/SRKN4lEn61sg7Y1j
	P0281CEEj5hbsQoTAqGazgMmOdWgcFjkBAOLPX8=
X-Google-Smtp-Source: ABdhPJwewPx8AwttuVVrTphJxMPxLf6aed4GsDjo6D3EJd3tGJHSaSCcVfSF60UjQb/6aonxBH8MtYX6l1KJW8WbcUA=
X-Received: by 2002:a17:906:8297:: with SMTP id h23mr9005103ejx.54.1613379001170;
 Mon, 15 Feb 2021 00:50:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1613349480.git.akuster808@gmail.com>
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 15 Feb 2021 09:49:50 +0100
Message-ID: <CA+chaQfaQG3ZRRZ0r0D3EZKkjGOrhEVqAZTGkb823nE8UyEEwg@mail.gmail.com>
Subject: Re: [oe] [gatesgarth 00/15] Patch review Feb 14th
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000040bf4f05bb5c12b3"

--00000000000040bf4f05bb5c12b3
Content-Type: text/plain; charset="UTF-8"

Hi,

this seems to be missing the top commit from:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=pkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth
so python3-grpcio-tools doesn't even parse since sysconfigdata were merged
in oe-core.

Cheers,

On Mon, Feb 15, 2021 at 2:13 AM akuster <akuster808@gmail.com> wrote:

> Next set for Gatesgarth.
> Please have feedback by Tuesday.
>
> The following changes since commit
> cef93b7b00e620d90a610112ee574fa60b691cf8:
>
>   openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/gatesgarth-nut
>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut
>
> Armin Kuster (1):
>   lua: update to 5.3.6
>
> Kai Kang (1):
>   mariadb: add package config zstd
>
> Khem Raj (5):
>   mariadb: Fix build on 32bit arches with 64bit time_t
>   gedit: Inherit python3targetconfig
>   openipmi: Inherit python3targetconfig
>   libplist: Inherit python3targetconfig
>   postgresql: Inherit python3targetconfig
>
> Mario Schuknecht (1):
>   dnsmasq: Fix systemd service
>
> Martin Jansa (1):
>   wireguard-module: remove PKG assignment
>
> Mingli Yu (1):
>   mariadb: upgrade to 10.5.8
>
> Qi.Chen@windriver.com (1):
>   minifi-cpp: set PSEUDO_CONSIDER_PATHS
>
> Shlomi Vaknin (1):
>   python3-sh: remove python3-tests from RDEPENDS
>
> Wang Mingyu (1):
>   dnsmasq: upgrade 2.82 -> 2.84
>
> akuster (1):
>   enca: Fix SRC_URI
>
> changqing.li@windriver.com (1):
>   celt051: update SRC_URI
>
>  .../recipes-gnome/gedit/gedit_3.36.2.bb       |  2 +-
>  .../wireguard-module_1.0.20200908.bb          |  7 ----
>  .../recipes-support/celt051/celt051_git.bb    |  2 +-
>  .../recipes-support/dnsmasq/dnsmasq/lua.patch |  9 +++--
>  .../recipes-support/dnsmasq/dnsmasq_2.82.bb   |  8 ----
>  .../recipes-support/dnsmasq/dnsmasq_2.84.bb   |  8 ++++
>  .../dnsmasq/files/dnsmasq-resolvconf.service  |  2 +-
>  .../openipmi/openipmi_2.0.29.bb               |  2 +-
>  ...ive_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  5 ++-
>  ...fine-__NR_futex-if-it-does-not-exist.patch | 37 ++++++++++++++++++
>  ...ktrace-t.c-make-the-test-conditional.patch | 38 +++++++++++++++++++
>  .../mysql/mariadb/c11_atomics.patch           | 14 +++----
>  .../{mariadb_10.5.6.bb => mariadb_10.5.8.bb}  |  0
>  meta-oe/recipes-dbs/postgresql/postgresql.inc |  2 +-
>  .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}        |  6 +--
>  .../libimobiledevice/libplist_2.2.0.bb        |  2 +-
>  .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
>  meta-oe/recipes-support/enca/enca_1.9.bb      |  7 ++--
>  .../python/python3-sh_1.14.1.bb               |  1 -
>  20 files changed, 112 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/
> dnsmasq_2.82.bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/
> dnsmasq_2.84.bb
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb =>
> mariadb-native_10.5.8.bb} (100%)
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb}
> (100%)
>  rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)
>
> --
> 2.17.1
>
>
> 
>
>

--00000000000040bf4f05bb5c12b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>this seems to be missing the top co=
mmit from:</div><div><a href=3D"https://git.openembedded.org/meta-openembed=
ded-contrib/log/?h=3Dpkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth">https://git=
.openembedded.org/meta-openembedded-contrib/log/?h=3Dpkj/_PYTHON_SYSCONFIGD=
ATA_NAME-gatesgarth</a><br></div><div>so python3-grpcio-tools doesn&#39;t e=
ven parse since sysconfigdata were merged in oe-core.</div><div><br></div><=
div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Feb 15, 2021 at 2:13 AM akuster &lt;<a href=3D"mai=
lto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Next set for Gatesgarth.<br>
Please have feedback by Tuesday.<br>
<br>
The following changes since commit cef93b7b00e620d90a610112ee574fa60b691cf=
8:<br>
<br>
=C2=A0 openldap: upgrade 2.4.56 -&gt; 2.4.57 (2021-02-02 10:18:22 -0800)<b=
r>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openemb=
edded-contrib</a> stable/gatesgarth-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/meta-openembedded-contrib/l=
og/?h=3Dstable/gatesgarth-nut" rel=3D"noreferrer" target=3D"_blank">http://=
cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/gatesgarth-=
nut</a><br>
<br>
Armin Kuster (1):<br>
=C2=A0 lua: update to 5.3.6<br>
<br>
Kai Kang (1):<br>
=C2=A0 mariadb: add package config zstd<br>
<br>
Khem Raj (5):<br>
=C2=A0 mariadb: Fix build on 32bit arches with 64bit time_t<br>
=C2=A0 gedit: Inherit python3targetconfig<br>
=C2=A0 openipmi: Inherit python3targetconfig<br>
=C2=A0 libplist: Inherit python3targetconfig<br>
=C2=A0 postgresql: Inherit python3targetconfig<br>
<br>
Mario Schuknecht (1):<br>
=C2=A0 dnsmasq: Fix systemd service<br>
<br>
Martin Jansa (1):<br>
=C2=A0 wireguard-module: remove PKG assignment<br>
<br>
Mingli Yu (1):<br>
=C2=A0 mariadb: upgrade to 10.5.8<br>
<br>
<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriv=
er.com</a> (1):<br>
=C2=A0 minifi-cpp: set PSEUDO_CONSIDER_PATHS<br>
<br>
Shlomi Vaknin (1):<br>
=C2=A0 python3-sh: remove python3-tests from RDEPENDS<br>
<br>
Wang Mingyu (1):<br>
=C2=A0 dnsmasq: upgrade 2.82 -&gt; 2.84<br>
<br>
akuster (1):<br>
=C2=A0 enca: Fix SRC_URI<br>
<br>
<a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank">changqing.=
li@windriver.com</a> (1):<br>
=C2=A0 celt051: update SRC_URI<br>
<br>
=C2=A0.../recipes-gnome/gedit/<a href=3D"http://gedit_3.36.2.bb" rel=3D"no=
referrer" target=3D"_blank">gedit_3.36.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=
=C2=A0 2 +-<br>
=C2=A0.../<a href=3D"http://wireguard-module_1.0.20200908.bb" rel=3D"noref=
errer" target=3D"_blank">wireguard-module_1.0.20200908.bb</a>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ----<br>
=C2=A0.../recipes-support/celt051/<a href=3D"http://celt051_git.bb" rel=3D=
"noreferrer" target=3D"_blank">celt051_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 +-=
<br>
=C2=A0.../recipes-support/dnsmasq/dnsmasq/lua.patch |=C2=A0 9 +++--<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.82.bb" rel=
=3D"noreferrer" target=3D"_blank">dnsmasq_2.82.bb</a>=C2=A0 =C2=A0|=C2=A0 =
8 ----<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.84.bb" rel=
=3D"noreferrer" target=3D"_blank">dnsmasq_2.84.bb</a>=C2=A0 =C2=A0|=C2=A0 =
8 ++++<br>
=C2=A0.../dnsmasq/files/dnsmasq-resolvconf.service=C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../openipmi/<a href=3D"http://openipmi_2.0.29.bb" rel=3D"noreferrer=
" target=3D"_blank">openipmi_2.0.29.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://ive_10.5.6.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ive_10.5.6.bb</a> =3D&gt; <a href=3D"http://mariadb-native_10.5.8.bb" =
rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.5.8.bb</a>} |=C2=A0 =
0<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 5 ++-<br>
=C2=A0...fine-__NR_futex-if-it-does-not-exist.patch | 37 +++++++++++++++++=
+<br>
=C2=A0...ktrace-t.c-make-the-test-conditional.patch | 38 +++++++++++++++++=
++<br>
=C2=A0.../mysql/mariadb/c11_atomics.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 14 +++----<br>
=C2=A0.../{<a href=3D"http://mariadb_10.5.6.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_10.5.6.bb</a> =3D&gt; <a href=3D"http://mariadb_10.5.8=
.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.5.8.bb</a>}=C2=A0 |=C2=
=
=A0 0<br>
=C2=A0meta-oe/recipes-dbs/postgresql/postgresql.inc |=C2=A0 2 +-<br>
=C2=A0.../lua/{<a href=3D"http://lua_5.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lua_5.3.5.bb</a> =3D&gt; <a href=3D"http://lua_5.3.6.bb" rel=
=3D"noreferrer" target=3D"_blank">lua_5.3.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +--<br>
=C2=A0.../libimobiledevice/<a href=3D"http://libplist_2.2.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">libplist_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 +-<br>
=C2=A0.../minifi-cpp/<a href=3D"http://minifi-cpp_0.7.0.bb" rel=3D"norefer=
rer" target=3D"_blank">minifi-cpp_0.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta-oe/recipes-support/enca/<a href=3D"http://enca_1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">enca_1.9.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 =
++--<br>
=C2=A0.../python/<a href=3D"http://python3-sh_1.14.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-sh_1.14.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A020 files changed, 112 insertions(+), 41 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/dnsmasq/<a href=
=3D"http://dnsmasq_2.82.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2=
.82.bb</a><br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/<a href=
=3D"http://dnsmasq_2.84.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2=
.84.bb</a><br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_1=
0.5.6.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.5.6.bb</a>=
 =3D&gt; <a href=3D"http://mariadb-native_10.5.8.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mariadb-native_10.5.8.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-D=
efine-__NR_futex-if-it-does-not-exist.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace=
-t.c-make-the-test-conditional.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_10.5.6.b=
b" rel=3D"noreferrer" target=3D"_blank">mariadb_10.5.6.bb</a> =3D&gt; <a hr=
ef=3D"http://mariadb_10.5.8.bb" rel=3D"noreferrer" target=3D"_blank">mariad=
b_10.5.8.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/lua/{<a href=3D"http://lua_5.3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">lua_5.3.5.bb</a> =3D&gt; <a href=3D"h=
ttp://lua_5.3.6.bb" rel=3D"noreferrer" target=3D"_blank">lua_5.3.6.bb</a>} =
(92%)<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000040bf4f05bb5c12b3--
