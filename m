Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.175.1591729021662832814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KVpjTZ61;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id g11so4153684qvs.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 11:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hN6ZMG1FWpLyGRLI9EUhRVitB/G/WXjYrvFtCMyG/c=;
        b=KVpjTZ61QTcN4NV+VXm+m2i/70wq14Ea9rT91og2fZY17NavPi+f/CZsI6PHNRORlB
         kf8Hzhb5txjfveQh9yGzuZyUxwC+5bNyGddnpvy3ixr7QPApCsvsUCjzn6fnR0a6tnmL
         F8mVmMirNFEHtWXEcoiOnKQnhTPpRWsCOADsoMwvnM/QwM6migUX7cav2Ix4AMKkoCuP
         SKYcuKk/9CzaSs2YQnCHlrPlXO9f7WfVnjiSAY1MGkF5xg8ESS7JSv1HKfMaTBKvofQq
         CPJnmTMMVol7/wln5RZt83LOF3ziWnrdYHDUKQxXCp4VOvJnNIwamK1oVG82lkyqZB1N
         6kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hN6ZMG1FWpLyGRLI9EUhRVitB/G/WXjYrvFtCMyG/c=;
        b=mlZ8tn3PMaZ+whM8rE4kmnOp/XKfW5SgYDfO5rXddusTFKIPLdkPjxz6EwsBcu3fyK
         x2RejWYhCI12hRBJ3EB/ZRzbSp0b2OWG6f3UvDmBqwKJhg2O9jsus1TKY7+ux3upiZqe
         G+bZ+gZ3RK7ua1I02vNfwVsHJWG46VxjfY7MZEAg9Wf0JjebF/bS1NTp6zji1KPjN5xW
         9w5K/hgf7/gV0xW9nkZfrlC7TRFkFvoU4pKmWft2/VuME0X3KJsR29XGZ2XKRmGuKDKl
         FxwoYFjs8f2GalWs/ui3nI18exhPgvnQn4LmAvv/GebBy1fX0V+7TsgIxPq1EvFyE6j0
         LB/w==
X-Gm-Message-State: AOAM531/2ZIUJ4iu4O9lqgKcS3rv4tjwpN32kmDSml+V/xG4wFLe4a0+
	+sVMgvmZiLBNWdyjJJrSkrIJ9cD1PeKTPQ9FebJtBYhh
X-Google-Smtp-Source: ABdhPJyZ4mTJajM2/MFZeKke1dTiZul1hRQZ0p76PrKHLjxtT9L3p7zsIBTAUXrs8sDPwjsXZKKLdUARM8XPTjPKijo=
X-Received: by 2002:ad4:47aa:: with SMTP id a10mr5709921qvz.61.1591728525036;
 Tue, 09 Jun 2020 11:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <16158ACEBF1AD616.29014@lists.openembedded.org> <32b06ca1-94ba-0717-b070-d85865aae0fa@gmail.com>
In-Reply-To: <32b06ca1-94ba-0717-b070-d85865aae0fa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Jun 2020 11:48:33 -0700
Message-ID: <CAMKF1spRgs1gFq90xdHvCQEbWpDeG7yYmo5DzrnmQer3Mje6eA@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/35] Merge Request
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050526805a7ab2dc7"

--00000000000050526805a7ab2dc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2020 at 8:46 AM akuster <akuster808@gmail.com> wrote:

>
>
> On 6/4/20 9:16 PM, akuster via lists.openembedded.org wrote:
>
> Ping.
>
> any issue with this merge request?
>

I Am fine with these changes were you looking for wider feedback or is it
ready to merge


