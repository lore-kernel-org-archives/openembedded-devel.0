Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.2641.1611263409388594285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 13:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U1uvHho2;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d15so2621726qtw.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 13:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ERW2+f8Kb6tpVpbzdT6loZvUl+7HOCgqgYZl5avVQU=;
        b=U1uvHho2W+8kfP7KZMOY9n46/DKQpxlOBKr4pY39frtj97uQuLrq9wQ8WEBHyzvJEh
         fhV99sqTOPrlfowwa/lGfnR/YHw/0PIs9OUmaQHbiwzMa6Ompe3hhJo6eUpCJSbqxpzo
         QW/QP6Z1CXlAv7922iyKe4T2ovKgt7x59p/9TlyUqUTa/DQ7TiqSR26sgOrOpD1zn1YW
         +2HXrMSmqE2S0qLit8AW12SWbBf3INozwbaCKqf5VRD2g+S1P+11+CyCZaxp5KAmdnHR
         WzW6lqx7iEsrNaOxbwEy+EXc0aqXV/K65zu9yLkFq5tLDI+tPnZgRDXpfI8I3e/+3lSB
         tTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ERW2+f8Kb6tpVpbzdT6loZvUl+7HOCgqgYZl5avVQU=;
        b=J7j2/L1e92fzV5swMewfmpo/a7WSds4cRDWdtQnuYa1zPyjXDs9PzDS5k+RWfWmDuP
         rfCAobkM5E7fG1vz+05LnXiN4jszHB8jeAuN6Q5vFIsBdJdUWtAUdZrz0DBW97zdOg2o
         KKoSexZIqUEdxbzhN4G2KUQYY5xLF6sXbrOSL7XiRJakPX4zy/45wVmpiQMFO7ibSnqO
         QdJrl0foaHdfGJeL12D2VwMB931AlW7LoxGFWS9/5YHoaCDW9j9mhCZLD6Q0VaGUJDBU
         kjsmdrOJqxbLJGCvRW3FHMg9xfUtaGNkvHIy33BTKQDqGcgP3pnrBOK7hZHkBeSTul6P
         PCaw==
X-Gm-Message-State: AOAM530XPo/W/QzvIiisg4G2BJ40d8KXRjjwNi7O0rSorx0YfBOO79An
	rdXcTyMKU6BFBrKLtfgNId8wHjrDgf/5pivdH3M=
X-Google-Smtp-Source: ABdhPJwhWv7Rx/Ix9aEI6XdRgjEOYwyTXnygg96CRgJ6DCXXNeX6/rnXszBX2kqajwjwshpdLso5xgNmpC29SRYMA0A=
X-Received: by 2002:ac8:6714:: with SMTP id e20mr1551654qtp.378.1611263408387;
 Thu, 21 Jan 2021 13:10:08 -0800 (PST)
MIME-Version: 1.0
References: <165BD7203D261159.3497@lists.openembedded.org> <56cba49c-633d-6f7b-af00-0ce75beae3f6@gmail.com>
In-Reply-To: <56cba49c-633d-6f7b-af00-0ce75beae3f6@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 21 Jan 2021 13:09:42 -0800
Message-ID: <CAMKF1sr1i5_45Q6RqDiPzTkoUkGpRs43MUOWZtEau6=H7T7xdA@mail.gmail.com>
Subject: Re: [oe] Gatesgarth pull request Jan 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 21, 2021 at 7:58 AM akuster808 <akuster808@gmail.com> wrote:
>
>
> The Dunfell merge request sent after this got merged. Is their an issue
> Gatesgarth?
>

No issues found, I was doing a local build which got stuck. It should be in now.

