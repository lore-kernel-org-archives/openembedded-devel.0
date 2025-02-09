Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56EEC02199
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 15:49:00 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.31277.1739116133116956034
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 07:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SOYU9ogs;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2832159276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739116132; x=1739720932; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAs/oqcD/QiiUrg7IZm0IBJFXHndfaJRHRgTnSDTsRk=;
        b=SOYU9ogsQmzbDyA5qrnz7jGMS+4572FLjseWo0JMtIJmLal7lIPbbj1UAI8OC7oeo0
         71az4D+orh0IapLUH3V48i/wA1wlqATD5Y1JdJCDUd8jY+tl9OXNy5Guyhx/Wz2itVuP
         snHzgnF3smk6Jp1y9yhZZrelQsSBnFu4YPRCw4LP6WrGCxPKwxzmnfYnoSkiYxFHb3jB
         BHxC2cZ7An4jL7g0mpmatSMvtMvjEgw0MznzjXII6q5STAZ0f95NYX6qIWuP/XG/vF9G
         pZuCHR4NsCfyumMdMfim4i6WOOts940MezniRQ9YUbr56GJ8NMug1RY5NyQ9x/QGtg6I
         j4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739116132; x=1739720932;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAs/oqcD/QiiUrg7IZm0IBJFXHndfaJRHRgTnSDTsRk=;
        b=n7NbGCP2X36/qZp/C5ohXYdoPBl00m35DEe97TQBo/cKpsjl2hZ/pqAbvTlZgUWR/i
         dDoxakbenBcyBp28+VTU79+YOChi2aIobNYmO2EsGivuCXTrpTGJBf6gspw1e0P3KMq9
         vm4wY+0Lm98lDe5DguLFknFD8GFTS/MZn34adx2HjYHBbwmFy6a8fHxpm1TwXm6eOn2a
         37rL+EWTdzEX5LfsY215Xbv8qkr00zQsHBWBLES0yDcT0KdBrkOEawizYE+3SRFUOnnN
         33MDua6M2LNoSRJFwz1FGYlrbg84NnOyTiU5MHepCfpwX19PVUkBSegbpICMbb/zZQX7
         BAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHGSalMLBkuMDazht1sAKPfxlUhj8d3Db9OO2WhRrFUZj51xsR7Jr/Wi2fAEsc1tkjGAxKMWprvba+GhQGdD3mzXQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdcC96tD4uc48JIQc8y2EkdwacTdfphWwjuI3HvwwQpV4sRDp8
	mPGy1zOJ6r9IZ2hpV5OWA3C7kwS96q6l1BAmjHCiyHjS8iISUflcbPCm7DS7
X-Gm-Gg: ASbGncs5sChUlvWp/GXrtMxDR8Qx53SdmS4D1qyX59xDPv+wGpD8mNe0wFppM2LMo2I
	4bbyyQE5TtEKna5pTOnU80UZN+aiwB1uT31elAMG8E9Y1x8xlWjekbNEBMn5HNaUL9zKGMOATpJ
	DyNtvLVwmdonPQuzANQZiNm+eZ4uEJgDO1XlVThnt6Bi3dXOqICvNeZ9Ax6bBhnGMXGt1lYTSSs
	OmhExdPOnJ7Z+pQjDuAQql2X4a/Z9QW6/ER+W1xESLfaSsXhBsFof7v/H8mUWYOIlh4iwx98Qhg
	/BeCs+ZG9XiRTJxwwbhdlCyVNPN0kKqMsU6mTA/Hw+y9mq2UbX0Q8EwkpM18OqziU40=
X-Google-Smtp-Source: AGHT+IGYCKf9glSSlTjWlThSN4sgKIBwlxDhLtgQ9r7tM/XYoC7I1Uj/1XTqdjSuiR/41MZ/GXN1Vw==
X-Received: by 2002:a05:690c:4a0c:b0:6ef:77e3:efe6 with SMTP id 00721157ae682-6f9b284bc66mr84264847b3.13.1739116132081;
        Sun, 09 Feb 2025 07:48:52 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:d056:e459:7b5a:e863? ([2600:1700:45dd:7000:d056:e459:7b5a:e863])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ffc2a32sm12410797b3.110.2025.02.09.07.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 07:48:51 -0800 (PST)
