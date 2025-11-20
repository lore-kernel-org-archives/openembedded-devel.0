Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32A9CF64A1
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 01:31:52 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23058.1763602302290845093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 17:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlQS3b03;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6420c0cf4abso267096d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 17:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763602301; x=1764207101; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QDK2R7VCqONRQXYEJWwW+Uoap7XTgAEaCDJJ01Os3tE=;
        b=OlQS3b03HtYOrcasutlf6xBm/DBDiE6FqQ9LzbzCImuSdPSzeVfqoepmMwOkf1PRsB
         sb9IooIXD/U5r74uz66sm/MQYfVU9eXDez4dT9aK24CO4LJqmEgdAtZMSv4o2ydtZamf
         ALoAX7/iffcqlsOvVqkVYecU4uiGU2J3HeGo5KbqQ7kY1qRDfCaM5VkLibdK27C7OWkD
         j6gxM84kUVlUpXuy02cVudmoxsCpIwo08xOt4w/dgR3/r+FhhkwkKVHtg0wrD/ferk5g
         uwKQo+/7ajMP2/aFsQgB2EWlwUjNc/5cSCY10AjiFK8oO+gS+uXezFwBd3DYUj6bM6fx
         Wu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763602301; x=1764207101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDK2R7VCqONRQXYEJWwW+Uoap7XTgAEaCDJJ01Os3tE=;
        b=EXJSFTDzeba9/mBXajxsfMUAP3QXLM1xmYyLT9gb34oSpon+cUs8toJKE0jWXPpOJC
         aML1Tj9WcbcECA9dqp5QCqEt8NC8JVN+lNyPntP575qmtjUPPZV9a+8QmLDDOgxHs17z
         LkS3wdrUgBg+Kof6WPN1WWqUfhBaThLmBHY0QfrSNuz8X4Cwowg9f+qnDE/9eF0cZ0Ob
         5z5k2dEqQPqsxudRazBS+Z/B18JprZKaCBPdvPlkXFqHM3RTiX8OuF33YngOZpq+BdWX
         lyJUKReZMdBTP2QF7Y9UJjkN5MCsrhKc6kDxjUqVciNALeuyvKfzWnMVokossWJuK09z
         wC/g==
X-Gm-Message-State: AOJu0YzFp/hSNZEhS33uOVeCJhNHIGugtMlePdtKguuRzXhRGjL78Jfs
	EiSFznLrw8YWNVg8lrzd3vPvYjE8rQaPfyUYKp0YiD5r3D51SYLzBEGhtfj+LCuh1p6kUB2MLvo
	2/G1Rn7Ws9HCVyCdq0MwX6YjrZ0bA6ok=
X-Gm-Gg: ASbGncv+1xpK9TSpEds9F/kfZKPZv9E8oNrvPs0UEuGOxSzafUjNxKzs2PBlu/Mrknl
	VrN0uasHplrzMiOCs+4GA0GZnAstIh7CW1HyaDROZY3ketmYC1Rq3yZzyG6U4oQy+w3OQgtXyG4
	ooGDzDAWqm4zOxIJW9jEg+JndMkdfK81GbN22enmu667WLwukNpj78FWGo4nPRG0DFgCp0dqH1z
	3pPduia+IdQYXy3wx3O3MWhbDgx2wBL9XgHwhApuA7wiXc2K2IjMy1AA3WMsY/x04JtDlbOY0uN
	FVSKGXsXq89mpJz9c3Ra+cDIG1lZj2MbKbd3VgVgkU5cRsKZhWYXukOFO3wD9qbF79sEXY5eq+0
	dz9N/7CN7DUxvAHaNm/2uPZPxD/vDWhRqE7FSR2l8QUq44H6hXjRiOJQ/
X-Google-Smtp-Source: AGHT+IG4Y26Wa9Zc4NTcbFjwi/AfSAsITHCSo0/ENhLxzjZ9LaNmTWjcfKuov0L8Pkwih8eIl0IqoUnpqYGOCBQcZgU=
X-Received: by 2002:a05:690e:1345:b0:63f:ab9d:11f3 with SMTP id
 956f58d0204a3-642f7d21ee2mr850296d50.33.1763602300975; Wed, 19 Nov 2025
 17:31:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763595040.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1763595040.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 17:31:14 -0800
X-Gm-Features: AWmQ_bm-Mv1LKFMc4Nks_AUG2-gFmsIOhbQdHTsOG3IFlESSulwGVyaAz4haVr0
Message-ID: <CAMKF1sr7qxW_ruK5RTB+pH3W_v2_nucBEBF1fwbQ7aWEE8F76A@mail.gmail.com>
Subject: Re: [PATCH 00/74] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000acc02a0643fca855"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 01:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121919

--000000000000acc02a0643fca855
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now thanks Anuj

