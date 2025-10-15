Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A453BCCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:08:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.11298.1760519294966880550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fSPfrCxM;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso5405579f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760519293; x=1761124093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfplDgCPE39MM2k19q8uZqR1dZPN198Y6g91vT1zU1I=;
        b=fSPfrCxMTXtm3gInJ068ALcLX4wTq2Z2OKLpfvXBa3K5m1hwQKph+Pk6SfRZFkMHsV
         6fyHe+6OEOSHc3WzlE6e9LyYoJmrhCjx6jlvwZFlSt/tzlEOm4HypXfdBw7lJcqe3MVz
         LBwLKWVgDOhlHj4+kV/asZJWbAxBnglrn8WOKggVMiYyd+L908DhZ3DvgbNtzr4Dx+kj
         j0t1YnkD2xIN3R91Jnnc4aq4g4KyX8Jy/LK0eD3HdUtfruu38CqVgzR+oEawuv1o+/Aj
         yU71SQYSZq0c58cTXDky0oRlbzkuyPzDFy2ChxwUlydUgSaPFP9SbWMt7KJwVoyC7JpW
         FzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760519293; x=1761124093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfplDgCPE39MM2k19q8uZqR1dZPN198Y6g91vT1zU1I=;
        b=iGadYt2kSYUv6YrgrRN5B3KtAJjAaSqzgk6zwZqaEbgzh6HYnMyId6khxXQjbhd5fc
         CGk1e7OGBR8lBjDyI1/xw3zv4oTM2ERNlFy/srJbc+wUhnkkN6moTTa8FsdLZRUGtRxw
         3VIzKR6n7mzS6FmggZ161uxgs/2vCm0rPRw3NKor9VmQhwx601nsvWNA/UxcxE4DbtjI
         OiNsrC+Sg8DaoSth/DRIYXll9eLNgPuGIuw9iXji05L4z8dp5qCVaRcTDQ+XnuO5dCp4
         Mvp2DRPT40iRgVBzN/20yliypwb4V+buX9+iFkJiPYu+xrqtfADr/cu5dgptLslwmFro
         CC3g==
X-Gm-Message-State: AOJu0Yx/axl8MUOHlh9AJeLPsBLLry+8wHngPaqfDDKsM3Yn8fknPSC7
	EKi/RsNCy12RepS6eqx9uEJgv/l15YXigiF7qmM/IDNYV5v1al6qdEF1sXamCQ==
X-Gm-Gg: ASbGnct6FuzGavLSlIakwmdZe5Rs0CbsWchHjo9mQ0O45j7W4ZibPxn7Pqe335r7xiJ
	U7PkEL/xIHXhyX32B3yf1xKtdBHzqVu8RaHPBCPUXYnYXwQAq6AsXg8iVHxkvKQX1dJpnbrEh8Z
	aP7gaXs0NVzl07JEavY8c5T4GK4VYjcWQzyB/L+yTgKW1bTD9NUKFeUTTkZlMAETxQ53XdGyLYW
	HubzCk/dot7QB3WK4oFhH/w6qTlA9OATDCLdlW+TIK0+2KdQVfLzoLy9tk3An4O48YCL6c2Krf0
	CNWzIgtm+U3jz5z611CHPIFjKosD9oEL76TooRYpIn68yb21wk69rmzF7LY1+stEpYjTl8g/5C1
	eN6p2zvSnCfxCiRE4TYno5W9wwMZx5Zcs9RJR+PupZ9/JUpvEfA==
X-Google-Smtp-Source: AGHT+IGF3eG4DFntaB3KLFvI3aslfs16BFxjbntoHElgrLfc+xcqdhj1PajGQQyYyLJOgDnAtBpDnw==
X-Received: by 2002:a05:6000:200f:b0:425:7cf6:5b9e with SMTP id ffacd0b85a97d-42666ac60f1mr17018374f8f.3.1760519292774;
        Wed, 15 Oct 2025 02:08:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5825aasm27601101f8f.14.2025.10.15.02.08.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:08:12 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Walnascar Pull Request Oct 15th
