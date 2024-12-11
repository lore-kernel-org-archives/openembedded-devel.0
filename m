Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA4DE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 13:51:25 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.11366.1733925079491648361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 05:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVLssX7e;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3c8c572309so858697276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 05:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733925078; x=1734529878; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yR0ZmAvMq2eBdsf2QsYtMUAcbFXEar4+GY3wR3xqu4=;
        b=OVLssX7eh898GQT1D8wrSJe3kEHGM47XqtSp/vT9HDz2AT7aHWfPl4jrThpy+OaXyg
         WoWLsnRVIj6KbxdqRKnxiGcbOC5/qUb1iOr/iFQSVllXJ/hKO50FC9b+/8eIp8qZdZSo
         gBJSSQi3XFU0wXVoxuORXCeyTeZxUI5UaRmGpnUkhKmnJTOQvqfPf/wbTekPkhLfMV6X
         LEv4mytTcJjlYzUJT/6C54suyEgZt3eBw8YxyCFuflEWGgS7l3PRPUCdBeCDFZvSx3Hh
         9dy3k6vxsztik62c7B53S1Pv+WGBsuMg5Dcf3qbJwpIuzo1E3RuUtbEM6csXKfMRpMkj
         ItpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925078; x=1734529878;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yR0ZmAvMq2eBdsf2QsYtMUAcbFXEar4+GY3wR3xqu4=;
        b=MdkiflB7HzmhN41JZeMbViBoiz+QuzxsBvgBYYpw0nj6k4GoXWCxykA2th/fi19Rj3
         vdBWTqCDzZIqGJ45vgQ00kv8Vh/1m7eGAm2C+SkyttZv/b86xqxxpfgHqa9Z4NGPO38Z
         kg9cvDXullHXqW0yRJPcwIa/r+CLBqaio9l/nelwvZfpmW75qpN5NaNd1jt+lwhnb33M
         1lXJ8PWebD0i7ZT6jcPN6P7OwwnK5SKiCUU39rlXZ89LxMJFohcxTnscMaK4KAhuWgcQ
         xHAQjMAVsqstf8f4zzXA1QuDH6DX+ofM95oIPoZLztke+zF8y84jEkAmbOCazFhVSLpe
         Dbng==
X-Forwarded-Encrypted: i=1; AJvYcCW982xGAjYwG+SX+RERUTAlgIhSEIGtpZ5FdkL9Fx1pQ+wIb5/uLVMMw0n83aq1mZj7SSKOHS9itX0JHxV2zExDT+c=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/GfukB/AZJ3Ng2R6GWHn1pdpQW8w7W96U2g25MFsyqUA0jRz/
	mPNbcGP3UmuKvkLe17wSfqXH3MjN6wgRAdnqsnNQ/MeSskg8qgraFFFQP1Tl
X-Gm-Gg: ASbGncv+2fVL4IGpoQm+RWtP5QHNG6NMLzUNEekY+zSintzw/ztcG2fMAT4XJ8K302C
	Ps8ZBjF7aUehf6qCp9srKcPhfd5w9RN2g3wHOhMmb9ThIhCuwvCCjfyJnfmKbdleMLz6EU5Jo5q
	1vrCKtLvWc/tzidU1knOGyB93t06lENpubKVM008wAzUS3j+flCD6GjcVBnWd6Nowd58SscOE+2
	b/0kBCuuMW0p3az2xSPdd6xqIT/eHSy9SSYh31OV1Qjb2evJA4LtQ+2Z9DfqozJE/H9/9yA6pRs
	yacONZ+Hg8SfbuqdPaYP69JWXSo=
X-Google-Smtp-Source: AGHT+IFvjkPql4oTT5bNMK+cIRLte20gOrbmVptmdDtSQhAqb0Dn36iBc8GXa/XygKvX5LoFAE+1gw==
X-Received: by 2002:a05:6902:2b85:b0:e3a:5128:5f21 with SMTP id 3f1490d57ef6-e3c8e6fc7f2mr3345473276.37.1733925078450;
        Wed, 11 Dec 2024 05:51:18 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:c8ab:874:7a76:f1ed? ([2600:1700:45dd:7000:c8ab:874:7a76:f1ed])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3c949c1bf6sm277771276.21.2024.12.11.05.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:51:18 -0800 (PST)
Message-ID: <b4df4743-842d-457b-9848-dedeea789cc5@gmail.com>
Date: Wed, 11 Dec 2024 08:51:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Dec 11th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 13:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114279

The following changes since commit 4ad41baed6236d499804cbfc4f174042d84fce97:

   sound-theme-freedesktop: Update SRC_URI (2024-10-13 11:19:56 -0400)

are available in the Git repository at:

   git://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf:

   libgsf: Upgrade 1.14.49 -> 1.14.53 (2024-12-08 15:04:56 -0500)

----------------------------------------------------------------
Archana Polampalli (1):
       apache2: Upgrade 2.4.60 -> 2.4.62