On Wed, Nov 19, 2025 at 3:34=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes in scarthgap. Tested on AB and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1098
>
> The following changes since commit
> f1f248262d662315159ee96c604f97415d1dbe6a:
>
>   cockpit: remove deprecated packages (2025-11-12 11:38:29 +0530)
>
> are available in the Git repository at:
>
>   https://github.com/anujm1/meta-openembedded anujm/scarthgap
>   https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap
>
> Ankur Tyagi (10):
>   tbb: upgrade 2021.11.0 -> 2021.12.0
>   jasper: upgrade 4.1.1 -> 4.1.2
>   libspiro: upgrade 20221101 -> 20230902
>   redis-plus-plus: upgrade 1.3.11 -> 1.3.12
>   redis: upgrade 7.2.11 -> 7.2.12
>   redis: upgrade 6.2.20 -> 6.2.21
>   botan: patch CVE-2024-34703
>   botan: patch CVE-2024-50382 and CVE-2024-50383
>   freerdp3: patch CVE-2025-4478
>   hdf5: patch CVE-2025-2926
>
> Anuj Mittal (1):
>   remmina: add DEPENDS on curl
>
> Armin Kuster (1):
>   audit: fix build when systemd is enabled.
>
> Bartosz Golaszewski (2):
>   libgpiod: update to v1.6.5
>   libgpiod: update v2.1.2 -> v2.1.3
>
> Ethan Roderick (1):
>   openldap: make license match spdx identifier
>
> Gyorgy Sarvari (17):
>   audiofile: patch CVE-2019-13147 and CVE-2022-24599
>   audiofile: patch CVE-2018-13440 and CVE-2018-17059
>   linuxptp: ignore CVE-2024-42861
>   rsyslog: set status for CVE-2015-3243
>   apache2: ignore CVE-2025-3891
>   webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646
>   webmin: patch CVE-2017-17089
>   webmin: patch CVE-2019-15642
>   webmin: patch CVE-2022-0824
>   webmin: patch CVE-2022-0829
>   libwmf: add proper CVE tag to patch
>   libwmf: add missing CVE tag to patch
>   libwmf: patch CVE-2015-0848 and CVE-2015-4588
>   libwmf: patch CVE-2015-4695
>   libwmf: patch CVE-2015-4696
>   libwmf: patch CVE-2016-9011
>   iptraf-ng: patch CVE-2024-52949
>
> J. S. (1):
>   libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
>
> Jason Schonberg (3):
>   xrdp: upgrade 0.9.19 -> 0.9.20
>   usbids: upgrade 2023.01.16 -> 2025.04.01
>   usbids: upgrade 2025.04.01 -> 2025.09.15
>
> Jiaying Song (1):
>   minifi-cpp: fix python shebang in minifi-python
>
> Khem Raj (3):
>   libforms: Remove buildpaths from fd2ps and fdesign scripts
>   libwmf: Fix buildpaths QA Errors in libwmf-config
>   fvwm: Fix buildpaths QA Errors
>
> Markus Volk (2):
>   xdg-desktop-portal: update 1.18.1 -> 1.18.4
>   flatpak;xdg-desktop-portal: add missing runtime dependency on
>     fuse3-utils
>
> Michael Wyraz (3):
>   python3-passlib: add native support
>   python3-transitions: add native support
>   python3-passlib: add python3-misc as a depencency
>
> Ninette Adhikari (1):
>   redis: Update status for CVE-2022-3734
>
> Peter Marko (4):
>   audiofile: mark CVE-2020-18781 as patched
>   proftpd: set status of CVE-2001-0027
>   rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
>   squid: patch CVE-2025-62168
>
> Shinji Matsunaga (1):
>   audit: Fix CVE_PRODUCT
>
> Wang Mingyu (16):
>   evtest: upgrade 1.35 -> 1.36
>   xmlsec1: upgrade 1.3.4 -> 1.3.5
>   openldap: upgrade 2.6.7 -> 2.6.8
>   openldap: upgrade 2.6.9 -> 2.6.10
>   mcelog: upgrade 198 -> 199
>   mcelog: upgrade 199 -> 200
>   libiodbc: upgrade 3.52.15 -> 3.52.16
>   libbytesize: upgrade 2.10 -> 2.11
>   libbpf: upgrade 1.4.0 -> 1.4.2
>   libbpf: upgrade 1.4.2 -> 1.4.3
>   libbpf: upgrade 1.4.3 -> 1.4.5
>   libbpf: upgrade 1.4.5 -> 1.4.6
>   openjpeg: upgrade 2.5.3 -> 2.5.4
>   feh: upgrade 3.10.2 -> 3.10.3
>   cryptsetup: upgrade 2.7.2 -> 2.7.3
>   cryptsetup: upgrade 2.7.3 -> 2.7.4
>
> Yi Zhao (4):
>   openldap: upgrade 2.6.8 -> 2.6.9
>   audit: upgrade 4.0.1 -> 4.0.2
>   libbpf: upgrade 1.4.6 -> 1.4.7
>   cryptsetup: upgrade 2.7.4 -> 2.7.5
>
> Yoann Congal (2):
>   klibc: fix debug pkgs reproducibility
>   grilo: fix buildpaths QA error
>
> alperak (1):
>   pcp: Fix contains reference to TMPDIR [buildpaths] warnings
>
>  .../recipes-gnome/grilo/grilo_0.3.16.bb       |  11 +-
>  meta-initramfs/classes/klibc.bbclass          |   2 +-
>  .../rtmpdump/rtmpdump_2.4.bb                  |   4 +
>  .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   2 +
>  .../squid/files/CVE-2025-62168.patch          | 211 +++++++++++++++++
>  .../recipes-daemons/squid/squid_6.14.bb       |   1 +
>  meta-oe/licenses/{OpenLDAP =3D> OLDAP-2.8}      |   0
>  .../linuxptp/linuxptp_4.1.bb                  |   2 +
>  .../botan/botan/CVE-2024-34703.patch          |  38 +++
>  .../CVE-2024-50382-and-CVE-2024-50383.patch   |  66 ++++++
>  meta-oe/recipes-crypto/botan/botan_3.2.0.bb   |   5 +-
>  ...ryptsetup_2.7.2.bb =3D> cryptsetup_2.7.5.bb} |   2 +-
>  .../iptraf/iptraf-ng/CVE-2024-52949.patch     | 218 ++++++++++++++++++
>  .../iptraf/iptraf-ng_1.2.1.bb                 |   1 +
>  .../flatpak/flatpak_1.15.8.bb                 |   1 +
>  .../libwmf/CVE-2015-0848-CVE-2015-4588.patch  | 135 +++++++++++
>  .../libwmf/libwmf/CVE-2015-4695.patch         |  70 ++++++
>  .../libwmf/libwmf/CVE-2015-4696.patch         |  37 +++
>  .../libwmf/libwmf/CVE-2016-9011.patch         |  50 ++++
>  .../libwmf/libwmf-0.2.8.4-intoverflow.patch   |   2 +
>  .../libwmf/libwmf-0.2.8.4-useafterfree.patch  |   2 +
>  .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  10 +-
>  .../minifi-cpp/minifi-cpp_0.15.0.bb           |   4 +
>  ...us_1.3.11.bb =3D> redis-plus-plus_1.3.12.bb} |   2 +-
>  ...-hiredis-use-default-CC-if-it-is-set.patch |   6 +-
>  ...ile-to-use-environment-build-setting.patch |   2 +-
>  ...003-hack-to-force-use-of-libc-malloc.patch |  10 +-
>  .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
>  ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   2 +-
>  ...006-Define-correct-gregs-for-RISCV32.patch |   2 +-
>  .../init-redis-server                         |   0
>  .../{redis-7.2.11 =3D> redis-7.2.12}/redis.conf |   0
>  .../redis.service                             |   0
>  .../{redis_6.2.20.bb =3D> redis_6.2.21.bb}      |   2 +-
>  .../{redis_7.2.11.bb =3D> redis_7.2.12.bb}      |   5 +-
>  .../rsyslog/rsyslog/rsyslog.conf              |   3 +-
>  .../rsyslog/rsyslog_8.2402.0.bb               |   2 +
>  .../feh/{feh_3.10.2.bb =3D> feh_3.10.3.bb}      |   2 +-
>  ...spiro_20221101.bb =3D> libspiro_20240902.bb} |   2 +-
>  meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb   |   3 +
>  .../{jasper_4.1.1.bb =3D> jasper_4.1.2.bb}      |   2 +-
>  .../libforms/libforms_1.2.5pre1.bb            |   5 +
>  .../openjpeg/openjpeg/CVE-2025-54874.patch    |  44 ----
>  .../{openjpeg_2.5.3.bb =3D> openjpeg_2.5.4.bb}  |   3 +-
>  .../{libbpf_1.4.0.bb =3D> libbpf_1.4.7.bb}      |   4 +-
>  .../audiofile/audiofile_0.3.6.bb              |   4 +
>  ...ays-check-the-number-of-coefficients.patch |   1 +
>  .../audiofile/files/CVE-2018-13440.patch      |  36 +++
>  .../audiofile/files/CVE-2018-17059.patch      |  35 +++
>  .../audiofile/files/CVE-2019-13147.patch      |  31 +++
>  .../audiofile/files/CVE-2022-24599.patch      |  50 ++++
>  ...ute_malloc__-with-__attribute__-__ma.patch |  49 ----
>  .../audit/{audit_4.0.1.bb =3D> audit_4.0.2.bb}  |  12 +-
>  .../freerdp/freerdp3/CVE-2025-4478.patch      |  60 +++++
>  .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
>  .../hdf5/files/CVE-2025-2926.patch            |  32 +++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
>  ...ibbytesize_2.10.bb =3D> libbytesize_2.11.bb} |   2 +-
>  ...ts-set-direction-when-reconfiguring-.patch |  38 ---
>  .../{libgpiod_1.6.4.bb =3D> libgpiod_1.6.5.bb}  |   2 +-
>  .../{libgpiod_2.1.2.bb =3D> libgpiod_2.1.3.bb}  |   4 +-
>  ...ibiodbc_3.52.15.bb =3D> libiodbc_3.52.16.bb} |   4 +-
>  .../mcelog/{mcelog_198.bb =3D> mcelog_200.bb}   |  11 +-
>  .../{openldap_2.6.7.bb =3D> openldap_2.6.10.bb} |  10 +-
>  meta-oe/recipes-support/pcp/pcp_6.0.5.bb      |   4 +
>  .../recipes-support/remmina/remmina_1.4.34.bb |   1 +
>  ...suppress-new-GCC-12-13-warnings-1192.patch |  57 -----
>  ....cmake-remove-cross-compiation-check.patch |  33 ---
>  .../{tbb_2021.11.0.bb =3D> tbb_2021.12.0.bb}    |   8 +-
>  ...ids_2023.01.16.bb =3D> usbids_2025.09.15.bb} |   3 +-
>  ...1.18.1.bb =3D> xdg-desktop-portal_1.18.4.bb} |   6 +-
>  .../0001-nss-nspr-fix-for-multilib.patch      |   7 +-
>  .../xmlsec1/change-finding-path-of-nss.patch  |   7 +-
>  .../{xmlsec1_1.3.4.bb =3D> xmlsec1_1.3.5.bb}    |   2 +-
>  ...guished_name-in-etc-xrdp-openssl.con.patch |   7 +-
>  .../xrdp/0001-Fix-the-compile-error.patch     |  12 +-
>  ...1-arch-Define-NO_NEED_ALIGN-on-ppc64.patch |   9 +-
>  ...001-mark-count-with-unused-attribute.patch |   9 +-
>  .../xrdp/{xrdp_0.9.19.bb =3D> xrdp_0.9.20.bb}   |   2 +-
>  ...ld-on-32bit-arches-with-64bit-time_t.patch |   7 +-
>  .../evtest/{evtest_1.35.bb =3D> evtest_1.36.bb} |   2 +-
>  .../libhtml/libhtml-tree-perl_5.03.bb         |   7 +
>  .../python/python3-passlib_1.7.4.bb           |   3 +
>  .../python/python3-transitions_0.9.0.bb       |   2 +
>  .../recipes-httpd/apache2/apache2_2.4.65.bb   |   1 +
>  ...issions-check-when-saving-allowed-cr.patch |  25 ++
>  ...e-potentially-malicious-HTTP-headers.patch |  53 +++++
>  ...0001-Foreign-module-may-need-a-check.patch |  27 +++
>  ...0001-HTML-escape-command-description.patch |  29 +++
>  ...es-cannot-contact-special-characters.patch |  26 +++
>  .../recipes-webadmin/webmin/webmin_1.850.bb   |   7 +-
>  91 files changed, 1403 insertions(+), 321 deletions(-)
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
>  rename meta-oe/licenses/{OpenLDAP =3D> OLDAP-2.8} (100%)
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.pat=
ch
>  create mode 100644
> meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-and-CVE-2024-50383.patc=
h
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.2.bb =3D>
> cryptsetup_2.7.5.bb} (98%)
>  create mode 100644
> meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
>  create mode 100644
> meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
>  rename meta-oe/recipes-extended/redis-plus-plus/{
> redis-plus-plus_1.3.11.bb =3D> redis-plus-plus_1.3.12.bb} (95%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/0001-hiredis-use-default-CC-if-it-is-set.patch (89%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/0002-lua-update-Makefile-to-use-environment-build-setting.p=
atch
> (97%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/0003-hack-to-force-use-of-libc-malloc.patch (81%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/0004-src-Do-not-reset-FINAL_LIBS.patch (74%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pa=
tch
> (92%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/0006-Define-correct-gregs-for-RISCV32.patch (97%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/init-redis-server (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/redis.conf (100%)
>  rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D>
> redis-7.2.12}/redis.service (100%)
>  rename meta-oe/recipes-extended/redis/{redis_6.2.20.bb =3D> redis_6.2.21=
.bb}
> (96%)
>  rename meta-oe/recipes-extended/redis/{redis_7.2.11.bb =3D> redis_7.2.12=
.bb}
> (93%)
>  rename meta-oe/recipes-graphics/feh/{feh_3.10.2.bb =3D> feh_3.10.3.bb}
> (88%)
>  rename meta-oe/recipes-graphics/fontforge/{libspiro_20221101.bb =3D>
> libspiro_20240902.bb} (85%)
>  rename meta-oe/recipes-graphics/jasper/{jasper_4.1.1.bb =3D>
> jasper_4.1.2.bb} (95%)
>  delete mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
>  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.3.bb =3D>
> openjpeg_2.5.4.bb} (86%)
>  rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.0.bb =3D> libbpf_1.4.7.=
bb}
> (92%)
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
>  create mode 100644
> meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch
>  delete mode 100644
> meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-wi=
th-__attribute__-__ma.patch
>  rename meta-oe/recipes-security/audit/{audit_4.0.1.bb =3D> audit_4.0.2.b=
b}
> (90%)
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-4478.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2926.patc=
h
>  rename meta-oe/recipes-support/libbytesize/{libbytesize_2.10.bb =3D>
> libbytesize_2.11.bb} (93%)
>  delete mode 100644
> meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set=
-direction-when-reconfiguring-.patch
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_1.6.4.bb =3D>
> libgpiod_1.6.5.bb} (94%)
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.2.bb =3D>
> libgpiod_2.1.3.bb} (87%)
>  rename meta-oe/recipes-support/libiodbc/{libiodbc_3.52.15.bb =3D>
> libiodbc_3.52.16.bb} (82%)
>  rename meta-oe/recipes-support/mcelog/{mcelog_198.bb =3D> mcelog_200.bb}
> (79%)
>  rename meta-oe/recipes-support/openldap/{openldap_2.6.7.bb =3D>
> openldap_2.6.10.bb} (96%)
>  delete mode 100644
> meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-=
1192.patch
>  delete mode 100644
> meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-c=
ompiation-check.patch
>  rename meta-oe/recipes-support/tbb/{tbb_2021.11.0.bb =3D> tbb_2021.12.0.=
bb}
> (92%)
>  rename meta-oe/recipes-support/usbids/{usbids_2023.01.16.bb =3D>
> usbids_2025.09.15.bb} (84%)
>  rename meta-oe/recipes-support/xdg-desktop-portal/{
> xdg-desktop-portal_1.18.1.bb =3D> xdg-desktop-portal_1.18.4.bb} (88%)
>  rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.4.bb =3D>
> xmlsec1_1.3.5.bb} (96%)
>  rename meta-oe/recipes-support/xrdp/{xrdp_0.9.19.bb =3D> xrdp_0.9.20.bb}
> (97%)
>  rename meta-oe/recipes-test/evtest/{evtest_1.35.bb =3D> evtest_1.36.bb}
> (90%)
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions=
-check-when-saving-allowed-cr.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-mali=
cious-HTTP-headers.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need=
-a-check.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-des=
cription.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-con=
tact-special-characters.patch
>
> --
> 2.51.2
>
>

--000000000000acc02a0643fca855
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now thanks Anuj</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 19=
, 2025 at 3:34=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss=
.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Please merge these changes in sc=
arthgap. Tested on AB and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1098" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1098</a><br>
<br>
The following changes since commit f1f248262d662315159ee96c604f97415d1dbe6a=
:<br>
<br>
=C2=A0 cockpit: remove deprecated packages (2025-11-12 11:38:29 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://github.com/anujm1/meta-openembedded" rel=3D"noref=
errer" target=3D"_blank">https://github.com/anujm1/meta-openembedded</a> an=
ujm/scarthgap<br>
=C2=A0 <a href=3D"https://github.com/anujm1/meta-openembedded/tree/anujm/sc=
arthgap" rel=3D"noreferrer" target=3D"_blank">https://github.com/anujm1/met=
a-openembedded/tree/anujm/scarthgap</a><br>
<br>
Ankur Tyagi (10):<br>
=C2=A0 tbb: upgrade 2021.11.0 -&gt; 2021.12.0<br>
=C2=A0 jasper: upgrade 4.1.1 -&gt; 4.1.2<br>
=C2=A0 libspiro: upgrade 20221101 -&gt; 20230902<br>
=C2=A0 redis-plus-plus: upgrade 1.3.11 -&gt; 1.3.12<br>
=C2=A0 redis: upgrade 7.2.11 -&gt; 7.2.12<br>
=C2=A0 redis: upgrade 6.2.20 -&gt; 6.2.21<br>
=C2=A0 botan: patch CVE-2024-34703<br>
=C2=A0 botan: patch CVE-2024-50382 and CVE-2024-50383<br>
=C2=A0 freerdp3: patch CVE-2025-4478<br>
=C2=A0 hdf5: patch CVE-2025-2926<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 remmina: add DEPENDS on curl<br>
<br>
Armin Kuster (1):<br>
=C2=A0 audit: fix build when systemd is enabled.<br>
<br>
Bartosz Golaszewski (2):<br>
=C2=A0 libgpiod: update to v1.6.5<br>
=C2=A0 libgpiod: update v2.1.2 -&gt; v2.1.3<br>
<br>
Ethan Roderick (1):<br>
=C2=A0 openldap: make license match spdx identifier<br>
<br>
Gyorgy Sarvari (17):<br>
=C2=A0 audiofile: patch CVE-2019-13147 and CVE-2022-24599<br>
=C2=A0 audiofile: patch CVE-2018-13440 and CVE-2018-17059<br>
=C2=A0 linuxptp: ignore CVE-2024-42861<br>
=C2=A0 rsyslog: set status for CVE-2015-3243<br>
=C2=A0 apache2: ignore CVE-2025-3891<br>
=C2=A0 webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646<br>
=C2=A0 webmin: patch CVE-2017-17089<br>
=C2=A0 webmin: patch CVE-2019-15642<br>
=C2=A0 webmin: patch CVE-2022-0824<br>
=C2=A0 webmin: patch CVE-2022-0829<br>
=C2=A0 libwmf: add proper CVE tag to patch<br>
=C2=A0 libwmf: add missing CVE tag to patch<br>
=C2=A0 libwmf: patch CVE-2015-0848 and CVE-2015-4588<br>
=C2=A0 libwmf: patch CVE-2015-4695<br>
=C2=A0 libwmf: patch CVE-2015-4696<br>
=C2=A0 libwmf: patch CVE-2016-9011<br>
=C2=A0 iptraf-ng: patch CVE-2024-52949<br>
<br>
J. S. (1):<br>
=C2=A0 libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]<br>
<br>
Jason Schonberg (3):<br>
=C2=A0 xrdp: upgrade 0.9.19 -&gt; 0.9.20<br>
=C2=A0 usbids: upgrade 2023.01.16 -&gt; 2025.04.01<br>
=C2=A0 usbids: upgrade 2025.04.01 -&gt; 2025.09.15<br>
<br>
Jiaying Song (1):<br>
=C2=A0 minifi-cpp: fix python shebang in minifi-python<br>
<br>
Khem Raj (3):<br>
=C2=A0 libforms: Remove buildpaths from fd2ps and fdesign scripts<br>
=C2=A0 libwmf: Fix buildpaths QA Errors in libwmf-config<br>
=C2=A0 fvwm: Fix buildpaths QA Errors<br>
<br>
Markus Volk (2):<br>
=C2=A0 xdg-desktop-portal: update 1.18.1 -&gt; 1.18.4<br>
=C2=A0 flatpak;xdg-desktop-portal: add missing runtime dependency on<br>
=C2=A0 =C2=A0 fuse3-utils<br>
<br>
Michael Wyraz (3):<br>
=C2=A0 python3-passlib: add native support<br>
=C2=A0 python3-transitions: add native support<br>
=C2=A0 python3-passlib: add python3-misc as a depencency<br>
<br>
Ninette Adhikari (1):<br>
=C2=A0 redis: Update status for CVE-2022-3734<br>
<br>
Peter Marko (4):<br>
=C2=A0 audiofile: mark CVE-2020-18781 as patched<br>
=C2=A0 proftpd: set status of CVE-2001-0027<br>
=C2=A0 rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fix=
ed<br>
=C2=A0 squid: patch CVE-2025-62168<br>
<br>
Shinji Matsunaga (1):<br>
=C2=A0 audit: Fix CVE_PRODUCT<br>
<br>
Wang Mingyu (16):<br>
=C2=A0 evtest: upgrade 1.35 -&gt; 1.36<br>
=C2=A0 xmlsec1: upgrade 1.3.4 -&gt; 1.3.5<br>
=C2=A0 openldap: upgrade 2.6.7 -&gt; 2.6.8<br>
=C2=A0 openldap: upgrade 2.6.9 -&gt; 2.6.10<br>
=C2=A0 mcelog: upgrade 198 -&gt; 199<br>
=C2=A0 mcelog: upgrade 199 -&gt; 200<br>
=C2=A0 libiodbc: upgrade 3.52.15 -&gt; 3.52.16<br>
=C2=A0 libbytesize: upgrade 2.10 -&gt; 2.11<br>
=C2=A0 libbpf: upgrade 1.4.0 -&gt; 1.4.2<br>
=C2=A0 libbpf: upgrade 1.4.2 -&gt; 1.4.3<br>
=C2=A0 libbpf: upgrade 1.4.3 -&gt; 1.4.5<br>
=C2=A0 libbpf: upgrade 1.4.5 -&gt; 1.4.6<br>
=C2=A0 openjpeg: upgrade 2.5.3 -&gt; 2.5.4<br>
=C2=A0 feh: upgrade 3.10.2 -&gt; 3.10.3<br>
=C2=A0 cryptsetup: upgrade 2.7.2 -&gt; 2.7.3<br>
=C2=A0 cryptsetup: upgrade 2.7.3 -&gt; 2.7.4<br>
<br>
Yi Zhao (4):<br>
=C2=A0 openldap: upgrade 2.6.8 -&gt; 2.6.9<br>
=C2=A0 audit: upgrade 4.0.1 -&gt; 4.0.2<br>
=C2=A0 libbpf: upgrade 1.4.6 -&gt; 1.4.7<br>
=C2=A0 cryptsetup: upgrade 2.7.4 -&gt; 2.7.5<br>
<br>
Yoann Congal (2):<br>
=C2=A0 klibc: fix debug pkgs reproducibility<br>
=C2=A0 grilo: fix buildpaths QA error<br>
<br>
alperak (1):<br>
=C2=A0 pcp: Fix contains reference to TMPDIR [buildpaths] warnings<br>
<br>
=C2=A0.../recipes-gnome/grilo/<a href=3D"http://grilo_0.3.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">grilo_0.3.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 11 +-<br>
=C2=A0meta-initramfs/classes/klibc.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../rtmpdump/<a href=3D"http://rtmpdump_2.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">rtmpdump_2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7f.bb" rel=
=3D"noreferrer" target=3D"_blank">proftpd_1.3.7f.bb</a> |=C2=A0 =C2=A02 +<b=
r>
=C2=A0.../squid/files/CVE-2025-62168.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 211 +++++++++++++++++<br>
=C2=A0.../recipes-daemons/squid/<a href=3D"http://squid_6.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">squid_6.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0meta-oe/licenses/{OpenLDAP =3D&gt; OLDAP-2.8}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../linuxptp/<a href=3D"http://linuxptp_4.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">linuxptp_4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../botan/botan/CVE-2024-34703.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 38 +++<br>
=C2=A0.../CVE-2024-50382-and-CVE-2024-50383.patch=C2=A0 =C2=A0|=C2=A0 66 ++=
++++<br>
=C2=A0meta-oe/recipes-crypto/botan/<a href=3D"http://botan_3.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">botan_3.2.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A05 +-<br>
=C2=A0...<a href=3D"http://ryptsetup_2.7.2.bb" rel=3D"noreferrer" target=3D=
"_blank">ryptsetup_2.7.2.bb</a> =3D&gt; <a href=3D"http://cryptsetup_2.7.5.=
bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.7.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../iptraf/iptraf-ng/CVE-2024-52949.patch=C2=A0 =C2=A0 =C2=A0| 218 ++=
++++++++++++++++<br>
=C2=A0.../iptraf/<a href=3D"http://iptraf-ng_1.2.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">iptraf-ng_1.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../flatpak/<a href=3D"http://flatpak_1.15.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">flatpak_1.15.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../libwmf/CVE-2015-0848-CVE-2015-4588.patch=C2=A0 | 135 +++++++++++<=
br>
=C2=A0.../libwmf/libwmf/CVE-2015-4695.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 70 ++++++<br>
=C2=A0.../libwmf/libwmf/CVE-2015-4696.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 37 +++<br>
=C2=A0.../libwmf/libwmf/CVE-2016-9011.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 50 ++++<br>
=C2=A0.../libwmf/libwmf-0.2.8.4-intoverflow.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../libwmf/libwmf-0.2.8.4-useafterfree.patch=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0.../recipes-extended/libwmf/<a href=3D"http://libwmf_0.2.8.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libwmf_0.2.8.4.bb</a> |=C2=A0 10 +-<br>
=C2=A0.../minifi-cpp/<a href=3D"http://minifi-cpp_0.15.0.bb" rel=3D"norefer=
rer" target=3D"_blank">minifi-cpp_0.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0...<a href=3D"http://us_1.3.11.bb" rel=3D"noreferrer" target=3D"_blan=
k">us_1.3.11.bb</a> =3D&gt; <a href=3D"http://redis-plus-plus_1.3.12.bb" re=
l=3D"noreferrer" target=3D"_blank">redis-plus-plus_1.3.12.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...-hiredis-use-default-CC-if-it-is-set.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0...ile-to-use-environment-build-setting.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...003-hack-to-force-use-of-libc-malloc.patch |=C2=A0 10 +-<br>
=C2=A0.../0004-src-Do-not-reset-FINAL_LIBS.patch=C2=A0 =C2=A0 |=C2=A0 10 +-=
<br>
=C2=A0...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...006-Define-correct-gregs-for-RISCV32.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../init-redis-server=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../{redis-7.2.11 =3D&gt; redis-7.2.12}/redis.conf |=C2=A0 =C2=A00<br=
>
=C2=A0.../redis.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../{<a href=3D"http://redis_6.2.20.bb" rel=3D"noreferrer" target=3D"=
_blank">redis_6.2.20.bb</a> =3D&gt; <a href=3D"http://redis_6.2.21.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_6.2.21.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://redis_7.2.11.bb" rel=3D"noreferrer" target=3D"=
_blank">redis_7.2.11.bb</a> =3D&gt; <a href=3D"http://redis_7.2.12.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0.../rsyslog/rsyslog/rsyslog.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0.../rsyslog/<a href=3D"http://rsyslog_8.2402.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">rsyslog_8.2402.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../feh/{<a href=3D"http://feh_3.10.2.bb" rel=3D"noreferrer" target=
=3D"_blank">feh_3.10.2.bb</a> =3D&gt; <a href=3D"http://feh_3.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">feh_3.10.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://spiro_20221101.bb" rel=3D"noreferrer" target=3D"=
_blank">spiro_20221101.bb</a> =3D&gt; <a href=3D"http://libspiro_20240902.b=
b" rel=3D"noreferrer" target=3D"_blank">libspiro_20240902.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta-oe/recipes-graphics/fvwm/<a href=3D"http://fvwm_2.7.0.bb" rel=3D=
"noreferrer" target=3D"_blank">fvwm_2.7.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A0=
3 +<br>
=C2=A0.../{<a href=3D"http://jasper_4.1.1.bb" rel=3D"noreferrer" target=3D"=
_blank">jasper_4.1.1.bb</a> =3D&gt; <a href=3D"http://jasper_4.1.2.bb" rel=
=3D"noreferrer" target=3D"_blank">jasper_4.1.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../libforms/<a href=3D"http://libforms_1.2.5pre1.bb" rel=3D"noreferr=
er" target=3D"_blank">libforms_1.2.5pre1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0.../openjpeg/openjpeg/CVE-2025-54874.patch=C2=A0 =C2=A0 |=C2=A0 44 --=
--<br>
=C2=A0.../{<a href=3D"http://openjpeg_2.5.3.bb" rel=3D"noreferrer" target=
=3D"_blank">openjpeg_2.5.3.bb</a> =3D&gt; <a href=3D"http://openjpeg_2.5.4.=
bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.4.bb</a>}=C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://libbpf_1.4.0.bb" rel=3D"noreferrer" target=3D"=
_blank">libbpf_1.4.0.bb</a> =3D&gt; <a href=3D"http://libbpf_1.4.7.bb" rel=
=3D"noreferrer" target=3D"_blank">libbpf_1.4.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +-<br>
=C2=A0.../audiofile/<a href=3D"http://audiofile_0.3.6.bb" rel=3D"noreferrer=
" target=3D"_blank">audiofile_0.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0...ays-check-the-number-of-coefficients.patch |=C2=A0 =C2=A01 +<br>
=C2=A0.../audiofile/files/CVE-2018-13440.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
36 +++<br>
=C2=A0.../audiofile/files/CVE-2018-17059.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
35 +++<br>
=C2=A0.../audiofile/files/CVE-2019-13147.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
31 +++<br>
=C2=A0.../audiofile/files/CVE-2022-24599.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
50 ++++<br>
=C2=A0...ute_malloc__-with-__attribute__-__ma.patch |=C2=A0 49 ----<br>
=C2=A0.../audit/{<a href=3D"http://audit_4.0.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">audit_4.0.1.bb</a> =3D&gt; <a href=3D"http://audit_4.0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">audit_4.0.2.bb</a>}=C2=A0 |=C2=A0 12 +-=
<br>
=C2=A0.../freerdp/freerdp3/CVE-2025-4478.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
60 +++++<br>
=C2=A0.../recipes-support/freerdp/<a href=3D"http://freerdp3_3.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">freerdp3_3.4.0.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0.../hdf5/files/CVE-2025-2926.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 +++<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb" rel=
=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A01 +<br=
>
=C2=A0...<a href=3D"http://ibbytesize_2.10.bb" rel=3D"noreferrer" target=3D=
"_blank">ibbytesize_2.10.bb</a> =3D&gt; <a href=3D"http://libbytesize_2.11.=
bb" rel=3D"noreferrer" target=3D"_blank">libbytesize_2.11.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...ts-set-direction-when-reconfiguring-.patch |=C2=A0 38 ---<br>
=C2=A0.../{<a href=3D"http://libgpiod_1.6.4.bb" rel=3D"noreferrer" target=
=3D"_blank">libgpiod_1.6.4.bb</a> =3D&gt; <a href=3D"http://libgpiod_1.6.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.5.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libgpiod_2.1.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libgpiod_2.1.2.bb</a> =3D&gt; <a href=3D"http://libgpiod_2.1.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_2.1.3.bb</a>}=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0...<a href=3D"http://ibiodbc_3.52.15.bb" rel=3D"noreferrer" target=3D=
"_blank">ibiodbc_3.52.15.bb</a> =3D&gt; <a href=3D"http://libiodbc_3.52.16.=
bb" rel=3D"noreferrer" target=3D"_blank">libiodbc_3.52.16.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../mcelog/{<a href=3D"http://mcelog_198.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mcelog_198.bb</a> =3D&gt; <a href=3D"http://mcelog_200.bb" rel=
=3D"noreferrer" target=3D"_blank">mcelog_200.bb</a>}=C2=A0 =C2=A0|=C2=A0 11=
 +-<br>
=C2=A0.../{<a href=3D"http://openldap_2.6.7.bb" rel=3D"noreferrer" target=
=3D"_blank">openldap_2.6.7.bb</a> =3D&gt; <a href=3D"http://openldap_2.6.10=
.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.6.10.bb</a>} |=C2=A0 1=
0 +-<br>
=C2=A0meta-oe/recipes-support/pcp/<a href=3D"http://pcp_6.0.5.bb" rel=3D"no=
referrer" target=3D"_blank">pcp_6.0.5.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0.../recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" rel=
=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0...suppress-new-GCC-12-13-warnings-1192.patch |=C2=A0 57 -----<br>
=C2=A0....cmake-remove-cross-compiation-check.patch |=C2=A0 33 ---<br>
=C2=A0.../{<a href=3D"http://tbb_2021.11.0.bb" rel=3D"noreferrer" target=3D=
"_blank">tbb_2021.11.0.bb</a> =3D&gt; <a href=3D"http://tbb_2021.12.0.bb" r=
el=3D"noreferrer" target=3D"_blank">tbb_2021.12.0.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 +-<br>
=C2=A0...<a href=3D"http://ids_2023.01.16.bb" rel=3D"noreferrer" target=3D"=
_blank">ids_2023.01.16.bb</a> =3D&gt; <a href=3D"http://usbids_2025.09.15.b=
b" rel=3D"noreferrer" target=3D"_blank">usbids_2025.09.15.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0...<a href=3D"http://1.18.1.bb" rel=3D"noreferrer" target=3D"_blank">=
1.18.1.bb</a> =3D&gt; <a href=3D"http://xdg-desktop-portal_1.18.4.bb" rel=
=3D"noreferrer" target=3D"_blank">xdg-desktop-portal_1.18.4.bb</a>} |=C2=A0=
 =C2=A06 +-<br>
=C2=A0.../0001-nss-nspr-fix-for-multilib.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A07 +-<br>
=C2=A0.../xmlsec1/change-finding-path-of-nss.patch=C2=A0 |=C2=A0 =C2=A07 +-=
<br>
=C2=A0.../{<a href=3D"http://xmlsec1_1.3.4.bb" rel=3D"noreferrer" target=3D=
"_blank">xmlsec1_1.3.4.bb</a> =3D&gt; <a href=3D"http://xmlsec1_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">xmlsec1_1.3.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...guished_name-in-etc-xrdp-openssl.con.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0.../xrdp/0001-Fix-the-compile-error.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
12 +-<br>
=C2=A0...1-arch-Define-NO_NEED_ALIGN-on-ppc64.patch |=C2=A0 =C2=A09 +-<br>
=C2=A0...001-mark-count-with-unused-attribute.patch |=C2=A0 =C2=A09 +-<br>
=C2=A0.../xrdp/{<a href=3D"http://xrdp_0.9.19.bb" rel=3D"noreferrer" target=
=3D"_blank">xrdp_0.9.19.bb</a> =3D&gt; <a href=3D"http://xrdp_0.9.20.bb" re=
l=3D"noreferrer" target=3D"_blank">xrdp_0.9.20.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0...ld-on-32bit-arches-with-64bit-time_t.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0.../evtest/{<a href=3D"http://evtest_1.35.bb" rel=3D"noreferrer" targ=
et=3D"_blank">evtest_1.35.bb</a> =3D&gt; <a href=3D"http://evtest_1.36.bb" =
rel=3D"noreferrer" target=3D"_blank">evtest_1.36.bb</a>} |=C2=A0 =C2=A02 +-=
<br>
=C2=A0.../libhtml/<a href=3D"http://libhtml-tree-perl_5.03.bb" rel=3D"noref=
errer" target=3D"_blank">libhtml-tree-perl_5.03.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0.../python/<a href=3D"http://python3-passlib_1.7.4.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-passlib_1.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../python/<a href=3D"http://python3-transitions_0.9.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-transitions_0.9.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-httpd/apache2/<a href=3D"http://apache2_2.4.65.bb" rel=3D=
"noreferrer" target=3D"_blank">apache2_2.4.65.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0...issions-check-when-saving-allowed-cr.patch |=C2=A0 25 ++<br>
=C2=A0...e-potentially-malicious-HTTP-headers.patch |=C2=A0 53 +++++<br>
=C2=A0...0001-Foreign-module-may-need-a-check.patch |=C2=A0 27 +++<br>
=C2=A0...0001-HTML-escape-command-description.patch |=C2=A0 29 +++<br>
=C2=A0...es-cannot-contact-special-characters.patch |=C2=A0 26 +++<br>
=C2=A0.../recipes-webadmin/webmin/<a href=3D"http://webmin_1.850.bb" rel=3D=
"noreferrer" target=3D"_blank">webmin_1.850.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A07 +-<br>
=C2=A091 files changed, 1403 insertions(+), 321 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
25-62168.patch<br>
=C2=A0rename meta-oe/licenses/{OpenLDAP =3D&gt; OLDAP-2.8} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-=
and-CVE-2024-50383.patch<br>
=C2=A0rename meta-oe/recipes-crypto/cryptsetup/{<a href=3D"http://cryptsetu=
p_2.7.2.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.7.2.bb</a> =
=3D&gt; <a href=3D"http://cryptsetup_2.7.5.bb" rel=3D"noreferrer" target=3D=
"_blank">cryptsetup_2.7.5.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024=
-52949.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-08=
48-CVE-2015-4588.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-46=
95.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-46=
96.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-90=
11.patch<br>
=C2=A0rename meta-oe/recipes-extended/redis-plus-plus/{<a href=3D"http://re=
dis-plus-plus_1.3.11.bb" rel=3D"noreferrer" target=3D"_blank">redis-plus-pl=
us_1.3.11.bb</a> =3D&gt; <a href=3D"http://redis-plus-plus_1.3.12.bb" rel=
=3D"noreferrer" target=3D"_blank">redis-plus-plus_1.3.12.bb</a>} (95%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/0001-hiredis-use-default-CC-if-it-is-set.patch (89%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (97%)<=
br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/0003-hack-to-force-use-of-libc-malloc.patch (81%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/0004-src-Do-not-reset-FINAL_LIBS.patch (74%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (92%)<b=
r>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/0006-Define-correct-gregs-for-RISCV32.patch (97%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/init-redis-server (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/redis.conf (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-7.2.11 =3D&gt; redis-7.2=
.12}/redis.service (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_6.2.20=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.2.20.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_6.2.21.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.=
2.21.bb</a>} (96%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_7.2.11=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.11.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_7.2.12.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.=
2.12.bb</a>} (93%)<br>
=C2=A0rename meta-oe/recipes-graphics/feh/{<a href=3D"http://feh_3.10.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">feh_3.10.2.bb</a> =3D&gt; <a href=3D"=
http://feh_3.10.3.bb" rel=3D"noreferrer" target=3D"_blank">feh_3.10.3.bb</a=
>} (88%)<br>
=C2=A0rename meta-oe/recipes-graphics/fontforge/{<a href=3D"http://libspiro=
_20221101.bb" rel=3D"noreferrer" target=3D"_blank">libspiro_20221101.bb</a>=
 =3D&gt; <a href=3D"http://libspiro_20240902.bb" rel=3D"noreferrer" target=
=3D"_blank">libspiro_20240902.bb</a>} (85%)<br>
=C2=A0rename meta-oe/recipes-graphics/jasper/{<a href=3D"http://jasper_4.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">jasper_4.1.1.bb</a> =3D&gt; <a h=
ref=3D"http://jasper_4.1.2.bb" rel=3D"noreferrer" target=3D"_blank">jasper_=
4.1.2.bb</a>} (95%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-202=
5-54874.patch<br>
=C2=A0rename meta-oe/recipes-graphics/openjpeg/{<a href=3D"http://openjpeg_=
2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.3.bb</a> =3D&gt=
; <a href=3D"http://openjpeg_2.5.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>openjpeg_2.5.4.bb</a>} (86%)<br>
=C2=A0rename meta-oe/recipes-kernel/libbpf/{<a href=3D"http://libbpf_1.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libbpf_1.4.0.bb</a> =3D&gt; <a hre=
f=3D"http://libbpf_1.4.7.bb" rel=3D"noreferrer" target=3D"_blank">libbpf_1.=
4.7.bb</a>} (92%)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-201=
8-13440.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-201=
8-17059.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-201=
9-13147.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-202=
2-24599.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-security/audit/audit/0001-Replace-=
__attribute_malloc__-with-__attribute__-__ma.patch<br>
=C2=A0rename meta-oe/recipes-security/audit/{<a href=3D"http://audit_4.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">audit_4.0.1.bb</a> =3D&gt; <a href=
=3D"http://audit_4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">audit_4.0.2=
.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-=
4478.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2926.p=
atch<br>
=C2=A0rename meta-oe/recipes-support/libbytesize/{<a href=3D"http://libbyte=
size_2.10.bb" rel=3D"noreferrer" target=3D"_blank">libbytesize_2.10.bb</a> =
=3D&gt; <a href=3D"http://libbytesize_2.11.bb" rel=3D"noreferrer" target=3D=
"_blank">libbytesize_2.11.bb</a>} (93%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001=
-bindings-cxx-tests-set-direction-when-reconfiguring-.patch<br>
=C2=A0rename meta-oe/recipes-support/libgpiod/{<a href=3D"http://libgpiod_1=
.6.4.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.4.bb</a> =3D&gt;=
 <a href=3D"http://libgpiod_1.6.5.bb" rel=3D"noreferrer" target=3D"_blank">=
libgpiod_1.6.5.bb</a>} (94%)<br>
=C2=A0rename meta-oe/recipes-support/libgpiod/{<a href=3D"http://libgpiod_2=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_2.1.2.bb</a> =3D&gt;=
 <a href=3D"http://libgpiod_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">=
libgpiod_2.1.3.bb</a>} (87%)<br>
=C2=A0rename meta-oe/recipes-support/libiodbc/{<a href=3D"http://libiodbc_3=
.52.15.bb" rel=3D"noreferrer" target=3D"_blank">libiodbc_3.52.15.bb</a> =3D=
&gt; <a href=3D"http://libiodbc_3.52.16.bb" rel=3D"noreferrer" target=3D"_b=
lank">libiodbc_3.52.16.bb</a>} (82%)<br>
=C2=A0rename meta-oe/recipes-support/mcelog/{<a href=3D"http://mcelog_198.b=
b" rel=3D"noreferrer" target=3D"_blank">mcelog_198.bb</a> =3D&gt; <a href=
=3D"http://mcelog_200.bb" rel=3D"noreferrer" target=3D"_blank">mcelog_200.b=
b</a>} (79%)<br>
=C2=A0rename meta-oe/recipes-support/openldap/{<a href=3D"http://openldap_2=
.6.7.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.6.7.bb</a> =3D&gt;=
 <a href=3D"http://openldap_2.6.10.bb" rel=3D"noreferrer" target=3D"_blank"=
>openldap_2.6.10.bb</a>} (96%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-=
new-GCC-12-13-warnings-1192.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-hwloc_detecti=
on.cmake-remove-cross-compiation-check.patch<br>
=C2=A0rename meta-oe/recipes-support/tbb/{<a href=3D"http://tbb_2021.11.0.b=
b" rel=3D"noreferrer" target=3D"_blank">tbb_2021.11.0.bb</a> =3D&gt; <a hre=
f=3D"http://tbb_2021.12.0.bb" rel=3D"noreferrer" target=3D"_blank">tbb_2021=
.12.0.bb</a>} (92%)<br>
=C2=A0rename meta-oe/recipes-support/usbids/{<a href=3D"http://usbids_2023.=
01.16.bb" rel=3D"noreferrer" target=3D"_blank">usbids_2023.01.16.bb</a> =3D=
&gt; <a href=3D"http://usbids_2025.09.15.bb" rel=3D"noreferrer" target=3D"_=
blank">usbids_2025.09.15.bb</a>} (84%)<br>
=C2=A0rename meta-oe/recipes-support/xdg-desktop-portal/{<a href=3D"http://=
xdg-desktop-portal_1.18.1.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desk=
top-portal_1.18.1.bb</a> =3D&gt; <a href=3D"http://xdg-desktop-portal_1.18.=
4.bb" rel=3D"noreferrer" target=3D"_blank">xdg-desktop-portal_1.18.4.bb</a>=
} (88%)<br>
=C2=A0rename meta-oe/recipes-support/xmlsec1/{<a href=3D"http://xmlsec1_1.3=
.4.bb" rel=3D"noreferrer" target=3D"_blank">xmlsec1_1.3.4.bb</a> =3D&gt; <a=
 href=3D"http://xmlsec1_1.3.5.bb" rel=3D"noreferrer" target=3D"_blank">xmls=
ec1_1.3.5.bb</a>} (96%)<br>
=C2=A0rename meta-oe/recipes-support/xrdp/{<a href=3D"http://xrdp_0.9.19.bb=
" rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.19.bb</a> =3D&gt; <a href=
=3D"http://xrdp_0.9.20.bb" rel=3D"noreferrer" target=3D"_blank">xrdp_0.9.20=
.bb</a>} (97%)<br>
=C2=A0rename meta-oe/recipes-test/evtest/{<a href=3D"http://evtest_1.35.bb"=
 rel=3D"noreferrer" target=3D"_blank">evtest_1.35.bb</a> =3D&gt; <a href=3D=
"http://evtest_1.36.bb" rel=3D"noreferrer" target=3D"_blank">evtest_1.36.bb=
</a>} (90%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Add-missing-permissions-check-when-saving-allowed-cr.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Escape-potentially-malicious-HTTP-headers.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Foreign-module-may-need-a-check.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
HTML-escape-command-description.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-=
Object-names-cannot-contact-special-characters.patch<br>
<br>
-- <br>
2.51.2<br>
<br>
</blockquote></div>

--000000000000acc02a0643fca855--

