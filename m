Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.194.1627491531325397988
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jul 2021 09:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ln4/PCa3;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id g6so1872172qvj.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jul 2021 09:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2l8OkhF3r08vG1Hobn9ZyLUFfCIUerkq6oLjJU59wI=;
        b=Ln4/PCa3ODh2HQ9CV/qC+XCT+9GjyHBL3ltf/4T0TW7SfUpLrPJ+Z5EXl3u/4f2Zb4
         Iv37ZqMuz7I05AR8EiA0PZj27QxNor0VUn3fpRFf81kxUh4mpn86g+hPoLwjCKvHBO7N
         P5jxRQ2HoH5H877hCvXacnd10EoNiOid7I5q8boA98PngXonyDdoJt+AngqvlRSIr84i
         uoGSaj2ZLc7v7MNrE4no/HtFQfqLOuLfpvXlV7R7t/WosRqTH6qaw/+CPguLYuCw2Jqr
         OVh9ZU4Urohw6zwx9/E6gdassGI80mMYK7Tmgo0bl+v02PbV6NNndVDbYPt2KFmQmUgk
         AYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2l8OkhF3r08vG1Hobn9ZyLUFfCIUerkq6oLjJU59wI=;
        b=VQKLE175InIC+Vh2jRjaOwRykDVsdOQiJfcV7uKipoF5Q6x70ccHlpb1VK82zNazhr
         YYbd8Q90/7gz0MMgIe0PhqZnJ4pCv8L33kj5bUtNI77u+OZQmOzJpAfmEvMqO+Ic8/9B
         M+P35QVmRLcIuF36HK36xHz0wv/oqsrbTgDumt5l8Y3sWgvPs4XlYABdG/RGFU/4BAih
         kxqA8Vsc9IcIbIC0yAI59F//I9SrHn+iceQ51o57KZjqblLCzw/vsSq94HTUwQeOTjXW
         uIb63/qe1uRRDzKSX62hQhrTsFw4qvpcBsvhOKmh134qgb5zy9L0BiRnkOhgW3UNCQvU
         enKA==
X-Gm-Message-State: AOAM531CLtpjV6mpgcMhooc/RwVytyCCU6LAVXbzbhQAgqlrzWA0BN28
	2gt5WExvUq4N9wKZNJxV17NAhsmx4cjnL1O/uuU=
X-Google-Smtp-Source: ABdhPJx92kLVtAIKdmrGCF6wAtsDOa5YZOfKiWbOrXzP7cE/H0KjQtlCFnWiCImVjhY2ovx9UPv7+csSn3sGeHAFERE=
X-Received: by 2002:a05:6214:1bcf:: with SMTP id m15mr919382qvc.55.1627491530406;
 Wed, 28 Jul 2021 09:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <57336956-c478-d82a-7595-7f62190db4b7@gmail.com>
