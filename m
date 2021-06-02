Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.13839.1622644500705555878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZG5ywunc;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id y15so2341850pfl.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=3aDWyjXMv4+OA23POrvz++0OX7+K+iWx/rhX9uHmXd0=;
        b=ZG5ywuncWfX+wxuAXdAbH2xjCvBZ/j8IuUgFeL6GCaLi/uj15AB+pW9+Izu+KIFusd
         dx4vDtznvfKaUJ3mKyKEphCUiEuv/MLe6XJplvWwZ0Nl15hvmsIt8iXS2o+3FOWd7VZB
         eFFBG0z099lK4foJ+WSjW+XU220ACtslGD+43dEi8dzp5t8z9qbcyZtjm9eFC7tWz3uj
         kN6UBphT5G2ghXNh3clWr3KEU87Ka1DG4GmwMEb+Tsa4++BIPaCDJGWK8uy0GjdCixHi
         eKp/P83JD6lvTaeQCda3ivMx/z8h+HrKx8Er2pyKdo+B9z5cY6CSOpm3WRv6e8fAKw5k
         tnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=3aDWyjXMv4+OA23POrvz++0OX7+K+iWx/rhX9uHmXd0=;
        b=A/jKMvT8XlrgSKhlUlU2NOY+bnFGq6a+ZuvCL1NQsX47hfkeKpeTO8bV+AUafPJV5w
         wX02HB63pq58magzLLHSoRYh/2f5NbCVK2TkGMDkIKMh+paAJDMK4dQWkDeUPEanJsT0
         dE5RhzfSswYaeOUxVa5n+kG2sfBZU7e0xCJLA/adGvT6BS90cpmlQd4KjRJYlwIgbY39
         z7x1zUjwSav96nlYsvrff9WfXmY0DtjJJ5CsOfZVx5N1kUa/kUoSlA4w7Ch7SK26Rpdq
         HmiepwzEBw22Mrrko+IrSnnYjIIaRUfDrGfuYDvvXA/1ZgCoXIbM0LpQhsj8HpmH38N/
         knGw==
X-Gm-Message-State: AOAM531mmv5wMzIbuw9v7YEL7hnWmQDrAgIHZntxYo3cIBTkv+KVJgcF
	V6HhyBMpPqmXkiKlx+5i9eY=
X-Google-Smtp-Source: ABdhPJx775ogJ8L6LrI4f9JhqB1bBt3guGZ8RoVjVSPXI/unhNwTC/4Ux92UfwQyrqO6W4WIQRhhYg==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr34100614pgu.145.1622644500140;
        Wed, 02 Jun 2021 07:35:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:64f2:a0cc:a4fe:22e5? ([2601:202:4180:a5c0:64f2:a0cc:a4fe:22e5])
        by smtp.gmail.com with ESMTPSA id j9sm7156537pjy.25.2021.06.02.07.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 07:34:59 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: dunfell merge request June 2
Message-ID: <d5e43cee-f7d2-f6f5-5fcd-c2038cbae69b@gmail.com>
Date: Wed, 2 Jun 2021 07:34:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 11eae114522a6befa06c7f4021a83bc016133543:

  linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to c38d2a74f762a792046f3d3c377827b08aade513:

  dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
-0700)

----------------------------------------------------------------
Alexander Vickberg (1):
      hostapd: fix building with CONFIG_TLS=internal

Mikko Rapeli (1):
      ebtables: use bitbake optimization levels

Sana Kazi (1):
      dnsmasq: Add fixes for CVEs reported for dnsmasq

akash.hadke (1):
      opencv: Add fix for CVE-2019-5063 and CVE-2019-5064

wangmy (8):
      exiv2: Fix CVE-2021-29457
      exiv2: Fix CVE-2021-29458
      exiv2: Fix CVE-2021-29463
      exiv2: Fix CVE-2021-3482
      exiv2: Fix CVE-2021-29464
      exiv2: Fix CVE-2021-29470
      exiv2: Fix CVE-2021-29473
      libsdl: Fix CVE-2019-13616

 .../ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch     |  19 +
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb    |   1 +
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         |   7 +-
 .../recipes-support/dnsmasq/files/CVE-2020-25681.patch          | 370
++++++++++++++++++
 .../recipes-support/dnsmasq/files/CVE-2020-25684.patch          |  98 +++++
 .../recipes-support/dnsmasq/files/CVE-2020-25685-1.patch        | 587
++++++++++++++++++++++++++++
 .../recipes-support/dnsmasq/files/CVE-2020-25685-2.patch        | 175
+++++++++
 .../recipes-support/dnsmasq/files/CVE-2020-25686-1.patch        | 332
++++++++++++++++
 .../recipes-support/dnsmasq/files/CVE-2020-25686-2.patch        |  63 +++
 .../hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch |  45 +++
 meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb             |   1 +
 .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch  |  27 ++
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                |   1 +
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch        |  26 ++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch        |  37 ++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch        | 120
++++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch        |  72 ++++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch        |  32 ++
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch        |  21 +
 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch         |  54 +++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   |   9 +-
 .../opencv/opencv/CVE-2019-5063_and_2019-5064.patch             |  78 ++++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb                  |   1 +
 23 files changed, 2174 insertions(+), 2 deletions(-)
 create mode 100644
meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
 create mode 100644
meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
 create mode 100644
meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
 create mode 100644
meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch
 create mode 100644
meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch
 create mode 100644
meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch
 create mode 100644
meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
 create mode 100644
meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
 create mode 100644
meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch

