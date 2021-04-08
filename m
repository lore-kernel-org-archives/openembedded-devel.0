Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1436.1617909360916217684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 12:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m3pRfthf;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id u17so4904069ejk.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SgMnD2oFeadeMKL3FQeCtjphNxBAerxBwzvS95e1fxY=;
        b=m3pRfthfChqO2c+qknk9rlEmC+bEVkgNDFM3qivI6O/Rwyx5sbKEQrTwcsNjo6Xjot
         NBvVqYaOAti0u4ujdfDEMV5UMYfIXDPQzdQ0fwarbP+iPocWxWkCA5EuiMt0JEw9P7OZ
         Kg0O5xH/emJWDVVUi9Enjq8cTiOBp6kR4Fhf6BusIZ8FfBqsHYBsb3xPCH5Z0AeK//1T
         jhnhzB0xZT7I2bo3udV0XWfGz7vMOCvsxzrGRDsOgSMK3LEVQiijKvq6ERWnGIO6ut3C
         tHrsoxGsHtDc4gAAFksN56pZ1e+zcIOCfNQC9cEaesI/RgxFnyzJwElgAvsZKUB1hwFz
         m9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SgMnD2oFeadeMKL3FQeCtjphNxBAerxBwzvS95e1fxY=;
        b=h8i3GM88BQ7erYTG1eBkVAeSjWybT15Tp/N1SoN4iP/88ZxVSW5xUXw4wdYbgypGnJ
         /jTG7Wnro8E06v5NVmm5BKAXHSa+Thy0Z8PbYJzcHRcg7jXWjNcDCS2n3jR+hlrCEp62
         /wopRS0KMzf16mVhIrT9JS16NvDi9z5rhfhpAJlgr9eeYW9AGBhtSJqIm4I8zXu//x32
         U86f4rrGFbNgfVqJOgiA24tXNx3lcoB18NunVOR/dbfAGeL5/QsNE2CyMUdpl+Isfivi
         MOxf+sHHEhCCURzAK/oTY4a6aEB+D95B/AkDVKR+NGg6OaMBYQevzC6w1DGBlb/c5isb
         tA6g==
X-Gm-Message-State: AOAM531gKmFTx0YzI5H/RDOE5o8fYEZJr9mAlFapdQsra3OOLdKzNORr
	VtMus3rw0DvTGWQmxDCsrT2uPrxjUePb7yp28uA=
X-Google-Smtp-Source: ABdhPJyOtKDf5E7/WEAiT0Hgg28d7wZIMYCist/3FMolrtPreW/WqPP6J8CRa3RfqGxfcyKGzl99Uf2F3yMlAOA28hg=
X-Received: by 2002:a17:906:ce4e:: with SMTP id se14mr13017796ejb.54.1617909359360;
 Thu, 08 Apr 2021 12:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617899100.git.akuster808@gmail.com>
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 8 Apr 2021 21:15:48 +0200
Message-ID: <CA+chaQfbCmJ2maMYU5xGhW6bpk5kew1knkJW5eHMuXQaGAf5Tg@mail.gmail.com>
Subject: Re: [oe] [hardknott 00/64] Patch review
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a4bed305bf7ae0ed"

--000000000000a4bed305bf7ae0ed
Content-Type: text/plain; charset="UTF-8"

Please take at least the libyui changes as well, because the version in
hardknott (as well as gatesgarth, dunfell) cannot be fetched.

On Thu, Apr 8, 2021 at 6:36 PM akuster <akuster808@gmail.com> wrote:

> Sync with master. Dropped iwd update  as it needs ell 0.39 which is not in
> master
>
> Please have comments back by Saturday.
>
> The following changes since commit
> 4ff36ed798939b20746e5b06a04eadf235cceffa:
>
>   README: updated Maintainers list for Hardknott (2021-03-31 07:05:07
> -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/hardknott-nut
>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut
>
> Andrew Geissler (1):
>   nodejs: ppc64le machine support
>
> Awais Belal (1):
>   libnet-ssleay-perl: add rdep on perl-module-autoloader
>
> Hermes Zhang (1):
>   gpsd: backport d-bus message time patch from upstream
>
> INC@Cisco) (1):
>   bpftool: improve reproducibility
>
> Kartikey Rameshbhai Parmar (1):
>   fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
>
> Khem Raj (11):
>   flashrom: Add remaining RISCV support
>   mpd: Check for commercial in LICENSE_FLAGS_WHITELIST
>   mpv: Exclude from world if commercial is not in inclusion list
>   sox: Exclude from world if commercial is not in inclusion list
>   vlc: Exclude from world if commercial is not in inclusion list
>   sox: Remove LICENSE_FLAGS = "commercial"
>   mariadb: Fix build on newer 32bit architectures
>   libmanette: Add recipe
>   pidgin-sipe: Fix build with glib-2.0 >= 2.68
>   gjs: Fix build with gcc11
>   poppler: Backport patches to fix build with glib-2.0 2.68+ and GCC11
>
> Leon Anavi (22):
>   python3-sqlalchemy: Upgrade 1.4.3 -> 1.4.4
>   python3-bitarray: Upgrade 1.8.1 -> 1.8.2
>   python3-httplib2: Upgrade 0.19.0 -> 0.19.1
>   python3-parso: Upgrade 0.8.1 -> 0.8.2
>   python3-matplotlib: Upgrade 3.3.4 -> 3.4.1
>   python3-pyroute2: Upgrade 0.5.15 -> 0.5.16
>   python3-h5py: Upgrade 3.1.0 -> 3.2.1
>   python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
>   python3-google-api-python-client: Upgrade 2.0.2 -> 2.1.0
>   python3-xlsxwriter: Upgrade 1.3.7 -> 1.3.8
>   python3-pymisp: Upgrade 2.4.140 -> 2.4.141
>   python3-tqdm: Upgrade 4.58.0 -> 4.59.0
>   python3-contextlib2: Upgrade 0.6.0 -> 0.6.0.post1
>   python3-typeguard: Upgrade 2.11.1 -> 2.12.0
>   python3-decorator: Upgrade 4.4.2 -> 5.0.1
>   python3-pillow: Upgrade 8.1.2 -> 8.2.0
>   python3-aiohttp: Upgrade 3.7.4 -> 3.7.4.post0
>   python3-networkx: Upgrade 2.5 -> 2.5.1
>   python3-pysonos: Upgrade 0.0.40 -> 0.0.41
>   python3-docutils: Upgrade 0.16 -> 0.17
>   python3-bitarray: Upgrade 1.8.2 -> 1.9.0
>   python3-regex: Upgrade 2021.3.17 -> 2021.4.4
>
> Martin Jansa (7):
>   packagegroup-meta-multimedia: include projucer only with x11 in
>     DISTRO_FEATURES
>   packagegroup-meta-multimedia: include vlc only with x11 in
>     DISTRO_FEATURES
>   packagegroup-meta-oe: include glfw, icewm, geis only with x11 in
>     DISTRO_FEATURES
>   phonet-utils: remove
>   packagegroup-meta-oe: use 4 spaces for identation
>   telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
>   uml-utilities: fix installed-vs-shipped with usrmerge
>
> Mingli Yu (1):
>   freeradius: Upgrade to 3.0.21
>
> Ross Burton (2):
>   flashrom: recipe cleanup
>   openjpeg: add native/nativesdk class extension
>
> Valentin Longchamp (1):
>   libssh: add gcrypt to PACKAGECONFIG
>
> Yann Dirson (1):
>   mpv: remove explicit LICENSE_FLAGS
>
> Yi Fan Yu (1):
>   rsyslog: fix some of the ptests
>
> hasan.men (2):
>   librdkafka: Add initial recipe v1.6.1
>   libcppkafka: Add initial recipe for cppkafka wrapper
>
> wangmy (1):
>   mariadb: upgrade 10.5.8 -> 10.5.9
>
> zangrc (6):
>   gnome-autoar: upgrade 0.2.4 -> 0.3.1
>   emacs: upgrade 27.1 -> 27.2
>   fbgrab: upgrade 1.4 -> 1.5
>   ostree: upgrade 2020.8 -> 2021.1
>   zabbix: upgrade 5.2.5 -> 5.2.6
>   libxaw: upgrade 1.0.13 -> 1.0.14
>
> zhengruoqin (4):
>   fetchmail: upgrade 6.4.17 -> 6.4.18
>   lldpd: upgrade 1.0.4 -> 1.0.8
>   networkmanager-openvpn: upgrade 1.8.12 -> 1.8.14
>   snort: upgrade 2.9.17 -> 2.9.17.1
>
>  ...id-g_once_init_enter-error-in-GCC-11.patch |  77 ++++++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb    |   4 +-
>  ...-autoar_0.2.4.bb => gnome-autoar_0.3.1.bb} |   4 +-
>  .../fluidsynth/fluidsynth.inc                 |   2 +-
>  .../recipes-multimedia/musicpd/mpd_0.22.6.bb  |  11 +-
>  .../packagegroup-meta-multimedia.bb           |   4 +-
>  .../recipes-multimedia/sox/sox_14.4.2.bb      |   5 +-
>  .../recipes-multimedia/vlc/vlc_3.0.12.bb      |   4 +-
>  ...python3-add-PY_INC_DIR-in-search-dir.patch |  58 -----
>  ...eradius_3.0.20.bb => freeradius_3.0.21.bb} |   3 +-
>  ...12.bb => networkmanager-openvpn_1.8.14.bb} |   4 +-
>  .../{snort_2.9.17.bb => snort_2.9.17.1.bb}    |   2 +-
>  .../lldpd/{lldpd_1.0.4.bb => lldpd_1.0.8.bb}  |   4 +-
>  ...etchmail_6.4.17.bb => fetchmail_6.4.18.bb} |   2 +-
>  ...or-last-line-only-from-preprocessed-.patch |  57 -----
>  ...SCV-as-non-memory-mapped-I-O-archite.patch |  44 ++++
>  ...typecast-enum-conversions-explicitly.patch |  66 ++---
>  .../flashrom/flashrom/meson-fixes.patch       |  68 ++++++
>  meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |  16 +-
>  .../0001-Include-limits.h-for-PATH_MAX.patch  |  25 --
>  .../phonet-utils/phonet-utils_git.bb          |  15 --
>  .../telepathy/telepathy-glib_0.24.1.bb        |   4 +-
>  .../{zabbix_5.2.5.bb => zabbix_5.2.6.bb}      |   4 +-
>  .../packagegroups/packagegroup-meta-oe.bb     | 210 ++++++++--------
>  ...ive_10.5.8.bb => mariadb-native_10.5.9.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   5 +-
>  ...ck-if-syscall-exists-before-using-it.patch |  43 ++++
>  ...ktrace-t.c-make-the-test-conditional.patch |  38 ---
>  .../mysql/mariadb/c11_atomics.patch           |  16 +-
>  .../recipes-dbs/mysql/mariadb/sys_futex.patch |  22 ++
>  .../{mariadb_10.5.8.bb => mariadb_10.5.9.bb}  |   0
>  .../recipes-devtools/nodejs/nodejs_12.21.0.bb |   2 +-
>  .../{ostree_2020.8.bb => ostree_2021.1.bb}    |   2 +-
>  ...-tests-disable-the-check-for-inotify.patch |  46 ++++
>  .../rsyslog/rsyslog/run-ptest                 |   6 +-
>  .../rsyslog/rsyslog_8.2102.0.bb               |  15 +-
>  .../uml-utilities/uml-utilities_20040406.bb   |   5 +-
>  .../fbgrab/{fbgrab_1.4.bb => fbgrab_1.5.bb}   |   2 +-
>  .../openjpeg/openjpeg_2.4.0.bb                |   2 +
>  .../{libxaw_1.0.13.bb => libxaw_1.0.14.bb}    |   5 +-
>  meta-oe/recipes-kernel/bpftool/bpftool.bb     |  11 +-
>  .../recipes-multimedia/mplayer/mpv_0.32.0.bb  |   4 +-
>  ...port.c-Fix-broken-d-bus-message-time.patch |  36 +++
>  meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb  |   1 +
>  .../emacs/{emacs_27.1.bb => emacs_27.2.bb}    |   2 +-
>  .../libcppkafka/libcppkafka_git.bb            |  22 ++
>  .../libmanette/libmanette_0.2.6.bb            |  16 ++
>  .../0001_fix_absolute_path_usage.patch        |  83 +++++++
>  .../librdkafka/librdkafka_1.6.1.bb            |  23 ++
>  .../recipes-support/libssh/libssh_0.8.9.bb    |   6 +-
>  .../0001-Migrate-to-use-g_memdup2.patch       | 192 +++++++++++++++
>  .../pidgin/pidgin-sipe_1.25.0.bb              |   1 +
>  ...tock-glib-macro-to-define-boxed-type.patch | 228 ++++++++++++++++++
>  ...rrecly-used-volatile-from-enum-type-.patch |  47 ++++
>  .../poppler/poppler_21.03.0.bb                |   2 +
>  .../libnet/libnet-ssleay-perl_1.85.bb         |   1 +
>  ....7.4.bb => python3-aiohttp_3.7.4.post0.bb} |   2 +-
>  ...ray_1.8.1.bb => python3-bitarray_1.9.0.bb} |   2 +-
>  ....2.6.bb => python3-cheetah_3.2.6.post1.bb} |   2 +-
>  ....bb => python3-contextlib2_0.6.0.post1.bb} |   3 +-
>  ...or_4.4.2.bb => python3-decorator_5.0.1.bb} |   3 +-
>  ...utils_0.16.bb => python3-docutils_0.17.bb} |   5 +-
>  ...python3-google-api-python-client_2.1.0.bb} |   2 +-
>  .../0001-setup.py-Fix-numpy-version.patch     |   8 +-
>  ...1-setup_build.py-avoid-absolute-path.patch |   4 +-
>  ...n3-h5py_3.1.0.bb => python3-h5py_3.2.1.bb} |   3 +-
>  ...2_0.19.0.bb => python3-httplib2_0.19.1.bb} |   2 +-
>  ...b_3.3.4.bb => python3-matplotlib_3.4.1.bb} |   5 +-
>  ...workx_2.5.bb => python3-networkx_2.5.1.bb} |   3 +-
>  ...-parso_0.8.1.bb => python3-parso_0.8.2.bb} |   2 +-
>  ...illow_8.1.2.bb => python3-pillow_8.2.0.bb} |   4 +-
>  ...p_2.4.140.bb => python3-pymisp_2.4.141.bb} |   2 +-
>  ...2_0.5.15.bb => python3-pyroute2_0.5.16.bb} |   2 +-
>  ...os_0.0.40.bb => python3-pysonos_0.0.41.bb} |   2 +-
>  ...2021.3.17.bb => python3-regex_2021.4.4.bb} |   2 +-
>  ...y_1.4.3.bb => python3-sqlalchemy_1.4.4.bb} |   2 +-
>  ...-tqdm_4.58.0.bb => python3-tqdm_4.59.0.bb} |   2 +-
>  ..._2.11.1.bb => python3-typeguard_2.12.0.bb} |   2 +-
>  ...r_1.3.7.bb => python3-xlsxwriter_1.3.8.bb} |   5 +-
>  79 files changed, 1197 insertions(+), 449 deletions(-)
>  create mode 100644
> meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch
>  rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.2.4.bb =>
> gnome-autoar_0.3.1.bb} (66%)
>  delete mode 100644
> meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
>  rename meta-networking/recipes-connectivity/freeradius/{
> freeradius_3.0.20.bb => freeradius_3.0.21.bb} (98%)
>  rename meta-networking/recipes-connectivity/networkmanager/{
> networkmanager-openvpn_1.8.12.bb => networkmanager-openvpn_1.8.14.bb}
> (91%)
>  rename meta-networking/recipes-connectivity/snort/{snort_2.9.17.bb =>
> snort_2.9.17.1.bb} (97%)
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.4.bb =>
> lldpd_1.0.8.bb} (94%)
>  rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.17.bb =>
> fetchmail_6.4.18.bb} (91%)
>  delete mode 100644
> meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
>  create mode 100644
> meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
>  create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
>  delete mode 100644
> meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
>  delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/
> phonet-utils_git.bb
>  rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.5.bb =>
> zabbix_5.2.6.bb} (95%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb =>
> mariadb-native_10.5.9.bb} (100%)
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>  delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb => mariadb_10.5.9.bb}
> (100%)
>  rename meta-oe/recipes-extended/ostree/{ostree_2020.8.bb =>
> ostree_2021.1.bb} (99%)
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
>  rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.4.bb => fbgrab_1.5.bb}
> (89%)
>  rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb =>
> libxaw_1.0.14.bb} (82%)
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch
>  rename meta-oe/recipes-support/emacs/{emacs_27.1.bb => emacs_27.2.bb}
> (99%)
>  create mode 100644 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
>  create mode 100644 meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
>  create mode 100644
> meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
>  create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
>  create mode 100644
> meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch
>  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.4.bb =>
> python3-aiohttp_3.7.4.post0.bb} (88%)
>  rename meta-python/recipes-devtools/python/{python3-bitarray_1.8.1.bb =>
> python3-bitarray_1.9.0.bb} (77%)
>  rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.bb =>
> python3-cheetah_3.2.6.post1.bb} (80%)
>  rename meta-python/recipes-devtools/python/{python3-contextlib2_0.6.0.bb
> => python3-contextlib2_0.6.0.post1.bb} (67%)
>  rename meta-python/recipes-devtools/python/{python3-decorator_4.4.2.bb
> => python3-decorator_5.0.1.bb} (79%)
>  rename meta-python/recipes-devtools/python/{python3-docutils_0.16.bb =>
> python3-docutils_0.17.bb} (52%)
>  rename meta-python/recipes-devtools/python/{
> python3-google-api-python-client_2.0.2.bb =>
> python3-google-api-python-client_2.1.0.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-h5py_3.1.0.bb =>
> python3-h5py_3.2.1.bb} (87%)
>  rename meta-python/recipes-devtools/python/{python3-httplib2_0.19.0.bb
> => python3-httplib2_0.19.1.bb} (77%)
>  rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.4.bb
> => python3-matplotlib_3.4.1.bb} (85%)
>  rename meta-python/recipes-devtools/python/{python3-networkx_2.5.bb =>
> python3-networkx_2.5.1.bb} (70%)
>  rename meta-python/recipes-devtools/python/{python3-parso_0.8.1.bb =>
> python3-parso_0.8.2.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-pillow_8.1.2.bb =>
> python3-pillow_8.2.0.bb} (86%)
>  rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.140.bb =>
> python3-pymisp_2.4.141.bb} (91%)
>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.15.bb
> => python3-pyroute2_0.5.16.bb} (90%)
>  rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.40.bb =>
> python3-pysonos_0.0.41.bb} (79%)
>  rename meta-python/recipes-devtools/python/{python3-regex_2021.3.17.bb
> => python3-regex_2021.4.4.bb} (77%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.3.bb
> => python3-sqlalchemy_1.4.4.bb} (85%)
>  rename meta-python/recipes-devtools/python/{python3-tqdm_4.58.0.bb =>
> python3-tqdm_4.59.0.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-typeguard_2.11.1.bb
> => python3-typeguard_2.12.0.bb} (87%)
>  rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.7.bb
> => python3-xlsxwriter_1.3.8.bb} (51%)
>
> --
> 2.17.1
>
>
> 
>
>

