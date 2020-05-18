Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.43839.1589813407977389747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dvqn8WZq;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id r22so4931517pga.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zX4e2nluyO1L8w7Mqv9QkpAe47eiBeX3nJQ1YTPp4zs=;
        b=Dvqn8WZqNYoQFabGKigbsf8iely25EvIjjHekf5CFdg3XxuWWM5GYeMGhkpIlzRnHS
         ePF9UCHDixBwXTexeCqVxyd166P5/C7FPtyTrcZjxYae+m+qogUCtXC+rE24B6mHLD/s
         J2U4kSgMGlz4FEPTB32Y6Mxj05sIgX9jBzOEyvd0vW4J7kWeCtrHHz8ZDGVGQLpysfjN
         I1khXHGWAJFva2WDoJMeL5I7yCcL7yRkxTPO7cKzSNGL1DHGwSsAfu26EYZvHJpwSpCw
         ESgpp0fBEcEzM+ZlmEFl5lJZTJFYeELFaPba72IxDFVWT63QNO3lu3/Vt5bKatKwBK1h
         BAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zX4e2nluyO1L8w7Mqv9QkpAe47eiBeX3nJQ1YTPp4zs=;
        b=rHLGk5bR8Knb6tTQ3lZaQcwfbiv3TZl1Xd7yPmc23t0m0H7f8YiqQ8mmh0/89xljtr
         Pl/BDssdUjwERKw13rEjgCqZ1Ykh6oPrnQRJH2HMqeCZxJUUajd4PSG6ueMccFRIthdS
         QLSGrMYr5pco+eqOdBs3jhSlUbylCLiRHmqpnfOlAY10vh+NIrgWutvmdpY0gH5CuRCu
         7c+A1+sBp3EWnlaVbiWLAUdGO5qcpGCPzit439W+nxMV0GUo2eAlrUSJ6iyKMWLbQbtS
         dTmP9chBLhXzZXonbY1dXBNs25y0XHWdYCCJzV/7FlFavGlCM5t4O2q6xkA9ye0DmAsT
         VY2g==
X-Gm-Message-State: AOAM531LE9VyzIXIBHAq99tMfGCL8FJ0iXT10ZBdyhikE0mdoAbka8so
	0LnL0I+V/U4OS8z447MkndQ1llwb
X-Google-Smtp-Source: ABdhPJwcExe7nKRKwU5dMl4ogPfFP7su35GLSTdXJRVUCOCtXkQJJ+AUqVXkfbQU0KK68itjdilKmA==
X-Received: by 2002:a63:d152:: with SMTP id c18mr15078588pgj.259.1589813406863;
        Mon, 18 May 2020 07:50:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:05 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/57] Patch review
Date: Mon, 18 May 2020 07:49:05 -0700
Message-Id: <cover.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These changes are being considered for backporting.
Please have comments back by Thursday 

The following changes since commit a62ad77973b16daac1cbaa03cbda3c6b9b91f2ff:

  README: updated Maintainers list for Dunfell (2020-05-05 16:47:34 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (1):
  mraa: Replace -fcommon with fix

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
 ...de-Declare-gVERSION-global-as-extern.patch | 31 +++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  3 +-
 ...ard_3.28.bb => gnome-themes-extra_3.28.bb} |  3 -
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
 64 files changed, 310 insertions(+), 167 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.16.bb => appstream-glib_0.7.17.bb} (84%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.13.bb => samba_4.10.15.bb} (99%)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb} (95%)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
 rename meta-oe/recipes-gnome/gnome-themes/{gnome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} (94%)
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

