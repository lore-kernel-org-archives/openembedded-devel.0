Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.45779.1589818372912526506
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 09:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=geAdrFwC;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id x13so5161292pfn.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=qxZrczWJUFP5K6clk9G2ZGDr/PoUAqzEjpVGbOHABKo=;
        b=geAdrFwCZqUrSQw/tRgDDyxcSUTs5Mn+gtgIQTwTIkAtTyN/sEVP1x3XEWtceYAxkl
         jhVpey5kuRZFOrVcrBkfUf6UzNZyqJJr0+X7PmZurjf/VXH6HBUVGPry8ZZVEALgs4XF
         Bms/kIwTpiSwPMhtg7neQPLsSy90lMeRneFRy9AN+WSFNTScxxQlYWVEy9lUxtndgImE
         XiRZ1kaA2WYWjnal/m33YSEWwHV6Rg2JOKygAv09Q5uUPlXcSTTCsp39tqn0VlFNDlYF
         +7oMwyVoaR2bWWLLQeKuAz7JxLroci+3zt34sKM9zzbVHEU516UvoZLJX1XrA+aEiwka
         yUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=qxZrczWJUFP5K6clk9G2ZGDr/PoUAqzEjpVGbOHABKo=;
        b=FM+avpg6wTmu+YcOc5/o/+BoEvXXBAbTrE1SoNVxS/vBfa5IobQIhDyYHfaKQowHlf
         MMGoTyFZGGp9yJznaTzZlpZXcYyVECLz153Ayr1+Z3usjm8hEwaARJ2rABwLzKdxMBwO
         D3a89aAEjpBpyAtKnqaPdHZtt2QZN1I7hrYkh3oJC2F7QHEpye2qRD74l9a9yh7mCF1O
         0XwlSyIOTbg5oYWTeIcTdm38iD06QMPunSRShnrjaGkbgKgbPho6lVR2HnVstifuTmkm
         dzrt+Vtvt7fpAEDGVfUVEVSF0+hFQP7w7/Q/Fq7fwZIxR7kLlCcZF45EX7axAI6fu8Q8
         tclw==
X-Gm-Message-State: AOAM530IAGaYLfRcgT/uBlGliSqqrBrXQjEH5j0GxEHQsSN4rX5aId8y
	OBMdH0vsJYrmwOScxqeTLZVEp+b6
X-Google-Smtp-Source: ABdhPJzdM7qRMwEvn4nYFyk0/5fETWlYlNCL+GHQ29QJGeNfz4AFe/qAmNi9LM8iE4WqFVHS7Xa8wA==
X-Received: by 2002:a63:e702:: with SMTP id b2mr15521659pgi.158.1589818371922;
        Mon, 18 May 2020 09:12:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:4481:39b9:1b65:c59? ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id x23sm7954018pgf.32.2020.05.18.09.12.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:12:51 -0700 (PDT)
Subject: Re: [oe] [dunfell 00/57] Patch review
To: openembedded-devel@lists.openembedded.org
References: <161026DF21C4386A.31912@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b838142d-d955-add1-5bf5-a0f192d1e606@gmail.com>
Date: Mon, 18 May 2020 09:12:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <161026DF21C4386A.31912@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------106A13C8D434FC184E0D60B2"
Content-Language: en-US

--------------106A13C8D434FC184E0D60B2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Groups.io has a limit on the number of emails in a given time.

this patch set exceeded that limit  so patches 39-57 got dropped. 


"500 We have received more than 40 messages in 30 minutes from you. To
guard against autoresponder mail loops, we must reject additional
messages from you temporarily. Please try again later. "

- armin