> -armin
>
> Please merge these changes to Dunfell
>
> Cover letter only
>
> The following changes since commit e413c1ef621688e69bb7830bb3151ed23b30b=
73e:
>
>   samba: upgrade 4.10.13 -> 4.10.15 (2020-05-20 16:50:45 +0000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
>
> Adrian Bunk (2):
>   unicode-ucd: Stop broken license downloading
>   postfix: Upgrade 3.4.10 -> 3.4.12
>
> Andreas M=C3=BCller (2):
>   gexiv2: upgrade 0.12.0 -> 0.12.1
>   thunar: upgrade 1.8.14 -> 1.8.15
>
> Andrew Geissler (1):
>   nlohmann-json: backport gcc10 fix
>
> Armin Kuster (1):
>   tremor: update SRC_URI as project moved to gitlab
>
> Christoph Steiger (1):
>   python-periphery: Add python-mmap to RDEPENDS
>
> Domarys Correa (1):
>   python3-jinja2: Update 2.11.1 -> 2.11.2
>
> Kai Kang (3):
>   xfconf: 4.14.2 -> 4.14.3
>   thunar: 1.8.12 -> 1.8.14
>   catfish: 1.4.11 -> 1.4.13
>
> Khem Raj (4):
>   netplan: Depend on systemd if it is in distro
>   uim: Add patch to fix -fno-common link error
>   postfix: Upgrade to 3.4.10 and compile with -fcommon
>   safec: Update to latest on 3.5.1 release tags
>
> Leon Anavi (5):
>   python3-gmqtt: Upgrade to 0.6.5
>   python3-appdirs: Upgrade to 1.4.4
>   python3-pandas: Upgrade 1.0.1 -> 1.0.3
>   python3-parallax: Upgrade 1.0.5 -> 1.0.6
>   python3-openpyxl: Upgrade 2.6.3 -> 3.0.3
>
> Pierre-Jean Texier (3):
>   librsync: upgrade 2.3.0 -> 2.3.1
>   ser2net: fix upstream check URL
>   ser2net: upgrade 4.1.5 -> 4.1.8
>
> Trevor Gamblin (1):
>   python3-iso8601: add python3-numbers to RDEPENDS
>
> Wang Mingyu (4):
>   jansson: upgrade 2.12 -> 2.13.1
>   openldap: upgrade 2.4.49 -> 2.4.50
>   python3-pycparser: upgrade 2.19 -> 2.20
>   cryptsetup: upgrade 2.3.1 -> 2.3.2
>
> Yanfei Xu (1):
>   turbostat: fix the build failure for new v5.7-rc6 kernel
>
> Yi Zhao (1):
>   apache2: create log/run directory via pkg_postinst
>
> Zang Ruochen (2):
>   dnsmasq: upgrade 2.80 -> 2.81
>   fetchmail: upgrade 6.4.3 -> 6.4.4
>
> Zheng Ruoqin (3):
>   dstat: Fix runtime error that depend python.
>   kea: upgrade 1.7.6 -> 1.7.7
>   libqmi: upgrade 1.24.8 -> 1.24.12
>
>  .../{gexiv2_0.12.0.bb =3D> gexiv2_0.12.1.bb}    |  4 +-
>  .../tremor/tremor_20180319.bb                 |  2 +-
>  .../kea/{kea_1.7.6.bb =3D> kea_1.7.7.bb}        |  4 +-
>  .../netplan/netplan_0.98.bb                   |  3 +-
>  ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------
>  .../{postfix_3.4.8.bb =3D> postfix_3.4.12.bb}   |  5 +-
>  ...nsmasq-fix-build-against-5.2-headers.patch | 31 ------
>  ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 ---------
>  .../recipes-support/dnsmasq/dnsmasq_2.80.bb   | 10 --
>  .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |  8 ++
>  ...{fetchmail_6.4.3.bb =3D> fetchmail_6.4.4.bb} |  4 +-
>  .../{libqmi_1.24.8.bb =3D> libqmi_1.24.12.bb}   |  3 +-
>  .../{ser2net_4.1.5.bb =3D> ser2net_4.1.8.bb}    |  5 +-
>  ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 ------
>  .../safec/{safec_3.5.bb =3D> safec_3.5.1.bb}    |  8 +-
>  ...ryptsetup_2.3.1.bb =3D> cryptsetup_2.3.2.bb} |  4 +-
>  ...latize-basic_json-ctor-from-json_ref.patch | 99 +++++++++++++++++++
>  .../nlohmann-json/0001-typo-fix.patch         | 43 ++++++++
>  .../nlohmann-json/nlohmann-json_3.7.3.bb      |  5 +-
>  .../{jansson_2.12.bb =3D> jansson_2.13.1.bb}    |  6 +-
>  .../recipes-kernel/turbostat/turbostat_3.4.bb | 20 +++-
>  .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++
>  meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  4 +-
>  .../{librsync_2.3.0.bb =3D> librsync_2.3.1.bb}  |  2 +-
>  ...{openldap_2.4.49.bb =3D> openldap_2.4.50.bb} |  4 +-
>  .../uim/uim/JMP_BUF_GC_jmp_buf.patch          | 15 +++
>  meta-oe/recipes-support/uim/uim_1.8.8.bb      |  1 +
>  .../unicode-ucd/files/license.html            | 98 ++++++++++++++++++
>  .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
>  .../python/python-iso8601.inc                 |  1 +
>  .../python/python-periphery.inc               |  2 +
>  ...dirs_1.4.3.bb =3D> python3-appdirs_1.4.4.bb} |  4 +-
>  ...-gmqtt_0.6.2.bb =3D> python3-gmqtt_0.6.5.bb} |  4 +-
>  .../python/python3-jinja2_2.11.1.bb           |  4 -
>  ...on-jinja2.inc =3D> python3-jinja2_2.11.2.bb} | 40 +++++---
>  ...yxl_2.6.3.bb =3D> python3-openpyxl_3.0.3.bb} |  6 +-
>  .../python/python3-pandas_1.0.1.bb            |  2 -
>  ...hon-pandas.inc =3D> python3-pandas_1.0.3.bb} |  6 +-
>  ...lax_1.0.5.bb =3D> python3-parallax_1.0.6.bb} |  4 +-
>  ...rser_2.19.bb =3D> python3-pycparser_2.20.bb} |  4 +-
>  .../recipes-httpd/apache2/apache2_2.4.43.bb   | 18 ++++
>  .../apache2/files/apache2-volatile.conf       |  2 +
>  .../apache2/files/apache2.service             |  4 -
>  .../recipes-httpd/apache2/files/init          |  5 -
>  .../apache2/files/volatiles.04_apache2        |  3 +
>  .../{catfish_1.4.11.bb =3D> catfish_1.4.13.bb}  |  4 +-
>  .../{thunar_1.8.12.bb =3D> thunar_1.8.15.bb}    |  4 +-
>  .../{xfconf_4.14.2.bb =3D> xfconf_4.14.3.bb}    |  4 +-
>  48 files changed, 475 insertions(+), 246 deletions(-)
>  rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.0.bb =3D> gexiv2_0.=
12.1.bb} (69%)
>  rename meta-networking/recipes-connectivity/kea/{kea_1.7.6.bb =3D> kea_=
1.7.7.bb} (94%)
>  delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-F=
ixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.4.8.bb =3D> p=
ostfix_3.4.12.bb} (75%)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001=
-dnsmasq-fix-build-against-5.2-headers.patch
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001=
-dnsmasq-fix-memory-leak-in-helper-c.patch
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80=
.bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81=
.bb
>  rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.3.bb =
=3D> fetchmail_6.4.4.bb} (86%)
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.8.bb =3D> libqm=
i_1.24.12.bb} (85%)
>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.5.bb =3D> ser2=
net_4.1.8.bb} (69%)
>  delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_I=
SOC11_SOURCE-only-with-glibc.patch
>  rename meta-oe/recipes-core/safec/{safec_3.5.bb =3D> safec_3.5.1.bb} (5=
9%)
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.1.bb =3D> cryp=
tsetup_2.3.2.bb} (96%)
>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json=
/0001-Templatize-basic_json-ctor-from-json_ref.patch
>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json=
/0001-typo-fix.patch
>  rename meta-oe/recipes-extended/jansson/{jansson_2.12.bb =3D> jansson_2=
.13.1.bb} (60%)
>  create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dsta=
t-to-python3.patch
>  rename meta-oe/recipes-support/librsync/{librsync_2.3.0.bb =3D> librsyn=
c_2.3.1.bb} (88%)
>  rename meta-oe/recipes-support/openldap/{openldap_2.4.49.bb =3D> openld=
ap_2.4.50.bb} (98%)
>  create mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.p=
atch
>  create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.ht=
ml
>  rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb =
=3D> python3-appdirs_1.4.4.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb =3D>=
 python3-gmqtt_0.6.5.bb} (74%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2=
.11.1.bb
>  rename meta-python/recipes-devtools/python/{python-jinja2.inc =3D> pyth=
on3-jinja2_2.11.2.bb} (44%)
>  rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb =
=3D> python3-openpyxl_3.0.3.bb} (70%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1=
.0.1.bb
>  rename meta-python/recipes-devtools/python/{python-pandas.inc =3D> pyth=
on3-pandas_1.0.3.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb =
=3D> python3-parallax_1.0.6.bb} (72%)
>  rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb =
=3D> python3-pycparser_2.20.bb} (74%)
>  create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-v=
olatile.conf
>  create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles=
.04_apache2
>  rename meta-xfce/recipes-apps/catfish/{catfish_1.4.11.bb =3D> catfish_1=
.4.13.bb} (72%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.12.bb =3D> thunar_1.8.=
15.bb} (84%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.2.bb =3D> xfconf_4.14=
.3.bb} (83%)
>
>
>
>
>=20
>