Message-ID: <3591a7bc-f9cb-46ac-8b39-4f1f5ad64ad0@gmail.com>
Date: Sun, 9 Feb 2025 07:48:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Feb 9th
Autocrypt: addr=akuster808@gmail.com; keydata=
 xsDNBGNNaZMBDAC6/Mhpw3EGOOTPtIpcUHT4lI974zN/QqccMPxH4oyBPRJbjVImYs9avXwV
 Ae9xoWKMM/vocEZWm6SOESZSGf+7l05Eo6MxU50cIQh0/bcOcdDAtFRDk4pZIL6X7vGzvFe6
 17tfNwKrTPgDFSSvq6XLUOqukInaVMHPeZum5GNnfuJswSDEQdxGTgudLWhCYwwoJ1AsVhg1
 nJXjQLOGUHFAZPYMhTak5jFXwG+CFzJ1OPpoAfcjQGYEYY5k5Yr1dESl/zgZSwwRLAAXo6JZ
 lm1rdd0c54XG4ah6fvZkd8r05uBVvbvmrdw5OohqqWzMq7RB9DAsszLvOaxN1epwUYnpkQ6x
 yYRBQxt766hLxtW6+bIXUZdinUsc0cD+MlLfynTzpT3eJPhvU9EtpTkA7hlFtHrhENRlT5rE
 F1ZCGykIhg5J/BL/JO3AISgliu0pPLg9r6tgZKu8r2LBf05LJ1vT2P1wVwlzpAdgHKAmTDF8
 MFEASfeJ4o9TrVFGbt8+cA0AEQEAAc0hYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5j
 b20+wsEHBBMBCAAxFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZQCGwMECwkIBwUVCAkK
 CwUWAgMBAAAKCRB5KfJxvOuR703oDAC4coUucV3gE+pNQAJcNWqIQwZHiwxbMy2fBgvTP0bx
 TQj6ZFl4tkiXGydUy9c2lcOj4XfaJuG85Z24IIJE0d8hWZMOZkSv5bmyB/NxbM5xRnPkHb6M
 n58wMSRCfNj/fsOoJE9nj5s41ktg1CA9QFBl9Dt0/8J/Mq+TxOKqYvzL4L8KEIw9nsi/yHQX
 ukXDwI2V01hTPZ6P7a4cZsjuvzCVN/WK2N3LzoVhQZHOOHGgx3h8XmsXMZ2ZxKjIdFTO2gFS
 48zXa4+LW/ZyJIUlnBIUdSnpS826wSq6Zn3TyvLJrFD3KSviX0N48htIfiYFJmTcGdDU+Zqr
 wKnPQWdZXgWLsv+3deGZ8z0UCdt3n/OSwRML3gFfYd7QBLazXIkFyplFmgOLwXkf+YifwSbu
 P3KTOpYN9bcl1Og2zU1dPTEg7RndDAvRUUA+XWrp7VM5gZgc0UFRNkrf4CZhxuMwATCJQVPj
 aII+TOxThBkx6NJqXD3tvlNozjLy4fLNZd8sAsrOwM0EY01plAEMAJ5IoQo1AbOAoMYUytqx
 zi1uOQa+ak48yVg4llEs55D9h9ANFEY8C5CyEYyXYKjHCgepUUHDRKIMIMxxzYLKDkd8bgvt
 +cmi1Jj36Wrzrf9qGFq5SvGL66IoUBCTsN64UexxbnNWMDF8qO2aXLvJZtfFJfYGc1ATDw8i
 96pv+FpjE3N76RdYRSFv5UGRqSKhT6jGlVMHb+Z/h1BOIsEBmbtgCozzJ45zhOY9635B4D7w
 i6CB2Aau3/FycPrKk/ZvkSq28tGYWwuhr/fvfvowg+IeClP1oCdKbaWsEwkGTN/PsRM8dPPe
 n07jesJUgpiHCUTF9oY3wJ1a86otszmWbvtJieM7vOxP3YnzF/VVFgDhTzRS0VqAjNRNOMoF
 E7ENS8o7uj7jrrGPuuM9cOhuDqqHwla3Rh0VX+W0//8qGZJ61oGV9paoGUb4PoRqC8ZpLrMB
 Z+f1VQ4iH7rzSQTOLEqGMZ+A34266TtKZKgmBxyqgNFd1HEeO4PD46ycLpnZAQARAQABwsD2
 BBgBCAAgFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZUCGwwACgkQeSnycbzrke+SWgv/
 QvvX84fAHEl7dkhla/oPdqY2bULh+hOxpo3WZmFhHi+41z2GhOJ78S3mY3yD+O7rdXkQIgIu
 bZDOIBMJc0lY/qKfXGpFOg5b8/hW3pYdjmUP1NQmdFK4XRLRL4OhLttgxVgO2yqDtlt9x1o3
 RLgTSJNsy/gQzUJw4m1zYs9qPRz7xglHwrn0OdDwgk6UofiS31cTZgz7txdNJ5pMNEOcjsaD
 KE+3jd6mAOz/VTG7mH3/5z0t+g9onQmfxBFpgxSM8HVtmjT4KWkqqUJzyXLtawbxhdv+fcUv
 5qUSr9ktwA8NJHmIHHcXBqiZLtLWFMJrdsgTFvjCXmTpm3ncsHS9L+JLVwIVCmUQUUCN1LhG
 itDSpYIEGrZObj82rX1wvxf/ZQ8VXS+owIR2F4yeeqPH/CyrPA1ASdtt+Am28/dJ2krr72at
 J++uLxA0cein1kjcosFDpQscnDcPzohnGyyjgEd6VwelZboIS1jt4lIa1badtV+cWMGMgM8W
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 15:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115318