On 5/18/20 7:49 AM, akuster via lists.openembedded.org wrote:
> These changes are being considered for backporting.
> Please have comments back by Thursday 
>
> The following changes since commit a62ad77973b16daac1cbaa03cbda3c6b9b91f2ff:
>
>   README: updated Maintainers list for Dunfell (2020-05-05 16:47:34 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut
>
> Adrian Bunk (1):
>   mraa: Replace -fcommon with fix
>
> Alexander Vickberg (1):
>   tcpdump: Fix PACKAGECONFIG for OpenSSL
>
> Andreas Müller (5):
>   xfce4-notifyd: upgrade 0.6.0 -> 0.6.1
>   xfconf: upgrade 4.14.1 -> 4.14.2
>   xfwm4: upgrade 4.14.1 -> 4.14.2
>   qpdf: upgrade 9.1.0 -> 10.0.1
>   qpdf: link libatomic explicitly on mips
>
> Changqing Li (1):
>   apache2: fix service start fail
>
> Claude Bing (3):
>   php: fix PACKAGECONFIG for soap
>   php: fix opcache link error in 7.4
>   php: update fix for opcache link issue in 7.4.4
>
> Emmanuel Roullit (1):
>   appstream-glib: update 0.7.16 -> 0.7.17
>
> Gianfranco Costamagna (1):
>   cpprest: Disable one more test requiring internet connection
>
> Jonathan Liu (1):
>   x11vnc: fix xfc NULL pointer dereference
>
> Khem Raj (1):
>   gtkwave: Disable mime update during install
>
> Konrad Weihmann (1):
>   php: fix zip package config
>
> Mingli Yu (10):
>   python3-ntplib: add missing python3-io RDEPENDS
>   python3-pid: add the missing rdepends
>   python3-parallax: add the missing rdepends
>   python3-pkgconfig: add missing rdepends
>   python3-pathlib2: add the missing rdepends
>   python3-ptyprocess: add the missing rdepends
>   python3-pydbus: add the missing rdepends
>   python3-pyudev: add the missing rdepends
>   python3-zipp: add the missing rdepends
>   gnome-themes-extra: correct the recipe name
>
> Slater, Joseph (2):
>   python-pretty-table: add rdep's
>   python3-pyhamcrest: add rdep
>
> Trevor Gamblin (7):
>   python3-py: add python3-netclient to RDEPENDS
>   python3-markdown: add logging and setuptools to RDEPENDS
>   python3-pyrsistent: add python3-numbers to RDEPENDS
>   python3-pytoml: add datetime and stringold to RDEPENDS
>   python3-dbusmock: re-add recipe and fix patch path
>   python3-pyyaml: add python3-netclient to RDEPENDS
>   python3-werkzeug: add python3-logging to RDEPENDS
>
> Wang Mingyu (4):
>   mailcap: upgrade 2.1.48 -> 2.1.49
>   multipath-tools: upgrade 0.8.3 -> 0.8.4
>   modemmanager: upgrade 1.12.8 -> 1.12.10
>   python3-pyroute2: upgrade 0.5.11 -> 0.5.12
>
> Yi Zhao (3):
>   nginx: remove /var/log/nginx when do_install
>   libldb: upgrade 1.5.6 -> 1.5.7
>   samba: upgrade 4.10.13 -> 4.10.15
>
> Zang Ruochen (8):
>   python3-parse-type: Modify ptest output format
>   python3-pluggy: Modify ptest output format
>   python3-polyline: Modify ptest output format
>   python3-precise-runner: Modify ptest output format
>   python3-prettytable: Modify ptest output format
>   python3-ptyprocess: Modify ptest output format
>   python3-pyasn1: Modify ptest output format
>   python3-pyasn1-modules: Modify ptest output format
>
> Zheng Ruoqin (4):
>   python3-pyserial: Modify ptest output format
>   python3-pyroute2: Modify ptest output format
>   v4l-utils: upgrade 1.18.0 -> 1.18.1
>   cpprest: upgrade 2.10.15 -> 2.10.16
>
> niko.mauno@vaisala.com (3):
>   python3-setuptools-scm: Cosmetic improvement
>   python3-setuptools-scm: Add nativesdk to BBCLASSEXTEND
>   python3-attrs: Add nativesdk to BBCLASSEXTEND
>
>  ...lib_0.7.16.bb => appstream-glib_0.7.17.bb} |  4 +-
>  .../{samba_4.10.13.bb => samba_4.10.15.bb}    |  4 +-
>  .../{libldb_1.5.6.bb => libldb_1.5.7.bb}      |  4 +-
>  .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |  2 +-
>  ...ager_1.12.8.bb => modemmanager_1.12.10.bb} |  2 +-
>  ...001-opcache-config.m4-enable-opcache.patch | 19 ++--
>  meta-oe/recipes-devtools/php/php_7.4.4.bb     | 10 +-
>  ...de-Declare-gVERSION-global-as-extern.patch | 31 +++++++
>  meta-oe/recipes-extended/mraa/mraa_git.bb     |  3 +-
>  ...ard_3.28.bb => gnome-themes-extra_3.28.bb} |  3 -
>  .../gtkwave/gtkwave_3.3.104.bb                |  2 +-
>  ...sor-fix-xfc-NULL-pointer-dereference.patch | 30 ++++++
>  .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
>  ...4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb} |  4 +-
>  .../qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb}    |  6 +-
>  .../cpprest/disable-outside-tests.patch       | 20 ++++
>  ...{cpprest_2.10.15.bb => cpprest_2.10.16.bb} |  4 +-
>  .../{mailcap_2.1.48.bb => mailcap_2.1.49.bb}  |  6 +-
>  ...fix-bug-of-do_compile-and-do_install.patch | 44 +++++++++
>  .../0024-RH-use-rpm-optflags-if-present.patch | 33 ++++---
>  ...om-kernel-cmdline-mpath.wwids-with-A.patch | 93 +++----------------
>  ...ools_0.8.3.bb => multipath-tools_0.8.4.bb} |  3 +-
>  .../python/python-pathlib2.inc                |  2 +-
>  .../python/python-prettytable.inc             |  5 +
>  .../python/python-ptyprocess.inc              |  3 +
>  .../python/python3-attrs_19.3.0.bb            |  6 +-
>  ...y-to-add-own-objects-to-internal-obj.patch |  0
>  ...ty-to-import-templates-from-packages.patch |  0
>  .../python/python3-dbusmock_0.16.7.bb         | 25 +++++
>  .../python/python3-markdown_3.0.1.bb          |  2 +
>  .../python/python3-ntplib_0.3.3.bb            |  2 +-
>  .../python/python3-parallax_1.0.5.bb          |  2 +
>  .../python/python3-parse-type/run-ptest       |  2 +-
>  .../python/python3-pid_2.2.5.bb               |  2 +
>  .../python/python3-pkgconfig_1.4.0.bb         |  1 +
>  .../python/python3-pluggy/run-ptest           |  3 +-
>  .../python/python3-polyline/run-ptest         |  2 +-
>  .../python/python3-precise-runner/run-ptest   |  2 +-
>  .../python/python3-prettytable/run-ptest      |  2 +-
>  .../python/python3-ptyprocess/run-ptest       |  2 +-
>  .../python/python3-py_1.8.1.bb                |  2 +
>  .../python/python3-pyasn1-modules/run-ptest   |  2 +-
>  .../python/python3-pyasn1/run-ptest           |  2 +-
>  .../python/python3-pydbus_0.6.0.bb            |  4 +-
>  .../python/python3-pyhamcrest_1.9.0.bb        |  2 +
>  .../python/python3-pyroute2/run-ptest         |  3 +-
>  ...2_0.5.11.bb => python3-pyroute2_0.5.12.bb} |  4 +-
>  .../python/python3-pyrsistent_0.15.7.bb       |  1 +
>  .../python/python3-pyserial/run-ptest         |  3 +-
>  .../python/python3-pytoml_0.1.21.bb           |  5 +
>  .../python/python3-pyudev_0.21.0.bb           |  1 +
>  .../python/python3-pyyaml_5.3.bb              |  1 +
>  .../python/python3-setuptools-scm_3.3.3.bb    | 13 ++-
>  .../python/python3-werkzeug_1.0.1.bb          |  1 +
>  .../python/python3-zipp_0.6.0.bb              |  4 +-
>  .../recipes-httpd/apache2/apache2_2.4.43.bb   |  8 --
>  .../apache2/files/apache2-volatile.conf       |  2 -
>  .../apache2/files/apache2.service             |  4 +
>  .../recipes-httpd/apache2/files/init          |  5 +
>  .../apache2/files/volatiles.04_apache2        |  3 -
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |  4 +-
>  ...otifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb} |  4 +-
>  .../{xfconf_4.14.1.bb => xfconf_4.14.2.bb}    |  4 +-
>  .../{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb}      |  4 +-
>  64 files changed, 310 insertions(+), 167 deletions(-)
>  rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.16.bb => appstream-glib_0.7.17.bb} (84%)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.13.bb => samba_4.10.15.bb} (99%)
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb} (95%)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb} (95%)
>  create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
>  rename meta-oe/recipes-gnome/gnome-themes/{gnome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} (94%)
>  create mode 100644 meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
>  rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb} (93%)
>  rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb} (82%)
>  rename meta-oe/recipes-support/cpprest/{cpprest_2.10.15.bb => cpprest_2.10.16.bb} (91%)
>  rename meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb} (81%)
>  create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
>  rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.3.bb => multipath-tools_0.8.4.bb} (97%)
>  rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch (100%)
>  rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0002-Add-possibility-to-import-templates-from-packages.patch (100%)
>  create mode 100644 meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.11.bb => python3-pyroute2_0.5.12.bb} (85%)
>  delete mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
>  delete mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
>  rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb} (84%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.1.bb => xfconf_4.14.2.bb} (83%)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb} (90%)
>
>
> 