--00000000000050526805a7ab2dc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 9, 2020 at 8:46 AM akuster &lt;<a href=3D"mail=
to:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
  
    
  
  <div>
    <br>
    <br>
    <div>On 6/4/20 9:16 PM, akuster via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.op=
enembedded.org</a> wrote:<br>
      <br>
      Ping.<br>
      <br>
      any issue with this merge request?<br>
      </div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I Am fine with these changes were you looking for wider feedback or is i=
t ready to merge=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div><div><br>
      -armin</div>
    <blockquote type=3D"cite">
      <pre>Please merge these changes to Dunfell

Cover letter only

The following changes since commit e413c1ef621688e69bb7830bb3151ed23b30b73=
e:

  samba: upgrade 4.10.13 -&gt; 4.10.15 (2020-05-20 16:50:45 +0000)

are available in the Git repository at:

  git://<a href=3D"http://git.openembedded.org/meta-openembedded" target=
=3D"_blank">git.openembedded.org/meta-openembedded</a> dunfell-next
  <a href=3D"http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfe=
ll-next" target=3D"_blank">http://cgit.openembedded.org/meta-openembedded/l=
og/?h=3Ddunfell-next</a>

Adrian Bunk (2):
  unicode-ucd: Stop broken license downloading
  postfix: Upgrade 3.4.10 -&gt; 3.4.12

