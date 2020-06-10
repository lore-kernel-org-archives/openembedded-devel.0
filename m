Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.1496.1591752105066011441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 18:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lyZybPOe;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n11so562702qkn.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yQWqpM2WQKDeUMwHh6twUzb86kcjHYS+AoPVZ8314tE=;
        b=lyZybPOe1KQT4RRWqnGFns9U9enhSva4aRMY11BvtMAE/snQbUFE8lYSXytYFE5IJU
         NeaygwjWa5YsEZDcFkDoFoYda2ehpOHsNzi98F6J5DN4m/T7f0hRuDaKt/dg29eS0mnz
         ACpAir2bfxAgMh0eMbeaugO/em2zqlI+iwW0IkQMkmErACI4edfiezq/JpsXK+BU2cnk
         i/beL38udaWUbl0qJZ20PIFECar/RxNg4LL8Erfx4vMBfbjWRxbsd5MPdc8kFgicok9c
         lc7ZyIPQE3FFJm4GMh7TkcjWUAq1/t6vyQ4QsHHa1YIiATsigGrJcxrT/iBebiSGEG/8
         vSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yQWqpM2WQKDeUMwHh6twUzb86kcjHYS+AoPVZ8314tE=;
        b=mYPSmjbQ61AYU0DxKOSsJVO0JkSW1Ae4kI2PU22hNccID/KZyrN2SlEzq7mKjaNdqD
         CRh51RCMhm/IKzEg7cV+BeoIoorN+uhpcqVH8tAlQcASQ7jiTVfKuXji3BasuQo/r9KG
         Ke14W5CoJ8gst/trEYilo4VwNXRfI4IyBeuPbMG194rjLZVOwri7WuyhMV957S+yaevm
         n7iEbN3TUgRan3kVFse2KbiaIuuHyKj8q/kBFRe26+YH+V11IxJRGBeOse4zoBl6PsX6
         SkuqXS20dllW6xmhxoDt4Vy1f6SQmeVUq9ICkSWPVnqDhx8OfDYmGUXmWg7iY1z7JKAZ
         cnZg==
X-Gm-Message-State: AOAM533kmsA7Rn5rSBYsjK7zqdz4V+rrqRQnKfW7WPOSCJAsts0rnASS
	+P6A1n1+E1sAmtfw4WohnR+rZY8zr0uDHZoCvBY=
X-Google-Smtp-Source: ABdhPJzlXNr34lMJHYry/u84AocVOcCIWtd+rVNWlyfhD57e62VCFS6XPY2goY/sqFndZ/SVz/zpHOZxR3bJrBYrG7Y=
X-Received: by 2002:a37:6610:: with SMTP id a16mr706944qkc.17.1591752103965;
 Tue, 09 Jun 2020 18:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <16158ACEBF1AD616.29014@lists.openembedded.org>
 <32b06ca1-94ba-0717-b070-d85865aae0fa@gmail.com> <CAMKF1spRgs1gFq90xdHvCQEbWpDeG7yYmo5DzrnmQer3Mje6eA@mail.gmail.com>
 <e85b6a9e-93c6-e25e-abf6-0cda6011746a@gmail.com>
In-Reply-To: <e85b6a9e-93c6-e25e-abf6-0cda6011746a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Jun 2020 18:21:17 -0700
Message-ID: <CAMKF1sqM8--DwMr6wuV-M1LSw+MWMttJUmx=hYHSpcT4r6ZACQ@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/35] Merge Request
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2020 at 2:33 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 6/9/20 11:48 AM, Khem Raj wrote:
>
>
>
> On Tue, Jun 9, 2020 at 8:46 AM akuster <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 6/4/20 9:16 PM, akuster via lists.openembedded.org wrote:
>>
>> Ping.
>>
>> any issue with this merge request?
>
>
> I Am fine with these changes were you looking for wider feedback or is i=
t ready to merge
>
>
> Looking for it to be merged, this series was  from a review from last we=
ek.
>
> Not to be confused with the one sent out early this week.
>

Ah yes, I kind of squashed it in my mind. This one is merged now.

