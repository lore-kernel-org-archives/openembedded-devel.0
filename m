Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.1992.1617925241623868288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 16:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lujfF10z;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id d12so3954943oiw.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hgTW+3tkoM+vq9TCZdNmZ8dqwojndFc77YvJlKVJVvA=;
        b=lujfF10zd8PtTUPQY2wvdzoE4xg6yUKw6jNu8/5+uKs0zaXicIcky2wre/JSknbAjw
         GJ3QDDHzJa6m1OwaLP4Z9rkbYV6+QunbHQAbx2yYMf0+qK8d8l+VdhMdZAzDU0PZYp6W
         Wc2Q4Oc9LGifS1jpXim3qQXOks2jkRduDoFxEwTFkQQhj2aJYa+1ojUQ2wHzwlvPF4ht
         FFUFrvXk68X4l/FljrP6JxQhdsq9cIu86g/QN8+iOyNLUPDhC/dKwOQufKWbbswNfeO6
         tRXiNZU6nS897Ye3d2vpv7yKsDiziXzrM3wevqB9dnHKf+ETZVgVgNgBhQoK+48f7Xyp
         XN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=hgTW+3tkoM+vq9TCZdNmZ8dqwojndFc77YvJlKVJVvA=;
        b=r5YKKESOqxQmVwHFwKLSLzkE5+IFYHSmsgco9H0mcfVUXXi/KrtuHfZnRCg+i9Ja5u
         G6Kj5AKPNpRSy4T46dm/gE+MrFdVco0V/3FBEfdHwu1ko5+0Ss5SVM/yQ2qMNmGkJ6aN
         ifumGlUCvijkTI50opJf2clwiG/t2ayGhfkL2gGBUPJ+aE0uBD80BgMX4AgizoCj/S4O
         PYM60tqyolXEQOHa8Hx543BplA69OGxUkqUfHVVMbbR0nz34OPnfUSoR/LYs5rHtuG+1
         ohySowzX3v4JfzwZKe8xtkGj0LheU5sX3x8hqbVW8ihluIozxXgY2YCEika4R8S2ygcz
         a6GQ==
X-Gm-Message-State: AOAM533sTGJYwsTk05JWcdiQim+HBqjC18iF9CWRZiCHkaA/QJHBiviD
	C/CtEr9PDJEMyWc2xJN1zMpe7uhn8/s=
X-Google-Smtp-Source: ABdhPJxBmjX6YOqxlv/oeNSfY6kMph33rNsljaG+kwq80GlvTV/Vp6fvipHQldndJjAMEcPELylS9g==
X-Received: by 2002:aca:4357:: with SMTP id q84mr8019694oia.51.1617925240620;
        Thu, 08 Apr 2021 16:40:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8533:6d3:7a8:8272? ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id v1sm217486ooh.3.2021.04.08.16.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 16:40:40 -0700 (PDT)
Subject: Re: [oe] [hardknott 00/64] Patch review
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1617899100.git.akuster808@gmail.com>
 <CA+chaQfbCmJ2maMYU5xGhW6bpk5kew1knkJW5eHMuXQaGAf5Tg@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <83683f62-fcaa-a5b1-2eb7-9d02b6992057@gmail.com>
Date: Thu, 8 Apr 2021 16:40:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfbCmJ2maMYU5xGhW6bpk5kew1knkJW5eHMuXQaGAf5Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/8/21 12:15 PM, Martin Jansa wrote:
> Please take at least the libyui changes as well, because the version
> in hardknott (as well as gatesgarth, dunfell) cannot be fetched.
Got that in stable/hardknott-nut and a clean build. will most likely
send a second series. Then I can work on g & d
-armin
>
> On Thu, Apr 8, 2021 at 6:36 PM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Sync with master. Dropped iwd update  as it needs ell 0.39 which
>     is not in master
>
>     Please have comments back by Saturday.
>
>     The following changes since commit
>     4ff36ed798939b20746e5b06a04eadf235cceffa:
>
>       README: updated Maintainers list for Hardknott (2021-03-31
>     07:05:07 -0700)
>
>     are available in the Git repository at:
>
>       git://git.openembedded.org/meta-openembedded-contrib
>     <http://git.openembedded.org/meta-openembedded-contrib>
>     stable/hardknott-nut
>      
>     http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut
>
>     Andrew Geissler (1):
>       nodejs: ppc64le machine support
>
>     Awais Belal (1):
>       libnet-ssleay-perl: add rdep on perl-module-autoloader
>
>     Hermes Zhang (1):
>       gpsd: backport d-bus message time patch from upstream
>
>     INC@Cisco) (1):
>       bpftool: improve reproducibility
>
>     Kartikey Rameshbhai Parmar (1):
>       fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
>
>     Khem Raj (11):
>       flashrom: Add remaining RISCV support
>       mpd: Check for commercial in LICENSE_FLAGS_WHITELIST
>       mpv: Exclude from world if commercial is not in inclusion list
>       sox: Exclude from world if commercial is not in inclusion list
>       vlc: Exclude from world if commercial is not in inclusion list
>       sox: Remove LICENSE_FLAGS = "commercial"
>       mariadb: Fix build on newer 32bit architectures
>       libmanette: Add recipe
>       pidgin-sipe: Fix build with glib-2.0 >= 2.68
>       gjs: Fix build with gcc11
>       poppler: Backport patches to fix build with glib-2.0 2.68+ and GCC11
>
>     Leon Anavi (22):
>       python3-sqlalchemy: Upgrade 1.4.3 -> 1.4.4
>       python3-bitarray: Upgrade 1.8.1 -> 1.8.2
>       python3-httplib2: Upgrade 0.19.0 -> 0.19.1
>       python3-parso: Upgrade 0.8.1 -> 0.8.2
>       python3-matplotlib: Upgrade 3.3.4 -> 3.4.1
>       python3-pyroute2: Upgrade 0.5.15 -> 0.5.16
>       python3-h5py: Upgrade 3.1.0 -> 3.2.1
>       python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
>       python3-google-api-python-client: Upgrade 2.0.2 -> 2.1.0
>       python3-xlsxwriter: Upgrade 1.3.7 -> 1.3.8
>       python3-pymisp: Upgrade 2.4.140 -> 2.4.141
>       python3-tqdm: Upgrade 4.58.0 -> 4.59.0
>       python3-contextlib2: Upgrade 0.6.0 -> 0.6.0.post1
>       python3-typeguard: Upgrade 2.11.1 -> 2.12.0
>       python3-decorator: Upgrade 4.4.2 -> 5.0.1
>       python3-pillow: Upgrade 8.1.2 -> 8.2.0
>       python3-aiohttp: Upgrade 3.7.4 -> 3.7.4.post0
>       python3-networkx: Upgrade 2.5 -> 2.5.1
>       python3-pysonos: Upgrade 0.0.40 -> 0.0.41
>       python3-docutils: Upgrade 0.16 -> 0.17
>       python3-bitarray: Upgrade 1.8.2 -> 1.9.0
>       python3-regex: Upgrade 2021.3.17 -> 2021.4.4
>
>     Martin Jansa (7):
>       packagegroup-meta-multimedia: include projucer only with x11 in
>         DISTRO_FEATURES
>       packagegroup-meta-multimedia: include vlc only with x11 in
>         DISTRO_FEATURES
>       packagegroup-meta-oe: include glfw, icewm, geis only with x11 in
>         DISTRO_FEATURES
>       phonet-utils: remove
>       packagegroup-meta-oe: use 4 spaces for identation
>       telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
>       uml-utilities: fix installed-vs-shipped with usrmerge
>
>     Mingli Yu (1):
>       freeradius: Upgrade to 3.0.21
>
>     Ross Burton (2):
>       flashrom: recipe cleanup
>       openjpeg: add native/nativesdk class extension
>
>     Valentin Longchamp (1):
>       libssh: add gcrypt to PACKAGECONFIG
>
>     Yann Dirson (1):
>       mpv: remove explicit LICENSE_FLAGS
>
>     Yi Fan Yu (1):
>       rsyslog: fix some of the ptests
>
>     hasan.men (2):
>       librdkafka: Add initial recipe v1.6.1
>       libcppkafka: Add initial recipe for cppkafka wrapper
>
>     wangmy (1):
>       mariadb: upgrade 10.5.8 -> 10.5.9
>
>     zangrc (6):
>       gnome-autoar: upgrade 0.2.4 -> 0.3.1
>       emacs: upgrade 27.1 -> 27.2
>       fbgrab: upgrade 1.4 -> 1.5
>       ostree: upgrade 2020.8 -> 2021.1
>       zabbix: upgrade 5.2.5 -> 5.2.6
>       libxaw: upgrade 1.0.13 -> 1.0.14
>
>     zhengruoqin (4):
>       fetchmail: upgrade 6.4.17 -> 6.4.18
>       lldpd: upgrade 1.0.4 -> 1.0.8
>       networkmanager-openvpn: upgrade 1.8.12 -> 1.8.14
>       snort: upgrade 2.9.17 -> 2.9.17.1
>
>      ...id-g_once_init_enter-error-in-GCC-11.patch |  77 ++++++
>      meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
>     <http://gjs_1.58.8.bb>    |   4 +-
>      ...-autoar_0.2.4.bb <http://autoar_0.2.4.bb> =>
>     gnome-autoar_0.3.1.bb <http://gnome-autoar_0.3.1.bb>} |   4 +-
>      .../fluidsynth/fluidsynth.inc                 |   2 +-
>      .../recipes-multimedia/musicpd/mpd_0.22.6.bb
>     <http://mpd_0.22.6.bb>  |  11 +-
>      .../packagegroup-meta-multimedia.bb
>     <http://packagegroup-meta-multimedia.bb>           |   4 +-
>      .../recipes-multimedia/sox/sox_14.4.2.bb <http://sox_14.4.2.bb> 
>         |   5 +-
>      .../recipes-multimedia/vlc/vlc_3.0.12.bb <http://vlc_3.0.12.bb> 
>         |   4 +-
>      ...python3-add-PY_INC_DIR-in-search-dir.patch |  58 -----
>      ...eradius_3.0.20.bb <http://eradius_3.0.20.bb> =>
>     freeradius_3.0.21.bb <http://freeradius_3.0.21.bb>} |   3 +-
>      ...12.bb <http://12.bb> => networkmanager-openvpn_1.8.14.bb
>     <http://networkmanager-openvpn_1.8.14.bb>} |   4 +-
>      .../{snort_2.9.17.bb <http://snort_2.9.17.bb> =>
>     snort_2.9.17.1.bb <http://snort_2.9.17.1.bb>}    |   2 +-
>      .../lldpd/{lldpd_1.0.4.bb <http://lldpd_1.0.4.bb> =>
>     lldpd_1.0.8.bb <http://lldpd_1.0.8.bb>}  |   4 +-
>      ...etchmail_6.4.17.bb <http://etchmail_6.4.17.bb> =>
>     fetchmail_6.4.18.bb <http://fetchmail_6.4.18.bb>} |   2 +-
>      ...or-last-line-only-from-preprocessed-.patch |  57 -----
>      ...SCV-as-non-memory-mapped-I-O-archite.patch |  44 ++++
>      ...typecast-enum-conversions-explicitly.patch |  66 ++---
>      .../flashrom/flashrom/meson-fixes.patch       |  68 ++++++
>      meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
>     <http://flashrom_1.2.bb>  |  16 +-
>      .../0001-Include-limits.h-for-PATH_MAX.patch  |  25 --
>      .../phonet-utils/phonet-utils_git.bb
>     <http://phonet-utils_git.bb>          |  15 --
>      .../telepathy/telepathy-glib_0.24.1.bb
>     <http://telepathy-glib_0.24.1.bb>        |   4 +-
>      .../{zabbix_5.2.5.bb <http://zabbix_5.2.5.bb> => zabbix_5.2.6.bb
>     <http://zabbix_5.2.6.bb>}      |   4 +-
>      .../packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb>     | 210 ++++++++--------
>      ...ive_10.5.8.bb <http://ive_10.5.8.bb> =>
>     mariadb-native_10.5.9.bb <http://mariadb-native_10.5.9.bb>} |   0
>      meta-oe/recipes-dbs/mysql/mariadb.inc         |   5 +-
>      ...ck-if-syscall-exists-before-using-it.patch |  43 ++++
>      ...ktrace-t.c-make-the-test-conditional.patch |  38 ---
>      .../mysql/mariadb/c11_atomics.patch           |  16 +-
>      .../recipes-dbs/mysql/mariadb/sys_futex.patch |  22 ++
>      .../{mariadb_10.5.8.bb <http://mariadb_10.5.8.bb> =>
>     mariadb_10.5.9.bb <http://mariadb_10.5.9.bb>}  |   0
>      .../recipes-devtools/nodejs/nodejs_12.21.0.bb
>     <http://nodejs_12.21.0.bb> |   2 +-
>      .../{ostree_2020.8.bb <http://ostree_2020.8.bb> =>
>     ostree_2021.1.bb <http://ostree_2021.1.bb>}    |   2 +-
>      ...-tests-disable-the-check-for-inotify.patch |  46 ++++
>      .../rsyslog/rsyslog/run-ptest                 |   6 +-
>      .../rsyslog/rsyslog_8.2102.0.bb <http://rsyslog_8.2102.0.bb>     
>              |  15 +-
>      .../uml-utilities/uml-utilities_20040406.bb
>     <http://uml-utilities_20040406.bb>   |   5 +-
>      .../fbgrab/{fbgrab_1.4.bb <http://fbgrab_1.4.bb> => fbgrab_1.5.bb
>     <http://fbgrab_1.5.bb>}   |   2 +-
>      .../openjpeg/openjpeg_2.4.0.bb <http://openjpeg_2.4.0.bb>       
>             |   2 +
>      .../{libxaw_1.0.13.bb <http://libxaw_1.0.13.bb> =>
>     libxaw_1.0.14.bb <http://libxaw_1.0.14.bb>}    |   5 +-
>      meta-oe/recipes-kernel/bpftool/bpftool.bb <http://bpftool.bb>   
>      |  11 +-
>      .../recipes-multimedia/mplayer/mpv_0.32.0.bb
>     <http://mpv_0.32.0.bb>  |   4 +-
>      ...port.c-Fix-broken-d-bus-message-time.patch |  36 +++
>      meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>     <http://gpsd_3.20.bb>  |   1 +
>      .../emacs/{emacs_27.1.bb <http://emacs_27.1.bb> => emacs_27.2.bb
>     <http://emacs_27.2.bb>}    |   2 +-
>      .../libcppkafka/libcppkafka_git.bb <http://libcppkafka_git.bb>   
>             |  22 ++
>      .../libmanette/libmanette_0.2.6.bb <http://libmanette_0.2.6.bb> 
>               |  16 ++
>      .../0001_fix_absolute_path_usage.patch        |  83 +++++++
>      .../librdkafka/librdkafka_1.6.1.bb <http://librdkafka_1.6.1.bb> 
>               |  23 ++
>      .../recipes-support/libssh/libssh_0.8.9.bb
>     <http://libssh_0.8.9.bb>    |   6 +-
>      .../0001-Migrate-to-use-g_memdup2.patch       | 192 +++++++++++++++
>      .../pidgin/pidgin-sipe_1.25.0.bb <http://pidgin-sipe_1.25.0.bb> 
>                 |   1 +
>      ...tock-glib-macro-to-define-boxed-type.patch | 228
>     ++++++++++++++++++
>      ...rrecly-used-volatile-from-enum-type-.patch |  47 ++++
>      .../poppler/poppler_21.03.0.bb <http://poppler_21.03.0.bb>       
>             |   2 +
>      .../libnet/libnet-ssleay-perl_1.85.bb
>     <http://libnet-ssleay-perl_1.85.bb>         |   1 +
>      ....7.4.bb <http://7.4.bb> => python3-aiohttp_3.7.4.post0.bb
>     <http://python3-aiohttp_3.7.4.post0.bb>} |   2 +-
>      ...ray_1.8.1.bb <http://ray_1.8.1.bb> =>
>     python3-bitarray_1.9.0.bb <http://python3-bitarray_1.9.0.bb>} |   2 +-
>      ....2.6.bb <http://2.6.bb> => python3-cheetah_3.2.6.post1.bb
>     <http://python3-cheetah_3.2.6.post1.bb>} |   2 +-
>      ....bb => python3-contextlib2_0.6.0.post1.bb
>     <http://python3-contextlib2_0.6.0.post1.bb>} |   3 +-
>      ...or_4.4.2.bb <http://or_4.4.2.bb> => python3-decorator_5.0.1.bb
>     <http://python3-decorator_5.0.1.bb>} |   3 +-
>      ...utils_0.16.bb <http://utils_0.16.bb> =>
>     python3-docutils_0.17.bb <http://python3-docutils_0.17.bb>} |   5 +-
>      ...python3-google-api-python-client_2.1.0.bb
>     <http://python3-google-api-python-client_2.1.0.bb>} |   2 +-
>      .../0001-setup.py-Fix-numpy-version.patch     |   8 +-
>      ...1-setup_build.py-avoid-absolute-path.patch |   4 +-
>      ...n3-h5py_3.1.0.bb <http://n3-h5py_3.1.0.bb> =>
>     python3-h5py_3.2.1.bb <http://python3-h5py_3.2.1.bb>} |   3 +-
>      ...2_0.19.0.bb <http://2_0.19.0.bb> => python3-httplib2_0.19.1.bb
>     <http://python3-httplib2_0.19.1.bb>} |   2 +-
>      ...b_3.3.4.bb <http://b_3.3.4.bb> => python3-matplotlib_3.4.1.bb
>     <http://python3-matplotlib_3.4.1.bb>} |   5 +-
>      ...workx_2.5.bb <http://workx_2.5.bb> =>
>     python3-networkx_2.5.1.bb <http://python3-networkx_2.5.1.bb>} |   3 +-
>      ...-parso_0.8.1.bb <http://parso_0.8.1.bb> =>
>     python3-parso_0.8.2.bb <http://python3-parso_0.8.2.bb>} |   2 +-
>      ...illow_8.1.2.bb <http://illow_8.1.2.bb> =>
>     python3-pillow_8.2.0.bb <http://python3-pillow_8.2.0.bb>} |   4 +-
>      ...p_2.4.140.bb <http://p_2.4.140.bb> =>
>     python3-pymisp_2.4.141.bb <http://python3-pymisp_2.4.141.bb>} |   2 +-
>      ...2_0.5.15.bb <http://2_0.5.15.bb> => python3-pyroute2_0.5.16.bb
>     <http://python3-pyroute2_0.5.16.bb>} |   2 +-
>      ...os_0.0.40.bb <http://os_0.0.40.bb> =>
>     python3-pysonos_0.0.41.bb <http://python3-pysonos_0.0.41.bb>} |   2 +-
>      ...2021.3.17.bb <http://2021.3.17.bb> =>
>     python3-regex_2021.4.4.bb <http://python3-regex_2021.4.4.bb>} |   2 +-
>      ...y_1.4.3.bb <http://y_1.4.3.bb> => python3-sqlalchemy_1.4.4.bb
>     <http://python3-sqlalchemy_1.4.4.bb>} |   2 +-
>      ...-tqdm_4.58.0.bb <http://tqdm_4.58.0.bb> =>
>     python3-tqdm_4.59.0.bb <http://python3-tqdm_4.59.0.bb>} |   2 +-
>      ..._2.11.1.bb <http://2.11.1.bb> => python3-typeguard_2.12.0.bb
>     <http://python3-typeguard_2.12.0.bb>} |   2 +-
>      ...r_1.3.7.bb <http://r_1.3.7.bb> => python3-xlsxwriter_1.3.8.bb
>     <http://python3-xlsxwriter_1.3.8.bb>} |   5 +-
>      79 files changed, 1197 insertions(+), 449 deletions(-)
>      create mode 100644
>     meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.patch
>      rename
>     meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.2.4.bb
>     <http://gnome-autoar_0.2.4.bb> => gnome-autoar_0.3.1.bb
>     <http://gnome-autoar_0.3.1.bb>} (66%)
>      delete mode 100644
>     meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
>      rename
>     meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.20.bb
>     <http://freeradius_3.0.20.bb> => freeradius_3.0.21.bb
>     <http://freeradius_3.0.21.bb>} (98%)
>      rename
>     meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.12.bb
>     <http://networkmanager-openvpn_1.8.12.bb> =>
>     networkmanager-openvpn_1.8.14.bb
>     <http://networkmanager-openvpn_1.8.14.bb>} (91%)
>      rename
>     meta-networking/recipes-connectivity/snort/{snort_2.9.17.bb
>     <http://snort_2.9.17.bb> => snort_2.9.17.1.bb
>     <http://snort_2.9.17.1.bb>} (97%)
>      rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.4.bb
>     <http://lldpd_1.0.4.bb> => lldpd_1.0.8.bb <http://lldpd_1.0.8.bb>}
>     (94%)
>      rename
>     meta-networking/recipes-support/fetchmail/{fetchmail_6.4.17.bb
>     <http://fetchmail_6.4.17.bb> => fetchmail_6.4.18.bb
>     <http://fetchmail_6.4.18.bb>} (91%)
>      delete mode 100644
>     meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
>      create mode 100644
>     meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
>      create mode 100644
>     meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
>      delete mode 100644
>     meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
>      delete mode 100644
>     meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
>     <http://phonet-utils_git.bb>
>      rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.5.bb
>     <http://zabbix_5.2.5.bb> => zabbix_5.2.6.bb
>     <http://zabbix_5.2.6.bb>} (95%)
>      rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb
>     <http://mariadb-native_10.5.8.bb> => mariadb-native_10.5.9.bb
>     <http://mariadb-native_10.5.9.bb>} (100%)
>      create mode 100644
>     meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>      delete mode 100644
>     meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>      create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
>      rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb
>     <http://mariadb_10.5.8.bb> => mariadb_10.5.9.bb
>     <http://mariadb_10.5.9.bb>} (100%)
>      rename meta-oe/recipes-extended/ostree/{ostree_2020.8.bb
>     <http://ostree_2020.8.bb> => ostree_2021.1.bb
>     <http://ostree_2021.1.bb>} (99%)
>      create mode 100644
>     meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
>      rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.4.bb
>     <http://fbgrab_1.4.bb> => fbgrab_1.5.bb <http://fbgrab_1.5.bb>} (89%)
>      rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb
>     <http://libxaw_1.0.13.bb> => libxaw_1.0.14.bb
>     <http://libxaw_1.0.14.bb>} (82%)
>      create mode 100644
>     meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch
>      rename meta-oe/recipes-support/emacs/{emacs_27.1.bb
>     <http://emacs_27.1.bb> => emacs_27.2.bb <http://emacs_27.2.bb>} (99%)
>      create mode 100644
>     meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
>     <http://libcppkafka_git.bb>
>      create mode 100644
>     meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
>     <http://libmanette_0.2.6.bb>
>      create mode 100644
>     meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
>      create mode 100644
>     meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
>     <http://librdkafka_1.6.1.bb>
>      create mode 100644
>     meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
>      create mode 100644
>     meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch
>      create mode 100644
>     meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch
>      rename
>     meta-python/recipes-devtools/python/{python3-aiohttp_3.7.4.bb
>     <http://python3-aiohttp_3.7.4.bb> =>
>     python3-aiohttp_3.7.4.post0.bb
>     <http://python3-aiohttp_3.7.4.post0.bb>} (88%)
>      rename
>     meta-python/recipes-devtools/python/{python3-bitarray_1.8.1.bb
>     <http://python3-bitarray_1.8.1.bb> => python3-bitarray_1.9.0.bb
>     <http://python3-bitarray_1.9.0.bb>} (77%)
>      rename
>     meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.bb
>     <http://python3-cheetah_3.2.6.bb> =>
>     python3-cheetah_3.2.6.post1.bb
>     <http://python3-cheetah_3.2.6.post1.bb>} (80%)
>      rename
>     meta-python/recipes-devtools/python/{python3-contextlib2_0.6.0.bb
>     <http://python3-contextlib2_0.6.0.bb> =>
>     python3-contextlib2_0.6.0.post1.bb
>     <http://python3-contextlib2_0.6.0.post1.bb>} (67%)
>      rename
>     meta-python/recipes-devtools/python/{python3-decorator_4.4.2.bb
>     <http://python3-decorator_4.4.2.bb> => python3-decorator_5.0.1.bb
>     <http://python3-decorator_5.0.1.bb>} (79%)
>      rename
>     meta-python/recipes-devtools/python/{python3-docutils_0.16.bb
>     <http://python3-docutils_0.16.bb> => python3-docutils_0.17.bb
>     <http://python3-docutils_0.17.bb>} (52%)
>      rename
>     meta-python/recipes-devtools/python/{python3-google-api-python-client_2.0.2.bb
>     <http://python3-google-api-python-client_2.0.2.bb> =>
>     python3-google-api-python-client_2.1.0.bb
>     <http://python3-google-api-python-client_2.1.0.bb>} (78%)
>      rename meta-python/recipes-devtools/python/{python3-h5py_3.1.0.bb
>     <http://python3-h5py_3.1.0.bb> => python3-h5py_3.2.1.bb
>     <http://python3-h5py_3.2.1.bb>} (87%)
>      rename
>     meta-python/recipes-devtools/python/{python3-httplib2_0.19.0.bb
>     <http://python3-httplib2_0.19.0.bb> => python3-httplib2_0.19.1.bb
>     <http://python3-httplib2_0.19.1.bb>} (77%)
>      rename
>     meta-python/recipes-devtools/python/{python3-matplotlib_3.3.4.bb
>     <http://python3-matplotlib_3.3.4.bb> =>
>     python3-matplotlib_3.4.1.bb <http://python3-matplotlib_3.4.1.bb>}
>     (85%)
>      rename
>     meta-python/recipes-devtools/python/{python3-networkx_2.5.bb
>     <http://python3-networkx_2.5.bb> => python3-networkx_2.5.1.bb
>     <http://python3-networkx_2.5.1.bb>} (70%)
>      rename
>     meta-python/recipes-devtools/python/{python3-parso_0.8.1.bb
>     <http://python3-parso_0.8.1.bb> => python3-parso_0.8.2.bb
>     <http://python3-parso_0.8.2.bb>} (75%)
>      rename
>     meta-python/recipes-devtools/python/{python3-pillow_8.1.2.bb
>     <http://python3-pillow_8.1.2.bb> => python3-pillow_8.2.0.bb
>     <http://python3-pillow_8.2.0.bb>} (86%)
>      rename
>     meta-python/recipes-devtools/python/{python3-pymisp_2.4.140.bb
>     <http://python3-pymisp_2.4.140.bb> => python3-pymisp_2.4.141.bb
>     <http://python3-pymisp_2.4.141.bb>} (91%)
>      rename
>     meta-python/recipes-devtools/python/{python3-pyroute2_0.5.15.bb
>     <http://python3-pyroute2_0.5.15.bb> => python3-pyroute2_0.5.16.bb
>     <http://python3-pyroute2_0.5.16.bb>} (90%)
>      rename
>     meta-python/recipes-devtools/python/{python3-pysonos_0.0.40.bb
>     <http://python3-pysonos_0.0.40.bb> => python3-pysonos_0.0.41.bb
>     <http://python3-pysonos_0.0.41.bb>} (79%)
>      rename
>     meta-python/recipes-devtools/python/{python3-regex_2021.3.17.bb
>     <http://python3-regex_2021.3.17.bb> => python3-regex_2021.4.4.bb
>     <http://python3-regex_2021.4.4.bb>} (77%)
>      rename
>     meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.3.bb
>     <http://python3-sqlalchemy_1.4.3.bb> =>
>     python3-sqlalchemy_1.4.4.bb <http://python3-sqlalchemy_1.4.4.bb>}
>     (85%)
>      rename
>     meta-python/recipes-devtools/python/{python3-tqdm_4.58.0.bb
>     <http://python3-tqdm_4.58.0.bb> => python3-tqdm_4.59.0.bb
>     <http://python3-tqdm_4.59.0.bb>} (78%)
>      rename
>     meta-python/recipes-devtools/python/{python3-typeguard_2.11.1.bb
>     <http://python3-typeguard_2.11.1.bb> =>
>     python3-typeguard_2.12.0.bb <http://python3-typeguard_2.12.0.bb>}
>     (87%)
>      rename
>     meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.7.bb
>     <http://python3-xlsxwriter_1.3.7.bb> =>
>     python3-xlsxwriter_1.3.8.bb <http://python3-xlsxwriter_1.3.8.bb>}
>     (51%)
>
>     -- 
>     2.17.1
>
>
>     
>

