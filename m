Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AA1C3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 12:04:29 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.121593.1723723462089415659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 05:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NfIqtXdr;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64b417e1511so8522347b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723723461; x=1724328261; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrqTZCiyMaQ5srIYSqlRTs16XTEQZZ7W5dwOU3QiKSA=;
        b=NfIqtXdrBgK3RE8CiRMjUfMzb/TIet4DJr7MKDE/+J1eCGx6YH33cWogEdz86PQL7/
         KmByYYlhCPwaQXJNVftG/U7dsL8vQNlDlTaPJ7voiixk0eXL17NwsYojDeOuIPTUjaI0
         Mq0Bh3q9zxZCmkxNwm1sg8N1oxLoYMFNU9zIz1XLPMVbwWyEzrOk9XCx9F5lKQQ7rLv4
         JVr+9y94yCuEOISlc3CwVq7uoeCaMq8Zs6jHSU2z+7y4EY4kKF6cTd0mT9HdT0D2tUr/
         5ulGFtTRpX4QRxgw/GdZgMSrL3MIsmeUGQBXLue/5d3dLOsKFXxUfkjneeGsw1E43uXU
         VUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723723461; x=1724328261;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrqTZCiyMaQ5srIYSqlRTs16XTEQZZ7W5dwOU3QiKSA=;
        b=BMmCSqNry16IZJ36P/zBcg6ZAXkvrOTdMmaM0Lzffrn14+BjbDt5QqzlMRcQBTBWMD
         zOcOKk7SbrJ3q8lzruMw1j5Nph7OM1kj8hTKsFuKIFKGiU/uwi62LmccjPNnnq4CpN3V
         +T/BZUMZqATkCp1RsXql//zAej9rlyfNuI24XyDEsVnppwbrnAGL9zbCFqVtU2Bo8WmJ
         a5TFWa7ipUdVG+caaKkRg3RxU20OH3+ZOyxlIEz1sqEFe15vqq1FTMUogDx/4abGlCZS
         UTzLC2OIkrh5YS6dX0M67g5LvIaDnJbzhUz0BgZTWMqe8UHYJ0zAaAcCNd+Em0jFM5tE
         u1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW255T2r12+xQy6F5Hl0W2X67lQktKggxuqAFpASlzJ2gXoKFcdnQAhLCra6vHqJvttSANLHaUPTUBBzJdn+t8Qxdo6OkMBbRQjerMF18btXdnsZ2/XvXt2VA==
X-Gm-Message-State: AOJu0YyX0x3nJmD6BnqKrf6adhOEaxzsvSQaKmpAzhfmm7ODSDEKMoXC
	SluovFMyyNjZrsZZYapXkQ52uCEnM7ZSFQxdt5CitWWIIdK8YcdU0HvAuQ==
X-Google-Smtp-Source: AGHT+IGE5cvmKq8Gp7pbhUimmSnb0AhKv7HZ8RaUU3Mzv/hmkiHl1GZtEH+Hb6bZv5sYs/9z1gfrMg==
X-Received: by 2002:a05:690c:d90:b0:69d:e911:88c3 with SMTP id 00721157ae682-6ac99517db9mr71936167b3.29.1723723460911;
        Thu, 15 Aug 2024 05:04:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:2e25:7600:d68b:4c69? ([2600:1700:45dd:7000:2e25:7600:d68b:4c69])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6af9d91ccabsm2160277b3.127.2024.08.15.05.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 05:04:20 -0700 (PDT)
Message-ID: <141465e9-8d41-46a0-b95a-0c50f1def2ba@gmail.com>
Date: Thu, 15 Aug 2024 08:04:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Aug 15th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 12:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111822

The following changes since commit 2338409efc51cf2022ff5610a9fb689251706e2b:

   python3-pydantic-core: Fix build with python 3.12.4 (2024-08-03 
12:25:17 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 64c481d017c1b5b5eae619a367a5e8fa00f1b156:

   libjs-jquery-icheck: Correct LIC_FILES_CHKSUM (2024-08-14 10:19:55 -0400)

----------------------------------------------------------------
Changqing Li (2):
       pavucontrol: update SRC_URI
       libatasmart: Update SRC_URI

Frank de Brabander (3):
       python3-pydantic-core: fix incompatible version
       python3-pydantic-core: fix TMPDIR path reference
       python3-pydantic-core: add missing RDEPENDS for ptest

J. S. (1):
       znc: Fix buildpaths QA errors

Khem Raj (2):
       log4cpp: Fix buildpaths QA error
       python3-pydantic: Upgrade to 2.7.3

Markus Volk (1):
       exiv2: update 0.28.0 -> 0.28.2

Mikko Rapeli (3):
       fwupd: skip buildpaths errors
       gcab: ignore buildpaths error from sources
       libjcat: skip buildpaths check

Ninette Adhikari (3):
       imagemagick: Update status for CVE
       imagemagick: Update status for CVE
       imagemagick: Update status for CVE

Peter Kjellerstedt (3):
       hostapd: Support running "devtool modify hostapd"
       hostapd: Only include the relevant parts from README in 
LIC_FILES_CHKSUM
       libjs-jquery-icheck: Correct LIC_FILES_CHKSUM

Scott Murray (2):
       python3-grpcio: Fix build with gcc-14
       python3-grpcio: backport abseil-cpp RISC-V fix

Tim Orling (1):
       python3-pydantic: upgrade 2.7.3 -> 2.7.4

Wang Mingyu (1):
       python3-pydantic: upgrade 2.7.0 -> 2.7.1

alperak (4):
       tayga: Fix contains reference to TMPDIR [buildpaths] warning
       etcd-cpp-apiv3: Fix contains reference to TMPDIR [buildpaths] warning
       exiv2: Upgrade 0.28.2 to 0.28.3 for CVE fix
       jsonrpc: Fix contains reference to TMPDIR [buildpaths] warning

  meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb       | 3 +
  meta-networking/recipes-irc/znc/znc_1.8.2.bb                    | 1 +
  meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb                       | 2 +
  meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 15 ++--
  meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb               | 4 +
  meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb          | 4 +
  meta-oe/recipes-gnome/gcab/gcab_1.6.bb                          | 3 +
  meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb                  | 2 +
  meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb        | 2 +-
  meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb                   | 19 -----
  meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb                   | 11 +++
  meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb        | 70 
++++++++++++++++
  meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb         | 2 +-
  meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb      | 2 +-
  meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb                | 4 +
  .../0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch | 82 
++++++++++++++++++
  .../0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch  | 74 
++++++++++++++++
  meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb    | 2 +
  .../recipes-devtools/python/python3-pydantic-core-crates.inc    | 88 
+++++++++----------
  ...1-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126 
----------------------------
  .../0001-Fix-generate_self_schema-for-Python-3.12-1299.patch    | 29 
-------
  .../0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch | 29 
+++++++
  .../0002-Dont-embed-RUSTFLAGS-in-final-binary.patch             | 47 
+++++++++++
  ...-pydantic-core_2.16.3.bb => python3-pydantic-core_2.18.4.bb} |  13 ++-
  .../{python3-pydantic_2.7.0.bb => python3-pydantic_2.7.4.bb} |   2 +-
  25 files changed, 403 insertions(+), 233 deletions(-)
  delete mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
  create mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
  create mode 100644 
meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
  delete mode 100644 
meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
  delete mode 100644 
meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch
  rename 
meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3.bb => 
python3-pydantic-core_2.18.4.bb} (80%)
  rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.0.bb 
=> python3-pydantic_2.7.4.bb} (95%)
t

