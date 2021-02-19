Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.12975.1613759694364565134
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 10:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FYQebuHO;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id lu16so15235621ejb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3pV5wmIbRgbCUtNiwWwC/3331fIgQaOsGpGUT6CZDvk=;
        b=FYQebuHOz7cgX8MbWPwksUh7QoPQ/Zl40dqkVcTOFVUOL2DJZg6hW577oERfH8U9Ac
         T2tpDfY2q8IEMH3IUudeUmmnlZfBaipduoYxO30KiAZJVYNzaXNBUu31Klzkm+t+h2WP
         h1W6DD5k9iG5IHQrnJuezHsE59XkITNXwnEBVqvTfDndsXwbnEM4+clduffny+XB4wpE
         G7g/ie10F8dmnH1tavCtLLd0Vet4qyvHYPaWXYFfSaefHEAeXnyWzdQSMgZGT2mrnmzR
         pVWQzTgu21yAxhM1cf2P6tR3z/gqHiOxBeO/f1hknNFkbf9LHwXb2lcaOX43RQuy/kXh
         1N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3pV5wmIbRgbCUtNiwWwC/3331fIgQaOsGpGUT6CZDvk=;
        b=GT/FH5OhwESbbLKLYWmup9cF3VmbC3KG2B5HFHZ5xp7esMOdIWA2+Lo4s8U9YWiBV6
         Ui5ZyC4Irv7kD9iKL19sMp6YiR3q5yY1RJF3fDvNMj3UVD0lBygS9KlVYh290GlCmGgQ
         ejcXosO6rjjtdgw6nHTTyQVq3SSPVN4gkzKub7QxBqanhFQp2X0D6v3861Fb38NtoWBb
         mVh0y4dqBQoCWSElbxrNTrSMkHPNdg7B9Gz37MOHfgrobD49qzQ6vLhMOK6vT1qPAiAd
         Yqq/UoeqV4xH4GzCMCbOfbmAwYLv+E7D2IMYuGgTd7zoTS4bbZC54HZCQw0tnGUKlc/a
         AWCQ==
X-Gm-Message-State: AOAM530dHnqiwDs7q664PzxgB5PmaRA4zjr1o6IjftX3nAn839L2FnTL
	B9cn6vVwYizpBZFkKc0yBaSfRMI7ZA+deoaT0os=
X-Google-Smtp-Source: ABdhPJyxhKbU1FFRmCmPHLnLyyagsKw6pdLgrUc1PIxHVt7cWQ+uTCLqMe9Rok7QTLqE80/rWdJB/jr9grAmxgivxfw=
X-Received: by 2002:a17:906:17d5:: with SMTP id u21mr10157579eje.541.1613759692991;
 Fri, 19 Feb 2021 10:34:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1613349480.git.akuster808@gmail.com> <CA+chaQfaQG3ZRRZ0r0D3EZKkjGOrhEVqAZTGkb823nE8UyEEwg@mail.gmail.com>
 <94c706e0-779a-00a1-a23d-6b4c6b6dd674@gmail.com>
In-Reply-To: <94c706e0-779a-00a1-a23d-6b4c6b6dd674@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 19 Feb 2021 19:34:41 +0100
Message-ID: <CA+chaQcjgMr_drNs_A3B1KJEZK0CJG3Nxss3CWrTmr16-jmXQQ@mail.gmail.com>
Subject: Re: [oe] [gatesgarth 00/15] Patch review Feb 14th
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000040f01b05bbb4b59c"

--00000000000040f01b05bbb4b59c
Content-Type: text/plain; charset="UTF-8"

lets fix the parsing :)