Chen Qi (1):
       protobuf: fix CVE-2024-7254

Haixiao Yan (3):
       wireguard-tools: clean the do_fecth warning
       openvpn: upgrade 2.5.6 -> 2.5.11
       freeradius: upgrade 3.0.21 -> 3.0.27

Jiaying Song (2):
       openipmi: upgrade 2.0.32->2.0.36
       python3-aiohttp: fix 
CVE-2023-49081/CVE-2024-30251/CVE-2024-52304/CVE-2023-49082/CVE-2024-27306

Khem Raj (1):
       gitpkgv: Fix python deprecation warning

Martin Jansa (5):
       flatbuffers: fix native build with gcc-14 on host
       python3-lxml: ignore incompatible-pointer-types issues in native 
build
       libjs-jquery-cookie: update branch from master to main
       poco: use main instead of master branch
       python3-geomet: fix branch parameter

Mingli Yu (1):
       mbedtls: Upgrade 2.28.8 -> 2.28.9

Peter Marko (3):
       squid: conditionally set status of CVE-2024-45802
       nss: patch CVE-2024-6602
       nss: patch CVE-2024-6609

Ramax Lo (1):
       vk-gl-cts: Fix branch names

Rohini Sangam (1):
       freeradius: Security fix for CVE-2024-3596

Yi Zhao (2):
       open-vm-tools: Security fixes CVE-2023-34059
       hostapd: Security fix for CVE-2023-52160

Yogita Urade (1):
       php: upgrade 8.1.29 -> 8.1.30

Zhang Peng (2):
       frr: fix multiple CVEs
       libgsf: Upgrade 1.14.49 -> 1.14.53

hongxu (3):
       indent: fix CVE-2024-0911
       ntfs-3g-ntfsprogs: fix CVE-2023-52890
       p7zip: Fix CVE-2023-52169 and CVE-2023-52168

  ...0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch | 42 ++
  .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb            | 1 +
  .../libgsf/{libgsf_1.14.49.bb => libgsf_1.14.53.bb} |   9 +-
  .../freeradius/files/0001-Add-autogen.sh.patch                  | 47 ++
  ...-Enable-and-change-user-and-group-of-freeradius-serve.patch} | 12 +-
  ...on.patch => 0003-configure.ac-allow-cross-compilation.patch} |  10 +-
  ...libtool-detection.patch => 0004-Fix-libtool-detection.patch} |  33 +-
  ...bcap.patch => 0005-configure.ac-add-option-for-libcap.patch} |  12 +-
  ...ing-host-dirs.patch => 0006-Avoid-searching-host-dirs.patch} |  57 +-
  ...patch => 0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch} |  12 +-
  ...se-jlibtool.patch => 0008-libtool-do-not-use-jlibtool.patch} |  24 +-
  ...r-BUILT_WITH.patch => 0009-Fix-quoting-for-BUILD_WITH.patch} |  13 +-
  ... => 0010-fix-error-for-expansion-of-macro-in-thread.h.patch} |   6 +-
  ...-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch} | 17 +-
  ...-raddb-certs-Makefile-fix-the-existed-certificate-err.patch} | 10 +-
  ...-raddb-certs-Makefile-fix-the-occasional-verification.patch} | 17 +-
  ...-2.7.patch => 0014-Workaround-error-with-autoconf-2.7.patch} |  14 +-
  ...tch => 0015-bootstrap-check-commands-of-openssl-exist.patch} |  10 +-
  ...flags.patch => 0016-version.c-don-t-print-build-flags.patch} |   6 +-
  .../recipes-connectivity/freeradius/files/CVE-2022-41860.patch  | 118 
-----
  .../recipes-connectivity/freeradius/files/CVE-2022-41861.patch  | 53 --
  .../freeradius/{freeradius_3.0.21.bb => freeradius_3.0.27.bb} |  37 +-
  .../mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb} |   2 +-
  meta-networking/recipes-daemons/squid/squid_4.15.bb             | 3 +
  .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 +-
  meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch  | 43 ++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch  | 130 
+++++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch  | 69 +++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch  | 111 ++++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch  | 84 +++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 7 +-
  .../open-vm-tools/open-vm-tools/CVE-2023-34059.patch            | 188 
+++++++
  .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
  .../0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch | 41 --
  .../openipmi/files/fix-symlink-install-error-in-cmdlang.patch   | 11 +-
  .../files/openipmi-remove-host-path-from-la_LDFLAGS.patch       | 49 --
  .../openipmi/{openipmi_2.0.32.bb => openipmi_2.0.36.bb} |  15 +-
  .../recipes-support/openvpn/openvpn/CVE-2024-24974.patch        | 49 --
  .../recipes-support/openvpn/openvpn/CVE-2024-27459.patch        | 99 ----
  .../recipes-support/openvpn/openvpn/CVE-2024-27903.patch        | 119 