Andreas M=C3=BCller (2):
  gexiv2: upgrade 0.12.0 -&gt; 0.12.1
  thunar: upgrade 1.8.14 -&gt; 1.8.15

Andrew Geissler (1):
  nlohmann-json: backport gcc10 fix

Armin Kuster (1):
  tremor: update SRC_URI as project moved to gitlab

Christoph Steiger (1):
  python-periphery: Add python-mmap to RDEPENDS

Domarys Correa (1):
  python3-jinja2: Update 2.11.1 -&gt; 2.11.2

Kai Kang (3):
  xfconf: 4.14.2 -&gt; 4.14.3
  thunar: 1.8.12 -&gt; 1.8.14
  catfish: 1.4.11 -&gt; 1.4.13

Khem Raj (4):
  netplan: Depend on systemd if it is in distro
  uim: Add patch to fix -fno-common link error
  postfix: Upgrade to 3.4.10 and compile with -fcommon
  safec: Update to latest on 3.5.1 release tags

Leon Anavi (5):
  python3-gmqtt: Upgrade to 0.6.5
  python3-appdirs: Upgrade to 1.4.4
  python3-pandas: Upgrade 1.0.1 -&gt; 1.0.3
  python3-parallax: Upgrade 1.0.5 -&gt; 1.0.6
  python3-openpyxl: Upgrade 2.6.3 -&gt; 3.0.3

Pierre-Jean Texier (3):
  librsync: upgrade 2.3.0 -&gt; 2.3.1
  ser2net: fix upstream check URL
  ser2net: upgrade 4.1.5 -&gt; 4.1.8

Trevor Gamblin (1):
  python3-iso8601: add python3-numbers to RDEPENDS

Wang Mingyu (4):
  jansson: upgrade 2.12 -&gt; 2.13.1
  openldap: upgrade 2.4.49 -&gt; 2.4.50
  python3-pycparser: upgrade 2.19 -&gt; 2.20
  cryptsetup: upgrade 2.3.1 -&gt; 2.3.2

Yanfei Xu (1):
  turbostat: fix the build failure for new v5.7-rc6 kernel

Yi Zhao (1):
  apache2: create log/run directory via pkg_postinst

