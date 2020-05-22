Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.13777.1590156703221655398
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 07:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jg5DR5UK;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id b190so5251205pfg.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCNgDi3EDctg991SfRyRxTxXKE3DgX0PSMjYMZ698ek=;
        b=Jg5DR5UKmf0WDuXmxoVuYfW4CJTJu1CFNVfmmmdwO0RFpKDeeP2Y92k8y+rs47mG7e
         MgVSz8RzbleboAn3wfDcTm03v5kB76hOxSBaNFjpQg8cC7h1Fjl9lxLb2sH25tjj2jlS
         1wSOiRwFu4bvD4Ayvp0aPq8xAU2D0eYIN7TbuhXWLwL1NDNrytzWlu4O3cIwQPjaAN/O
         sg9EVB8nr3Wt/wOEWW/7AQXMpjX84FJty/OB1NdAcMx3dx/Tra3TJ45csgFrjKEh///+
         WtV744K7b/oljWTOT8xFb01V0z1W+5Lx5NiC+eoOKnTnr2ayIyHQsAG56KKgTnJv8Yk5
         e3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCNgDi3EDctg991SfRyRxTxXKE3DgX0PSMjYMZ698ek=;
        b=nPbhIJ3l793zES6DcIjw2xH6DvgN+ryXI8Jhygph8EQSeG3rZ71H/DdL2yD2BFimOK
         884i7X7JKrSVtrA9JpzFjt2zA8Rmm0YTgaMqyOZJE0fr7pqAt5XGhP42Zd5VrNh069gU
         bT6E/v4FSrmZQUWGXaHBYYf9tIx/Kb0TxZ8otphUmtcR4B62RF+qj1fRo7XMlJ78Z/qD
         IeQ3yx6ssUL0yKsqGwp9xcpuKY1HWuZm2wC9vjFixS9VnjJ2MdlnU7BCtSTq9CY/UzY/
         2k2vUApo4yUs7HFdCQ6/5m5T9VOA3YNqD2PaeQuqlZZ0GQYfcxGwBUo//YDko4IKdJPY
         8ztQ==
X-Gm-Message-State: AOAM5329XDX4LOojSpccnuSOZzAOpDjpVYeE9RZlApjlQTC5m9k6CR4O
	9BXaKjSdDewidSrx4hYmhmM3SF8D
X-Google-Smtp-Source: ABdhPJykJdknpSWX5THtyl5KE1laq7D8KS+JvMWaJoVJG5b8g6PnG8t3RgTdXj7XO1ON6NnJT2xNbQ==
X-Received: by 2002:a65:6107:: with SMTP id z7mr439029pgu.341.1590156702213;
        Fri, 22 May 2020 07:11:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id p4sm6844764pff.159.2020.05.22.07.11.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:11:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/55] pull request
Date: Fri, 22 May 2020 07:10:39 -0700
Message-Id: <cover.1590156579.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes into dunfell
Cover letter only