-----
  .../openvpn/{openvpn_2.5.6.bb => openvpn_2.5.11.bb} |   7 +-
  meta-oe/classes/gitpkgv.bbclass                                 | 2 +-
  .../recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch   | 198 
+++++++
  meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 1 +
  ...1-C-stl_emulation-span-count_-is-not-const-anymore-722.patch | 27 +
  meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb       | 4 +-
  meta-oe/recipes-devtools/php/{php_8.1.29.bb => php_8.1.30.bb} |   2 +-
  ...1-Add-recursion-check-when-parsing-unknown-fields-in-J.patch | 795 
++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb            | 1 +
  .../0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch     | 123 
+++++
  meta-oe/recipes-extended/indent/indent_2.2.12.bb                | 1 +
  .../files/0001-Fix-two-buffer-overflow-vulnerabilities.patch    | 455 
++++++++++++++++
  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                   | 1 +
  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc              | 6 +-
  meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb      | 2 +-
  meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch             | 65 +++
  meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch             | 30 ++
  meta-oe/recipes-support/nss/nss_3.74.bb                         | 2 +
  meta-oe/recipes-support/poco/poco_1.11.2.bb                     | 2 +-
  .../python/python3-aiohttp/CVE-2023-49081.patch                 | 96 ++++
  .../python/python3-aiohttp/CVE-2023-49082.patch                 | 105 ++++
  .../python/python3-aiohttp/CVE-2024-27306.patch                 | 81 +++
  .../python/python3-aiohttp/CVE-2024-30251.patch                 | 522 
++++++++++++++++++
  .../python/python3-aiohttp/CVE-2024-52304.patch                 | 46 ++
  meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb    | 5 +
  meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb     | 5 +-
  meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb       | 2 +
  .../apache2/{apache2_2.4.60.bb => apache2_2.4.62.bb} |   2 +-
  68 files changed, 3459 insertions(+), 712 deletions(-)
  create mode 100644 
meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.49.bb => 
libgsf_1.14.53.bb} (52%)
  create mode 100644 
meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-enble-user-in-conf.patch 
=> 0002-Enable-and-change-user-and-group-of-freeradius-serve.patch} (67%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-configure.ac-allow-cross-compilation.patch 
=> 0003-configure.ac-allow-cross-compilation.patch} (85%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool-detection.patch 
=> 0004-Fix-libtool-detection.patch} (73%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-configure.ac-add-option-for-libcap.patch 
=> 0005-configure.ac-add-option-for-libcap.patch} (87%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-avoid-searching-host-dirs.patch 
=> 0006-Avoid-searching-host-dirs.patch} (85%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-rlm_python-add-PY_INC_DIR.patch 
=> 0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch} (81%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool-do-not-use-jlibtool.patch 
=> 0008-libtool-do-not-use-jlibtool.patch} (91%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-quoting-for-BUILT_WITH.patch 
=> 0009-Fix-quoting-for-BUILD_WITH.patch} (87%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-error-for-expansion-of-macro.patch 
=> 0010-fix-error-for-expansion-of-macro-in-thread.h.patch} (95%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch 
=> 0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch} (59%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch 
=> 0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch} (92%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-Makefile-fix-the-occasional-verification.patch 
=> 0013-raddb-certs-Makefile-fix-the-occasional-verification.patch} (94%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{0001-workaround-error-with-autoconf-2.7.patch 
=> 0014-Workaround-error-with-autoconf-2.7.patch} (77%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{check-openssl-cmds-in-script-bootstrap.patch 
=> 0015-bootstrap-check-commands-of-openssl-exist.patch} (81%)
  rename 
meta-networking/recipes-connectivity/freeradius/files/{0001-version.c-don-t-print-build-flags.patch 
=> 0016-version.c-don-t-print-build-flags.patch} (86%)
  delete mode 100644 
meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
  delete mode 100644 
meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
  rename 
meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.21.bb => 
freeradius_3.0.27.bb} (89%)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.8.bb 
=> mbedtls_2.28.9.bb} (97%)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34059.patch
  delete mode 100644 
meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
  delete mode 100644 
meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
  rename meta-networking/recipes-support/openipmi/{openipmi_2.0.32.bb => 
openipmi_2.0.36.bb} (87%)
  delete mode 100644 
meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
  delete mode 100644 
meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
  delete mode 100644 
meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
  rename meta-networking/recipes-support/openvpn/{openvpn_2.5.6.bb => 
openvpn_2.5.11.bb} (92%)
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch
  create mode 100644 
meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-C-stl_emulation-span-count_-is-not-const-anymore-722.patch
  rename meta-oe/recipes-devtools/php/{php_8.1.29.bb => php_8.1.30.bb} (99%)
  create mode 100644 
meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
  create mode 100644 
meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
  create mode 100644 
meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49081.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49082.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-27306.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-30251.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb => 
apache2_2.4.62.bb} (99%)