Date: Wed, 15 Oct 2025 11:08:08 +0200
Message-ID: <20251015090811.625601-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 09:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120700

Hello,

This is what's intended to be the last pull request for Walnascar branch.

This is somewhat bigger than usual, it contains a number of CVE-fixes and minor
version updates (thank you everyone involved).

arm build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/18458276556/job/52583748632
aarch64 build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/18458400620/job/52584106553
x86 build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/18458402760/job/52584113425
x86-64 build logs: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/18458406025/job/52584122824
YP compatibility check: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/18461359873/job/52593373926

Please let me know if you have any questions or concerns.

---

The following changes since commit 80ab58cc404959ae2f0e8b2e68935b3bfd8e8cfe:

  readme: update maintainer (2025-09-16 08:37:07 +0200)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/walnascar-nut

for you to fetch changes up to 07330a98cf93806b7a4e0170a541b94962ff3960:

  libppd: patch CVE-2024-47175 (2025-10-13 09:21:32 +0200)

----------------------------------------------------------------
Ankur Tyagi (15):
      lsscsi: fix versioning
      zlog: fix CVE-2024-22857
      libiec61850: patch CVE-2024-26529
      libiec61850: patch CVE-2024-45971
      libiec61850: patch CVE-2024-45970
      libcupsfilters: patch CVE-2024-47076
      libraw: patch CVE-2025-43961 CVE-2025-43962
      libraw: patch CVE-2025-43963
      libraw: patch CVE-2025-43964
      tinyproxy: patch CVE-2023-49606
      hdf5: patch CVE-2025-2923
      hdf5: patch CVE-2025-2924
      hdf5: patch CVE-2025-2925
      hdf5: patch CVE-2025-6269
      libppd: patch CVE-2024-47175

Archana Polampalli (1):
      tcpreplay: upgrade 4.5.1 -> 4.5.2

Bartosz Golaszewski (1):
      libgpiod: update to v2.2.2

Changqing Li (2):
      pahole: fix a Segmentation fault error
      lsscsi: upgrade to version 0.32

Denis OSTERLAND-HEIM (1):
      libusbgx: fix example gadget start

Divya Chellam (1):
      cjson: upgrade 1.7.18 -> 1.7.19

Gyorgy Sarvari (43):
      pm-qa: update git fetch protocol
      tokyocabinet: switch to working SRC_URI
      tokyocabinet: fix license
      readme: update maintainer
      collectd: set working SRC_URI
      mosh: set working SRC_URI
      nmap: set correct license
      daemonize: update to latest revision
      apache2: patch CVE-2025-54090
      civetweb: patch CVE-2025-55763
      dovecot: patch CVE-2022-30550
      emacs: patch CVE-2024-30202
      emacs: patch CVE-2024-30203
      emacs: patch CVE-2024-30204
      emacs: patch CVE-2024-30205
      emacs: patch CVE-2024-39331
      wireshark: patch CVE-2025-5601
      redis: ignore CVE-2025-21605
      redis: patch CVE-2025-27151
      redis: patch CVE-2025-32023
      redis: patch CVE-2025-48367
      python3-django: ignore CVE-2025-27556
      exiv2: patch CVE-2025-26623
      exiv2: patch CVE-2025-54080
      exiv2: patch CVE-2025-55304
      gimp: ignore CVE-2025-8672
      gimp: patch CVE-2025-5473
      imagemagick: patch CVE-2025-53014
      imagemagick: patch CVE-2025-53015
      imagemagick: patch CVE-2025-53019
      imagemagick: patch CVE-2025-53101
      imagemagick: patch CVE-2025-55004
      imagemagick: patch CVE-2025-55005
      imagemagick: patch CVE-2025-55154
      imagemagick: patch CVE-2025-55160
      imagemagick: patch CVE-2025-55212
      imagemagick: patch CVE-2025-57803
      imagemagick: patch CVE-2025-57807
      iperf2: ignore irrelevant CVEs
      jasper: patch CVE-2025-8835
      jasper: patch CVE-2025-8836
      jasper: patch CVE-2025-8837
      libavif: patch CVE-2025-48174

Jason Schonberg (1):
      Remove the use of http://ftp.gnome.org/pub/gnome