The following changes since commit a62ad77973b16daac1cbaa03cbda3c6b9b91f2ff:

  README: updated Maintainers list for Dunfell (2020-05-05 16:47:34 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next

Alexander Vickberg (1):
  tcpdump: Fix PACKAGECONFIG for OpenSSL

Andreas Müller (5):
  xfce4-notifyd: upgrade 0.6.0 -> 0.6.1
  xfconf: upgrade 4.14.1 -> 4.14.2
  xfwm4: upgrade 4.14.1 -> 4.14.2
  qpdf: upgrade 9.1.0 -> 10.0.1
  qpdf: link libatomic explicitly on mips

Changqing Li (1):
  apache2: fix service start fail

Claude Bing (3):
  php: fix PACKAGECONFIG for soap
  php: fix opcache link error in 7.4
  php: update fix for opcache link issue in 7.4.4

Emmanuel Roullit (1):
  appstream-glib: update 0.7.16 -> 0.7.17

Gianfranco Costamagna (1):
  cpprest: Disable one more test requiring internet connection

Jonathan Liu (1):
  x11vnc: fix xfc NULL pointer dereference

Khem Raj (1):
  gtkwave: Disable mime update during install

Konrad Weihmann (1):
  php: fix zip package config

Mingli Yu (9):
  python3-ntplib: add missing python3-io RDEPENDS
  python3-pid: add the missing rdepends
  python3-parallax: add the missing rdepends
  python3-pkgconfig: add missing rdepends
  python3-pathlib2: add the missing rdepends
  python3-ptyprocess: add the missing rdepends
  python3-pydbus: add the missing rdepends
  python3-pyudev: add the missing rdepends
  python3-zipp: add the missing rdepends

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
  mailcap: upgrade 2.1.48 -> 2.1.49
  multipath-tools: upgrade 0.8.3 -> 0.8.4
  modemmanager: upgrade 1.12.8 -> 1.12.10
  python3-pyroute2: upgrade 0.5.11 -> 0.5.12

Yi Zhao (3):
  nginx: remove /var/log/nginx when do_install
  libldb: upgrade 1.5.6 -> 1.5.7
  samba: upgrade 4.10.13 -> 4.10.15

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
  v4l-utils: upgrade 1.18.0 -> 1.18.1
  cpprest: upgrade 2.10.15 -> 2.10.16

niko.mauno@vaisala.com (3):
  python3-setuptools-scm: Cosmetic improvement
  python3-setuptools-scm: Add nativesdk to BBCLASSEXTEND
  python3-attrs: Add nativesdk to BBCLASSEXTEND

 ...lib_0.7.16.bb => appstream-glib_0.7.17.bb} |  4 +-
 .../{samba_4.10.13.bb => samba_4.10.15.bb}    |  4 +-
 .../{libldb_1.5.6.bb => libldb_1.5.7.bb}      |  4 +-
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |  2 +-
 ...ager_1.12.8.bb => modemmanager_1.12.10.bb} |  2 +-
 ...001-opcache-config.m4-enable-opcache.patch | 19 ++--
 meta-oe/recipes-devtools/php/php_7.4.4.bb     | 10 +-
 .../gtkwave/gtkwave_3.3.104.bb                |  2 +-
 ...sor-fix-xfc-NULL-pointer-dereference.patch | 30 ++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 ...4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb} |  4 +-
 .../qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb}    |  6 +-
 .../cpprest/disable-outside-tests.patch       | 20 ++++
 ...{cpprest_2.10.15.bb => cpprest_2.10.16.bb} |  4 +-
 .../{mailcap_2.1.48.bb => mailcap_2.1.49.bb}  |  6 +-
 ...fix-bug-of-do_compile-and-do_install.patch | 44 +++++++++
 .../0024-RH-use-rpm-optflags-if-present.patch | 33 ++++---
 ...om-kernel-cmdline-mpath.wwids-with-A.patch | 93 +++----------------
 ...ools_0.8.3.bb => multipath-tools_0.8.4.bb} |  3 +-
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
 ...2_0.5.11.bb => python3-pyroute2_0.5.12.bb} |  4 +-
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
 ...otifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb} |  4 +-
 .../{xfconf_4.14.1.bb => xfconf_4.14.2.bb}    |  4 +-
 .../{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb}      |  4 +-
 61 files changed, 278 insertions(+), 162 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.16.bb => appstream-glib_0.7.17.bb} (84%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.13.bb => samba_4.10.15.bb} (99%)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb} (95%)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb} (93%)
 rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb} (82%)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.15.bb => cpprest_2.10.16.bb} (91%)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb} (81%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.3.bb => multipath-tools_0.8.4.bb} (97%)
 rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch (100%)
 rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0002-Add-possibility-to-import-templates-from-packages.patch (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.11.bb => python3-pyroute2_0.5.12.bb} (85%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb} (84%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.1.bb => xfconf_4.14.2.bb} (83%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb} (90%)

-- 
2.17.1