--------------106A13C8D434FC184E0D60B2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Groups.io has a limit on the number of emails in a given time.

this patch set exceeded that limit  so patches 39-57 got dropped. 


"500 We have received more than 40 messages in 30 minutes from you. To
guard against autoresponder mail loops, we must reject additional
messages from you temporarily. Please try again later. "

- armin
</pre>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/18/20 7:49 AM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:161026DF21C4386A.31912@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">These changes are being considered for backporting.
Please have comments back by Thursday 

The following changes since commit a62ad77973b16daac1cbaa03cbda3c6b9b91f2ff:

  README: updated Maintainers list for Dunfell (2020-05-05 16:47:34 -0700)

are available in the Git repository at:

  <a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded-contrib">https://git.openembedded.org/meta-openembedded-contrib</a> stable/dunfell-nut
  <a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut">http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut</a>

Adrian Bunk (1):
  mraa: Replace -fcommon with fix

Alexander Vickberg (1):
  tcpdump: Fix PACKAGECONFIG for OpenSSL

Andreas Müller (5):
  xfce4-notifyd: upgrade 0.6.0 -&gt; 0.6.1
  xfconf: upgrade 4.14.1 -&gt; 4.14.2
  xfwm4: upgrade 4.14.1 -&gt; 4.14.2
  qpdf: upgrade 9.1.0 -&gt; 10.0.1
  qpdf: link libatomic explicitly on mips

