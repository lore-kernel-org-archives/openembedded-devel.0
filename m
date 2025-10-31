Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12378CCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 07:44:56 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web10.9730.1761896686075517034
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 00:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V3P2mlyf;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63f533fbff7so1914187d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761896685; x=1762501485; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ7LvFXbI6f/WdxTft99o6xR3L9URku0RcYCjFF26/4=;
        b=V3P2mlyfc8mBXEZL7MkYHX1NWFkqV9rXROI6iiA6gDRF9y5K3riaRVVyHb21uu6p9D
         tz2BHzc2WHv8hTgWvStHiu0tkap3rZY1NgiXylBKYLP+PqnwBME4NrqfWKpyrcYWo9fW
         fWjInrPHWdKc8b2RJhBgiWSnSltfIVVYDGhOmds/LXQh0YTNwiqO8JVIJr2FYNoRuZ/Z
         NP6dqHIPm04lHkwwGgf1cHpMpMwR2gZumh5Fyz6nhRVBrL3CR8vqPJho42Hew6vCI5XX
         051RCCFlKO6v3R5FFqSBt8PVEsmaTLFPF+O70VeTneD6EoImihaT8cvdOLfv/nfHYTfW
         HQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896685; x=1762501485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ7LvFXbI6f/WdxTft99o6xR3L9URku0RcYCjFF26/4=;
        b=PVLikNUtH3hBB07rgx+tOyFULFbRz0iG4aIDs7XnyQVTAj0Gcu32QGj0mL+EurOHLI
         O/iB+RqX9eflHmqDFdCTN92iBS1S7FouiSb6j+5ju2TEun8ZOdfFKPHmiyZH0EsI4HX5
         ANkDy8/FFpsjjChuBg9hnNgz98CfVG/ZfAY7IBrL26VqMHbj0VIJGLYD5KoYdX6kLN23
         U3i4P4i7UzviY2/HysBo3QWFb/tn12EpvnRf0WbSS7PTD2VTpOJ11pvx0BMgs8hw2Vdd
         /oasDoUKGujilpKx8PMTPWbtTPjXDBBiH19VcgocG5zyzmyEvcPNg+Lc+LxYQ2uUMrl7
         afeA==
X-Gm-Message-State: AOJu0YwAvK46ycTO1Dz4y2DcJObQrkU1ilkkswbpZORel0wpAK/w9ANs
	MJH1ds9S3k/p8qB0Ibco1U39EvVCweZtCBWx4Dmuzhrdna6tp+15wyGoQ23al/PdPrm0QPcscrD
	qV/fVp9Zb51T1s3QnidxcMm7MlL7MReY=
X-Gm-Gg: ASbGncsS37aF0zyUB9rEtSPegKCUYQCefXvdP7XVpovRLwa+Mus0j+LGiUuY3mL+JwI
	nmbaGAYEZ+oWKXBZFpAiH2eDh9Jg1h5Q9IUFQaDKbAJY9HPLVfGKKCQUgveStvxITbsGTAdjoq+
	tz6opWsAsBuJgmewBs8OzyDXiXDCsoTr6YvF9vQEG4fgrQg9QNRNokQiVPZ97WD1N6nhbVVy4Zz
	ojnv5z52bw6TTfSrkFeFENrseXPwOusiERFVLCnPtcXJsYm0lGkdXNV/xvpscpKW8v82EuaUdy1
	ZgfKGb5l8UlUNkDxZmgHORFpYbP1BuUE9jLZSc1GKZKw9i4WTf4oJB0YoBmMkx5IomBDK3gKyKO
	X+uAIeHrWr355rg==
X-Google-Smtp-Source: AGHT+IHF3kkgNe6dwV9oWUa/wCv/ovRFLePOOLVP+9IE1KvTMxvA+UpK8EULm1ADxgBV1VMrVpcMxh7XAOG8LpL82+E=
X-Received: by 2002:a05:690c:6611:b0:785:cbf4:72cd with SMTP id
 00721157ae682-78648407bcfmr20755087b3.3.1761896684728; Fri, 31 Oct 2025
 00:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761876513.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1761876513.git.anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Oct 2025 00:44:17 -0700