> -armin
>
> On 1/19/21 8:43 PM, akuster via lists.openembedded.org wrote:
> > The following changes since commit b9dcf17700014dec679307dc1247882dccd439ca:
> >
> >   Revert "numactl: Remove the recipe" (2020-11-05 09:00:37 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/meta-openembedded gatesgarth-next
> >
> > for you to fetch changes up to 6ff4bd4f345b4e8030b9197d13097308df521576:
> >
> >   postgresql: Update to 12.5 (2021-01-18 08:20:58 -0800)
> >
> > ----------------------------------------------------------------
> > Armin Kuster (2):
> >       Revert "gnome-calendar: update to 3.38.1, add libhandy 1.x support"
> >       wireshark: Several securtiy fixes
> >
> > Chen Qi (1):
> >       tclap: fix branch
> >
> > Chencheng Zhang (1):
> >       tclap: align version to tag v1.2.2
> >
> > Diego Santa Cruz (2):
> >       gssdp: Upgrade to 1.2.2 -> 1.2.3
> >       gupnp: Upgrade to 1.2.2 -> 1.2.4
> >
> > Gianfranco (1):
> >       dlt-daemon: add upstream patch to fix CVE-2020-29394
> >
> > He Zhe (1):
> >       lmbench: Fix setting LDLIBS failure
> >
> > Hongxu Jia (1):
> >       lvm2.inc: switch branch master to main
> >
> > Joe Slater (1):
> >       multipath-tools: fix error handling for
> > udev_monitor_set_receive_buffer_size
> >
> > Kai Kang (1):
> >       colord: fix installed-vs-shipped error
> >
> > Khem Raj (4):
> >       pidgin-sipe: Do not add native libdir to pkgconfig search path
> >       sdbus-c++-libsystemd: Fix reallocarray check in meson
> >       networkmanager: Fix reallocarray check in meson and configure
> >       postgresql: Use /dev/urandom when openssl is not used
> >
> > Martin Jansa (1):
> >       nanopb: move to dynamic-layers
> >
> > Max Kellermann (1):
> >       php: remove the failing ${D}/${TMPDIR} code
> >
> > Mikko Rapeli (1):
> >       fuse: set CVE_PRODUCT to "fuse_project:fuse"
> >
> > Philip Balister (1):
> >       spdlog: Fix recipe so other recipes can use spdlog with external fmt.
> >
> > Robert Joslyn (1):
> >       postgresql: Update to 12.5
> >
> > Roland Hieber (5):
> >       pcsc-lite: provide pcsc-lite-lib-native explicitly for native build
> >       lockfile-progs: use DEBIAN_MIRROR in SRC_URI
> >       liboop: use upstream SRC_URI
> >       fbset: use DEBIAN_MIRROR in SRC_URI
> >       openct: use upstream SRC_URI
> >
> > Sean Nyekjaer (1):
> >       nodejs: 12.19.1 -> 12.20.1
> >
> > Stacy Gaikovaia (1):
> >       nodejs: 12.19.0 -> 12.19.1
> >
> > Vyacheslav Yurkov (1):
> >       python3-aiohttp: added missing RDEPENDs
> >
> > Wang Mingyu (1):
> >       zabbix: CVE-2020-15803 Security Advisory
> >
> > Yi Zhao (2):
> >       minifi-cpp: depend on nettle and lz4
> >       ebtables: do not install /etc/ethertypes
> >
> > Zang Ruochen (1):
> >       mcpp: Normalize the patch format of CVE
> >
> > Zheng Ruoqin (4):
> >       samba: CVE-2020-14318 Security Advisory
> >       samba: CVE-2020-14383 Security Advisory
> >       php: CVE-2020-7070
> >       php: CVE-2020-7069
> >
> > jabdoa2 (2):
> >       libsdl2-mixer: Fix ogg/vorbis support in libsdl2-mixer
> >       libsdl2-mixer: set --disable-music-ogg-shared to link statically
> >
> > viatsk (1):
> >       tcpdump: Patch for CVE-2020-8037
> >
> >  .../recipes-support/fuse/fuse3_3.9.3.bb            |   2 +
> >  .../recipes-support/fuse/fuse_2.9.9.bb             |   2 +
> >  .../8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch | 242
> > ---------------------
> >  ...calendar_3.38.1.bb => gnome-calendar_3.36.2.bb} |   3 +-
> >  .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}       |   4 +-
> >  .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}       |   4 +-
> >  .../networkmanager/fix_reallocarray_check.patch    |  27 +++
> >  .../networkmanager/networkmanager_1.22.14.bb       |   1 +
> >  .../samba/samba/CVE-2020-14318.patch               | 142 ++++++++++++
> >  .../samba/samba/CVE-2020-14383.patch               | 112 ++++++++++
> >  .../recipes-connectivity/samba/samba_4.10.18.bb    |   2 +
> >  ...01-Makefile-do-not-install-etc-ethertypes.patch |  35 +++
> >  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   3 +-
> >  ...-escaping-don-t-allocate-a-too-large-buff.patch |  70 ++++++
> >  .../recipes-support/tcpdump/tcpdump_4.9.3.bb       |   1 +
> >  .../{wireshark_3.2.7.bb => wireshark_3.2.10.bb}    |   2 +-
> >  .../recipes-devtools/nanopb/nanopb_0.4.3.bb        |   0
> >  ...t-CFLAGS-LDFLAGS-to-append-values-passed-.patch |   2 +-
> >  .../zabbix/zabbix/CVE-2020-15803.patch             |  36 +++
> >  .../recipes-connectivity/zabbix/zabbix_4.4.6.bb    |   1 +
> >  .../0001-meson-Fix-reallocarray-check.patch        |  25 +++
> >  .../sdbus-c++/sdbus-c++-libsystemd_243.bb          |   1 +
> >  meta-oe/recipes-dbs/postgresql/postgresql.inc      |   2 +-
> >  .../{postgresql_12.4.bb => postgresql_12.5.bb}     |   2 +-
> >  .../mcpp/files/CVE-2019-14274.patch                |  34 +++
> >  meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch |  31 ---
> >  meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb        |   3 +-
> >  .../{nodejs_12.19.0.bb => nodejs_12.20.1.bb}       |   4 +-
> >  .../recipes-devtools/php/php/CVE-2020-7069.patch   | 158 ++++++++++++++
> >  .../recipes-devtools/php/php/CVE-2020-7070.patch   |  24 ++
> >  meta-oe/recipes-devtools/php/php_7.4.9.bb          |  11 +-
> >  meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb      |   4 +-
> >  .../dlt-daemon/dlt-daemon/275.patch                |  38 ++++
> >  .../dlt-daemon/dlt-daemon_2.18.5.bb                |   1 +
> >  .../lockfile-progs/lockfile-progs_0.1.18.bb        |   2 +-
> >  .../minifi-cpp/minifi-cpp_0.7.0.bb                 |   2 +-
> >  .../recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb |   2 +-
> >  meta-oe/recipes-support/colord/colord.bb           |   2 +-
> >  meta-oe/recipes-support/fbset/fbset_2.1.bb         |   2 +-
> >  meta-oe/recipes-support/liboop/liboop_1.0.1.bb     |   2 +-
> >  meta-oe/recipes-support/lvm2/lvm2.inc              |   2 +-
> >  ...h-uevent.c-fix-error-handling-for-udev_mo.patch |  39 ++++
> >  .../multipath-tools/multipath-tools_0.8.4.bb       |   1 +
> >  meta-oe/recipes-support/openct/openct_0.6.20.bb    |   2 +-
> >  .../recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb   |   1 +
> >  ...o-not-add-native-paths-to-pkgconfig-searc.patch |  36 +++
> >  .../recipes-support/pidgin/pidgin-sipe_1.25.0.bb   |   1 +
> >  .../0001-Enable-use-of-external-fmt-library.patch  |  26 +++
> >  meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb     |   5 +-
> >  .../python/python3-aiohttp_3.7.2.bb                |   4 +-
> >  50 files changed, 849 insertions(+), 309 deletions(-)
> >  delete mode 100644
> > meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch
> >  rename
> > meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_3.38.1.bb =>
> > gnome-calendar_3.36.2.bb} (78%)
> >  rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb =>
> > gssdp_1.2.3.bb} (83%)
> >  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb =>
> > gupnp_1.2.4.bb} (64%)
> >  create mode 100644
> > meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> >  create mode 100644
> > meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
> >  create mode 100644
> > meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
> >  create mode 100644
> > meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
> >  create mode 100644
> > meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
> >  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb =>
> > wireshark_3.2.10.bb} (96%)
> >  rename meta-oe/{ =>
> > dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)
> >  create mode 100644
> > meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
> >  create mode 100644
> > meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
> >  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.4.bb =>
> > postgresql_12.5.bb} (73%)
> >  create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
> >  rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.0.bb =>
> > nodejs_12.20.1.bb} (97%)
> >  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
> >  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
> >  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
> >  create mode 100644
> > meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
> >  create mode 100644
> > meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
> >  create mode 100644
> > meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch
> >
> >
> > 
> >
>
