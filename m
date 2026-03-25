Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D40109C032
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:58:38 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24347.1774450709295456778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQIgn7tt;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64aedd812baso2675947d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 07:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774450708; cv=none;
        d=google.com; s=arc-20240605;
        b=d+KzALIYsbdGZ+/UDujqqFFbxTrARg5thdYJb7QcBnzh8O4/b9xjC+WgqAbdGSICag
         qe5bjAWwI5Kpm5xn1AWDyelAfk08+UXF6oAG9k6phBTozOE53CLZoT+oW3mjxIxW+loI
         xOzF05i9AGoXdUSYflLxAAVDGnJ1F/Pacwi350wnnsoNBAoXwq1g1dWjDbNukyLTM8K0
         WSREs3a8Cuctduev7xwVbeowuqihOXb69c2GnY3eOz1TCq2eLA8SzP4iVv958j9S75ZL
         WccnhwUobbyTUBRHI1L5iE9LTMslS7TUK8E4fgG3HuGH+IQWNypOr1G6KTYBSCzRT+iY
         zMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z3eJMWXgYv2GTC96azd4HvGST9igcZ+rCpB4y0igGn0=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=DcSiO+pSQCeTsHD5CzlCPg2e0V1c3CPVunUDrAg0Su80d/oW9uxUWFjfJgbrKq5BIA
         uOaWNSTfB8wuNGCZ/BScJfMhINIYoV/P5y/y7q5eLxRI9v21bMnVyVJCGsOIjy8z1eDI
         y1QaCyQ/9ST577veTM3/Ihj8xJ57qaG7ruLm8VRpV/x7TNoNY8FbBIaALbHrFftolo0o
         AcRMro4GsAnhW10awRWv1r+m4H3quLfTAtu7kqUV0zKfLQQ1ZQtOjqyD5vtAcYnKMPtG
         GUXPDqJSC+rgHc/yFnb/xKYabJ1o8/g5BjGuFlNM+qfNZGmhygqjElFmLlmP1SUD4B/h
         gNVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774450708; x=1775055508; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3eJMWXgYv2GTC96azd4HvGST9igcZ+rCpB4y0igGn0=;
        b=LQIgn7ttfwVlZ/nR8G46ma878zF+9hujtoKWQd2/CsWVe5TCXP3brH7eCSEU0KZFta
         V2nS3aciLuJpQXzAP6DhXnKluO+G7JNIkOSr70GsEHy8HnC8yiMgYSCkYNVl69yzf9zl
         nZdVcBcXCNL42IJLgxqopqomonJlNepqB5GHiT1gJ0iebJAo6Tdcmd0exOQ25+eKjNUb
         ObD2+0Vl8HFIvqxjv+c3u+/u9fqnxpU6rpattj7en52RLdUZCdAn8HJ6sNRO6G+Gkyet
         SYAqCPgnVIoR/3FVKBQTBpBbsieZWNh3P0cck3UPUzlO+lHfAI2ufc8snW3hK6DMYqCt
         YVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774450708; x=1775055508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3eJMWXgYv2GTC96azd4HvGST9igcZ+rCpB4y0igGn0=;
        b=sbaafZXhtg1JbhZPQxeY3Vnhh+xMqCN+ph10Om4A20XkFyVkjRqvE3HuIs0yxVlEIP
         w6x/3Rh6JQajDAEqwh6W8Xd8xBVquLwQOGohdHERkq3vS0uHM5tUAclduHaCUTPE0tCd
         3q8Clr3yu5vdlXEALtNrEig8WMAqqLO6YBt+pUObjRFVAARNcFH1KwN29/KjXeUHERet
         0bNuxbX/bxfRTEsxEm14ZNXVVEnGa5aj4faXDyZaR3PRVTd/yuWw5usghSTXjxiQGHbN
         ghSROFUQFfa+le6dPy/Ba7GRz2jfCt/VzMozMsv1i17m2iJ/WNCpUR3DB3OSNrIPkrnR
         BFhw==
X-Gm-Message-State: AOJu0Ywo9J+yyQSWVYtbFaO240owPoRGtrBy//GeNwBWoLd+F3B8n9qL
	KSZ77ibAzbmjQ2trDZli4jnrOOyVEFaMt9VPCpolsXKQ5I6ZDXhhpDmENVoMTxnNCIZJbWRszjW
	Xu1ELcshnZpcK+7DAAWMqqcjLqycQ2jQ=
X-Gm-Gg: ATEYQzw/E4m+HsKrAzEdOnYEVaJOt7SC+U4tQjK6ooylQDoHRdKVornPGfz6NWC86CL
	+xBrsIEE+vljimgWMh8c13Hxww86wYIzM75xbjo7yS4pm2Py9HPwFTu4K7Yax9DqMZ4aPz50H0g
	uQALgvBcCRxr2UMgoHFGK2Dmt60r6vK4oyilRPzBv0AdBse5fll2AFpHEiB4CYWwnkRH5R5yTPQ
	2dYSub/0k/ibezxGeY8SrRlg2tC8xrVEy0vEp2EUI8TQajOg7yVLhKaIka/8nGVm1hmjSGcw+Rp
	OvgU2tpKEPavVBhF5tdXTtezzyaupkxfbJbRQD+T/qJfl+mncbcpNxvl4T2XPNmujvsvIXvw26B
	Sh5pCVKozaQOpSPIzfQZJFOJK
X-Received: by 2002:a53:b043:0:b0:64e:e0fc:a30b with SMTP id
 956f58d0204a3-64ee6183fe8mr2645976d50.77.1774450708062; Wed, 25 Mar 2026
 07:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774420778.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1774420778.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 07:58:00 -0700
X-Gm-Features: AaiRm51-kVjCJlFD42o221os9rhUD3v7YAdlBZ5oGrS-kHMt7UlDNIum7cIeQ9g
Message-ID: <CAMKF1spQmnJysL1XREQjrvP4WsZQboJJsMVz=m=JUKZ+zLSYtg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/49] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020292c064dda8037"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 14:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125625

--00000000000020292c064dda8037
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied now, Thanks Anuj