Zang Ruochen (2):
  dnsmasq: upgrade 2.80 -&gt; 2.81
  fetchmail: upgrade 6.4.3 -&gt; 6.4.4

Zheng Ruoqin (3):
  dstat: Fix runtime error that depend python.
  kea: upgrade 1.7.6 -&gt; 1.7.7
  libqmi: upgrade 1.24.8 -&gt; 1.24.12

 .../{<a href=3D"http://gexiv2_0.12.0.bb" target=3D"_blank">gexiv2_0.12.0.=
bb</a> =3D&gt; <a href=3D"http://gexiv2_0.12.1.bb" target=3D"_blank">gexiv2=
_0.12.1.bb</a>}    |  4 +-
 .../tremor/<a href=3D"http://tremor_20180319.bb" target=3D"_blank">tremor=
_20180319.bb</a>                 |  2 +-
 .../kea/{<a href=3D"http://kea_1.7.6.bb" target=3D"_blank">kea_1.7.6.bb</=
a> =3D&gt; <a href=3D"http://kea_1.7.7.bb" target=3D"_blank">kea_1.7.7.bb</=
a>}        |  4 +-
 .../netplan/<a href=3D"http://netplan_0.98.bb" target=3D"_blank">netplan_=
0.98.bb</a>                   |  3 +-
 ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------
 .../{<a href=3D"http://postfix_3.4.8.bb" target=3D"_blank">postfix_3.4.8.=
bb</a> =3D&gt; <a href=3D"http://postfix_3.4.12.bb" target=3D"_blank">postf=
ix_3.4.12.bb</a>}   |  5 +-
 ...nsmasq-fix-build-against-5.2-headers.patch | 31 ------
 ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 ---------
 .../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.80.bb" target=3D"=
_blank">dnsmasq_2.80.bb</a>   | 10 --
 .../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.81.bb" target=3D"=
_blank">dnsmasq_2.81.bb</a>   |  8 ++
 ...{<a href=3D"http://fetchmail_6.4.3.bb" target=3D"_blank">fetchmail_6.4=
.3.bb</a> =3D&gt; <a href=3D"http://fetchmail_6.4.4.bb" target=3D"_blank">f=
etchmail_6.4.4.bb</a>} |  4 +-
 .../{<a href=3D"http://libqmi_1.24.8.bb" target=3D"_blank">libqmi_1.24.8.=
bb</a> =3D&gt; <a href=3D"http://libqmi_1.24.12.bb" target=3D"_blank">libqm=
i_1.24.12.bb</a>}   |  3 +-
 .../{<a href=3D"http://ser2net_4.1.5.bb" target=3D"_blank">ser2net_4.1.5.=
bb</a> =3D&gt; <a href=3D"http://ser2net_4.1.8.bb" target=3D"_blank">ser2ne=
t_4.1.8.bb</a>}    |  5 +-
 ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 ------
 .../safec/{<a href=3D"http://safec_3.5.bb" target=3D"_blank">safec_3.5.bb=
</a> =3D&gt; <a href=3D"http://safec_3.5.1.bb" target=3D"_blank">safec_3.5.=
1.bb</a>}    |  8 +-
 ...<a href=3D"http://ryptsetup_2.3.1.bb" target=3D"_blank">ryptsetup_2.3.=
1.bb</a> =3D&gt; <a href=3D"http://cryptsetup_2.3.2.bb" target=3D"_blank">c=
ryptsetup_2.3.2.bb</a>} |  4 +-
 ...latize-basic_json-ctor-from-json_ref.patch | 99 +++++++++++++++++++
 .../nlohmann-json/0001-typo-fix.patch         | 43 ++++++++
 .../nlohmann-json/<a href=3D"http://nlohmann-json_3.7.3.bb" target=3D"_bl=
ank">nlohmann-json_3.7.3.bb</a>      |  5 +-
 .../{<a href=3D"http://jansson_2.12.bb" target=3D"_blank">jansson_2.12.bb=
</a> =3D&gt; <a href=3D"http://jansson_2.13.1.bb" target=3D"_blank">jansson=
_2.13.1.bb</a>}    |  6 +-
 .../recipes-kernel/turbostat/<a href=3D"http://turbostat_3.4.bb" target=