Jeroen Hofstee (1):
      php: ignore CVE-2024-3566

Jiaying Song (2):
      webkitgtk3: fix build failure with DEBUG_BUILD enabled
      webkitgtk3: fix do_configure error on beaglebone-yocto

Khem Raj (2):
      tomlplusplus: Fix test failures with clang/libcxx
      safec: Pass Qunused-arguments when using clang

Kéléfa Sané (1):
      crash: fix reproducibility

Leon Anavi (1):
      ssd1306: Update to newer version

Libo Chen (1):
      python3-gpt-image: Add native and nativesdk targets to the build

Liu Yiding (2):
      freeradius: Fix service start error
      freeradius: Fix the multilib config

Louis Rannou (1):
      mosquitto: bump to 2.0.21

Markus Volk (1):
      malcontent: update 0.13.0 -> 0.13.1

Mikko Rapeli (1):
      fwupd-efi: update from 1.6 to 1.7

Nitin Wankhade (1):
      iperf3: Fix CVE-2025-54350

Nylon Chen (1):
      kernel-selftest: handle missing -64.h headers

Patrick Zacharias (1):
      libcanberra: Fix sound not playing on Colibri iMX8X

Peter Kjellerstedt (3):
      hostapd: Backport a patch to build SAE-PK correctly
      glog: Support building for native
      opencv: Support building for native

Praveen Kumar (2):
      fix: CVE-2025-53644
      polkit: fix CVE-2025-7519

Rajeshkumar Ramasamy (1):
      open-vm-tools: upgrade 12.5.0 -> 12.5.4

Sana Kazi (1):
      imagemagick: guard sed operations in do_install for optional files

Saravanan (1):
      udisks2: upgrade 2.10.1 -> 2.10.2

Sunil Dora (1):
      layer.conf: add bpftrace to NON_MULTILIB_RECIPES

Wang Mingyu (16):
      bolt: upgrade 0.9.6 -> 0.9.10
      gensio: upgrade 2.8.7 -> 2.8.15
      libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
      ser2net: upgrade 4.6.4 -> 4.6.5
      mm-common: upgrade 1.0.6 -> 1.0.7
      valijson: upgrade 1.0.4 -> 1.0.5
      valijson: upgrade 1.0.5 -> 1.0.6
      tk: upgrade 9.0.1 -> 9.0.2
      sexpect: upgrade 2.3.14 -> 2.3.15
      iptraf-ng: upgrade 1.2.1 -> 1.2.2
      libssh: upgrade 0.11.2 -> 0.11.3
      parallel: upgrade 20250322 -> 20250422
      parallel: upgrade 20250422 -> 20250522
      parallel: upgrade 20250522 -> 20250622
      parallel: upgrade 20250622 -> 20250722
      parallel: upgrade 20250722 -> 20250822

Yi Zhao (2):
      tk8: upgrade 8.6.15 -> 8.6.17
      nmap: set UPSTREAM_CHECK_REGEX

Yoann Congal (2):
      gutenprint: fix a build race-condition
      boinc-client: fix hostname reproducibility

Yogita Urade (1):
      indent: fix CVE-2023-40305

Zoltán Böszörményi (1):
      gutenprint: 5.3.5

hongxu (1):
      indent: fix CVE-2024-0911

