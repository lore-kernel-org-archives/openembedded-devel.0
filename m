Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.10476.1622217790543368353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 09:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V6Vjk+HY;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id l70so2891060pga.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 May 2021 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=aYtPVffTMQ4ZvS4TfJcIAWhPMo4OdPxqqJGUtSvZszc=;
        b=V6Vjk+HYwmRsiltlz1IHZpV0iE/HYMjSyyhxMCzgHUQwYpwB5kt9EFSsOOhGk6zDuc
         ZTR4N8jEKKkTrCoApUu/A008RBbNN23akvlV9LM+bNM1cJfyL1lCgzgxqokKnOV2nmyK
         WXo0urRFM4WlaLiPJkRuXuHErjXltWu9ZkRfu80LTUmAZHw6fCQbfsF/M40yywtlr8kt
         HEyDamKJkhWGTYFKoorhGxmhgPpt0t8k8M546kJVAxagN58HW4wHIdHGj/4sPZUM+f7c
         zPLOIXiIPfIhKwL5B/1MVXjHbdURve/XNA9tAKRWFJp6DIJNdQ2jWlDVVgMVL9Au3o7M
         OYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=aYtPVffTMQ4ZvS4TfJcIAWhPMo4OdPxqqJGUtSvZszc=;
        b=Ozd22WBkhSCShUDVHv8xtTWecF+Ej5J7UBXuGTu/7HShaIqnAj8Aia6jftDpDP6uBq
         ZMHbURYk5GVocARUbIBkQllHMoDNR2hhOxfFPKSpRkGMrQn2fnQ7grBcHhEnj7zZQzA1
         z6DNnE/o7gTVaB643xuToE0lh0nN92YvRkgt29IvZhzIIQknb50zJ7x8ZbPhqXvpn2cP
         ZB5OeUB5PqKW9PCYqcGck9WvaV+k9zITnclhi8pXhCnOnSP9xMLkEgq0cK6nHGKEjU89
         QMXBf3hYHroBxYB+/hwY9Z4/YED+a0L8G5JMp7vOVQkfSnLDCQ/ozbWLYLHxbP3o1bPv
         wwWQ==
X-Gm-Message-State: AOAM532RM87tXe6cUqO1fEh1utQ2IgBL0jGZCRSkghJX9LOxv9HIDHhe
	rEhpblyNfzMf3Wa/XkBmHIk=
X-Google-Smtp-Source: ABdhPJyC+mPLrMWXmdbrv44tbY171eVSKQYuDvojFuL65RcuEe+VL3mzU28OR7AVa00NEetnHHMUAA==
X-Received: by 2002:a63:9d43:: with SMTP id i64mr9534120pgd.205.1622217790008;
        Fri, 28 May 2021 09:03:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:883d:884f:ddd1:c711? ([2601:202:4180:a5c0:883d:884f:ddd1:c711])
        by smtp.gmail.com with ESMTPSA id x23sm4729314pje.52.2021.05.28.09.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 09:03:09 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Hardknott merge request May 28th
Message-ID: <02803737-39e0-d54a-8351-03232280e370@gmail.com>
Date: Fri, 28 May 2021 09:03:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit cf5bd6a8308108b4313a1e45ce8aa87e73125bf9:

  xfce4-settings: upgrade 4.16.0 -> 4.16.1 (2021-05-17 07:18:41 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 9ee0e08ba2395b9cb93f2273bb1018adb3630407:

  libgtop: fix do_compile error (2021-05-23 08:29:00 -0700)

----------------------------------------------------------------
Alexander Vickberg (1):
      hostapd: fix building with CONFIG_TLS=internal

Andreas Müller (1):
      libgtop: tidy up recipe

Changqing Li (1):
      libgtop: fix do_compile error

Khem Raj (1):
      opencv: Disable tbb on riscv/musl

Leon Anavi (4):
      python3-cerberus: Upgrade 1.3.3 -> 1.3.4
      python3-robotframework: Upgrade 4.0.1 -> 4.0.2
      python3-rfc3339-validator: Upgrade 0.1.3 -> 0.1.4
      python3-pymongo: Upgrade 3.11.3 -> 3.11.4

Saul Wold (2):
      opencv: remove tbb packageconfig for powerpc
      sysdig: disable building for ppc

Trevor Gamblin (2):
      python3-django: upgrade 2.2.20 -> 2.2.22
      python3-django: upgrade 3.2 -> 3.2.2

wangmy (10):
      uftrace: Fix a plthook crash on aarch64 with binutils2.35.1 and
later versions on aarch64
      exiv2: Fix CVE-2021-29457
      exiv2: Fix CVE-2021-29458
      exiv2: Fix CVE-2021-29463
      exiv2: Fix CVE-2021-3482
      exiv2: Fix CVE-2021-29464
      exiv2: Fix CVE-2021-29470
      exiv2: Fix CVE-2021-29473
      libsdl: Fix CVE-2019-13616
      trace-cmd: Conflict resolution

zangrc (1):
      postgresql: upgrade 13.2 -> 13.3

 .../libgtop/0001-fix-compile-error-for-cross-compile.patch      |  37
+++++++++
 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb              |   7 +-
 .../hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch |  45
+++++++++++
 meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb             |   1 +
 .../0001-configure.in-bypass-autoconf-2.69-version-check.patch  |   2 +-
 .../postgresql/{postgresql_13.2.bb => postgresql_13.3.bb}       |   2 +-
 .../uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch |  27
-------
 ...1-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch |  47
+++++++++++
 meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb               |   2 +-
 meta-oe/recipes-extended/sysdig/sysdig_git.bb                   |   2 +
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch  |  27
+++++++
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                |   1 +
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb             |   2 +
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch        |  26
++++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch        |  37
+++++++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch        | 120
++++++++++++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch        |  72
+++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch        |  32
++++++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch        |  21 +++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch         |  54
+++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   |   9 ++-
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb                  |   6 ++
 .../{python3-cerberus_1.3.3.bb => python3-cerberus_1.3.4.bb}    |   4 +-
 meta-python/recipes-devtools/python/python3-django_2.2.20.bb    |   9 ---
 meta-python/recipes-devtools/python/python3-django_2.2.22.bb    |   9 +++
 .../python/{python3-django_3.2.bb => python3-django_3.2.2.bb}   |   4 +-
 .../{python3-pymongo_3.11.3.bb => python3-pymongo_3.11.4.bb}    |   2 +-
 ...39-validator_0.1.3.bb => python3-rfc3339-validator_0.1.4.bb} |   2 +-
 ...-robotframework_4.0.1.bb => python3-robotframework_4.0.2.bb} |   2 +-
 29 files changed, 561 insertions(+), 50 deletions(-)
 create mode 100644
meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.2.bb =>
postgresql_13.3.bb} (78%)
 delete mode 100644
meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
 create mode 100644
meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
 create mode 100644
meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.3.bb
=> python3-cerberus_1.3.4.bb} (75%)
 delete mode 100644
meta-python/recipes-devtools/python/python3-django_2.2.20.bb
 create mode 100644
meta-python/recipes-devtools/python/python3-django_2.2.22.bb
 rename meta-python/recipes-devtools/python/{python3-django_3.2.bb =>
python3-django_3.2.2.bb} (59%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.3.bb
=> python3-pymongo_3.11.4.bb} (91%)
 rename
meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.3.bb
=> python3-rfc3339-validator_0.1.4.bb} (83%)
 rename
meta-python/recipes-devtools/python/{python3-robotframework_4.0.1.bb =>
python3-robotframework_4.0.2.bb} (91%)