Changqing Li (1):
  apache2: fix service start fail

Claude Bing (3):
  php: fix PACKAGECONFIG for soap
  php: fix opcache link error in 7.4
  php: update fix for opcache link issue in 7.4.4

Emmanuel Roullit (1):
  appstream-glib: update 0.7.16 -&gt; 0.7.17

Gianfranco Costamagna (1):
  cpprest: Disable one more test requiring internet connection

Jonathan Liu (1):
  x11vnc: fix xfc NULL pointer dereference

Khem Raj (1):
  gtkwave: Disable mime update during install

Konrad Weihmann (1):
  php: fix zip package config

Mingli Yu (10):
  python3-ntplib: add missing python3-io RDEPENDS
  python3-pid: add the missing rdepends
  python3-parallax: add the missing rdepends
  python3-pkgconfig: add missing rdepends
  python3-pathlib2: add the missing rdepends
  python3-ptyprocess: add the missing rdepends
  python3-pydbus: add the missing rdepends
  python3-pyudev: add the missing rdepends
  python3-zipp: add the missing rdepends
  gnome-themes-extra: correct the recipe name

Slater, Joseph (2):
  python-pretty-table: add rdep's
  python3-pyhamcrest: add rdep

Trevor Gamblin (7):
  python3-py: add python3-netclient to RDEPENDS
  python3-markdown: add logging and setuptools to RDEPENDS
  python3-pyrsistent: add python3-numbers to RDEPENDS
  python3-pytoml: add datetime and stringold to RDEPENDS
  python3-dbusmock: re-add recipe and fix patch path
  python3-pyyaml: add python3-netclient to RDEPENDS
  python3-werkzeug: add python3-logging to RDEPENDS