current gatesgarth-next
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Mon, Feb 15, 2021 at 4:50 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 2/15/21 12:49 AM, Martin Jansa wrote:
> > Hi,
> >
> > this seems to be missing the top commit from:
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=pkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth
> > so python3-grpcio-tools doesn't even parse since sysconfigdata were
> > merged in oe-core.
>
> Thanks.
> I did run several builds with this series as I was having other build
> issues around "python3targetconfig" changes.
>
> I pull those in  too.
>
> -armin
> >
> > Cheers,
> >
> > On Mon, Feb 15, 2021 at 2:13 AM akuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     Next set for Gatesgarth.
> >     Please have feedback by Tuesday.
> >
> >     The following changes since commit
> >     cef93b7b00e620d90a610112ee574fa60b691cf8:
> >
> >       openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)
> >
> >     are available in the Git repository at:
> >
> >       git://git.openembedded.org/meta-openembedded-contrib
> >     <http://git.openembedded.org/meta-openembedded-contrib>
> >     stable/gatesgarth-nut
> >
> >
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut
> >
> >     Armin Kuster (1):
> >       lua: update to 5.3.6
> >
> >     Kai Kang (1):
> >       mariadb: add package config zstd
> >
> >     Khem Raj (5):
> >       mariadb: Fix build on 32bit arches with 64bit time_t
> >       gedit: Inherit python3targetconfig
> >       openipmi: Inherit python3targetconfig
> >       libplist: Inherit python3targetconfig
> >       postgresql: Inherit python3targetconfig
> >
> >     Mario Schuknecht (1):
> >       dnsmasq: Fix systemd service
> >
> >     Martin Jansa (1):
> >       wireguard-module: remove PKG assignment
> >
> >     Mingli Yu (1):
> >       mariadb: upgrade to 10.5.8
> >
> >     Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com> (1):
> >       minifi-cpp: set PSEUDO_CONSIDER_PATHS
> >
> >     Shlomi Vaknin (1):
> >       python3-sh: remove python3-tests from RDEPENDS
> >
> >     Wang Mingyu (1):
> >       dnsmasq: upgrade 2.82 -> 2.84
> >
> >     akuster (1):
> >       enca: Fix SRC_URI
> >
> >     changqing.li@windriver.com <mailto:changqing.li@windriver.com> (1):
> >       celt051: update SRC_URI
> >
> >      .../recipes-gnome/gedit/gedit_3.36.2.bb <http://gedit_3.36.2.bb>
> >          |  2 +-
> >      .../wireguard-module_1.0.20200908.bb
> >     <http://wireguard-module_1.0.20200908.bb>          |  7 ----
> >      .../recipes-support/celt051/celt051_git.bb
> >     <http://celt051_git.bb>    |  2 +-
> >      .../recipes-support/dnsmasq/dnsmasq/lua.patch |  9 +++--
> >      .../recipes-support/dnsmasq/dnsmasq_2.82.bb
> >     <http://dnsmasq_2.82.bb>   |  8 ----
> >      .../recipes-support/dnsmasq/dnsmasq_2.84.bb
> >     <http://dnsmasq_2.84.bb>   |  8 ++++
> >      .../dnsmasq/files/dnsmasq-resolvconf.service  |  2 +-
> >      .../openipmi/openipmi_2.0.29.bb <http://openipmi_2.0.29.bb>
> >              |  2 +-
> >      ...ive_10.5.6.bb <http://ive_10.5.6.bb> =>
> >     mariadb-native_10.5.8.bb <http://mariadb-native_10.5.8.bb>} |  0
> >      meta-oe/recipes-dbs/mysql/mariadb.inc         |  5 ++-
> >      ...fine-__NR_futex-if-it-does-not-exist.patch | 37
> ++++++++++++++++++
> >      ...ktrace-t.c-make-the-test-conditional.patch | 38
> >     +++++++++++++++++++
> >      .../mysql/mariadb/c11_atomics.patch           | 14 +++----
> >      .../{mariadb_10.5.6.bb <http://mariadb_10.5.6.bb> =>
> >     mariadb_10.5.8.bb <http://mariadb_10.5.8.bb>}  |  0
> >      meta-oe/recipes-dbs/postgresql/postgresql.inc |  2 +-
> >      .../lua/{lua_5.3.5.bb <http://lua_5.3.5.bb> => lua_5.3.6.bb
> >     <http://lua_5.3.6.bb>}        |  6 +--
> >      .../libimobiledevice/libplist_2.2.0.bb
> >     <http://libplist_2.2.0.bb>        |  2 +-
> >      .../minifi-cpp/minifi-cpp_0.7.0.bb <http://minifi-cpp_0.7.0.bb>
> >               |  1 +
> >      meta-oe/recipes-support/enca/enca_1.9.bb <http://enca_1.9.bb>
> >       |  7 ++--
> >      .../python/python3-sh_1.14.1.bb <http://python3-sh_1.14.1.bb>
> >                |  1 -
> >      20 files changed, 112 insertions(+), 41 deletions(-)
> >      delete mode 100644
> >     meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
> >     <http://dnsmasq_2.82.bb>
> >      create mode 100644
> >     meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
> >     <http://dnsmasq_2.84.bb>
> >      rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb
> >     <http://mariadb-native_10.5.6.bb> => mariadb-native_10.5.8.bb
> >     <http://mariadb-native_10.5.8.bb>} (100%)
> >      create mode 100644
> >
>  meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
> >      create mode 100644
> >
>  meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
> >      rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb
> >     <http://mariadb_10.5.6.bb> => mariadb_10.5.8.bb
> >     <http://mariadb_10.5.8.bb>} (100%)
> >      rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb
> >     <http://lua_5.3.5.bb> => lua_5.3.6.bb <http://lua_5.3.6.bb>} (92%)
> >
> >     --
> >     2.17.1
> >
> >
> >     
> >
>
>

--00000000000040f01b05bbb4b59c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>lets fix the parsing :)</div><div><br></div><div dir=
=3D"ltr">current gatesgarth-next<div>Acked-by: Martin Jansa &lt;<a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Feb 15, 2021 at 4:50 PM akuster808 &lt;<a href=3D"mailto:akuster808@=
gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
<br>
On 2/15/21 12:49 AM, Martin Jansa wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; this seems to be missing the top commit from:<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log=
/?h=3Dpkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Dpkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth</a><br>
&gt; so python3-grpcio-tools doesn&#39;t even parse since sysconfigdata we=
re<br>
&gt; merged in oe-core.<br>
<br>
Thanks.<br>
I did run several builds with this series as I was having other build<br>
issues around &quot;python3targetconfig&quot; changes.<br>
<br>
I pull those in=C2=A0 too.<br>
<br>
-armin<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; On Mon, Feb 15, 2021 at 2:13 AM akuster &lt;<a href=3D"mailto:akuster=
808@gmail.com" target=3D"_blank">akuster808@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">=
akuster808@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Next set for Gatesgarth.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Please have feedback by Tuesday.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The following changes since commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0cef93b7b00e620d90a610112ee574fa60b691cf8:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 openldap: upgrade 2.4.56 -&gt; 2.4.57 (2021=
-02-02 10:18:22 -0800)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 git://<a href=3D"http://git.openembedded.or=
g/meta-openembedded-contrib" rel=3D"noreferrer" target=3D"_blank">git.opene=
mbedded.org/meta-openembedded-contrib</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.openembedded.org/meta-op=
enembedded-contrib" rel=3D"noreferrer" target=3D"_blank">http://git.openemb=
edded.org/meta-openembedded-contrib</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0stable/gatesgarth-nut<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/meta-opene=
mbedded-contrib/log/?h=3Dstable/gatesgarth-nut" rel=3D"noreferrer" target=
=3D"_blank">http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=
=3Dstable/gatesgarth-nut</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Armin Kuster (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 lua: update to 5.3.6<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Kai Kang (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mariadb: add package config zstd<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Khem Raj (5):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mariadb: Fix build on 32bit arches with 64b=
it time_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gedit: Inherit python3targetconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 openipmi: Inherit python3targetconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 libplist: Inherit python3targetconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 postgresql: Inherit python3targetconfig<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mario Schuknecht (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 dnsmasq: Fix systemd service<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Martin Jansa (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 wireguard-module: remove PKG assignment<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mingli Yu (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mariadb: upgrade to 10.5.8<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Qi.Chen@windriver.com" target=3D=
"_blank">Qi.Chen@windriver.com</a> &lt;mailto:<a href=3D"mailto:Qi.Chen@win=
driver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt; (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 minifi-cpp: set PSEUDO_CONSIDER_PATHS<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Shlomi Vaknin (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 python3-sh: remove python3-tests from RDEPE=
NDS<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Wang Mingyu (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 dnsmasq: upgrade 2.82 -&gt; 2.84<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0akuster (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 enca: Fix SRC_URI<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a> &lt;mailto:<a href=3D"mailto:c=
hangqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>=
&gt; (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 celt051: update SRC_URI<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-gnome/gedit/<a href=3D"http://ge=
dit_3.36.2.bb" rel=3D"noreferrer" target=3D"_blank">gedit_3.36.2.bb</a> &lt=
;<a href=3D"http://gedit_3.36.2.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://gedit_3.36.2.bb</a>&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../<a href=3D"http://wireguard-module_1.0.2=
0200908.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-module_1.0.20200=
908.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://wireguard-module_1.0.2020090=
8.bb" rel=3D"noreferrer" target=3D"_blank">http://wireguard-module_1.0.2020=
0908.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/celt051/<a href=3D"http:=
//celt051_git.bb" rel=3D"noreferrer" target=3D"_blank">celt051_git.bb</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://celt051_git.bb" rel=3D"noref=
errer" target=3D"_blank">http://celt051_git.bb</a>&gt;=C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/dnsmasq/dnsmasq/lua.patc=
h |=C2=A0 9 +++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/dnsmasq/<a href=3D"http:=
//dnsmasq_2.82.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2.82.bb</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dnsmasq_2.82.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://dnsmasq_2.82.bb</a>&gt;=C2=A0 =C2=A0|=C2=
=A0 8 ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/dnsmasq/<a href=3D"http:=
//dnsmasq_2.84.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2.84.bb</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dnsmasq_2.84.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://dnsmasq_2.84.bb</a>&gt;=C2=A0 =C2=A0|=C2=
=A0 8 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dnsmasq/files/dnsmasq-resolvconf.service=
=
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../openipmi/<a href=3D"http://openipmi_2.0.=
29.bb" rel=3D"noreferrer" target=3D"_blank">openipmi_2.0.29.bb</a> &lt;<a h=
ref=3D"http://openipmi_2.0.29.bb" rel=3D"noreferrer" target=3D"_blank">http=
://openipmi_2.0.29.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"http://ive_10.5.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">ive_10.5.6.bb</a> &lt;<a href=3D"http://ive_10=
.5.6.bb" rel=3D"noreferrer" target=3D"_blank">http://ive_10.5.6.bb</a>&gt; =
=
=3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mariadb-native_10.5.8.bb" rel=3D=
"noreferrer" target=3D"_blank">mariadb-native_10.5.8.bb</a> &lt;<a href=3D"=
http://mariadb-native_10.5.8.bb" rel=3D"noreferrer" target=3D"_blank">http:=
//mariadb-native_10.5.8.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...fine-__NR_futex-if-it-does-not-exist.patc=
h | 37 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...ktrace-t.c-make-the-test-conditional.patc=
h | 38<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../mysql/mariadb/c11_atomics.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../{<a href=3D"http://mariadb_10.5.6.bb" re=
l=3D"noreferrer" target=3D"_blank">mariadb_10.5.6.bb</a> &lt;<a href=3D"htt=
p://mariadb_10.5.6.bb" rel=3D"noreferrer" target=3D"_blank">http://mariadb_=
10.5.6.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mariadb_10.5.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">mariadb_10.5.8.bb</a> &lt;<a href=3D"http://mariadb=
_10.5.8.bb" rel=3D"noreferrer" target=3D"_blank">http://mariadb_10.5.8.bb</=
a>&gt;}=C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-dbs/postgresql/postgresql.in=
c |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../lua/{<a href=3D"http://lua_5.3.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">lua_5.3.5.bb</a> &lt;<a href=3D"http://l=
ua_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http://lua_5.3.5.bb</a>&g=
t; =3D&gt; <a href=3D"http://lua_5.3.6.bb" rel=3D"noreferrer" target=3D"_bl=
ank">lua_5.3.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lua_5.3.6.bb" rel=3D"norefer=
rer" target=3D"_blank">http://lua_5.3.6.bb</a>&gt;}=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 6 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libimobiledevice/<a href=3D"http://libpl=
ist_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.2.0.bb</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libplist_2.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://libplist_2.2.0.bb</a>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../minifi-cpp/<a href=3D"http://minifi-cpp_=
0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">minifi-cpp_0.7.0.bb</a> &lt;=
<a href=3D"http://minifi-cpp_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>http://minifi-cpp_0.7.0.bb</a>&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-support/enca/<a href=3D"http=
://enca_1.9.bb" rel=3D"noreferrer" target=3D"_blank">enca_1.9.bb</a> &lt;<a=
 href=3D"http://enca_1.9.bb" rel=3D"noreferrer" target=3D"_blank">http://en=
ca_1.9.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 |=C2=A0 7 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../python/<a href=3D"http://python3-sh_1.14=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-sh_1.14.1.bb</a> &lt;<a=
 href=3D"http://python3-sh_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">=
http://python3-sh_1.14.1.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A020 files changed, 112 insertions(+), 41 dele=
tions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dnsmasq/<a href=3D=
"http://dnsmasq_2.82.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2.82.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dnsmasq_2.82.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://dnsmasq_2.82.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dnsmasq/<a href=3D=
"http://dnsmasq_2.84.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2.84.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dnsmasq_2.84.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://dnsmasq_2.84.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D=
"http://mariadb-native_10.5.6.bb" rel=3D"noreferrer" target=3D"_blank">mari=
adb-native_10.5.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mariadb-native_10.5.6.bb" re=
l=3D"noreferrer" target=3D"_blank">http://mariadb-native_10.5.6.bb</a>&gt; =
=
=3D&gt; <a href=3D"http://mariadb-native_10.5.8.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mariadb-native_10.5.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mariadb-native_10.5.8.bb" re=
l=3D"noreferrer" target=3D"_blank">http://mariadb-native_10.5.8.bb</a>&gt;}=
 (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-De=
fine-__NR_futex-if-it-does-not-exist.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-=
t.c-make-the-test-conditional.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D=
"http://mariadb_10.5.6.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.=
5.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mariadb_10.5.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://mariadb_10.5.6.bb</a>&gt; =3D&gt; <a hre=
f=3D"http://mariadb_10.5.8.bb" rel=3D"noreferrer" target=3D"_blank">mariadb=
_10.5.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mariadb_10.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">http://mariadb_10.5.8.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-devtools/lua/{<a href=
=
=3D"http://lua_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">lua_5.3.5.bb=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lua_5.3.5.bb" rel=3D"norefer=
rer" target=3D"_blank">http://lua_5.3.5.bb</a>&gt; =3D&gt; <a href=3D"http:=
//lua_5.3.6.bb" rel=3D"noreferrer" target=3D"_blank">lua_5.3.6.bb</a> &lt;<=
a href=3D"http://lua_5.3.6.bb" rel=3D"noreferrer" target=3D"_blank">http://=
lua_5.3.6.bb</a>&gt;} (92%)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.17.1<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000040f01b05bbb4b59c--