X-Gm-Features: AWmQ_bkSxCd3-lSia2kyx4QggiY7hqBiDMnNOUiiIRzcOJkwBM7hlOnWczmHKa4
Message-ID: <CAMKF1soGZ+5-+dScQRQjc11+OHA8uDgHDMXMYMMjpSZ5V-qhJA@mail.gmail.com>
Subject: Re: [scarthgap][PATCH 00/87] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121228

merged now thanks Anuj

On Thu, Oct 30, 2025 at 7:13=E2=80=AFPM Anuj Mittal <anuj.mittal@intel.com>=
 wrote:
>
> We had a lot of CVE fixes in past month. Thank you to everyone who
> contributed. I tested this on AB and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1040
>
>
> The following changes since commit a8484babb6b06f5a7278e4778d13d7a19abc95=
02:
>
>   uim: Stick to C17 (2025-10-29 23:07:07 +0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> Alexandre Truong (1):
>   evince: Update status for CVE-2011-0433 and CVE-2011-5244
>
> Ankur Tyagi (25):
>   tinyproxy: patch CVE-2023-49606
>   frr: patch CVE-2024-44070
>   libavif: ignore CVE-2025-48175
>   libconfuse: patch CVE-2022-40320
>   hdf5: patch CVE-2025-2913
>   hdf5: patch CVE-2025-2914
>   hdf5: patch CVE-2025-2915
>   hdf5: patch CVE-2025-2923, CVE-2025-6816, CVE-2025-6856
>   hdf5: patch CVE-2025-2924
>   hdf5: patch CVE-2025-2925
>   hdf5: patch CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
>   libppd: patch CVE-2024-47175
>   libcupsfilters: patch CVE-2024-47076
>   libraw: patch CVE-2025-43961 CVE-2025-43962
>   libraw: patch CVE-2025-43963
>   libraw: patch CVE-2025-43964
>   zlog: fix CVE-2024-22857
>   memcached: patch CVE-2023-46852
>   memcached: patch CVE-2023-46853
>   ndpi: ignore CVE-2025-25066
>   libiec61850: patch CVE-2024-26529
>   libiec61850: patch CVE-2024-45970
>   libiec61850: patch CVE-2024-45971
>   mbedtls: upgrade 3.6.4 -> 3.6.5
>   hostapd: patch CVE-2025-24912
>
> Christos Gavros (1):
>   corosync: reproducibility issue
>
> Divya Chellam (1):
>   jq: fix CVE-2025-9403
>
> Gyorgy Sarvari (27):
>   pm-qa: update git fetch protocol
>   tokyocabinet: switch to working SRC_URI
>   tokyocabinet: fix license
>   iperf2: ignore irrelevant CVEs
>   jasper: patch CVE-2025-8835
>   jasper: patch CVE-2025-8836
>   jasper: patch CVE-2025-8837
>   etcd: patch CVE-2023-32082
>   freerdp3: patch CVE-2024-32039 and CVE-2024-32041
>   freerdp3: patch CVE-2024-32040
>   freerdp3: patch CVE-2024-32458
>   freerdp3: patch CVE-2024-32459
>   freerdp3: patch CVE-2024-32460
>   freerdp3: patch CVE-2024-32658
>   freerdp3: patch CVE-2025-32659
>   freerdp3: patch CVE-2024-32660
>   freerdp3: patch CVE-2024-32661
>   freerdp3: patch CVE-2024-32662
>   exiv2: patch CVE-2025-26623
>   exiv2: patch CVE-2025-54080
>   exiv2: patch CVE-2025-55304
>   redis: upgrade 6.2.18 -> 6.2.20
>   emacs: patch CVE-2024-30202
>   emacs: patch CVE-2024-30203
>   emacs: patch CVE-2024-30204
>   emacs: patch CVE-2024-30205
>   emacs: patch CVE-2024-39331
>
> Hitendra Prajapati (1):
>   libjxl: fix CVE-2024-11403 & CVE-2024-11498
>
> Jiaying Song (2):
>   webkitgtk3: update 2.44.1 -> 2.44.3
>   webkitgtk3: fix do_configure error on beaglebone-yocto
>
> Khem Raj (2):
>   freerdp: Upgrade 2.11.2 -> 2.11.7
>   influxdb: Do not remove non-existing files
>
> Ninette Adhikari (3):
>   xsp: CVE status update for CVE-2006-2658
>   influxdb: Update CVE status for CVE-2019-10329
>   monkey: Update status for CVE-2013-2183
>
> Peter Marko (12):
>   emlog: set CVE_PRODUCT
>   freerdp: patch CVE-2024-32661
>   freerdp: mark CVE-2024-32662 as fixed
>   freerdp3: set CVE_PRODUCT
>   corosync: fix upstream version check
>   corosync: upgrade 3.1.6 -> 3.1.9
>   corosync: patch CVE-2025-30472
>   dash: set CVE_PRODUCT
>   gattlib: mark CVE-2019-6498 as fixed
>   memcached: ignore disputed CVE-2022-26635
>   monkey: ignore CVE-2013-1771
>   squid: patch CVE-2025-59362
>
> Praveen Kumar (2):
>   yasm: fix CVE-2024-22653
>   cjson: upgrade 1.7.18 -> 1.7.19
>
> Rajeshkumar Ramasamy (1):
>   open-vm-tools: fix CVE-2025-41244
>
> Saravanan (1):
>   fio: fix CVE-2025-10823
>
> Soumya Sambu (1):
>   python3-django: upgrade 4.2.18 -> 4.2.20
>
> Vijay Anusuri (4):
>   poppler: Fix CVE-2025-43718
>   redis: upgrade 7.2.8 -> 7.2.11
>   redis: upgrade 6.2.16 -> 6.2.18
>   vorbis-tools: Fix CVE-2023-43361
>
> Wang Mingyu (1):
>   libiec61850: upgrade 1.5.1 -> 1.5.3
>
> Yi Zhao (1):
>   redis: upgrade 6.2.14 -> 6.2.16
>
> Yogita Urade (1):
>   poppler: fix CVE-2025-52885
>
>  .../recipes-gnome/evince/evince_46.0.bb       |   4 +
>  .../libavif/libavif_1.0.1.bb                  |   2 +
>  .../vorbis-tools/CVE-2023-43361.patch         |  57 ++
>  .../vorbis-tools/vorbis-tools_1.4.2.bb        |   1 +
>  .../libiec61850/files/CVE-2024-26529.patch    |  33 +
>  .../libiec61850/files/CVE-2024-45970.patch    |  74 +++
>  .../libiec61850/files/CVE-2024-45971.patch    | 218 +++++++
>  ...iec61850_1.5.1.bb =3D> libiec61850_1.5.3.bb} |   5 +-
>  .../{mbedtls_3.6.4.bb =3D> mbedtls_3.6.5.bb}    |   2 +-
>  .../squid/files/CVE-2025-59362.patch          |  52 ++
>  .../recipes-daemons/squid/squid_6.9.bb        |   1 +
>  .../corosync/corosync/CVE-2025-30472.patch    |  69 ++
>  .../{corosync_3.1.6.bb =3D> corosync_3.1.9.bb}  |  17 +-
>  .../frr/frr/CVE-2024-44070.patch              |  54 ++
>  .../recipes-protocols/frr/frr_9.1.bb          |   1 +
>  .../net-snmp/net-snmp_5.9.4.bb                |   3 +
>  .../libconfuse/files/CVE-2022-40320.patch     |  42 ++
>  .../libconfuse/libconfuse_3.3.bb              |   5 +-
>  .../memcached/memcached/CVE-2023-46852.patch  |  71 +++
>  .../memcached/memcached/CVE-2023-46853.patch  | 117 ++++
>  .../memcached/memcached_1.6.17.bb             |   4 +
>  .../recipes-support/ntopng/ndpi_4.2.bb        |   2 +
>  .../open-vm-tools/CVE-2025-41244.patch        | 123 ++++
>  .../open-vm-tools/open-vm-tools_12.3.5.bb     |   1 +
>  .../tinyproxy/0001-CVE-2023-49606.patch       |  59 ++
>  .../tinyproxy/tinyproxy_1.11.1.bb             |   1 +
>  .../fio/fio/CVE-2025-10823.patch              |  37 ++
>  meta-oe/recipes-benchmark/fio/fio_3.36.bb     |   2 +
>  .../recipes-benchmark/iperf2/iperf2_2.0.13.bb |   3 +
>  .../gattlib/gattlib_git.bb                    |   2 +
>  .../hostapd/hostapd/CVE-2025-24912_01.patch   |  80 +++
>  .../hostapd/hostapd/CVE-2025-24912_02.patch   |  72 +++
>  .../hostapd/hostapd_2.10.bb                   |   2 +
>  meta-oe/recipes-core/emlog/emlog.inc          |   2 +
>  .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   9 +-
>  .../cjson/cjson/CVE-2025-57052.patch          |  33 -
>  .../{cjson_1.7.18.bb =3D> cjson_1.7.19.bb}      |   3 +-
>  .../jq/jq/CVE-2025-9403.patch                 |  49 ++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
>  .../yasm/yasm/CVE-2024-22653.patch            |  32 +
>  meta-oe/recipes-devtools/yasm/yasm_git.bb     |   1 +
>  .../etcd/etcd/CVE-2023-32082.patch            |  86 +++
>  meta-oe/recipes-extended/etcd/etcd_3.5.7.bb   |   1 +
>  ...-hiredis-use-default-CC-if-it-is-set.patch |   0
>  ...ile-to-use-environment-build-setting.patch |   0
>  ...003-hack-to-force-use-of-libc-malloc.patch |   8 +-
>  .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
>  ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   0
>  ...006-Define-correct-gregs-for-RISCV32.patch |   0
>  .../init-redis-server                         |   0
>  .../{redis-7.2.8 =3D> redis-7.2.11}/redis.conf  |   0
>  .../redis.service                             |   0
>  .../redis/redis-7.2.8/CVE-2025-32023.patch    | 218 -------
>  ...hiredis-use-default-CC-if-it-is-set.patch} |  14 +-
>  ...le-to-use-environment-build-setting.patch} |  10 +-
>  ...03-hack-to-force-use-of-libc-malloc.patch} |   9 +-
>  ...=3D> 0004-src-Do-not-reset-FINAL_LIBS.patch} |   8 +-
>  ...CE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |   6 +-
>  ...006-Define-correct-gregs-for-RISCV32.patch |  12 +-
>  .../redis/redis/init-redis-server             |   0
>  .../{redis_6.2.14.bb =3D> redis_6.2.20.bb}      |  17 +-
>  .../redis/{redis_7.2.8.bb =3D> redis_7.2.11.bb} |   3 +-
>  ...E-2024-22857-buffer-overflow-patched.patch |  31 +
>  meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  |   4 +-
>  .../jasper/jasper/0001-Fixes-400.patch        | 171 +++++
>  .../jasper/jasper/0001-Fixes-401.patch        |  78 +++
>  .../jasper/jasper/0001-Fixes-402-403.patch    |  62 ++
>  .../recipes-graphics/jasper/jasper_4.1.1.bb   |   6 +-
>  .../libjxl/libjxl/CVE-2024-11403.patch        |  70 ++
>  .../libjxl/libjxl/CVE-2024-11498.patch        | 113 ++++
>  .../libjxl/libjxl_0.10.2.bb                   |   6 +-
>  meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb |   2 +
>  .../libcupsfilters/0001-CVE-2024-47076.patch  |  38 ++
>  .../cups/libcupsfilters_2.0.0.bb              |   1 +
>  .../cups/libppd/0001-CVE-2024-47175.patch     | 600 ++++++++++++++++++
>  meta-oe/recipes-printing/cups/libppd_2.0.0.bb |   5 +-
>  meta-oe/recipes-shells/dash/dash_0.5.12.bb    |   2 +
>  meta-oe/recipes-support/emacs/emacs_29.1.bb   |   5 +
>  ...w.el-mm-display-inline-fontify-Mark-.patch |  27 +
>  ...nts-Consider-all-remote-files-unsafe.patch |  38 ++
>  ...w-Add-protection-when-untrusted-cont.patch |  60 ++
>  ...abbrev-Do-not-evaluate-arbitrary-uns.patch |  71 +++
>  ...et-templates-Prevent-code-evaluation.patch |  47 ++
>  ...ppendIccProfile-to-fix-quadratic-per.patch |  96 +++
>  .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch |  77 +++
>  .../0001-Revert-fix-copy-constructors.patch   |  82 +++
>  meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |   6 +-
>  .../0001-Fixed-compilation-warnings.patch     |  27 +
>  .../freerdp/freerdp/CVE-2024-32661.patch      |  27 +
>  .../freerdp/freerdp3/CVE-2024-32039.patch     |  68 ++
>  .../freerdp/freerdp3/CVE-2024-32040.patch     |  29 +
>  .../freerdp/freerdp3/CVE-2024-32458.patch     | 119 ++++
>  .../freerdp/freerdp3/CVE-2024-32459.patch     |  30 +
>  .../freerdp/freerdp3/CVE-2024-32460.patch     |  26 +
>  .../freerdp/freerdp3/CVE-2024-32658.patch     |  35 +
>  .../freerdp/freerdp3/CVE-2024-32659.patch     |  27 +
>  .../freerdp/freerdp3/CVE-2024-32660.patch     | 151 +++++
>  .../freerdp/freerdp3/CVE-2024-32661.patch     |  28 +
>  .../freerdp/freerdp3/CVE-2024-32662.patch     |  28 +
>  .../recipes-support/freerdp/freerdp3_3.4.0.bb |  15 +-
>  .../{freerdp_2.11.2.bb =3D> freerdp_2.11.7.bb}  |   6 +-
>  .../hdf5/files/CVE-2025-2913.patch            |  32 +
>  .../hdf5/files/CVE-2025-2914.patch            |  47 ++
>  .../hdf5/files/CVE-2025-2915.patch            |  50 ++
>  ...025-2923-CVE-2025-6816-CVE-2025-6856.patch |  65 ++
>  .../hdf5/files/CVE-2025-2924.patch            |  37 ++
>  .../hdf5/files/CVE-2025-2925.patch            |  53 ++
>  ...-6269-CVE-2025-6270-CVE-2025-6516_01.patch |  65 ++
>  ...-6269-CVE-2025-6270-CVE-2025-6516_02.patch | 252 ++++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   8 +
>  .../0001-CVE-2025-43961-CVE-2025-43962.patch  | 108 ++++
>  .../libraw/libraw/0002-CVE-2025-43963.patch   |  40 ++
>  .../libraw/libraw/0003-CVE-2025-43964.patch   |  29 +
>  .../recipes-support/libraw/libraw_0.21.2.bb   |   7 +-
>  .../poppler/poppler/CVE-2025-43718.patch      |  31 +
>  .../poppler/poppler/CVE-2025-52885.patch      |  30 +
>  .../poppler/poppler_23.04.0.bb                |   2 +
>  .../tokyocabinet/tokyocabinet_1.4.48.bb       |   4 +-
>  ...kitgtk3_2.44.1.bb =3D> webkitgtk3_2.44.3.bb} |  14 +-
>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |   2 +-
>  ...ngo_4.2.18.bb =3D> python3-django_4.2.20.bb} |   4 +-
>  .../recipes-httpd/monkey/monkey_1.6.9.bb      |   2 +
>  122 files changed, 4597 insertions(+), 347 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbi=
s-tools/CVE-2023-43361.patch
>  create mode 100644 meta-networking/recipes-connectivity/libiec61850/file=
s/CVE-2024-26529.patch
>  create mode 100644 meta-networking/recipes-connectivity/libiec61850/file=
s/CVE-2024-45970.patch
>  create mode 100644 meta-networking/recipes-connectivity/libiec61850/file=
s/CVE-2024-45971.patch
>  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5=
.1.bb =3D> libiec61850_1.5.3.bb} (88%)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.4.bb =
=3D> mbedtls_3.6.5.bb} (98%)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-=
59362.patch
>  create mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2025-30472.patch
>  rename meta-networking/recipes-extended/corosync/{corosync_3.1.6.bb =3D>=
 corosync_3.1.9.bb} (84%)