=3D"_blank">turbostat_3.4.bb</a> | 20 +++-
 .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++
 meta-oe/recipes-support/dstat/<a href=3D"http://dstat_0.7.4.bb" target=3D=
"_blank">dstat_0.7.4.bb</a>  |  4 +-
 .../{<a href=3D"http://librsync_2.3.0.bb" target=3D"_blank">librsync_2.3.=
0.bb</a> =3D&gt; <a href=3D"http://librsync_2.3.1.bb" target=3D"_blank">lib=
rsync_2.3.1.bb</a>}  |  2 +-
 ...{<a href=3D"http://openldap_2.4.49.bb" target=3D"_blank">openldap_2.4.=
49.bb</a> =3D&gt; <a href=3D"http://openldap_2.4.50.bb" target=3D"_blank">o=
penldap_2.4.50.bb</a>} |  4 +-
 .../uim/uim/JMP_BUF_GC_jmp_buf.patch          | 15 +++
 meta-oe/recipes-support/uim/<a href=3D"http://uim_1.8.8.bb" target=3D"_bl=
ank">uim_1.8.8.bb</a>      |  1 +
 .../unicode-ucd/files/license.html            | 98 ++++++++++++++++++
 .../unicode-ucd/<a href=3D"http://unicode-ucd_12.1.0.bb" target=3D"_blank=
">unicode-ucd_12.1.0.bb</a>         |  7 +-
 .../python/python-iso8601.inc                 |  1 +
 .../python/python-periphery.inc               |  2 +
 ...<a href=3D"http://dirs_1.4.3.bb" target=3D"_blank">dirs_1.4.3.bb</a> =
=3D&gt; <a href=3D"http://python3-appdirs_1.4.4.bb" target=3D"_blank">pyth=
on3-appdirs_1.4.4.bb</a>} |  4 +-
 ...-<a href=3D"http://gmqtt_0.6.2.bb" target=3D"_blank">gmqtt_0.6.2.bb</a=
> =3D&gt; <a href=3D"http://python3-gmqtt_0.6.5.bb" target=3D"_blank">pytho=
n3-gmqtt_0.6.5.bb</a>} |  4 +-
 .../python/<a href=3D"http://python3-jinja2_2.11.1.bb" target=3D"_blank">=
python3-jinja2_2.11.1.bb</a>           |  4 -
 ...on-jinja2.inc =3D&gt; <a href=3D"http://python3-jinja2_2.11.2.bb" targ=
et=3D"_blank">python3-jinja2_2.11.2.bb</a>} | 40 +++++---
 ...<a href=3D"http://yxl_2.6.3.bb" target=3D"_blank">yxl_2.6.3.bb</a> =3D=
&gt; <a href=3D"http://python3-openpyxl_3.0.3.bb" target=3D"_blank">python3=
-openpyxl_3.0.3.bb</a>} |  6 +-
 .../python/<a href=3D"http://python3-pandas_1.0.1.bb" target=3D"_blank">p=
ython3-pandas_1.0.1.bb</a>            |  2 -
 ...hon-pandas.inc =3D&gt; <a href=3D"http://python3-pandas_1.0.3.bb" targ=
et=3D"_blank">python3-pandas_1.0.3.bb</a>} |  6 +-
 ...<a href=3D"http://lax_1.0.5.bb" target=3D"_blank">lax_1.0.5.bb</a> =3D=
&gt; <a href=3D"http://python3-parallax_1.0.6.bb" target=3D"_blank">python3=
-parallax_1.0.6.bb</a>} |  4 +-
 ...<a href=3D"http://rser_2.19.bb" target=3D"_blank">rser_2.19.bb</a> =3D=
&gt; <a href=3D"http://python3-pycparser_2.20.bb" target=3D"_blank">python3=
-pycparser_2.20.bb</a>} |  4 +-
 .../recipes-httpd/apache2/<a href=3D"http://apache2_2.4.43.bb" target=3D"=