> - armin
>
>
>>
>> -armin
>>
>> Please merge these changes to Dunfell
>>
>> Cover letter only
>>
>> The following changes since commit e413c1ef621688e69bb7830bb3151ed23b30=
b73e:
>>
>>   samba: upgrade 4.10.13 -> 4.10.15 (2020-05-20 16:50:45 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded dunfell-next
>>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
>>
>> Adrian Bunk (2):
>>   unicode-ucd: Stop broken license downloading
>>   postfix: Upgrade 3.4.10 -> 3.4.12
>>
>> Andreas M=C3=BCller (2):
>>   gexiv2: upgrade 0.12.0 -> 0.12.1
>>   thunar: upgrade 1.8.14 -> 1.8.15
>>
>> Andrew Geissler (1):
>>   nlohmann-json: backport gcc10 fix
>>
>> Armin Kuster (1):
>>   tremor: update SRC_URI as project moved to gitlab
>>
>> Christoph Steiger (1):
>>   python-periphery: Add python-mmap to RDEPENDS
>>
>> Domarys Correa (1):
>>   python3-jinja2: Update 2.11.1 -> 2.11.2
>>
>> Kai Kang (3):
>>   xfconf: 4.14.2 -> 4.14.3
>>   thunar: 1.8.12 -> 1.8.14
>>   catfish: 1.4.11 -> 1.4.13
>>
>> Khem Raj (4):
>>   netplan: Depend on systemd if it is in distro
>>   uim: Add patch to fix -fno-common link error
>>   postfix: Upgrade to 3.4.10 and compile with -fcommon
>>   safec: Update to latest on 3.5.1 release tags
>>
>> Leon Anavi (5):
>>   python3-gmqtt: Upgrade to 0.6.5
>>   python3-appdirs: Upgrade to 1.4.4
>>   python3-pandas: Upgrade 1.0.1 -> 1.0.3
>>   python3-parallax: Upgrade 1.0.5 -> 1.0.6
>>   python3-openpyxl: Upgrade 2.6.3 -> 3.0.3
>>
>> Pierre-Jean Texier (3):
>>   librsync: upgrade 2.3.0 -> 2.3.1
>>   ser2net: fix upstream check URL
>>   ser2net: upgrade 4.1.5 -> 4.1.8
>>
>> Trevor Gamblin (1):
>>   python3-iso8601: add python3-numbers to RDEPENDS
>>
>> Wang Mingyu (4):
>>   jansson: upgrade 2.12 -> 2.13.1
>>   openldap: upgrade 2.4.49 -> 2.4.50
>>   python3-pycparser: upgrade 2.19 -> 2.20
>>   cryptsetup: upgrade 2.3.1 -> 2.3.2
>>
>> Yanfei Xu (1):
>>   turbostat: fix the build failure for new v5.7-rc6 kernel
>>
>> Yi Zhao (1):
>>   apache2: create log/run directory via pkg_postinst
>>
>> Zang Ruochen (2):
>>   dnsmasq: upgrade 2.80 -> 2.81
>>   fetchmail: upgrade 6.4.3 -> 6.4.4
>>
>> Zheng Ruoqin (3):
>>   dstat: Fix runtime error that depend python.
>>   kea: upgrade 1.7.6 -> 1.7.7
>>   libqmi: upgrade 1.24.8 -> 1.24.12
>>
>>  .../{gexiv2_0.12.0.bb =3D> gexiv2_0.12.1.bb}    |  4 +-
>>  .../tremor/tremor_20180319.bb                 |  2 +-
>>  .../kea/{kea_1.7.6.bb =3D> kea_1.7.7.bb}        |  4 +-
>>  .../netplan/netplan_0.98.bb                   |  3 +-
>>  ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------
>>  .../{postfix_3.4.8.bb =3D> postfix_3.4.12.bb}   |  5 +-
>>  ...nsmasq-fix-build-against-5.2-headers.patch | 31 ------
>>  ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 ---------
>>  .../recipes-support/dnsmasq/dnsmasq_2.80.bb   | 10 --
>>  .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |  8 ++
>>  ...{fetchmail_6.4.3.bb =3D> fetchmail_6.4.4.bb} |  4 +-
>>  .../{libqmi_1.24.8.bb =3D> libqmi_1.24.12.bb}   |  3 +-
>>  .../{ser2net_4.1.5.bb =3D> ser2net_4.1.8.bb}    |  5 +-
>>  ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 ------
>>  .../safec/{safec_3.5.bb =3D> safec_3.5.1.bb}    |  8 +-
>>  ...ryptsetup_2.3.1.bb =3D> cryptsetup_2.3.2.bb} |  4 +-
>>  ...latize-basic_json-ctor-from-json_ref.patch | 99 +++++++++++++++++++
>>  .../nlohmann-json/0001-typo-fix.patch         | 43 ++++++++
>>  .../nlohmann-json/nlohmann-json_3.7.3.bb      |  5 +-
>>  .../{jansson_2.12.bb =3D> jansson_2.13.1.bb}    |  6 +-
>>  .../recipes-kernel/turbostat/turbostat_3.4.bb | 20 +++-
>>  .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++
>>  meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  4 +-
>>  .../{librsync_2.3.0.bb =3D> librsync_2.3.1.bb}  |  2 +-
>>  ...{openldap_2.4.49.bb =3D> openldap_2.4.50.bb} |  4 +-
>>  .../uim/uim/JMP_BUF_GC_jmp_buf.patch          | 15 +++
>>  meta-oe/recipes-support/uim/uim_1.8.8.bb      |  1 +
>>  .../unicode-ucd/files/license.html            | 98 ++++++++++++++++++
>>  .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
>>  .../python/python-iso8601.inc                 |  1 +
>>  .../python/python-periphery.inc               |  2 +
>>  ...dirs_1.4.3.bb =3D> python3-appdirs_1.4.4.bb} |  4 +-
>>  ...-gmqtt_0.6.2.bb =3D> python3-gmqtt_0.6.5.bb} |  4 +-
>>  .../python/python3-jinja2_2.11.1.bb           |  4 -
>>  ...on-jinja2.inc =3D> python3-jinja2_2.11.2.bb} | 40 +++++---
>>  ...yxl_2.6.3.bb =3D> python3-openpyxl_3.0.3.bb} |  6 +-
>>  .../python/python3-pandas_1.0.1.bb            |  2 -
>>  ...hon-pandas.inc =3D> python3-pandas_1.0.3.bb} |  6 +-
>>  ...lax_1.0.5.bb =3D> python3-parallax_1.0.6.bb} |  4 +-
>>  ...rser_2.19.bb =3D> python3-pycparser_2.20.bb} |  4 +-
>>  .../recipes-httpd/apache2/apache2_2.4.43.bb   | 18 ++++
>>  .../apache2/files/apache2-volatile.conf       |  2 +
>>  .../apache2/files/apache2.service             |  4 -
>>  .../recipes-httpd/apache2/files/init          |  5 -
>>  .../apache2/files/volatiles.04_apache2        |  3 +
>>  .../{catfish_1.4.11.bb =3D> catfish_1.4.13.bb}  |  4 +-
>>  .../{thunar_1.8.12.bb =3D> thunar_1.8.15.bb}    |  4 +-
>>  .../{xfconf_4.14.2.bb =3D> xfconf_4.14.3.bb}    |  4 +-
>>  48 files changed, 475 insertions(+), 246 deletions(-)
>>  rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.0.bb =3D> gexiv2_0=
.12.1.bb} (69%)
>>  rename meta-networking/recipes-connectivity/kea/{kea_1.7.6.bb =3D> kea=
_1.7.7.bb} (94%)
>>  delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-=
Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
>>  rename meta-networking/recipes-daemons/postfix/{postfix_3.4.8.bb =3D> =
postfix_3.4.12.bb} (75%)
>>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/000=
1-dnsmasq-fix-build-against-5.2-headers.patch
>>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/000=
1-dnsmasq-fix-memory-leak-in-helper-c.patch
>>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.8=
0.bb
>>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.8=
1.bb
>>  rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.3.bb =
=3D> fetchmail_6.4.4.bb} (86%)
>>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.8.bb =3D> libq=
mi_1.24.12.bb} (85%)
>>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.5.bb =3D> ser=
2net_4.1.8.bb} (69%)
>>  delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_=
ISOC11_SOURCE-only-with-glibc.patch
>>  rename meta-oe/recipes-core/safec/{safec_3.5.bb =3D> safec_3.5.1.bb} (=
59%)
>>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.1.bb =3D> cry=
ptsetup_2.3.2.bb} (96%)
>>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-jso=
n/0001-Templatize-basic_json-ctor-from-json_ref.patch
>>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-jso=
n/0001-typo-fix.patch
>>  rename meta-oe/recipes-extended/jansson/{jansson_2.12.bb =3D> jansson_=
2.13.1.bb} (60%)
>>  create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dst=
at-to-python3.patch
>>  rename meta-oe/recipes-support/librsync/{librsync_2.3.0.bb =3D> librsy=
nc_2.3.1.bb} (88%)
>>  rename meta-oe/recipes-support/openldap/{openldap_2.4.49.bb =3D> openl=
dap_2.4.50.bb} (98%)
>>  create mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.=
patch
>>  create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.h=
tml
>>  rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb =
=3D> python3-appdirs_1.4.4.bb} (75%)
>>  rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb =3D=
> python3-gmqtt_0.6.5.bb} (74%)
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_=
2.11.1.bb
>>  rename meta-python/recipes-devtools/python/{python-jinja2.inc =3D> pyt=
hon3-jinja2_2.11.2.bb} (44%)
>>  rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb =
=
=3D> python3-openpyxl_3.0.3.bb} (70%)
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_=
1.0.1.bb
>>  rename meta-python/recipes-devtools/python/{python-pandas.inc =3D> pyt=
hon3-pandas_1.0.3.bb} (78%)
>>  rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb =
=
=3D> python3-parallax_1.0.6.bb} (72%)
>>  rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb =
=
=3D> python3-pycparser_2.20.bb} (74%)
>>  create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-=
volatile.conf
>>  create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatile=
s.04_apache2
>>  rename meta-xfce/recipes-apps/catfish/{catfish_1.4.11.bb =3D> catfish_=
1.4.13.bb} (72%)
>>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.12.bb =3D> thunar_1.8=
.15.bb} (84%)
>>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.2.bb =3D> xfconf_4.1=
4.3.bb} (83%)
>>
>>
>>
>>=20
>
>