>  create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-44=
070.patch
>  create mode 100755 meta-networking/recipes-support/libconfuse/files/CVE-=
2022-40320.patch
>  create mode 100644 meta-networking/recipes-support/memcached/memcached/C=
VE-2023-46852.patch
>  create mode 100644 meta-networking/recipes-support/memcached/memcached/C=
VE-2023-46853.patch
>  create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm=
-tools/CVE-2025-41244.patch
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/0=
001-CVE-2023-49606.patch
>  create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patc=
h
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025=
-24912_01.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025=
-24912_02.patch
>  delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.p=
atch
>  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb =3D> cjson_1.7.19=
.bb} (95%)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.pat=
ch
>  create mode 100644 meta-oe/recipes-extended/etcd/etcd/CVE-2023-32082.pat=
ch
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/00=
01-hiredis-use-default-CC-if-it-is-set.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/00=
02-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/00=
03-hack-to-force-use-of-libc-malloc.patch (86%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/00=
04-src-Do-not-reset-FINAL_LIBS.patch (79%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/00=
05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/00=
06-Define-correct-gregs-for-RISCV32.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/in=
it-redis-server (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/re=
dis.conf (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.8 =3D> redis-7.2.11}/re=
dis.service (100%)
>  delete mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-3=
2023.patch
>  rename meta-oe/recipes-extended/redis/redis/{hiredis-use-default-CC-if-i=
t-is-set.patch =3D> 0001-hiredis-use-default-CC-if-it-is-set.patch} (85%)
>  rename meta-oe/recipes-extended/redis/redis/{lua-update-Makefile-to-use-=
environment-build-setting.patch =3D> 0002-lua-update-Makefile-to-use-enviro=
nment-build-setting.patch} (93%)
>  rename meta-oe/recipes-extended/redis/redis/{oe-use-libc-malloc.patch =
=3D> 0003-hack-to-force-use-of-libc-malloc.patch} (92%)
>  rename meta-oe/recipes-extended/redis/redis/{0001-src-Do-not-reset-FINAL=
_LIBS.patch =3D> 0004-src-Do-not-reset-FINAL_LIBS.patch} (86%)
>  rename meta-oe/recipes-extended/redis/redis/{GNU_SOURCE.patch =3D> 0005-=
Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} (91%)
>  mode change 100755 =3D> 100644 meta-oe/recipes-extended/redis/redis/init=
-redis-server
>  rename meta-oe/recipes-extended/redis/{redis_6.2.14.bb =3D> redis_6.2.20=
.bb} (79%)
>  rename meta-oe/recipes-extended/redis/{redis_7.2.8.bb =3D> redis_7.2.11.=
bb} (95%)
>  create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-2285=
7-buffer-overflow-patched.patch
>  create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400=
.patch
>  create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401=
.patch
>  create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402=
-403.patch
>  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-114=
03.patch
>  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-114=
98.patch
>  create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE=
-2024-47076.patch
>  create mode 100644 meta-oe/recipes-printing/cups/libppd/0001-CVE-2024-47=
175.patch
>  create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm=
-view.el-mm-display-inline-fontify-Mark-.patch
>  create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-con=
tents-Consider-all-remote-files-unsafe.patch
>  create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-pr=
eview-Add-protection-when-untrusted-cont.patch
>  create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-exp=
and-abbrev-Do-not-evaluate-arbitrary-uns.patch
>  create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-se=
t-templates-Prevent-code-evaluation.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-meth=
od-appendIccProfile-to-fix-quadratic-per.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-540=
80-fix.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-c=
opy-constructors.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-co=
mpilation-warnings.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-3266=
1.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-320=
39.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-320=
40.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-324=
58.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-324=
59.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-324=
60.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-326=
58.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-326=
59.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-326=
60.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-326=
61.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-326=
62.patch
>  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb =3D> freerdp_2=
.11.7.bb} (93%)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-=
2025-6816-CVE-2025-6856.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-=
2025-6270-CVE-2025-6516_01.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-=
2025-6270-CVE-2025-6516_02.patch
>  create mode 100644 meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-4=
3961-CVE-2025-43962.patch
>  create mode 100644 meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-4=
3963.patch
>  create mode 100644 meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-4=
3964.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-4371=
8.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5288=
5.patch
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.1.bb =3D> webk=
itgtk3_2.44.3.bb} (89%)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.18.bb =3D=
> python3-django_4.2.20.bb} (63%)
>