On Tue, Mar 24, 2026 at 11:43=E2=80=AFPM Anuj Mittal via lists.openembedded=
.org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested with qemux86, qemu86-64,
> qemuarm and qemuarm64 locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1392
>
> The following changes since commit
> 4d3e2639dec542b58708244662d5ce36810fc510:
>
>   source-han-sans-*-fonts: rename downloaded files in SRC_URI (2026-03-03
> 13:08:08 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 06f846a325fde423bb0a6d49d771d8c1e144d7eb:
>
>   bluealsa: fix QA issue staticdev (2026-03-24 15:53:24 +0530)
>
> ----------------------------------------------------------------
>
> Aviv Daum (1):
>   lldpd: fix xml PACKAGECONFIG dependency
>
> Christos Gavros (1):
>   nativesdk-pistache: dependency with brotli
>
> Deepak Rathore (1):
>   yasm: extend recipe for nativesdk builds
>
> Gyorgy Sarvari (33):
>   exiftool: ignore CVE-2026-3102
>   freerdp: upgrade 2.11.7 -> 2.11.8
>   gimp: ignore CVE-2025-14424
>   gimp: patch CVE-2025-15059
>   gimp: patch CVE-2025-2760
>   gimp: patch CVE-2025-2761
>   gimp: patch CVE-2026-0797
>   gimp: patch CVE-2026-2044
>   gimp: patch CVE-2026-2045
>   gimp: ignore CVE-2026-2047
>   gimp: patch CVE-2026-2048
>   gnome-shell: ignore CVE-2021-3982
>   keepalived: patch CVE-2024-41184
>   libjxl: upgrade 0.10.2 -> 0.10.5
>   protobuf: ignore CVE-2026-0994
>   python3-django: upgrade 4.2.28 -> 4.2.29
>   streamripper: ignore CVE-2020-37065
>   gimp: add additional patch for CVE-2026-0797
>   vlc: ignore CVE-2026-26227 and CVE-2026-26228
>   php: upgrade 8.2.29 -> 8.2.30
>   ettercap: patch CVE-2026-3603
>   exiv2: patch CVE-2026-25884
>   exiv2: patch CVE-2026-27596
>   exiv2: patch CVE-2026-27631
>   imagemagick: patch CVE-2025-68618
>   imagemagick: patch CVE-2025-68950
>   imagemagick: patch CVE-2025-69204
>   hiawatha: fix SRC_URI
>   openjpeg: patch CVE-2023-39327
>   capnproto: patch CVE-2026-32239 and CVE-2026-32240
>   libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched
>   mariadb: upgrade 10.11.12 -> 10.11.16
>   libde265: patch CVE-2025-61147
>
> Hitendra Prajapati (4):
>   wireshark: Fix CVE-2026-3201
>   wireshark: Fix CVE-2026-0960
>   python3-pyjwt: Fix CVE-2026-32597
>   python3-pillow: fix CVE-2026-25990
>
> Martin Jansa (1):
>   krb5: fix build with gcc-15
>
> Matthias Proske (1):
>   bluealsa: fix QA issue staticdev
>
> Peter Marko (4):
>   spice-gtk: mark CVE-2012-4425 as fixed
>   spice: ignore CVE-2016-0749
>   spice: set CVE-2016-2150 status to fixed
>   sassc: ignore CVE-2022-43357
>
> Sujeet Nayak (1):
>   libnice: make crypto library configurable via PACKAGECONFIG
>
> Vijay Anusuri (1):
>   libssh: Fix CVE-2026-3731
>
> haonguyen-qualgo (1):
>   mbedtls: Do not set LIB_INSTALL_DIR to an absolute path to make
>     MbedTLSTargets.cmake relocateable
>
>  .../gimp/gimp/CVE-2025-15059.patch            |    33 +
>  .../gimp/gimp/CVE-2025-2760-1.patch           |    38 +
>  .../gimp/gimp/CVE-2025-2760-2.patch           |    84 +
>  .../gimp/gimp/CVE-2025-2761.patch             |    34 +
>  .../gimp/gimp/CVE-2026-0797-1.patch           |    91 +
>  .../gimp/gimp/CVE-2026-0797-2.patch           |    62 +
>  .../gimp/gimp/CVE-2026-2044.patch             |    28 +
>  .../gimp/gimp/CVE-2026-2045.patch             |    36 +
>  .../gimp/gimp/CVE-2026-2048.patch             |    84 +
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |    13 +-
>  .../gnome-shell/gnome-shell_46.1.bb           |     1 +
>  .../bluealsa/bluealsa_git.bb                  |     1 +
>  .../libde265/libde265/CVE-2025-61147.patch    |    84 +
>  .../libde265/libde265_1.0.12.bb               |     3 +-
>  .../streamripper/streamripper_1.64.6.bb       |     2 +
>  .../recipes-multimedia/vlc/vlc_3.0.20.bb      |     3 +
>  .../mbedtls/mbedtls_2.28.10.bb                |     2 -
>  .../mbedtls/mbedtls_3.6.5.bb                  |     2 -
>  .../keepalived/CVE-2024-41184-1.patch         |    98 +
>  .../keepalived/CVE-2024-41184-2.patch         |    88 +
>  .../keepalived/CVE-2024-41184-3.patch         |    94 +
>  .../keepalived/CVE-2024-41184-4.patch         |    33 +
>  .../keepalived/keepalived_2.2.8.bb            |     4 +
>  .../recipes-daemons/lldpd/lldpd_1.0.18.bb     |     2 +-
>  .../ettercap/ettercap/CVE-2026-3606.patch     |    48 +
>  .../ettercap/ettercap_0.8.3.1.bb              |     4 +-
>  .../recipes-support/spice/spice-gtk_0.42.bb   |     2 +
>  .../recipes-support/spice/spice_git.bb        |     2 +
>  .../wireshark/files/CVE-2026-0960.patch       |    43 +
>  .../wireshark/files/CVE-2026-3201.patch       |    55 +
>  .../wireshark/wireshark_4.2.14.bb             |     2 +
>  ...nate-old-style-function-declarations.patch | 10803 ++++++++++++++++
>  .../recipes-connectivity/krb5/krb5_1.21.3.bb  |     1 +
>  ...10.11.12.bb =3D> mariadb-native_10.11.16.bb} |     0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |     2 +-
>  ...ck-if-syscall-exists-before-using-it.patch |     8 +-
>  ...Lists.txt-fix-gen_lex_hash-not-found.patch |     6 +-
>  ...ariadb_10.11.12.bb =3D> mariadb_10.11.16.bb} |     0
>  .../CVE-2026-32239_CVE-2026-32240.patch       |   160 +
>  .../capnproto/capnproto_1.0.2.bb              |     4 +-
>  .../recipes-devtools/perl/exiftool_12.72.bb   |     2 +
>  .../php/php/CVE-2025-14177.patch              |    84 -
>  .../php/php/CVE-2025-14178.patch              |    65 -
>  .../php/php/CVE-2025-14180.patch              |    69 -
>  .../php/{php_8.2.29.bb =3D> php_8.2.30.bb}      |     5 +-
>  .../protobuf/protobuf_4.25.8.bb               |     2 +
>  meta-oe/recipes-devtools/yasm/yasm_git.bb     |     2 +-
>  .../recipes-extended/brotli/brotli_1.1.0.bb   |     2 +-
>  .../openjpeg/openjpeg/CVE-2023-39327.patch    |    51 +
>  .../openjpeg/openjpeg_2.5.4.bb                |     1 +
>  .../libjxl/libjxl/CVE-2024-11403.patch        |    70 -
>  .../libjxl/libjxl/CVE-2024-11498.patch        |   113 -
>  .../{libjxl_0.10.2.bb =3D> libjxl_0.10.5.bb}    |    10 +-
>  .../exiv2/exiv2/CVE-2026-25884-1.patch        |    69 +
>  .../exiv2/exiv2/CVE-2026-25884-2.patch        |    25 +
>  .../exiv2/exiv2/CVE-2026-27596-1.patch        |    71 +
>  .../exiv2/exiv2/CVE-2026-27596-2.patch        |    24 +
>  .../exiv2/exiv2/CVE-2026-27631-1.patch        |    63 +
>  .../exiv2/exiv2/CVE-2026-27631-2.patch        |    26 +
>  meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |     8 +
>  .../0001-Fixed-compilation-warnings.patch     |    27 -
>  .../{freerdp_2.11.7.bb =3D> freerdp_2.11.8.bb}  |     3 +-
>  .../imagemagick/CVE-2025-68618.patch          |   109 +
>  .../imagemagick/CVE-2025-68950.patch          |    25 +
>  .../imagemagick/CVE-2025-69204.patch          |    71 +
>  .../imagemagick/imagemagick_7.1.1.bb          |     3 +
>  .../recipes-support/libnice/libnice_0.1.22.bb |     5 +-
>  .../libssh/libssh/CVE-2026-3731-1.patch       |    44 +
>  .../libssh/libssh/CVE-2026-3731-2.patch       |   102 +
>  .../recipes-support/libssh/libssh_0.10.6.bb   |     2 +
>  meta-oe/recipes-support/sass/sassc_git.bb     |     2 +
>  .../0001-lower-setuptools-requirements.patch  |     0
>  ...ngo_4.2.28.bb =3D> python3-django_4.2.29.bb} |     2 +-
>  .../python3-pillow/CVE-2026-25990.patch       |    91 +
>  .../python/python3-pillow_10.3.0.bb           |     1 +
>  .../python/python3-pyjwt/CVE-2026-32597.patch |   216 +
>  .../python/python3-pyjwt_2.8.0.bb             |     1 +
>  .../recipes-httpd/hiawatha/hiawatha_10.12.bb  |     2 +-
>  78 files changed, 13067 insertions(+), 461 deletions(-)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.pat=
ch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.pat=
ch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-1.pat=
ch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.pat=
ch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.pa=
tch
>  create mode 100644
> meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2026-3201.patch
>  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/0001-Eliminate-old-style-function-=
declarations.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb =3D>
> mariadb-native_10.11.16.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb =3D>
> mariadb_10.11.16.bb} (100%)
>  create mode 100644
> meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-3224=
0.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
>  rename meta-oe/recipes-devtools/php/{php_8.2.29.bb =3D> php_8.2.30.bb}
> (98%)
>  create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
>  delete mode 100644
> meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
>  delete mode 100644
> meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
>  rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.10.2.bb =3D>
> libjxl_0.10.5.bb} (87%)
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
>  delete mode 100644
> meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.p=
atch
>  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.7.bb =3D>
> freerdp_2.11.8.bb} (97%)
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68618.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68950.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-69204.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-2.patch
>  rename meta-python/recipes-devtools/python/{python3-django-4.2.28 =3D>
> python3-django-4.2.29}/0001-lower-setuptools-requirements.patch (100%)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb =3D=
>
> python3-django_4.2.29.bb} (82%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125601):
> https://lists.openembedded.org/g/openembedded-devel/message/125601
> Mute This Topic: https://lists.openembedded.org/mt/118497268/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000020292c064dda8037
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">applied now, Thanks Anuj</div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar =
24, 2026 at 11:43=E2=80=AFPM Anuj Mittal via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:=
oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Please merge these changes in scarthgap. Tested with qemux86, qemu86-6=
4,<br>
qemuarm and qemuarm64 locally and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1392" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1392</a><br>
<br>
The following changes since commit 4d3e2639dec542b58708244662d5ce36810fc510=
:<br>
<br>
=C2=A0 source-han-sans-*-fonts: rename downloaded files in SRC_URI (2026-03=
-03 13:08:08 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to 06f846a325fde423bb0a6d49d771d8c1e144d7eb:<br=
>
<br>
=C2=A0 bluealsa: fix QA issue staticdev (2026-03-24 15:53:24 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Aviv Daum (1):<br>
=C2=A0 lldpd: fix xml PACKAGECONFIG dependency<br>
<br>
Christos Gavros (1):<br>
=C2=A0 nativesdk-pistache: dependency with brotli<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 yasm: extend recipe for nativesdk builds<br>
<br>
Gyorgy Sarvari (33):<br>
=C2=A0 exiftool: ignore CVE-2026-3102<br>
=C2=A0 freerdp: upgrade 2.11.7 -&gt; 2.11.8<br>
=C2=A0 gimp: ignore CVE-2025-14424<br>
=C2=A0 gimp: patch CVE-2025-15059<br>
=C2=A0 gimp: patch CVE-2025-2760<br>
=C2=A0 gimp: patch CVE-2025-2761<br>
=C2=A0 gimp: patch CVE-2026-0797<br>
=C2=A0 gimp: patch CVE-2026-2044<br>
=C2=A0 gimp: patch CVE-2026-2045<br>
=C2=A0 gimp: ignore CVE-2026-2047<br>
=C2=A0 gimp: patch CVE-2026-2048<br>
=C2=A0 gnome-shell: ignore CVE-2021-3982<br>
=C2=A0 keepalived: patch CVE-2024-41184<br>
=C2=A0 libjxl: upgrade 0.10.2 -&gt; 0.10.5<br>
=C2=A0 protobuf: ignore CVE-2026-0994<br>
=C2=A0 python3-django: upgrade 4.2.28 -&gt; 4.2.29<br>
=C2=A0 streamripper: ignore CVE-2020-37065<br>
=C2=A0 gimp: add additional patch for CVE-2026-0797<br>
=C2=A0 vlc: ignore CVE-2026-26227 and CVE-2026-26228<br>
=C2=A0 php: upgrade 8.2.29 -&gt; 8.2.30<br>
=C2=A0 ettercap: patch CVE-2026-3603<br>
=C2=A0 exiv2: patch CVE-2026-25884<br>
=C2=A0 exiv2: patch CVE-2026-27596<br>
=C2=A0 exiv2: patch CVE-2026-27631<br>
=C2=A0 imagemagick: patch CVE-2025-68618<br>
=C2=A0 imagemagick: patch CVE-2025-68950<br>
=C2=A0 imagemagick: patch CVE-2025-69204<br>
=C2=A0 hiawatha: fix SRC_URI<br>
=C2=A0 openjpeg: patch CVE-2023-39327<br>
=C2=A0 capnproto: patch CVE-2026-32239 and CVE-2026-32240<br>
=C2=A0 libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched<br>
=C2=A0 mariadb: upgrade 10.11.12 -&gt; 10.11.16<br>
=C2=A0 libde265: patch CVE-2025-61147<br>
<br>
Hitendra Prajapati (4):<br>
=C2=A0 wireshark: Fix CVE-2026-3201<br>
=C2=A0 wireshark: Fix CVE-2026-0960<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-32597<br>
=C2=A0 python3-pillow: fix CVE-2026-25990<br>
<br>
Martin Jansa (1):<br>
=C2=A0 krb5: fix build with gcc-15<br>
<br>
Matthias Proske (1):<br>
=C2=A0 bluealsa: fix QA issue staticdev<br>
<br>
Peter Marko (4):<br>
=C2=A0 spice-gtk: mark CVE-2012-4425 as fixed<br>
=C2=A0 spice: ignore CVE-2016-0749<br>
=C2=A0 spice: set CVE-2016-2150 status to fixed<br>
=C2=A0 sassc: ignore CVE-2022-43357<br>
<br>
Sujeet Nayak (1):<br>
=C2=A0 libnice: make crypto library configurable via PACKAGECONFIG<br>
<br>
Vijay Anusuri (1):<br>
=C2=A0 libssh: Fix CVE-2026-3731<br>
<br>
haonguyen-qualgo (1):<br>
=C2=A0 mbedtls: Do not set LIB_INSTALL_DIR to an absolute path to make<br>
=C2=A0 =C2=A0 MbedTLSTargets.cmake relocateable<br>
<br>
=C2=A0.../gimp/gimp/CVE-2025-15059.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 33 +<br>
=C2=A0.../gimp/gimp/CVE-2025-2760-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 38 +<br>
=C2=A0.../gimp/gimp/CVE-2025-2760-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 84 +<br>
=C2=A0.../gimp/gimp/CVE-2025-2761.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 34 +<br>
=C2=A0.../gimp/gimp/CVE-2026-0797-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 91 +<br>
=C2=A0.../gimp/gimp/CVE-2026-0797-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 62 +<br>
=C2=A0.../gimp/gimp/CVE-2026-2044.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 28 +<br>
=C2=A0.../gimp/gimp/CVE-2026-2045.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 36 +<br>
=C2=A0.../gimp/gimp/CVE-2026-2048.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 84 +<br>
=C2=A0meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" rel=
=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a>=C2=A0 |=C2=A0 =C2=A0 =
13 +-<br>
=C2=A0.../gnome-shell/<a href=3D"http://gnome-shell_46.1.bb" rel=3D"norefer=
rer" target=3D"_blank">gnome-shell_46.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../bluealsa/<a href=3D"http://bluealsa_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">bluealsa_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../libde265/libde265/CVE-2025-61147.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 84 +<br>
=C2=A0.../libde265/<a href=3D"http://libde265_1.0.12.bb" rel=3D"noreferrer"=
 target=3D"_blank">libde265_1.0.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A03 +-<br>
=C2=A0.../streamripper/<a href=3D"http://streamripper_1.64.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">streamripper_1.64.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.20.bb" rel=3D"no=
referrer" target=3D"_blank">vlc_3.0.20.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A03 +<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" =
target=3D"_blank">mbedtls_2.28.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A02 -<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_3.6.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mbedtls_3.6.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A02 -<br>
=C2=A0.../keepalived/CVE-2024-41184-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 98 +<br>
=C2=A0.../keepalived/CVE-2024-41184-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 88 +<br>
=C2=A0.../keepalived/CVE-2024-41184-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 94 +<br>
=C2=A0.../keepalived/CVE-2024-41184-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 33 +<br>
=C2=A0.../keepalived/<a href=3D"http://keepalived_2.2.8.bb" rel=3D"noreferr=
er" target=3D"_blank">keepalived_2.2.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A04 +<br>
=C2=A0.../recipes-daemons/lldpd/<a href=3D"http://lldpd_1.0.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">lldpd_1.0.18.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A0 =C2=A02 +-<br>
=C2=A0.../ettercap/ettercap/CVE-2026-3606.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 48 +<br>
=C2=A0.../ettercap/<a href=3D"http://ettercap_0.8.3.1.bb" rel=3D"noreferrer=
" target=3D"_blank">ettercap_0.8.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0.../recipes-support/spice/<a href=3D"http://spice-gtk_0.42.bb" rel=3D=
"noreferrer" target=3D"_blank">spice-gtk_0.42.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">spice_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +<br>
=C2=A0.../wireshark/files/CVE-2026-0960.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 43 +<br>
=C2=A0.../wireshark/files/CVE-2026-3201.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 55 +<br>
=C2=A0.../wireshark/<a href=3D"http://wireshark_4.2.14.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_4.2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A02 +<br>
=C2=A0...nate-old-style-function-declarations.patch | 10803 +++++++++++++++=
+<br>
=C2=A0.../recipes-connectivity/krb5/<a href=3D"http://krb5_1.21.3.bb" rel=
=3D"noreferrer" target=3D"_blank">krb5_1.21.3.bb</a>=C2=A0 |=C2=A0 =C2=A0 =
=C2=A01 +<br>
=C2=A0...<a href=3D"http://10.11.12.bb" rel=3D"noreferrer" target=3D"_blank=
">10.11.12.bb</a> =3D&gt; <a href=3D"http://mariadb-native_10.11.16.bb" rel=
=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.16.bb</a>} |=C2=A0 =
=C2=A0 =C2=A00<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0...ck-if-syscall-exists-before-using-it.patch |=C2=A0 =C2=A0 =C2=A08 =
+-<br>
=C2=A0...Lists.txt-fix-gen_lex_hash-not-found.patch |=C2=A0 =C2=A0 =C2=A06 =
+-<br>
=C2=A0...<a href=3D"http://ariadb_10.11.12.bb" rel=3D"noreferrer" target=3D=
"_blank">ariadb_10.11.12.bb</a> =3D&gt; <a href=3D"http://mariadb_10.11.16.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.16.bb</a>} |=C2=A0 =
=C2=A0 =C2=A00<br>
=C2=A0.../CVE-2026-32239_CVE-2026-32240.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0160 +<br>
=C2=A0.../capnproto/<a href=3D"http://capnproto_1.0.2.bb" rel=3D"noreferrer=
" target=3D"_blank">capnproto_1.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0.../recipes-devtools/perl/<a href=3D"http://exiftool_12.72.bb" rel=3D=
"noreferrer" target=3D"_blank">exiftool_12.72.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A02 +<br>
=C2=A0.../php/php/CVE-2025-14177.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 84 -<br>
=C2=A0.../php/php/CVE-2025-14178.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 65 -<br>
=C2=A0.../php/php/CVE-2025-14180.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 69 -<br>
=C2=A0.../php/{<a href=3D"http://php_8.2.29.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.2.29.bb</a> =3D&gt; <a href=3D"http://php_8.2.30.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.2.30.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A05 +-<br>
=C2=A0.../protobuf/<a href=3D"http://protobuf_4.25.8.bb" rel=3D"noreferrer"=
 target=3D"_blank">protobuf_4.25.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A02 +-<br>
=C2=A0.../recipes-extended/brotli/<a href=3D"http://brotli_1.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">brotli_1.1.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A02 +-<br>
=C2=A0.../openjpeg/openjpeg/CVE-2023-39327.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 51 +<br>
=C2=A0.../openjpeg/<a href=3D"http://openjpeg_2.5.4.bb" rel=3D"noreferrer" =
target=3D"_blank">openjpeg_2.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../libjxl/libjxl/CVE-2024-11403.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 70 -<br>
=C2=A0.../libjxl/libjxl/CVE-2024-11498.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0113 -<br>
=C2=A0.../{<a href=3D"http://libjxl_0.10.2.bb" rel=3D"noreferrer" target=3D=
"_blank">libjxl_0.10.2.bb</a> =3D&gt; <a href=3D"http://libjxl_0.10.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libjxl_0.10.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 10 +-<br>
=C2=A0.../exiv2/exiv2/CVE-2026-25884-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 69 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-25884-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 25 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27596-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 71 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27596-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 24 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27631-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 63 +<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27631-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 26 +<br>
=C2=A0meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.28.3.bb" rel=
=3D"noreferrer" target=3D"_blank">exiv2_0.28.3.bb</a> |=C2=A0 =C2=A0 =C2=A0=
8 +<br>
=C2=A0.../0001-Fixed-compilation-warnings.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 27 -<br>
=C2=A0.../{<a href=3D"http://freerdp_2.11.7.bb" rel=3D"noreferrer" target=
=3D"_blank">freerdp_2.11.7.bb</a> =3D&gt; <a href=3D"http://freerdp_2.11.8.=
bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.8.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A03 +-<br>
=C2=A0.../imagemagick/CVE-2025-68618.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0109 +<br>
=C2=A0.../imagemagick/CVE-2025-68950.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 25 +<br>
=C2=A0.../imagemagick/CVE-2025-69204.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 71 +<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.1.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">imagemagick_7.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 =C2=A03 +<br>
=C2=A0.../recipes-support/libnice/<a href=3D"http://libnice_0.1.22.bb" rel=
=3D"noreferrer" target=3D"_blank">libnice_0.1.22.bb</a> |=C2=A0 =C2=A0 =C2=
=A05 +-<br>
=C2=A0.../libssh/libssh/CVE-2026-3731-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 44 +<br>
=C2=A0.../libssh/libssh/CVE-2026-3731-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0102 +<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-support/sass/<a href=3D"http://sassc_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">sassc_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A02 +<br>
=C2=A0.../0001-lower-setuptools-requirements.patch=C2=A0 |=C2=A0 =C2=A0 =C2=
=A00<br>
=C2=A0...<a href=3D"http://ngo_4.2.28.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_4.2.28.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.29.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_4.2.29.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../python3-pillow/CVE-2026-25990.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 91 +<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_10.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_10.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-32597.patch |=C2=A0 =C2=A0216 +<br>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.8.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-pyjwt_2.8.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-httpd/hiawatha/<a href=3D"http://hiawatha_10.12.bb" rel=
=3D"noreferrer" target=3D"_blank">hiawatha_10.12.bb</a>=C2=A0 |=C2=A0 =C2=
=A0 =C2=A02 +-<br>
=C2=A078 files changed, 13067 insertions(+), 461 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.=
patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.=
patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.pa=
tch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-1.=
patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.=
patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.pa=
tch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.pa=
tch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.pa=
tch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2025-61147.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/keepalived/keepali=
ved/CVE-2024-41184-4.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ettercap/ettercap/=
CVE-2026-3606.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2026-0960.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2026-3201.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Elimin=
ate-old-style-function-declarations.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_10=
.11.12.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.12.bb<=
/a> =3D&gt; <a href=3D"http://mariadb-native_10.11.16.bb" rel=3D"noreferrer=
" target=3D"_blank">mariadb-native_10.11.16.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_10.11.12.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.12.bb</a> =3D&gt; <a=
 href=3D"http://mariadb_10.11.16.bb" rel=3D"noreferrer" target=3D"_blank">m=
ariadb_10.11.16.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2=
026-32239_CVE-2026-32240.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.pa=
tch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.pa=
tch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.pa=
tch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.29.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.2.29.bb</a> =3D&gt; <a href=3D"=
http://php_8.2.30.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.30.bb</a=
>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-202=
3-39327.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-=
11403.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-=
11498.patch<br>
=C2=A0rename meta-oe/recipes-multimedia/libjxl/{<a href=3D"http://libjxl_0.=
10.2.bb" rel=3D"noreferrer" target=3D"_blank">libjxl_0.10.2.bb</a> =3D&gt; =
<a href=3D"http://libjxl_0.10.5.bb" rel=3D"noreferrer" target=3D"_blank">li=
bjxl_0.10.5.bb</a>} (87%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631=
-2.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed=
-compilation-warnings.patch<br>
=C2=A0rename meta-oe/recipes-support/freerdp/{<a href=3D"http://freerdp_2.1=
1.7.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.11.7.bb</a> =3D&gt; =
<a href=3D"http://freerdp_2.11.8.bb" rel=3D"noreferrer" target=3D"_blank">f=
reerdp_2.11.8.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2025-68618.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2025-68950.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2025-69204.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-373=
1-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-373=
1-2.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{python3-django-4.2.28 =3D=
&gt; python3-django-4.2.29}/0001-lower-setuptools-requirements.patch (100%)=
<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.28.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
28.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.29.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.29.bb</a>} (82%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-25990.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-32597.patch<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125601): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125601" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125601</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118497268/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118497268/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000020292c064dda8037--