_blank">apache2_2.4.43.bb</a>   | 18 ++++
 .../apache2/files/apache2-volatile.conf       |  2 +
 .../apache2/files/apache2.service             |  4 -
 .../recipes-httpd/apache2/files/init          |  5 -
 .../apache2/files/volatiles.04_apache2        |  3 +
 .../{<a href=3D"http://catfish_1.4.11.bb" target=3D"_blank">catfish_1.4.1=
1.bb</a> =3D&gt; <a href=3D"http://catfish_1.4.13.bb" target=3D"_blank">cat=
fish_1.4.13.bb</a>}  |  4 +-
 .../{<a href=3D"http://thunar_1.8.12.bb" target=3D"_blank">thunar_1.8.12.=
bb</a> =3D&gt; <a href=3D"http://thunar_1.8.15.bb" target=3D"_blank">thunar=
_1.8.15.bb</a>}    |  4 +-
 .../{<a href=3D"http://xfconf_4.14.2.bb" target=3D"_blank">xfconf_4.14.2.=
bb</a> =3D&gt; <a href=3D"http://xfconf_4.14.3.bb" target=3D"_blank">xfconf=
_4.14.3.bb</a>}    |  4 +-
 48 files changed, 475 insertions(+), 246 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{<a href=3D"http://gexiv2_0.12.0.b=
b" target=3D"_blank">gexiv2_0.12.0.bb</a> =3D&gt; <a href=3D"http://gexiv2_=
0.12.1.bb" target=3D"_blank">gexiv2_0.12.1.bb</a>} (69%)
 rename meta-networking/recipes-connectivity/kea/{<a href=3D"http://kea_1.=
7.6.bb" target=3D"_blank">kea_1.7.6.bb</a> =3D&gt; <a href=3D"http://kea_1.=
7.7.bb" target=3D"_blank">kea_1.7.7.bb</a>} (94%)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fix=
ed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
 rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://postfix=
_3.4.8.bb" target=3D"_blank">postfix_3.4.8.bb</a> =3D&gt; <a href=3D"http:/=
/postfix_3.4.12.bb" target=3D"_blank">postfix_3.4.12.bb</a>} (75%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-d=
nsmasq-fix-build-against-5.2-headers.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-d=
nsmasq-fix-memory-leak-in-helper-c.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/<a href=3D"htt=
p://dnsmasq_2.80.bb" target=3D"_blank">dnsmasq_2.80.bb</a>
 create mode 100644 meta-networking/recipes-support/dnsmasq/<a href=3D"htt=
p://dnsmasq_2.81.bb" target=3D"_blank">dnsmasq_2.81.bb</a>
 rename meta-networking/recipes-support/fetchmail/{<a href=3D"http://fetch=
mail_6.4.3.bb" target=3D"_blank">fetchmail_6.4.3.bb</a> =3D&gt; <a href=3D"=
http://fetchmail_6.4.4.bb" target=3D"_blank">fetchmail_6.4.4.bb</a>} (86%)
 rename meta-oe/recipes-connectivity/libqmi/{<a href=3D"http://libqmi_1.24=
.8.bb" target=3D"_blank">libqmi_1.24.8.bb</a> =3D&gt; <a href=3D"http://lib=
qmi_1.24.12.bb" target=3D"_blank">libqmi_1.24.12.bb</a>} (85%)
 rename meta-oe/recipes-connectivity/ser2net/{<a href=3D"http://ser2net_4.=
1.5.bb" target=3D"_blank">ser2net_4.1.5.bb</a> =3D&gt; <a href=3D"http://se=
r2net_4.1.8.bb" target=3D"_blank">ser2net_4.1.8.bb</a>} (69%)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISO=
C11_SOURCE-only-with-glibc.patch
 rename meta-oe/recipes-core/safec/{<a href=3D"http://safec_3.5.bb" target=
=
=3D"_blank">safec_3.5.bb</a> =3D&gt; <a href=3D"http://safec_3.5.1.bb" tar=
get=3D"_blank">safec_3.5.1.bb</a>} (59%)
 rename meta-oe/recipes-crypto/cryptsetup/{<a href=3D"http://cryptsetup_2.=
3.1.bb" target=3D"_blank">cryptsetup_2.3.1.bb</a> =3D&gt; <a href=3D"http:/=
/cryptsetup_2.3.2.bb" target=3D"_blank">cryptsetup_2.3.2.bb</a>} (96%)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0=
001-Templatize-basic_json-ctor-from-json_ref.patch
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0=
001-typo-fix.patch
 rename meta-oe/recipes-extended/jansson/{<a href=3D"http://jansson_2.12.b=
b" target=3D"_blank">jansson_2.12.bb</a> =3D&gt; <a href=3D"http://jansson_=
2.13.1.bb" target=3D"_blank">jansson_2.13.1.bb</a>} (60%)
 create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-=
to-python3.patch
 rename meta-oe/recipes-support/librsync/{<a href=3D"http://librsync_2.3.0=
.bb" target=3D"_blank">librsync_2.3.0.bb</a> =3D&gt; <a href=3D"http://libr=
sync_2.3.1.bb" target=3D"_blank">librsync_2.3.1.bb</a>} (88%)
 rename meta-oe/recipes-support/openldap/{<a href=3D"http://openldap_2.4.4=
9.bb" target=3D"_blank">openldap_2.4.49.bb</a> =3D&gt; <a href=3D"http://op=
enldap_2.4.50.bb" target=3D"_blank">openldap_2.4.50.bb</a>} (98%)
 create mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.pat=
ch
 create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.html
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-app=
dirs_1.4.3.bb" target=3D"_blank">python3-appdirs_1.4.3.bb</a> =3D&gt; <a hr=
ef=3D"http://python3-appdirs_1.4.4.bb" target=3D"_blank">python3-appdirs_1.=
4.4.bb</a>} (75%)
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-gmq=
tt_0.6.2.bb" target=3D"_blank">python3-gmqtt_0.6.2.bb</a> =3D&gt; <a href=
=3D"http://python3-gmqtt_0.6.5.bb" target=3D"_blank">python3-gmqtt_0.6.5.b=
b</a>} (74%)
 delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"http://=
python3-jinja2_2.11.1.bb" target=3D"_blank">python3-jinja2_2.11.1.bb</a>
 rename meta-python/recipes-devtools/python/{python-jinja2.inc =3D&gt; <a =
href=3D"http://python3-jinja2_2.11.2.bb" target=3D"_blank">python3-jinja2_2=
.11.2.bb</a>} (44%)
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-ope=
npyxl_2.6.3.bb" target=3D"_blank">python3-openpyxl_2.6.3.bb</a> =3D&gt; <a =
href=3D"http://python3-openpyxl_3.0.3.bb" target=3D"_blank">python3-openpyx=
l_3.0.3.bb</a>} (70%)
 delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pandas_1.0.1.bb" target=3D"_blank">python3-pandas_1.0.1.bb</a>
 rename meta-python/recipes-devtools/python/{python-pandas.inc =3D&gt; <a =
href=3D"http://python3-pandas_1.0.3.bb" target=3D"_blank">python3-pandas_1.=
0.3.bb</a>} (78%)
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-par=
allax_1.0.5.bb" target=3D"_blank">python3-parallax_1.0.5.bb</a> =3D&gt; <a =
href=3D"http://python3-parallax_1.0.6.bb" target=3D"_blank">python3-paralla=
x_1.0.6.bb</a>} (72%)
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-pyc=
parser_2.19.bb" target=3D"_blank">python3-pycparser_2.19.bb</a> =3D&gt; <a =
href=3D"http://python3-pycparser_2.20.bb" target=3D"_blank">python3-pycpars=
er_2.20.bb</a>} (74%)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-vol=
atile.conf
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.0=
4_apache2
 rename meta-xfce/recipes-apps/catfish/{<a href=3D"http://catfish_1.4.11.b=
b" target=3D"_blank">catfish_1.4.11.bb</a> =3D&gt; <a href=3D"http://catfis=
h_1.4.13.bb" target=3D"_blank">catfish_1.4.13.bb</a>} (72%)
 rename meta-xfce/recipes-xfce/thunar/{<a href=3D"http://thunar_1.8.12.bb"=
 target=3D"_blank">thunar_1.8.12.bb</a> =3D&gt; <a href=3D"http://thunar_1.=
8.15.bb" target=3D"_blank">thunar_1.8.15.bb</a>} (84%)
 rename meta-xfce/recipes-xfce/xfconf/{<a href=3D"http://xfconf_4.14.2.bb"=
 target=3D"_blank">xfconf_4.14.2.bb</a> =3D&gt; <a href=3D"http://xfconf_4.=
14.3.bb" target=3D"_blank">xfconf_4.14.3.bb</a>} (83%)

</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <br>
  </div>

<br>
</blockquote></div></div>

--00000000000050526805a7ab2dc7--