jacobpanov (1):
      kernel-selftest: Fix PTP selftest compilation for kernel 6.7+

 README.md                                          |    2 +
 meta-filesystems/README.md                         |    2 +
 meta-gnome/README.md                               |    2 +
 .../0001-plug-ins-ZDI-CAN-26752-mitigation.patch   |   38 +
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb         |    3 +-
 meta-initramfs/README.md                           |    2 +
 meta-multimedia/README.md                          |    2 +
 ...01-Add-integer-overflow-check-to-makeRoom.patch |   27 +
 .../recipes-multimedia/libavif/libavif_1.0.1.bb    |    4 +-
 meta-networking/README.md                          |    1 +
 ...erflow-in-directory-URI-slash-redirection.patch |   57 +
 .../recipes-connectivity/civetweb/civetweb_1.16.bb |    1 +
 .../files/0018-Fix-Service-start-error.patch       |   33 +
 .../freeradius/freeradius_3.2.7.bb                 |    5 +-
 ...don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch |    7 +-
 ...se-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch} |    4 +-
 ...0-fixed-null-pointer-dereference-in-mmsSe.patch |   33 +
 ...7-replaced-unsafe-function-StringUtils_cr.patch |  218 +
 ...9-fixed-potential-buffer-overflows-in-MMS.patch |   73 +
 .../libiec61850/libiec61850_1.5.3.bb               |    5 +-
 .../mosquitto/files/2895.patch                     |    2 +-
 .../mosquitto/files/3238.patch                     |   25 +
 .../{mosquitto_2.0.20.bb => mosquitto_2.0.21.bb}   |    3 +-
 ...ndling-passdbs-with-identical-driver-args.patch |  136 +
 .../recipes-support/dovecot/dovecot_2.3.21.1.bb    |    1 +
 .../open-vm-tools/CVE-2025-22247.patch             |  378 --
 ...-vm-tools_12.5.0.bb => open-vm-tools_12.5.4.bb} |    3 +-
 .../{tcpreplay_4.5.1.bb => tcpreplay_4.5.2.bb}     |    2 +-
 .../tinyproxy/tinyproxy/0001-CVE-2023-49606.patch  |   59 +
 .../recipes-support/tinyproxy/tinyproxy_1.11.1.bb  |    1 +
 ...ot-allow-fence-to-go-beyond-column-size-w.patch |   61 +
 .../recipes-support/wireshark/wireshark_4.2.11.bb  |    1 +
 meta-oe/conf/include/non-repro-meta-oe.inc         |    3 -
 meta-oe/conf/layer.conf                            |    2 +-
 meta-oe/licenses/NPSL                              |  583 +++
 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb   |    3 +
 .../iperf3/iperf3/CVE-2025-54350.patch             |   24 +
 meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb    |    3 +-
 .../bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb}         |    2 +-
 ...erate_binary.py-Use-env-to-detect-python3.patch |   23 -
 .../fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}   |    5 +-
 .../lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}       |    8 +-
 .../gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb}   |    4 +-
 ...e-base64-for-hostapd-CONFIG_SAE_PK-builds.patch |   40 +
 .../recipes-connectivity/hostapd/hostapd_2.11.bb   |    1 +
 ...lue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} |    2 +-
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb    |    5 +-
 .../ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} |    2 +-
 .../libsigc++-2.0/libsigc++-2.0_2.12.1.bb          |    2 +-
 .../libsigc++-2.0/libsigc++-3_3.6.0.bb             |    2 +-
 .../{mm-common_1.0.6.bb => mm-common_1.0.7.bb}     |    4 +-
 .../proxy-libintl/proxy-libintl_20100902.bb        |    4 +-
 meta-oe/recipes-core/safec/safec_3.7.1.bb          |    3 +
 .../cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb}     |    2 +-
 meta-oe/recipes-devtools/glade/glade_3.36.0.bb     |    2 +-
 .../{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb}     |    4 +-
 ...ncoder-Fix-elf_functions-cleanup-on-error.patch |   54 +
 meta-oe/recipes-devtools/pahole/pahole_1.29.bb     |    3 +-
 meta-oe/recipes-devtools/php/php_8.4.10.bb         |    1 +
 .../{sexpect_2.3.14.bb => sexpect_2.3.15.bb}       |    4 +-
 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb    |    2 +-
 .../tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb}         |    2 +-
 .../tcltk/{tk_9.0.1.bb => tk_9.0.2.bb}             |    2 +-
 .../tomlplusplus/tomlplusplus_git.bb               |    4 +
 .../{valijson_1.0.4.bb => valijson_1.0.6.bb}       |    4 +-
 .../recipes-extended/boinc/boinc-client_7.20.5.bb  |    5 +-
 .../recipes-extended/collectd/collectd_5.12.0.bb   |    4 +-
 ...-a-heap-buffer-underread-in-set_buf_break.patch |  123 +
 .../indent/indent/CVE-2023-40305_0001.patch        | 4196 +++++++++++++++++++
 .../indent/indent/CVE-2023-40305_0002.patch        | 4254 ++++++++++++++++++++
 meta-oe/recipes-extended/indent/indent_2.2.12.bb   |    3 +
 .../{parallel_20250322.bb => parallel_20250822.bb} |    2 +-
 .../polkit/files/CVE-2025-7519.patch               |   34 +
 meta-oe/recipes-extended/polkit/polkit_126.bb      |    5 +-
 ...h-of-AOF-file-name-in-redis-check-aof-CVE.patch |   34 +
 ...bounds-write-in-hyperloglog-commands-CVE-.patch |  215 +
 ...t-even-if-accepted-connection-reports-an-.patch |  117 +
 .../redis/redis/0001-CVE-2025-27151.patch          |   31 +
 ...bounds-write-in-hyperloglog-commands-CVE-.patch |  215 +
 ...t-even-if-accepted-connection-reports-an-.patch |  107 +
 meta-oe/recipes-extended/redis/redis_6.2.18.bb     |    5 +
 meta-oe/recipes-extended/redis/redis_7.2.8.bb      |    4 +
 ...01-CVE-2024-22857-buffer-overflow-patched.patch |   31 +
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb       |    4 +-
 .../gnome-themes/gnome-themes-extra_3.28.bb        |    2 +-
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb         |    2 +-
 meta-oe/recipes-gnome/malcontent/malcontent.inc    |    6 +-
 .../jasper/jasper/0001-Fixes-400.patch             |  173 +
 .../jasper/jasper/0001-Fixes-401.patch             |   80 +
 .../jasper/jasper/0001-Fixes-402-403.patch         |   63 +
 meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb    |    6 +-
 meta-oe/recipes-kernel/crash/crash.inc             |    1 +
 ...01-Use-CC-env-var-to-get-compiler-version.patch |   48 +
 .../kernel-selftest/kernel-selftest.bb             |   17 +-
 .../cups/libcupsfilters/0001-CVE-2024-47076.patch  |   38 +
 .../recipes-printing/cups/libcupsfilters_2.0.0.bb  |    1 +
 .../cups/libppd/0001-CVE-2024-47175.patch          |  600 +++
 meta-oe/recipes-printing/cups/libppd_2.0.0.bb      |    5 +-
 ...build-race-condition-around-empty-directo.patch |   60 +
 .../{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb}   |    6 +-
 meta-oe/recipes-security/nmap/nmap_7.95.bb         |    5 +-
 ...c-too-many-arguments-to-function-write-er.patch |   46 -
 meta-oe/recipes-support/daemonize/daemonize_git.bb |    3 +-
 meta-oe/recipes-support/emacs/emacs_29.1.bb        |    5 +
 ...m-view.el-mm-display-inline-fontify-Mark-.patch |   27 +
 ...contents-Consider-all-remote-files-unsafe.patch |   38 +
 ...review-Add-protection-when-untrusted-cont.patch |   60 +
 ...pand-abbrev-Do-not-evaluate-arbitrary-uns.patch |   71 +
 ...cro-set-templates-Prevent-code-evaluation.patch |   47 +
 ...hod-appendIccProfile-to-fix-quadratic-per.patch |   96 +
 .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch      |   77 +
 .../exiv2/0001-Revert-fix-copy-constructors.patch  |   82 +
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb      |    6 +-
 meta-oe/recipes-support/glog/glog_0.7.1.bb         |    2 +
 .../hdf5/files/0001-CVE-2025-2923.patch            |   67 +
 .../hdf5/files/0002-CVE-2025-2924.patch            |   39 +
 .../hdf5/files/0003-CVE-2025-2925.patch            |   53 +
 .../files/0004-CVE-2025-6269-OSV-2023-77.patch     |  294 ++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb      |    4 +
 ...-checks-to-make-sure-we-don-t-get-stuck-i.patch |   48 +
 .../imagemagick/0001-CVE-2025-55004.patch          |   64 +
 .../imagemagick/0001-CVE-2025-55005.patch          |   36 +
 .../imagemagick/0001-CVE-2025-55154.patch          |   80 +
 .../imagemagick/0001-CVE-2025-55160.patch          |  161 +
 .../imagemagick/0001-CVE-2025-55212.patch          |   56 +
 .../imagemagick/0001-CVE-2025-57803.patch          |   61 +
 .../imagemagick/0001-CVE-2025-57807.patch          |   46 +
 ...rrect-out-of-bounds-read-of-a-single-byte.patch |   25 +
 ...y-leak-when-entering-StreamImage-multiple.patch |   26 +
 ...b.com-ImageMagick-ImageMagick-security-ad.patch |   52 +
 .../imagemagick/0002-Added-missing-return.patch    |   24 +
 .../imagemagick/imagemagick_7.1.1-43.bb            |   38 +-
 ...ine-audio-buffer-size-for-a-time-of-500ms.patch |   42 +
 .../libcanberra/libcanberra_0.30.bb                |    1 +
 .../{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb}       |    2 +-
 .../0001-CVE-2025-43961-CVE-2025-43962.patch       |  108 +
 .../libraw/libraw/0002-CVE-2025-43963.patch        |   40 +
 .../libraw/libraw/0003-CVE-2025-43964.patch        |   29 +
 meta-oe/recipes-support/libraw/libraw_0.21.2.bb    |    7 +-
 .../libssh/{libssh_0.11.2.bb => libssh_0.11.3.bb}  |    2 +-
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb   |    2 +-
 .../opencv/opencv/CVE-2025-53644.patch             |   29 +
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb    |   16 +-
 .../tokyocabinet/tokyocabinet_1.4.48.bb            |    4 +-
 meta-oe/recipes-support/udisks/udisks2_2.10.1.bb   |    3 +-
 ...-variable-to-control-macro-__PAS_ALWAYS_I.patch |   74 +
 .../recipes-support/webkitgtk/webkitgtk3_2.48.1.bb |   16 +-
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb            |    2 +-
 meta-perl/README.md                                |    4 +-
 meta-python/README.md                              |    2 +
 .../python/python3-django_5.0.13.bb                |    2 +
 .../python3-gpt-image/python3-gpt-image_0.9.0.bb   |    2 +
 meta-webserver/README.md                           |    2 +
 .../apache2/apache2/CVE-2025-54090.patch           |   40 +
 .../recipes-httpd/apache2/apache2_2.4.64.bb        |    1 +
 meta-xfce/README.md                                |    2 +
 156 files changed, 14115 insertions(+), 553 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-plug-ins-ZDI-CAN-26752-mitigation.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-makeRoom.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch
 rename meta-networking/recipes-connectivity/libiec61850/files/{0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch => 0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch} (89%)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0005-LIB61850-449-fixed-potential-buffer-overflows-in-MMS.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/3238.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.bb => mosquitto_2.0.21.bb} (96%)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.5.0.bb => open-vm-tools_12.5.4.bb} (98%)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.1.bb => tcpreplay_4.5.2.bb} (88%)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/0001-CVE-2023-49606.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/0001-column-Do-not-allow-fence-to-go-beyond-column-size-w.patch
 create mode 100644 meta-oe/licenses/NPSL
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (62%)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb} (92%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} (89%)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} (91%)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb} (78%)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (97%)
 rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} (89%)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb} (82%)
 rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} (97%)
 rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} (97%)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb => valijson_1.0.6.bb} (90%)
 create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
 create mode 100644 meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
 create mode 100644 meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0002.patch
 rename meta-oe/recipes-extended/parallel/{parallel_20250322.bb => parallel_20250822.bb} (93%)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-CVE-2025-27151.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
 create mode 100644 meta-oe/recipes-printing/cups/libppd/0001-CVE-2024-47175.patch
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (91%)
 delete mode 100644 meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-CVE-2025-2923.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0003-CVE-2025-2925.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55004.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55005.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55154.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55160.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55212.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57803.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57807.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-Correct-out-of-bounds-read-of-a-single-byte.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0002-Added-missing-return.patch
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb} (98%)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.11.2.bb => libssh_0.11.3.bb} (96%)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2025-53644.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2025-54090.patch