--000000000000a4bed305bf7ae0ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please take at least the libyui changes as well, because t=
he version in hardknott (as well as gatesgarth, dunfell) cannot be fetched.=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Apr 8, 2021 at 6:36 PM akuster &lt;<a href=3D"mailto:akuster808@gma=
il.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Sync with master. Dropped iwd update=C2=A0 as i=
t needs ell 0.39 which is not in master<br>
<br>
Please have comments back by Saturday.<br>
<br>
The following changes since commit 4ff36ed798939b20746e5b06a04eadf235cceff=
a:<br>
<br>
=C2=A0 README: updated Maintainers list for Hardknott (2021-03-31 07:05:07=
 -0700)<br>
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
Andrew Geissler (1):<br>
=C2=A0 nodejs: ppc64le machine support<br>
<br>
Awais Belal (1):<br>
=C2=A0 libnet-ssleay-perl: add rdep on perl-module-autoloader<br>
<br>
Hermes Zhang (1):<br>
=C2=A0 gpsd: backport d-bus message time patch from upstream<br>
<br>
INC@Cisco) (1):<br>
=C2=A0 bpftool: improve reproducibility<br>
<br>
Kartikey Rameshbhai Parmar (1):<br>
=C2=A0 fluidsynth: update SRC_URI to remove non-existing 2.1.x branch<br>
<br>
Khem Raj (11):<br>
=C2=A0 flashrom: Add remaining RISCV support<br>
=C2=A0 mpd: Check for commercial in LICENSE_FLAGS_WHITELIST<br>
=C2=A0 mpv: Exclude from world if commercial is not in inclusion list<br>
=C2=A0 sox: Exclude from world if commercial is not in inclusion list<br>
=C2=A0 vlc: Exclude from world if commercial is not in inclusion list<br>
=C2=A0 sox: Remove LICENSE_FLAGS =3D &quot;commercial&quot;<br>
=C2=A0 mariadb: Fix build on newer 32bit architectures<br>
=C2=A0 libmanette: Add recipe<br>
=C2=A0 pidgin-sipe: Fix build with glib-2.0 &gt;=3D 2.68<br>
=C2=A0 gjs: Fix build with gcc11<br>
=C2=A0 poppler: Backport patches to fix build with glib-2.0 2.68+ and GCC1=
1<br>
<br>
Leon Anavi (22):<br>
=C2=A0 python3-sqlalchemy: Upgrade 1.4.3 -&gt; 1.4.4<br>
=C2=A0 python3-bitarray: Upgrade 1.8.1 -&gt; 1.8.2<br>
=C2=A0 python3-httplib2: Upgrade 0.19.0 -&gt; 0.19.1<br>
=C2=A0 python3-parso: Upgrade 0.8.1 -&gt; 0.8.2<br>
=C2=A0 python3-matplotlib: Upgrade 3.3.4 -&gt; 3.4.1<br>
=C2=A0 python3-pyroute2: Upgrade 0.5.15 -&gt; 0.5.16<br>
=C2=A0 python3-h5py: Upgrade 3.1.0 -&gt; 3.2.1<br>
=C2=A0 python3-cheetah: Upgrade 3.2.6 -&gt; 3.2.6.post1<br>
=C2=A0 python3-google-api-python-client: Upgrade 2.0.2 -&gt; 2.1.0<br>
=C2=A0 python3-xlsxwriter: Upgrade 1.3.7 -&gt; 1.3.8<br>
=C2=A0 python3-pymisp: Upgrade 2.4.140 -&gt; 2.4.141<br>
=C2=A0 python3-tqdm: Upgrade 4.58.0 -&gt; 4.59.0<br>
=C2=A0 python3-contextlib2: Upgrade 0.6.0 -&gt; 0.6.0.post1<br>
=C2=A0 python3-typeguard: Upgrade 2.11.1 -&gt; 2.12.0<br>
=C2=A0 python3-decorator: Upgrade 4.4.2 -&gt; 5.0.1<br>
=C2=A0 python3-pillow: Upgrade 8.1.2 -&gt; 8.2.0<br>
=C2=A0 python3-aiohttp: Upgrade 3.7.4 -&gt; 3.7.4.post0<br>
=C2=A0 python3-networkx: Upgrade 2.5 -&gt; 2.5.1<br>
=C2=A0 python3-pysonos: Upgrade 0.0.40 -&gt; 0.0.41<br>
=C2=A0 python3-docutils: Upgrade 0.16 -&gt; 0.17<br>
=C2=A0 python3-bitarray: Upgrade 1.8.2 -&gt; 1.9.0<br>
=C2=A0 python3-regex: Upgrade 2021.3.17 -&gt; 2021.4.4<br>
<br>
Martin Jansa (7):<br>
=C2=A0 packagegroup-meta-multimedia: include projucer only with x11 in<br>
=C2=A0 =C2=A0 DISTRO_FEATURES<br>
=C2=A0 packagegroup-meta-multimedia: include vlc only with x11 in<br>
=C2=A0 =C2=A0 DISTRO_FEATURES<br>
=C2=A0 packagegroup-meta-oe: include glfw, icewm, geis only with x11 in<br=
>
=C2=A0 =C2=A0 DISTRO_FEATURES<br>
=C2=A0 phonet-utils: remove<br>
=C2=A0 packagegroup-meta-oe: use 4 spaces for identation<br>
=C2=A0 telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings=
<br>
=C2=A0 uml-utilities: fix installed-vs-shipped with usrmerge<br>
<br>
Mingli Yu (1):<br>
=C2=A0 freeradius: Upgrade to 3.0.21<br>
<br>
Ross Burton (2):<br>
=C2=A0 flashrom: recipe cleanup<br>
=C2=A0 openjpeg: add native/nativesdk class extension<br>
<br>
Valentin Longchamp (1):<br>
=C2=A0 libssh: add gcrypt to PACKAGECONFIG<br>
<br>
Yann Dirson (1):<br>
=C2=A0 mpv: remove explicit LICENSE_FLAGS<br>
<br>
Yi Fan Yu (1):<br>
=C2=A0 rsyslog: fix some of the ptests<br>
<br>
hasan.men (2):<br>
=C2=A0 librdkafka: Add initial recipe v1.6.1<br>
=C2=A0 libcppkafka: Add initial recipe for cppkafka wrapper<br>
<br>
wangmy (1):<br>
=C2=A0 mariadb: upgrade 10.5.8 -&gt; 10.5.9<br>
<br>
zangrc (6):<br>
=C2=A0 gnome-autoar: upgrade 0.2.4 -&gt; 0.3.1<br>
=C2=A0 emacs: upgrade 27.1 -&gt; 27.2<br>
=C2=A0 fbgrab: upgrade 1.4 -&gt; 1.5<br>
=C2=A0 ostree: upgrade 2020.8 -&gt; 2021.1<br>
=C2=A0 zabbix: upgrade 5.2.5 -&gt; 5.2.6<br>
=C2=A0 libxaw: upgrade 1.0.13 -&gt; 1.0.14<br>
<br>
zhengruoqin (4):<br>
=C2=A0 fetchmail: upgrade 6.4.17 -&gt; 6.4.18<br>
=C2=A0 lldpd: upgrade 1.0.4 -&gt; 1.0.8<br>
=C2=A0 networkmanager-openvpn: upgrade 1.8.12 -&gt; 1.8.14<br>
=C2=A0 snort: upgrade 2.9.17 -&gt; 2.9.17.1<br>
<br>
=C2=A0...id-g_once_init_enter-error-in-GCC-11.patch |=C2=A0 77 ++++++<br>
=C2=A0meta-gnome/recipes-gnome/gjs/<a href=3D"http://gjs_1.58.8.bb" rel=3D=
"noreferrer" target=3D"_blank">gjs_1.58.8.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0...-<a href=3D"http://autoar_0.2.4.bb" rel=3D"noreferrer" target=3D"=
_blank">autoar_0.2.4.bb</a> =3D&gt; <a href=3D"http://gnome-autoar_0.3.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gnome-autoar_0.3.1.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../fluidsynth/fluidsynth.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-multimedia/musicpd/<a href=3D"http://mpd_0.22.6.bb" rel=
=3D"noreferrer" target=3D"_blank">mpd_0.22.6.bb</a>=C2=A0 |=C2=A0 11 +-<br=
>
=C2=A0.../<a href=3D"http://packagegroup-meta-multimedia.bb" rel=3D"norefe=
rrer" target=3D"_blank">packagegroup-meta-multimedia.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../recipes-multimedia/sox/<a href=3D"http://sox_14.4.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">sox_14.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=
=C2=A05 +-<br>
=C2=A0.../recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">vlc_3.0.12.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=
=C2=A04 +-<br>
=C2=A0...python3-add-PY_INC_DIR-in-search-dir.patch |=C2=A0 58 -----<br>
=C2=A0...<a href=3D"http://eradius_3.0.20.bb" rel=3D"noreferrer" target=3D=
"_blank">eradius_3.0.20.bb</a> =3D&gt; <a href=3D"http://freeradius_3.0.21.=
bb" rel=3D"noreferrer" target=3D"_blank">freeradius_3.0.21.bb</a>} |=C2=A0 =
=
=C2=A03 +-<br>
=C2=A0...<a href=3D"http://12.bb" rel=3D"noreferrer" target=3D"_blank">12.=
bb</a> =3D&gt; <a href=3D"http://networkmanager-openvpn_1.8.14.bb" rel=3D"n=
oreferrer" target=3D"_blank">networkmanager-openvpn_1.8.14.bb</a>} |=C2=A0 =
=
=C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://snort_2.9.17.bb" rel=3D"noreferrer" target=3D=
"_blank">snort_2.9.17.bb</a> =3D&gt; <a href=3D"http://snort_2.9.17.1.bb" r=
el=3D"noreferrer" target=3D"_blank">snort_2.9.17.1.bb</a>}=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../lldpd/{<a href=3D"http://lldpd_1.0.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">lldpd_1.0.4.bb</a> =3D&gt; <a href=3D"http://lldpd_1.0.8.bb" =
rel=3D"noreferrer" target=3D"_blank">lldpd_1.0.8.bb</a>}=C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0...<a href=3D"http://etchmail_6.4.17.bb" rel=3D"noreferrer" target=
=3D"_blank">etchmail_6.4.17.bb</a> =3D&gt; <a href=3D"http://fetchmail_6.4=
.18.bb" rel=3D"noreferrer" target=3D"_blank">fetchmail_6.4.18.bb</a>} |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...or-last-line-only-from-preprocessed-.patch |=C2=A0 57 -----<br>
=C2=A0...SCV-as-non-memory-mapped-I-O-archite.patch |=C2=A0 44 ++++<br>
=C2=A0...typecast-enum-conversions-explicitly.patch |=C2=A0 66 ++---<br>
=C2=A0.../flashrom/flashrom/meson-fixes.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 68 ++++++<br>
=C2=A0meta-oe/recipes-bsp/flashrom/<a href=3D"http://flashrom_1.2.bb" rel=
=3D"noreferrer" target=3D"_blank">flashrom_1.2.bb</a>=C2=A0 |=C2=A0 16 +-<=
br>
=C2=A0.../0001-Include-limits.h-for-PATH_MAX.patch=C2=A0 |=C2=A0 25 --<br>
=C2=A0.../phonet-utils/<a href=3D"http://phonet-utils_git.bb" rel=3D"noref=
errer" target=3D"_blank">phonet-utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 15 --<br>
=C2=A0.../telepathy/<a href=3D"http://telepathy-glib_0.24.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">telepathy-glib_0.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://zabbix_5.2.5.bb" rel=3D"noreferrer" target=3D=
"_blank">zabbix_5.2.5.bb</a> =3D&gt; <a href=3D"http://zabbix_5.2.6.bb" rel=
=
=3D"noreferrer" target=3D"_blank">zabbix_5.2.6.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"=
noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0| 210 ++++++++--------<br>
=C2=A0...<a href=3D"http://ive_10.5.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ive_10.5.8.bb</a> =3D&gt; <a href=3D"http://mariadb-native_10.5.9.bb" =
rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.5.9.bb</a>} |=C2=A0 =
=
=C2=A00<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0...ck-if-syscall-exists-before-using-it.patch |=C2=A0 43 ++++<br>
=C2=A0...ktrace-t.c-make-the-test-conditional.patch |=C2=A0 38 ---<br>
=C2=A0.../mysql/mariadb/c11_atomics.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 16 +-<br>
=C2=A0.../recipes-dbs/mysql/mariadb/sys_futex.patch |=C2=A0 22 ++<br>
=C2=A0.../{<a href=3D"http://mariadb_10.5.8.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_10.5.8.bb</a> =3D&gt; <a href=3D"http://mariadb_10.5.9=
.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.5.9.bb</a>}=C2=A0 |=C2=
=
=A0 =C2=A00<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_12.21.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">nodejs_12.21.0.bb</a> |=C2=A0 =C2=A02 +-=
<br>
=C2=A0.../{<a href=3D"http://ostree_2020.8.bb" rel=3D"noreferrer" target=
=3D"_blank">ostree_2020.8.bb</a> =3D&gt; <a href=3D"http://ostree_2021.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ostree_2021.1.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0...-tests-disable-the-check-for-inotify.patch |=C2=A0 46 ++++<br>
=C2=A0.../rsyslog/rsyslog/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0.../rsyslog/<a href=3D"http://rsyslog_8.2102.0.bb" rel=3D"noreferrer=
" target=3D"_blank">rsyslog_8.2102.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<br>
=C2=A0.../uml-utilities/<a href=3D"http://uml-utilities_20040406.bb" rel=
=3D"noreferrer" target=3D"_blank">uml-utilities_20040406.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0.../fbgrab/{<a href=3D"http://fbgrab_1.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">fbgrab_1.4.bb</a> =3D&gt; <a href=3D"http://fbgrab_1.5.bb" re=
l=3D"noreferrer" target=3D"_blank">fbgrab_1.5.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../openjpeg/<a href=3D"http://openjpeg_2.4.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">openjpeg_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../{<a href=3D"http://libxaw_1.0.13.bb" rel=3D"noreferrer" target=
=3D"_blank">libxaw_1.0.13.bb</a> =3D&gt; <a href=3D"http://libxaw_1.0.14.b=
b" rel=3D"noreferrer" target=3D"_blank">libxaw_1.0.14.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" rel=3D"=
noreferrer" target=3D"_blank">bpftool.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 11 =
+-<br>
=C2=A0.../recipes-multimedia/mplayer/<a href=3D"http://mpv_0.32.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mpv_0.32.0.bb</a>=C2=A0 |=C2=A0 =C2=A04 =
+-<br>
=C2=A0...port.c-Fix-broken-d-bus-message-time.patch |=C2=A0 36 +++<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a>=C2=A0 |=C2=A0 =C2=A01 +=
<br>
=C2=A0.../emacs/{<a href=3D"http://emacs_27.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">emacs_27.1.bb</a> =3D&gt; <a href=3D"http://emacs_27.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">emacs_27.2.bb</a>}=C2=A0 =C2=A0 |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0.../libcppkafka/<a href=3D"http://libcppkafka_git.bb" rel=3D"norefer=
rer" target=3D"_blank">libcppkafka_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 22 ++<br>
=C2=A0.../libmanette/<a href=3D"http://libmanette_0.2.6.bb" rel=3D"norefer=
rer" target=3D"_blank">libmanette_0.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 16 ++<br>
=C2=A0.../0001_fix_absolute_path_usage.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 83 +++++++<br>
=C2=A0.../librdkafka/<a href=3D"http://librdkafka_1.6.1.bb" rel=3D"norefer=
rer" target=3D"_blank">librdkafka_1.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 23 ++<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=
=A06 +-<br>
=C2=A0.../0001-Migrate-to-use-g_memdup2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
192 +++++++++++++++<br>
=C2=A0.../pidgin/<a href=3D"http://pidgin-sipe_1.25.0.bb" rel=3D"noreferre=
r" target=3D"_blank">pidgin-sipe_1.25.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...tock-glib-macro-to-define-boxed-type.patch | 228 ++++++++++++++++=
++<br>
=C2=A0...rrecly-used-volatile-from-enum-type-.patch |=C2=A0 47 ++++<br>
=C2=A0.../poppler/<a href=3D"http://poppler_21.03.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">poppler_21.03.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../libnet/<a href=3D"http://libnet-ssleay-perl_1.85.bb" rel=3D"nore=
ferrer" target=3D"_blank">libnet-ssleay-perl_1.85.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0....<a href=3D"http://7.4.bb" rel=3D"noreferrer" target=3D"_blank">7=
.4.bb</a> =3D&gt; <a href=3D"http://python3-aiohttp_3.7.4.post0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-aiohttp_3.7.4.post0.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ray_1.8.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ray_1.8.1.bb</a> =3D&gt; <a href=3D"http://python3-bitarray_1.9.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-bitarray_1.9.0.bb</a>} |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0....<a href=3D"http://2.6.bb" rel=3D"noreferrer" target=3D"_blank">2=
.6.bb</a> =3D&gt; <a href=3D"http://python3-cheetah_3.2.6.post1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-cheetah_3.2.6.post1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0....bb =3D&gt; <a href=3D"http://python3-contextlib2_0.6.0.post1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-contextlib2_0.6.0.post1.bb</a=
>} |=C2=A0 =C2=A03 +-<br>
=C2=A0...<a href=3D"http://or_4.4.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">or_4.4.2.bb</a> =3D&gt; <a href=3D"http://python3-decorator_5.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-decorator_5.0.1.bb</a>} |=C2=A0 =
=
=C2=A03 +-<br>
=C2=A0...<a href=3D"http://utils_0.16.bb" rel=3D"noreferrer" target=3D"_bl=
ank">utils_0.16.bb</a> =3D&gt; <a href=3D"http://python3-docutils_0.17.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.17.bb</a>} |=C2=A0 =
=
=C2=A05 +-<br>
=C2=A0...<a href=3D"http://python3-google-api-python-client_2.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-google-api-python-client_2.1.0.b=
b</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0.../0001-setup.py-Fix-numpy-version.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A08 +-<br>
=C2=A0...1-setup_build.py-avoid-absolute-path.patch |=C2=A0 =C2=A04 +-<br>
=C2=A0...<a href=3D"http://n3-h5py_3.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">n3-h5py_3.1.0.bb</a> =3D&gt; <a href=3D"http://python3-h5py_3.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-h5py_3.2.1.bb</a>} |=C2=A0 =
=
=C2=A03 +-<br>
=C2=A0...<a href=3D"http://2_0.19.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">2_0.19.0.bb</a> =3D&gt; <a href=3D"http://python3-httplib2_0.19.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-httplib2_0.19.1.bb</a>} |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://b_3.3.4.bb" rel=3D"noreferrer" target=3D"_blank=
">b_3.3.4.bb</a> =3D&gt; <a href=3D"http://python3-matplotlib_3.4.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.4.1.bb</a>} |=C2=A0=
 =C2=A05 +-<br>
=C2=A0...<a href=3D"http://workx_2.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">workx_2.5.bb</a> =3D&gt; <a href=3D"http://python3-networkx_2.5.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-networkx_2.5.1.bb</a>} |=C2=A0 =
=
=C2=A03 +-<br>
=C2=A0...-<a href=3D"http://parso_0.8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">parso_0.8.1.bb</a> =3D&gt; <a href=3D"http://python3-parso_0.8.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-parso_0.8.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://illow_8.1.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">illow_8.1.2.bb</a> =3D&gt; <a href=3D"http://python3-pillow_8.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-pillow_8.2.0.bb</a>} |=C2=A0 =
=
=C2=A04 +-<br>
=C2=A0...<a href=3D"http://p_2.4.140.bb" rel=3D"noreferrer" target=3D"_bla=
nk">p_2.4.140.bb</a> =3D&gt; <a href=3D"http://python3-pymisp_2.4.141.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pymisp_2.4.141.bb</a>} |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://2_0.5.15.bb" rel=3D"noreferrer" target=3D"_blan=
k">2_0.5.15.bb</a> =3D&gt; <a href=3D"http://python3-pyroute2_0.5.16.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-pyroute2_0.5.16.bb</a>} |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://os_0.0.40.bb" rel=3D"noreferrer" target=3D"_bla=
nk">os_0.0.40.bb</a> =3D&gt; <a href=3D"http://python3-pysonos_0.0.41.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pysonos_0.0.41.bb</a>} |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://2021.3.17.bb" rel=3D"noreferrer" target=3D"_bla=
nk">2021.3.17.bb</a> =3D&gt; <a href=3D"http://python3-regex_2021.4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-regex_2021.4.4.bb</a>} |=C2=A0 =
=
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://y_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank=
">y_1.4.3.bb</a> =3D&gt; <a href=3D"http://python3-sqlalchemy_1.4.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-sqlalchemy_1.4.4.bb</a>} |=C2=A0=
 =C2=A02 +-<br>
=C2=A0...-<a href=3D"http://tqdm_4.58.0.bb" rel=3D"noreferrer" target=3D"_=
blank">tqdm_4.58.0.bb</a> =3D&gt; <a href=3D"http://python3-tqdm_4.59.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-tqdm_4.59.0.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0..._<a href=3D"http://2.11.1.bb" rel=3D"noreferrer" target=3D"_blank=
">2.11.1.bb</a> =3D&gt; <a href=3D"http://python3-typeguard_2.12.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-typeguard_2.12.0.bb</a>} |=C2=A0=
 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://r_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank=
">r_1.3.7.bb</a> =3D&gt; <a href=3D"http://python3-xlsxwriter_1.3.8.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-xlsxwriter_1.3.8.bb</a>} |=C2=A0=
 =C2=A05 +-<br>
=C2=A079 files changed, 1197 insertions(+), 449 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid=
-g_once_init_enter-error-in-GCC-11.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-autoar/{<a href=3D"http://gnom=
e-autoar_0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gnome-autoar_0.2.4.=
bb</a> =3D&gt; <a href=3D"http://gnome-autoar_0.3.1.bb" rel=3D"noreferrer" =
target=3D"_blank">gnome-autoar_0.3.1.bb</a>} (66%)<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/freeradius/f=
iles/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch<br>
=C2=A0rename meta-networking/recipes-connectivity/freeradius/{<a href=3D"h=
ttp://freeradius_3.0.20.bb" rel=3D"noreferrer" target=3D"_blank">freeradius=
_3.0.20.bb</a> =3D&gt; <a href=3D"http://freeradius_3.0.21.bb" rel=3D"noref=
errer" target=3D"_blank">freeradius_3.0.21.bb</a>} (98%)<br>
=C2=A0rename meta-networking/recipes-connectivity/networkmanager/{<a href=
=3D"http://networkmanager-openvpn_1.8.12.bb" rel=3D"noreferrer" target=3D"=
_blank">networkmanager-openvpn_1.8.12.bb</a> =3D&gt; <a href=3D"http://netw=
orkmanager-openvpn_1.8.14.bb" rel=3D"noreferrer" target=3D"_blank">networkm=
anager-openvpn_1.8.14.bb</a>} (91%)<br>
=C2=A0rename meta-networking/recipes-connectivity/snort/{<a href=3D"http:/=
/snort_2.9.17.bb" rel=3D"noreferrer" target=3D"_blank">snort_2.9.17.bb</a> =
=
=3D&gt; <a href=3D"http://snort_2.9.17.1.bb" rel=3D"noreferrer" target=3D"=
_blank">snort_2.9.17.1.bb</a>} (97%)<br>
=C2=A0rename meta-networking/recipes-daemons/lldpd/{<a href=3D"http://lldp=
d_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">lldpd_1.0.4.bb</a> =3D&gt;=
 <a href=3D"http://lldpd_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lld=
pd_1.0.8.bb</a>} (94%)<br>
=C2=A0rename meta-networking/recipes-support/fetchmail/{<a href=3D"http://=
fetchmail_6.4.17.bb" rel=3D"noreferrer" target=3D"_blank">fetchmail_6.4.17.=
bb</a> =3D&gt; <a href=3D"http://fetchmail_6.4.18.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">fetchmail_6.4.18.bb</a>} (91%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefi=
le-Check-for-last-line-only-from-preprocessed-.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-flashr=
om-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes=
.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-=
utils/0001-Include-limits.h-for-PATH_MAX.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/<a href=
=
=3D"http://phonet-utils_git.bb" rel=3D"noreferrer" target=3D"_blank">phone=
t-utils_git.bb</a><br>
=C2=A0rename meta-oe/recipes-connectivity/zabbix/{<a href=3D"http://zabbix=
_5.2.5.bb" rel=3D"noreferrer" target=3D"_blank">zabbix_5.2.5.bb</a> =3D&gt;=
 <a href=3D"http://zabbix_5.2.6.bb" rel=3D"noreferrer" target=3D"_blank">za=
bbix_5.2.6.bb</a>} (95%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_1=
0.5.8.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.5.8.bb</a>=
 =3D&gt; <a href=3D"http://mariadb-native_10.5.9.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mariadb-native_10.5.9.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-=
Check-if-syscall-exists-before-using-it.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace=
-t.c-make-the-test-conditional.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch=
<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_10.5.8.b=
b" rel=3D"noreferrer" target=3D"_blank">mariadb_10.5.8.bb</a> =3D&gt; <a hr=
ef=3D"http://mariadb_10.5.9.bb" rel=3D"noreferrer" target=3D"_blank">mariad=
b_10.5.9.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-extended/ostree/{<a href=3D"http://ostree_202=
0.8.bb" rel=3D"noreferrer" target=3D"_blank">ostree_2020.8.bb</a> =3D&gt; <=
a href=3D"http://ostree_2021.1.bb" rel=3D"noreferrer" target=3D"_blank">ost=
ree_2021.1.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-tes=
ts-disable-the-check-for-inotify.patch<br>
=C2=A0rename meta-oe/recipes-graphics/fbgrab/{<a href=3D"http://fbgrab_1.4=
.bb" rel=3D"noreferrer" target=3D"_blank">fbgrab_1.4.bb</a> =3D&gt; <a href=
=
=3D"http://fbgrab_1.5.bb" rel=3D"noreferrer" target=3D"_blank">fbgrab_1.5.=
bb</a>} (89%)<br>
=C2=A0rename meta-oe/recipes-graphics/xorg-lib/{<a href=3D"http://libxaw_1=
.0.13.bb" rel=3D"noreferrer" target=3D"_blank">libxaw_1.0.13.bb</a> =3D&gt;=
 <a href=3D"http://libxaw_1.0.14.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibxaw_1.0.14.bb</a>} (82%)<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-db=
usexport.c-Fix-broken-d-bus-message-time.patch<br>
=C2=A0rename meta-oe/recipes-support/emacs/{<a href=3D"http://emacs_27.1.b=
b" rel=3D"noreferrer" target=3D"_blank">emacs_27.1.bb</a> =3D&gt; <a href=
=3D"http://emacs_27.2.bb" rel=3D"noreferrer" target=3D"_blank">emacs_27.2.=
bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libcppkafka/<a href=3D"ht=
tp://libcppkafka_git.bb" rel=3D"noreferrer" target=3D"_blank">libcppkafka_g=
it.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-support/libmanette/<a href=3D"htt=
p://libmanette_0.2.6.bb" rel=3D"noreferrer" target=3D"_blank">libmanette_0.=
2.6.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/000=
1_fix_absolute_path_usage.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/librdkafka/<a href=3D"htt=
p://librdkafka_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_1.=
6.1.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-M=
igrate-to-use-g_memdup2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib=
-Use-stock-glib-macro-to-define-boxed-type.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/0002-glib=
-Remove-incorrecly-used-volatile-from-enum-type-.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-aiohttp_3.7.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp_3.=
7.4.bb</a> =3D&gt; <a href=3D"http://python3-aiohttp_3.7.4.post0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-aiohttp_3.7.4.post0.bb</a>} (88%)<br=
>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-bitarray_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bitarray_=
1.8.1.bb</a> =3D&gt; <a href=3D"http://python3-bitarray_1.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-bitarray_1.9.0.bb</a>} (77%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-cheetah_3.2.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-cheetah_3.=
2.6.bb</a> =3D&gt; <a href=3D"http://python3-cheetah_3.2.6.post1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-cheetah_3.2.6.post1.bb</a>} (80%)<br=
>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-contextlib2_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-contex=
tlib2_0.6.0.bb</a> =3D&gt; <a href=3D"http://python3-contextlib2_0.6.0.post=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-contextlib2_0.6.0.post1.=
bb</a>} (67%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-decorator_4.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-decorato=
r_4.4.2.bb</a> =3D&gt; <a href=3D"http://python3-decorator_5.0.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-decorator_5.0.1.bb</a>} (79%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-docutils_0.16.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0=
.16.bb</a> =3D&gt; <a href=3D"http://python3-docutils_0.17.bb" rel=3D"noref=
errer" target=3D"_blank">python3-docutils_0.17.bb</a>} (52%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-google-api-python-client_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-google-api-python-client_2.0.2.bb</a> =3D&gt; <a href=3D"http://pyth=
on3-google-api-python-client_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-google-api-python-client_2.1.0.bb</a>} (78%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-h5py_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-h5py_3.1.0.bb=
</a> =3D&gt; <a href=3D"http://python3-h5py_3.2.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-h5py_3.2.1.bb</a>} (87%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-httplib2_0.19.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-httplib2=
_0.19.0.bb</a> =3D&gt; <a href=3D"http://python3-httplib2_0.19.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-httplib2_0.19.1.bb</a>} (77%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-matplotlib_3.3.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplot=
lib_3.3.4.bb</a> =3D&gt; <a href=3D"http://python3-matplotlib_3.4.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.4.1.bb</a>} (85%)<b=
r>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-networkx_2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-networkx_2.=
5.bb</a> =3D&gt; <a href=3D"http://python3-networkx_2.5.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-networkx_2.5.1.bb</a>} (70%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-parso_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-parso_0.8.1.=
bb</a> =3D&gt; <a href=3D"http://python3-parso_0.8.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-parso_0.8.2.bb</a>} (75%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-pillow_8.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_8.1.=
2.bb</a> =3D&gt; <a href=3D"http://python3-pillow_8.2.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pillow_8.2.0.bb</a>} (86%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-pymisp_2.4.140.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymisp_2.=
4.140.bb</a> =3D&gt; <a href=3D"http://python3-pymisp_2.4.141.bb" rel=3D"no=
referrer" target=3D"_blank">python3-pymisp_2.4.141.bb</a>} (91%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-pyroute2_0.5.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyroute2=
_0.5.15.bb</a> =3D&gt; <a href=3D"http://python3-pyroute2_0.5.16.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pyroute2_0.5.16.bb</a>} (90%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-pysonos_0.0.40.bb" rel=3D"noreferrer" target=3D"_blank">python3-pysonos_0=
.0.40.bb</a> =3D&gt; <a href=3D"http://python3-pysonos_0.0.41.bb" rel=3D"no=
referrer" target=3D"_blank">python3-pysonos_0.0.41.bb</a>} (79%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-regex_2021.3.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-regex_20=
21.3.17.bb</a> =3D&gt; <a href=3D"http://python3-regex_2021.4.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-regex_2021.4.4.bb</a>} (77%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-sqlalchemy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-sqlalch=
emy_1.4.3.bb</a> =3D&gt; <a href=3D"http://python3-sqlalchemy_1.4.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-sqlalchemy_1.4.4.bb</a>} (85%)<b=
r>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-tqdm_4.58.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tqdm_4.58.0.=
bb</a> =3D&gt; <a href=3D"http://python3-tqdm_4.59.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-tqdm_4.59.0.bb</a>} (78%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-typeguard_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-typegua=
rd_2.11.1.bb</a> =3D&gt; <a href=3D"http://python3-typeguard_2.12.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-typeguard_2.12.0.bb</a>} (87%)<b=
r>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-xlsxwriter_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-xlsxwri=
ter_1.3.7.bb</a> =3D&gt; <a href=3D"http://python3-xlsxwriter_1.3.8.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-xlsxwriter_1.3.8.bb</a>} (51%)<b=
r>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a4bed305bf7ae0ed--
