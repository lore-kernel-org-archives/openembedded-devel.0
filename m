Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.7504.1625147877328988072
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 06:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FRYVnDFB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id l11so4290838pji.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=oeoT3GeynAEoaPeq9iz0TukSXJsxNCJzydHmjIQMP94=;
        b=FRYVnDFB63i0e3QCo3L6+y51kFDyvusF1l1fFJyIViwzPycvuu6nCmq5eZx7S+5O1t
         PCkEuuxwMG88fZ7rIhgFwro2kv1FHfY03QepJltDxeezLpPEvBoYfbfN2UiRnYG7dvyB
         zN7A8BqfdTptbXpBa4C5VCrz2XuJWYG+RFnEt8PLBz8CbxHg1ABolB63CwnZktMCwWaf
         hBW9DBGUpxE1GktllyLK8jIcgxzGtU2I2AKHIbekevfQ0JWu4+mfSdEv3L7Hf78Wn5Sp
         9V79xRZToOsLkFWeaKKVLlnXkfhtYDp6d0Nc69Jp6JaM+7Lv8H0TYf3i5RAOEiRY82SG
         ch3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=oeoT3GeynAEoaPeq9iz0TukSXJsxNCJzydHmjIQMP94=;
        b=N1H1YlFSZwHFYW90xKKKk5JeD2U9U6KgG0BqF/i0LAYMTsH2jcELyuNyEFvJimAuFa
         FxAjniDjHcUv4Lf1p92EJL1xMjS270I+KoUPvmrrgeBL8kNrwG9w5rf25u7clLdArZhl
         HD4J7a8Hckl2WoQH3vreZYU1mR4sHLhMIbuDNIXGcRRtD3bzFm1CfHc1it6hdrUNtWW0
         o9RG6IenVYWWmavF93LP2bBJTmSSzYrDoiTY9YGDbHGBr7dWEuU9BrKxVHSFFR3zAW/B
         I3jKTFCqx/L3wYwmDBM1SYgYt7s7jATCFyFRmesuPW5IIh8u5bqKNCKyxaGbX71i4q/X
         udLA==
X-Gm-Message-State: AOAM531QTmbaVhHa1yfJWa0juv9GjH0UEJEMgSZKsYHC0gf8Nq1y68nA
	cxmW6NLH4j2G6am7krWxsbk=
X-Google-Smtp-Source: ABdhPJykV5/Rq+KIk4xonrxWpHUYWcAVyFGs3amNnrLIogakhhp5JN0I5WqreozYCtRC1RYBfU9miQ==
X-Received: by 2002:a17:902:b198:b029:11b:2246:e374 with SMTP id s24-20020a170902b198b029011b2246e374mr29689plr.17.1625147876837;
        Thu, 01 Jul 2021 06:57:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:608a:da78:6588:bb4f? ([2601:202:4180:a5c0:608a:da78:6588:bb4f])
        by smtp.gmail.com with ESMTPSA id q24sm26419210pgk.32.2021.07.01.06.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 06:57:56 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Hardknott merge request; July 1st
Message-ID: <fca61e07-2a18-7777-ac83-1226a079d55c@gmail.com>
Date: Thu, 1 Jul 2021 06:57:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit aca88908fd329f5cef6f19995b072397fb2d8ec6:

  thunar: fix CVE-2021-32563 (2021-06-13 12:35:48 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to c51e79dd854460c6f6949a187970d05362152e84:

  python3-django: upgrade 2.2.23 -> 2.2.24 (2021-06-27 07:50:20 -0700)

----------------------------------------------------------------
Andrea Adami (3):
      initramfs-kexecboot-image: support cases where machines override
IMAGE_FSTYPES
      initramfs-debug-image: support cases where machines override
IMAGE_FSTYPES
      rapidjson: remove stale LIB_INSTALL_DIR

Chen Qi (1):
      minifi-cpp: set CLEANBROKEN to 1

Geoff Parker (1):
      cifs-utils: set ROOTSBINDIR to /usr/sbin if DISTRO_FEATURES has
usrmerge

Leon Anavi (1):
      python3-django: Upgrade 3.2.3 -> 3.2.4

Olivier Georget (1):
      libpfm4 4.10.1 : enable arm64 host platform

Ovidiu Panait (1):
      libeigen: update LICENSE information

Peter Kjellerstedt (2):
      net-snmp: A little clean up
      net-snmp: Support building for native

Sekine Shigeki (2):
      add CVE-2011-2411 to allowlist
      ntp: add CVE-2016-9312 to allowlist

Trevor Gamblin (3):
      python3-django: upgrade 2.2.22 -> 2.2.23
      python3-django: upgrade 3.2.2 -> 3.2.3
      python3-django: upgrade 2.2.23 -> 2.2.24

Yi Zhao (1):
      minifi-cpp: set correct python processor directory in configure file

ito-yuichi@fujitsu.com (2):
      cyrus-sasl: add CVE-2020-8032 to allowlist
      dovecot: add CVE-2016-4983 to allowlist

zangrc (1):
      wireshark: upgrade 3.4.5 -> 3.4.6

zhengruoqin (1):
      net-snmp: upgrade 5.9 -> 5.9.1

 meta-initramfs/recipes-core/images/initramfs-debug-image.bb     |  7 +++-
 meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb |  8 +++--
 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     |  4 +++
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb |  3 ++
 .../net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch        | 19
++++++-----
 .../net-snmp/{net-snmp_5.9.bb => net-snmp_5.9.1.bb}             | 53
++++++++++++++++-------------
 meta-networking/recipes-support/cifs/cifs-utils_6.13.bb         | 17
+++++++--
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb       |  3 ++
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             |  3 ++
 .../wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb}        |  2 +-
 meta-oe/licenses/MINPACK                                        | 51
+++++++++++++++++++++++++++
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             |  2 +-
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb         |  5 +++
 meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb                 |  3 +-
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb              |  9 +++--
 meta-python/recipes-devtools/python/python3-django_2.2.22.bb    |  9 -----
 meta-python/recipes-devtools/python/python3-django_2.2.24.bb    |  9 +++++
 .../python/{python3-django_3.2.2.bb => python3-django_3.2.4.bb} |  2 +-
 18 files changed, 156 insertions(+), 53 deletions(-)
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.bb =>
net-snmp_5.9.1.bb} (89%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.5.bb =>
wireshark_3.4.6.bb} (97%)
 create mode 100644 meta-oe/licenses/MINPACK
 delete mode 100644
meta-python/recipes-devtools/python/python3-django_2.2.22.bb
 create mode 100644
meta-python/recipes-devtools/python/python3-django_2.2.24.bb
 rename meta-python/recipes-devtools/python/{python3-django_3.2.2.bb =>
python3-django_3.2.4.bb} (77%)

