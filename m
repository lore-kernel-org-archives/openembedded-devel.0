Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68985C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 17:29:51 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.682.1745170189442112111
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Apr 2025 10:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtXvvvZA;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7043db8491dso29145307b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745170188; x=1745774988; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/6wG+RC4GnyZOoFkwjwUx2YLqxErNPpEB18jK3Qi0=;
        b=JtXvvvZA9MnZ84YFYSnMrgFVcKOSzDuRU1B+bRb+DgsK2QfFaM9WSVwknSRHi5hfpd
         e2MNPxwBZ7Cj7mp+VKQo9uYA47N4UHFgErz0HNT0jpgNEqPSOlnGL7NpgdG0hT03CDG1
         ly+xNa+Q4iMyt5ARuJc4wZvKenCmK6RYMw23TtMwipPwIMKsLbRmOxQG2a9bSsjxG9/S
         YeRFpsf1BTiWZHK7pV3dnBt9/9KRFhBBERJfPfj87Qw5OdBVzMmjFqiEg1Q2A6uVwB6B
         RnN7yfbVJZ/Qaxg2PXt3SexHp+HsTbwHFntGbQsM/jKOC454vlaZMUL7ZgpHglAcytID
         TZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745170188; x=1745774988;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8R/6wG+RC4GnyZOoFkwjwUx2YLqxErNPpEB18jK3Qi0=;
        b=VxlqERubdpZAU3asUtlgorUHsglGZEoFt8oGXL9uYy0IcEJsOoY4gjDs5JaUQ0hu1W
         7zA/M/uGFTMoImDtXoew93vzC/J31rUSjQ+2tjrRbHaoCPROOl+8u+NMvZkFkYj5guzK
         GJraY0XgtxTy16+80wJloEWwrzykCHA3gboQBPkcVz/rg2M9GKbpfY8e1GEtjIB5YKg8
         h1E5ntoo29Z3pFmuuhTT/wv9kzxOhdO+0YhCx77XIqllNMKtmjl9KmcrJM8e06lyGdKA
         7HMxsXPdlf+mNZ1QUEFYbG6MooN2UupCPCok7uMVZP27WLySkwqytXtCkJOgWadLhqnT
         0iRg==
X-Forwarded-Encrypted: i=1; AJvYcCUIrhVgv1Lsyt68R9sNHzKWMhbaOiBtlrrqRPhBDl7TjgRAwPcYeqAMaUu6ta0OyKQIxfkbihudrCSkCnLoGDSOeYE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMIjsdN54qUrpw4dzSYjS30U/zI8bZHIVg2yt6SnRKGJA2wa5p
	0R4Pgu/2fJW8FNYEQBkLxpfz5hbsBc/e1C05NWR+80BcJJ0EFyzl
X-Gm-Gg: ASbGncsJ+YMMaKCRwpp0z1Cx+uZferECsXRcKIWCJjr9G+Rhr9Qgsjul/jq/5ysBWGM
	gwii8U7M+M/6y9Y0TNekEyFHO89BPXlESPYiUKGDgEumgOCKpp+vlvWhN1lyIWFiVei0DkLTtW1
	jT2bfhqhwfZ6R/2jGpIpFyqRZjH1uxBbp1us3cW7LPhLhKH5Fyx9SRZ5IRaLFOw7PXc1tKUw48y
	xSnEH/pS3V74MShQCxDPoozZYBpXB8rizAtd2jFqTJOu2ovWOmLRmTqBcvlKD820lAraV2aaDjr
	rDVBnEPpZ8HUy6sVv9Y9d7sXzCAQQqECCOg6ZLwQCpFKs1tWAA7cHkY9ffTCWa6IbEmmuWnenNd
	9oHOHjluPIy7owsTt