The following changes since commit dda0d53326017d6758ec6bdfdaf2f484c089d13f:

   gphoto2: Fix contains reference to TMPDIR [buildpaths] warning 
(2025-01-20 19:46:16 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 4f11a12b2352bbdfafb6b7d956bf424af4992977:

   modejs: upgrade 20.18.0 -> 20.18.2 (2025-02-04 15:04:57 -0800)

----------------------------------------------------------------
Archana Polampalli (1):
       modejs: upgrade 20.18.0 -> 20.18.2

Divya Chellam (1):
       redis: upgrade 7.2.6 -> 7.2.7

Hongxu Jia (1):
       nodejs: support cross compile without qemu user conditionally

J. S (2):
       nodejs: upgrade 20.16.0 -> 20.17.0
       nodejs: upgrade 20.17.0 -> 20.18.0

Jason Schonberg (1):
       nodejs: upgrade 20.13.0 -> 20.16.0

Jef Driesen (1):
       nginx: fix the tarball and license checksums

Khem Raj (2):
       nodejs: Upgrade to 20.13.0 release
       nodejs: Fix build with libc++ 19

Martin Jansa (2):
       lapack: add PACKAGECONFIG for cblas
       lapack: fix buildpaths in ptest also when CBLAS is enabled

Peter Marko (1):
       python3-grpcio: patch CVE-2024-11407

Thomas Roos (1):
       libcamera: backport 0.4.0 from master-next

Wang Mingyu (1):
       uutils-coreutils: upgrade 0.0.27 -> 0.0.28

Yoann Congal (1):
       mdio-tools: fix mdio-netlink kernel module reproducibility

Yogita Urade (1):
       poppler: fix CVE-2024-56378

Zhang Peng (1):
       lapack: fix TMPDIR reference in do_package_qa

  .../libcamera/libcamera/0001-ipu3-Use-posix-basename.patch      | 71 ---
  .../0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch | 43 --
  .../libcamera/0002-options-Replace-use-of-VLAs-in-C.patch       | 128 
------
  .../libcamera/{libcamera_0.2.0.bb => libcamera_0.4.0.bb} |  11 +-
  meta-networking/conf/include/non-repro-meta-networking.inc      | 2 -
  .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb            | 5 +-
  .../recipes-core/uutils-coreutils/uutils-coreutils-crates.inc   | 668 
++++++++++++++++++++--------
  .../{uutils-coreutils_0.0.27.bb => uutils-coreutils_0.0.28.bb} |   2 +-
  meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb                | 43 ++
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_20.12.bb => nodejs-oe-cache-native_20.18.bb} |   0
  meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch        | 182 
++++++++
  meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch          | 85 +++-
  .../nodejs/{nodejs_20.12.2.bb => nodejs_20.18.2.bb} |  85 ++--
  .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
  ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
  .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
  .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
  ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
  .../redis/{redis-7.2.6 => redis-7.2.7}/init-redis-server |   0
  .../redis/{redis-7.2.6 => redis-7.2.7}/redis.conf |   0
  .../redis/{redis-7.2.6 => redis-7.2.7}/redis.service |   0
  .../recipes-extended/redis/{redis_7.2.6.bb => redis_7.2.7.bb} |   2 +-
  meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch    | 77 ++++
  meta-oe/recipes-support/poppler/poppler_23.04.0.bb              | 1 +
  .../recipes-devtools/python/python3-grpcio/CVE-2024-11407.patch | 32 ++
  meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb    | 1 +
  meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb              | 4 +-
  29 files changed, 949 insertions(+), 493 deletions(-)
  delete mode 100644 
meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
  delete mode 100644 
meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
  delete mode 100644 
meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
  rename 
meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb => 
libcamera_0.4.0.bb} (84%)
  rename 
meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.27.bb => 
uutils-coreutils_0.0.28.bb} (98%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.12 => 
nodejs-oe-cache-20.18}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.12.bb => 
nodejs-oe-cache-native_20.18.bb} (100%)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.12.2.bb => 
nodejs_20.18.2.bb} (69%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/0002-lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.6 => 
redis-7.2.7}/redis.service (100%)
  rename meta-oe/recipes-extended/redis/{redis_7.2.6.bb => 
redis_7.2.7.bb} (96%)
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-11407.patch