Wang Mingyu (4):
  mailcap: upgrade 2.1.48 -&gt; 2.1.49
  multipath-tools: upgrade 0.8.3 -&gt; 0.8.4
  modemmanager: upgrade 1.12.8 -&gt; 1.12.10
  python3-pyroute2: upgrade 0.5.11 -&gt; 0.5.12

Yi Zhao (3):
  nginx: remove /var/log/nginx when do_install
  libldb: upgrade 1.5.6 -&gt; 1.5.7
  samba: upgrade 4.10.13 -&gt; 4.10.15

Zang Ruochen (8):
  python3-parse-type: Modify ptest output format
  python3-pluggy: Modify ptest output format
  python3-polyline: Modify ptest output format
  python3-precise-runner: Modify ptest output format
  python3-prettytable: Modify ptest output format
  python3-ptyprocess: Modify ptest output format
  python3-pyasn1: Modify ptest output format
  python3-pyasn1-modules: Modify ptest output format

Zheng Ruoqin (4):
  python3-pyserial: Modify ptest output format
  python3-pyroute2: Modify ptest output format
  v4l-utils: upgrade 1.18.0 -&gt; 1.18.1
  cpprest: upgrade 2.10.15 -&gt; 2.10.16

<a class="moz-txt-link-abbreviated" href="mailto:niko.mauno@vaisala.com">niko.mauno@vaisala.com</a> (3):
  python3-setuptools-scm: Cosmetic improvement
  python3-setuptools-scm: Add nativesdk to BBCLASSEXTEND
  python3-attrs: Add nativesdk to BBCLASSEXTEND

 ...lib_0.7.16.bb =&gt; appstream-glib_0.7.17.bb} |  4 +-
 .../{samba_4.10.13.bb =&gt; samba_4.10.15.bb}    |  4 +-
 .../{libldb_1.5.6.bb =&gt; libldb_1.5.7.bb}      |  4 +-
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |  2 +-
 ...ager_1.12.8.bb =&gt; modemmanager_1.12.10.bb} |  2 +-
 ...001-opcache-config.m4-enable-opcache.patch | 19 ++--
 meta-oe/recipes-devtools/php/php_7.4.4.bb     | 10 +-
 ...de-Declare-gVERSION-global-as-extern.patch | 31 +++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  3 +-
 ...ard_3.28.bb =&gt; gnome-themes-extra_3.28.bb} |  3 -
 .../gtkwave/gtkwave_3.3.104.bb                |  2 +-
 ...sor-fix-xfc-NULL-pointer-dereference.patch | 30 ++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 ...4l-utils_1.18.0.bb =&gt; v4l-utils_1.18.1.bb} |  4 +-
 .../qpdf/{qpdf_9.1.0.bb =&gt; qpdf_10.0.1.bb}    |  6 +-
 .../cpprest/disable-outside-tests.patch       | 20 ++++
 ...{cpprest_2.10.15.bb =&gt; cpprest_2.10.16.bb} |  4 +-
 .../{mailcap_2.1.48.bb =&gt; mailcap_2.1.49.bb}  |  6 +-
 ...fix-bug-of-do_compile-and-do_install.patch | 44 +++++++++
 .../0024-RH-use-rpm-optflags-if-present.patch | 33 ++++---
 ...om-kernel-cmdline-mpath.wwids-with-A.patch | 93 +++----------------
 ...ools_0.8.3.bb =&gt; multipath-tools_0.8.4.bb} |  3 +-
 .../python/python-pathlib2.inc                |  2 +-
 .../python/python-prettytable.inc             |  5 +
 .../python/python-ptyprocess.inc              |  3 +
 .../python/python3-attrs_19.3.0.bb            |  6 +-
 ...y-to-add-own-objects-to-internal-obj.patch |  0
 ...ty-to-import-templates-from-packages.patch |  0
 .../python/python3-dbusmock_0.16.7.bb         | 25 +++++
 .../python/python3-markdown_3.0.1.bb          |  2 +
 .../python/python3-ntplib_0.3.3.bb            |  2 +-
 .../python/python3-parallax_1.0.5.bb          |  2 +
 .../python/python3-parse-type/run-ptest       |  2 +-
 .../python/python3-pid_2.2.5.bb               |  2 +
 .../python/python3-pkgconfig_1.4.0.bb         |  1 +
 .../python/python3-pluggy/run-ptest           |  3 +-
 .../python/python3-polyline/run-ptest         |  2 +-
 .../python/python3-precise-runner/run-ptest   |  2 +-
 .../python/python3-prettytable/run-ptest      |  2 +-
 .../python/python3-ptyprocess/run-ptest       |  2 +-
 .../python/python3-py_1.8.1.bb                |  2 +
 .../python/python3-pyasn1-modules/run-ptest   |  2 +-
 .../python/python3-pyasn1/run-ptest           |  2 +-
 .../python/python3-pydbus_0.6.0.bb            |  4 +-
 .../python/python3-pyhamcrest_1.9.0.bb        |  2 +
 .../python/python3-pyroute2/run-ptest         |  3 +-
 ...2_0.5.11.bb =&gt; python3-pyroute2_0.5.12.bb} |  4 +-
 .../python/python3-pyrsistent_0.15.7.bb       |  1 +
 .../python/python3-pyserial/run-ptest         |  3 +-
 .../python/python3-pytoml_0.1.21.bb           |  5 +
 .../python/python3-pyudev_0.21.0.bb           |  1 +
 .../python/python3-pyyaml_5.3.bb              |  1 +
 .../python/python3-setuptools-scm_3.3.3.bb    | 13 ++-
 .../python/python3-werkzeug_1.0.1.bb          |  1 +
 .../python/python3-zipp_0.6.0.bb              |  4 +-
 .../recipes-httpd/apache2/apache2_2.4.43.bb   |  8 --
 .../apache2/files/apache2-volatile.conf       |  2 -
 .../apache2/files/apache2.service             |  4 +
 .../recipes-httpd/apache2/files/init          |  5 +
 .../apache2/files/volatiles.04_apache2        |  3 -
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  4 +-
 ...otifyd_0.6.0.bb =&gt; xfce4-notifyd_0.6.1.bb} |  4 +-
 .../{xfconf_4.14.1.bb =&gt; xfconf_4.14.2.bb}    |  4 +-
 .../{xfwm4_4.14.1.bb =&gt; xfwm4_4.14.2.bb}      |  4 +-
 64 files changed, 310 insertions(+), 167 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.16.bb =&gt; appstream-glib_0.7.17.bb} (84%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.13.bb =&gt; samba_4.10.15.bb} (99%)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.6.bb =&gt; libldb_1.5.7.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.8.bb =&gt; modemmanager_1.12.10.bb} (95%)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
 rename meta-oe/recipes-gnome/gnome-themes/{gnome-themes-standard_3.28.bb =&gt; gnome-themes-extra_3.28.bb} (94%)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.0.bb =&gt; v4l-utils_1.18.1.bb} (93%)
 rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb =&gt; qpdf_10.0.1.bb} (82%)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.15.bb =&gt; cpprest_2.10.16.bb} (91%)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb =&gt; mailcap_2.1.49.bb} (81%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.3.bb =&gt; multipath-tools_0.8.4.bb} (97%)
 rename meta-python/recipes-devtools/python/{python-dbusmock =&gt; python3-dbusmock}/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch (100%)
 rename meta-python/recipes-devtools/python/{python-dbusmock =&gt; python3-dbusmock}/0002-Add-possibility-to-import-templates-from-packages.patch (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.11.bb =&gt; python3-pyroute2_0.5.12.bb} (85%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.0.bb =&gt; xfce4-notifyd_0.6.1.bb} (84%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.1.bb =&gt; xfconf_4.14.2.bb} (83%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.1.bb =&gt; xfwm4_4.14.2.bb} (90%)

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------106A13C8D434FC184E0D60B2--