X-Google-Smtp-Source: AGHT+IFnMqTCUsjx6mssSyIOcKMnqiq3yhYZG2WICHf+2y/3Noe9wkbwPegxLzpRrI0qXzPeaseL2Q==
X-Received: by 2002:a05:690c:6b87:b0:700:a988:59dc with SMTP id 00721157ae682-706cdac3a3dmr134912977b3.31.1745170188489;
        Sun, 20 Apr 2025 10:29:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:9135:c479:111d:3d43? ([2600:1700:45dd:7000:9135:c479:111d:3d43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fbc5sm15456617b3.21.2025.04.20.10.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 10:29:48 -0700 (PDT)
Message-ID: <f5a909bd-6758-4488-957d-22dd872ae45b@gmail.com>
Date: Sun, 20 Apr 2025 13:29:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: April 20th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 17:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116988

The following changes since commit 67ad83dd7c2485dae0c90eac345007af6195b84d:

   krb5: fix CVE-2025-24528 (2025-03-27 14:04:21 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to e92d0173a80ea7592c866618ef5293203c50544c:

   lmsensors: Clean stale files for sensord to avoid incorrect GCC 
header dependencies (2025-04-16 20:33:56 -0400)

----------------------------------------------------------------
Awais Belal (1):
       mongodb: update to 4.4.29

Divya Chellam (1):
       openvpn: upgrade 2.6.12 -> 2.6.14

Haixiao Yan (1):
       lmsensors: Clean stale files for sensord to avoid incorrect GCC 
header dependencies

Khem Raj (13):
       wolfssl: Add packageconfig for reproducible build
       blueman: Fix buildpathe issue with cython generated code
       botan: Make it reproducible
       keepalived: Make build reproducible
       ldns: Fix buildpaths QA issues
       python3-kivy: Remove buildpaths from comments in generated C sources
       python3-pyproj: Fix buildpaths QA Error
       python3-pyproj: Remove absolute paths from cython generated .c files
       python3-pycocotools: Remove absolute paths from comments
       lprng: Specify target paths for needed utilities
       fwknop: Specify target locations of gpg and wget
       e2tools: Fix buildpaths QA warning in config.status in ptest
       sharutils: Let POSIX_SHELL be overridable from environment

Martin Jansa (1):
       gcab: fix buildpaths QA issue

Soumya Sambu (1):
       php: Upgrade 8.2.26 -> 8.2.28

Wang Mingyu (3):
       nana: Fix buildpaths warning.
       fetchmail: Fix buildpaths warning.
       fetchmail: disable rpath to fix buildpaths warning.

Yi Zhao (2):
       mbedtls: upgrade 2.28.9 -> 2.28.10
       mbedtls: 3.6.2 -> 3.6.3

alperak (4):
       rdist: Fix contains reference to TMPDIR [buildpaths] warning
       perfetto: Fix contains reference to TMPDIR [buildpaths] warning
       hplip: Fix contains reference to TMPDIR [buildpaths] warning
       boinc-client: Fix contains reference to TMPDIR [buildpaths] warning

  meta-filesystems/recipes-utils/e2tools/e2tools_git.bb           | 2 +-
  .../blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch | 38 
+++++++++++++++++++++++
  meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb   | 1 +
  .../mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} |  2 +-
  .../mbedtls/{mbedtls_3.6.2.bb => mbedtls_3.6.3.bb} |  7 ++---
  meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb       | 2 +-
  meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb   | 3 ++
  ...1-configure.ac-Do-not-emit-compiler-flags-into-object-.patch | 29 
++++++++++++++++++
  meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb  | 5 +++
  meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb   | 2 +-
  meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb         | 4 ++-
  .../openvpn/{openvpn_2.6.12.bb => openvpn_2.6.14.bb} |  2 +-
  .../mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch | 28 
-----------------
  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 7 ++---
  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb               | 5 ++-
  meta-oe/recipes-crypto/botan/botan_3.2.0.bb                     | 8 ++---
  meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb                     | 3 +-
  meta-oe/recipes-devtools/perfetto/perfetto.bb                   | 4 +--
  meta-oe/recipes-devtools/php/{php_8.2.26.bb => php_8.2.28.bb} |  2 +-
  meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb           | 4 +++
  meta-oe/recipes-extended/hplip/hplip_3.22.10.bb                 | 2 +-
  meta-oe/recipes-extended/lprng/lprng_3.8.C.bb                   | 4 ++-
  meta-oe/recipes-extended/nana/nana_git.bb                       | 6 ++++
  ...1-gcab-enums.c.etemplate-include-basename-instead-of-f.patch | 37 
+++++++++++++++++++++++
  meta-oe/recipes-gnome/gcab/gcab_1.6.bb                          | 1 +
  ...1-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch | 47 
+++++++++++++++++++++++++++++
  meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb           | 3 ++
  meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb       | 7 +++++
  .../recipes-devtools/python/python3-pycocotools_2.0.7.bb        | 4 +++
  meta-python/recipes-devtools/python/python3-pyproj/rpath.patch  | 18 
+++++++++++
  meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb     | 10 
++++++
  31 files changed, 243 insertions(+), 54 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb 
=> mbedtls_2.28.10.bb} (98%)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.2.bb 
=> mbedtls_3.6.3.bb} (91%)
  create mode 100644 
meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
  rename meta-networking/recipes-support/openvpn/{openvpn_2.6.12.bb => 
openvpn_2.6.14.bb} (97%)
  delete mode 100644 
meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
  rename meta-oe/recipes-devtools/php/{php_8.2.26.bb => php_8.2.28.bb} (99%)
  create mode 100644 
meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch
  create mode 100644 
meta-oe/recipes-support/sharutils/sharutils/0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pyproj/rpath.patch