In-Reply-To: <57336956-c478-d82a-7595-7f62190db4b7@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Jul 2021 09:58:24 -0700
Message-ID: <CAMKF1sq8Z1Bw9_7-cu1HO84P9mxz0Wyg0aBMRF_KitqNp=77Fw@mail.gmail.com>
Subject: Re: dunfell merge request July 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 27, 2021 at 9:23 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 7bd47ef6c98323c95a9e527129dca98c9a65ee08:
>
>   dovecot: add CVE-2016-4983 to allowlist (2021-07-06 07:50:13 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 85f8047c71047d93cf79a954142157f85079968d:
>
>   php: Upgrade to 7.4.16 (2021-07-26 16:05:08 -0700)
>
> ----------------------------------------------------------------
> Adrian Zaharia (1):
>       ntp: fix ntpdate to wait for subprocesses
>
> Armin Kuster (3):
>       mariadb: update to 10.4.20
>       hiawatha: fix url.
>       wireshark: update to 3.2.15
>
> Armin kuster (1):
>       postgresql: update to 12.7
>
> Bruce Ashfield (1):
>       vboxguestdrivers: fix build against kernel v5.10+
>
> Changqing Li (2):
>       nginx: fix CVE-2021-23017
>       php: allow php as empty
>
> Diego Santa Cruz (1):
>       php: split out phpdbg into a separate package
>
> Gianfranco (5):
>       vboxguestdrivers: upgrade 6.1.16 -> 6.1.18
>       vboxguestdrivers: Add patch proposed upstream to fix a build
> failure on i386
>       vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
>       vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
>       vboxguestdrivers: add a fix for build failure with kernel 5.13
>
> Gianfranco Costamagna (3):
>       vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
>       vboxguestdrivers: upgrade 6.1.12 -> 6.1.14 Drop kernel 5.8
> compatibility patch, now part of upstream codebase
>       vboxguestdrivers: upgrade 6.1.14 -> 6.1.16
>
> Hongxu Jia (1):
>       vboxguestdrivers: fix failed to compile with kernel 5.8.0
>
> Jate Sujjavanich (1):
>       ufw: backport patches, update RRECOMMENDS, python3 support, tests
>
> Khem Raj (5):
>       tracker-miners: Check for commercial license to enable ffmpeg
>       sysprof: Enable sysprofd/libsysprof only when polkit in
> DISTRO_FEATURES
>       vboxguestdrivers: Fix build with kernel 5.8
>       vboxguestdrivers: Add __divmoddi4 builtin support
>       libdevmapper,lvm2: Do not inherit license
>
> Li Wang (1):
>       apache2: fix CVE-2020-13950 CVE-2020-35452 CVE-2021-26690
> CVE-2021-26691 CVE-2021-30641
>
> Masaki Ambai (1):
>       nss: add CVE-2006-5201 to allowlist
>
> Mingli Yu (1):
>       php: Upgrade to 7.4.16
>
> Nicolas Dechesne (4):
>       python3-markupsafe: remove recipe
>       python3-jinja2: remove recipe
>       python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe
>       ostree: Do not check for meta-python
>

merged thanks

>  meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb        |     2 +-
>  meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb             |     4 +-
>  .../ufw/ufw/0006-check-requirements-get-error.patch             |    36 +
>  .../ufw/ufw/0007-use-conntrack-instead-of-state-module.patch    | 14903
> ++++++++++++++++++++++++++
>  .../ufw/ufw/0008-support-.-setup.py-build-LP-819600.patch       |    93 +
>  .../ufw/ufw/0009-adjust-runtime-tests-to-use-daytime-port.patch |  2895
> +++++
>  .../0010-empty-out-IPT_MODULES-and-update-documentation.patch   |   106 +
>  ...ts-check-requirements--simplify-and-support-python-3.8.patch |    33 +
>  .../Add-code-to-detect-openembedded-python-interpreter.patch    |    33 +
>  .../ufw/ufw/setup-only-make-one-reference-to-env.patch          |    14 +-
>  meta-networking/recipes-connectivity/ufw/ufw_0.33.bb            |    49 +-
>  meta-networking/recipes-support/ntp/ntp/ntpdate                 |     5 +
>  .../wireshark/{wireshark_3.2.10.bb => wireshark_3.2.15.bb}      |     2 +-
>  .../{mariadb-native_10.4.17.bb => mariadb-native_10.4.20.bb}    |     0
>  meta-oe/recipes-dbs/mysql/mariadb.inc                           |     4 +-
>  .../mysql/{mariadb_10.4.17.bb => mariadb_10.4.20.bb}            |     0
>  .../postgresql/{postgresql_12.5.bb => postgresql_12.7.bb}       |     4 +-
>  meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch            |   158 -
>  meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch            |    24 -
>  meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb}    |    12 +-
>  .../recipes-devtools/python/python-cython.inc                   |     0
>  .../recipes-devtools/python/python3-cython_0.29.14.bb           |     0
>  .../recipes-devtools/python/python3-pyparsing_2.4.6.bb          |     0
>  .../recipes-devtools/python/python3-pyyaml_5.3.1.bb             |     0
>  meta-oe/recipes-extended/ostree/ostree_2020.3.bb                |     2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc                           |     5 +-
>  meta-oe/recipes-support/nss/nss_3.51.1.bb                       |     3 +
>  .../vboxguestdrivers/40-linux-5.13-support.patch                |   276 +
>  .../vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch      |    36 +
>  .../{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.22.bb}   |     9 +-
>  meta-python/recipes-devtools/python/python3-jinja2/run-ptest    |     3 -
>  meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb    |    43 -
>  .../recipes-devtools/python/python3-markupsafe/run-ptest        |     3 -
>  meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb |     2 -
>  .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          |    45 +
>  .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          |    49 +
>  .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          |    39 +
>  .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          |    35 +
>  .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          |    66 +
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb          |     5 +
>  meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb         |     2 +-
>  meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch   |    46 +
>  meta-webserver/recipes-httpd/nginx/nginx.inc                    |     1 +
>  43 files changed, 18786 insertions(+), 261 deletions(-)
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0006-check-requirements-get-error.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0007-use-conntrack-instead-of-state-module.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0008-support-.-setup.py-build-LP-819600.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0009-adjust-runtime-tests-to-use-daytime-port.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0010-empty-out-IPT_MODULES-and-update-documentation.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/0011-tests-check-requirements--simplify-and-support-python-3.8.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.10.bb
> => wireshark_3.2.15.bb} (96%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.17.bb =>
> mariadb-native_10.4.20.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.17.bb =>
> mariadb_10.4.20.bb} (100%)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.5.bb =>
> postgresql_12.7.bb} (51%)
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>  rename meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb} (96%)
>  rename {meta-python =>
> meta-oe}/recipes-devtools/python/python-cython.inc (100%)
>  rename {meta-python =>
> meta-oe}/recipes-devtools/python/python3-cython_0.29.14.bb (100%)
>  rename {meta-python =>
> meta-oe}/recipes-devtools/python/python3-pyparsing_2.4.6.bb (100%)
>  rename {meta-python =>
> meta-oe}/recipes-devtools/python/python3-pyyaml_5.3.1.bb (100%)
>  create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
>  create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
>  rename
> meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb =>
> vboxguestdrivers_6.1.22.bb} (90%)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-jinja2/run-ptest
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch
>
