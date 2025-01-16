Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1307CC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 14:23:31 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.50356.1737037409288868689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 06:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvL0l73P;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e549be93d5eso1854705276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 06:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737037408; x=1737642208; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZsEd5LJLPNFd4AUxTbaZiP7vQxqQhWhn66slsNKqBk=;
        b=mvL0l73P4UbWwyOG53Bgqr2durCrduX2n5zWTYXrU9D1Mz+IpxmtA6J1OBE3teW4ny
         5l6pUtsbGl5JSHLGwIRVT7vAdKDiGWt/XodtGpLhjVYrrJLDuBWCCocyY0tAru3HfKXO
         C0Bzz59YM+fai1pyPN8/RUp+EtuTn7h8OUZQK+hWC66kc+mZOD87LkQiHl71jZgru8V/
         aRhNkM95fl7KF6nLtHcBypAopmFBCgKsJjIUl0XrjFshRw58AFSVslFHcibPwP8trLcN
         Ep9d+Vm82dTPYoTwkSDMOzM1P/phQRgirZ99HmEZNOA+ZHHGRwpf4blUq1PsXZXMAWBy
         bHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737037408; x=1737642208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZsEd5LJLPNFd4AUxTbaZiP7vQxqQhWhn66slsNKqBk=;
        b=CO/LVPB7olWzEZV/3W41Mcgpy4wBb9QaRx2+B369zWi4U8zMibOMU/1795t58KB1bW
         EtsyQKqk4P+O1H1S/fE1ZB5TaLoy96RhIp1yJ4xJirje12A84T9+Ja4VesXJFV6xG65y
         0EAqzRpK6YoXv8dImA7BHHLj+C5w+KQgfQzEvxNUqh0qePL2207r5w21A/S2bvaUUxOI
         Dr2LvMUw+Sjyht6eHI6gWenQTot4X+PNYuYtCTiafgqNUbWIpAWyVAUA7An3PvJlofoo
         2rgbEgMgkjDEkn9V2QSvcH/i6rmwsQ/ThzYN8F7dGz3etAJTNU8nFtO1+L31qE2cIgmf
         MBMA==
X-Gm-Message-State: AOJu0YwPLv5Npswg3uUwaGEq7066mePy2VM5+KRW0+b0FEypzrF44RXy
	hE66XTmAsZpg41G0BFZxaEvYi5lmKo+rJozmzQizMvh+dVr9w2o2sUtPOQla
X-Gm-Gg: ASbGncvGfBhq/B9y57sVscenXaxDdB2//AWIDQV1nOYQiMR/UF0imv3hECZxLBWSS1X
	d6/99+TTh3eYNmp+cWLquVPSDDUyE+gtrr+Z6otMpGQDPQVqgmVDA8EtHi7XlMFTLbExxJr1HQ2
	zg8vvGbR2vFR2213SmoC5mjpznR5hdZ3Ty60jm1Qg6MNgGI4707FnVB0eDZBcUv2b/qm5pWYe2t
	9bmOzZhKTlyr/g409Yg6XAASNsTDfgiQBPehq6n3TYu6ASJsONN5MBbefITliYKA40xLZuWMuEt
	tREpiGYPX1ExW2zrzDC4xx6mWUT2hbD4
X-Google-Smtp-Source: AGHT+IG1ZXSOvTyWHRQBP5hxP8AZwyghEZ3ZMMUKLv/2JS6oIWZatjg89xvRMgA1WD9UYb7Cr/4o3Q==
X-Received: by 2002:a05:6902:12c9:b0:e57:3a14:a22d with SMTP id 3f1490d57ef6-e573a14a377mr16460798276.2.1737037408217;
        Thu, 16 Jan 2025 06:23:28 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:3a5d:3b3f:a37c:dcbd? ([2600:1700:45dd:7000:3a5d:3b3f:a37c:dcbd])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e57ab2a75e1sm43224276.3.2025.01.16.06.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 06:23:27 -0800 (PST)
Message-ID: <745edda5-7754-4761-aae4-1b87518322fb@gmail.com>
Date: Thu, 16 Jan 2025 09:23:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: styhead merge request: Jan 12th
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <05f57241-f78b-441b-a352-39ebf6f8cabf@gmail.com>
 <CAMKF1srwrOi7Lh72+P0xYmGUs0a2GbvigduRYU6TqaijDt92og@mail.gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
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
In-Reply-To: <CAMKF1srwrOi7Lh72+P0xYmGUs0a2GbvigduRYU6TqaijDt92og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 14:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114915




On 1/12/25 10:54 PM, Khem Raj wrote:
> Hi Armin,
>
> This is not merging into styhead without conflicts
>
> CONFLICT (content): Merge conflict in
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
> Can you take a look and perhaps update your baseline ?

Hmm.. rebase and pushed again.

- armin
>
> On Sun, Jan 12, 2025 at 5:02 PM akuster808 <akuster808@gmail.com> wrote:
>> The following changes since commit 7cd38212e73e0e9f42f4d92defb16dd81f71221d:
>>
>>     lvm2: Remove the lvm2-udevrules package (2024-11-25 15:32:56 -0500)
>>
>> are available in the Git repository at:
>>
>>     https://git.openembedded.org/meta-openembedded styhead-next
>>
>> for you to fetch changes up to 31a24ab044a24936f50a80828ecd7048bf5b1f5e:
>>
>>     libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
>> (2025-01-12 19:57:19 -0500)
>>
>> ----------------------------------------------------------------
>> Benjamin Bouvier (1):
>>         bridge-utils: add CVE_PRODUCT
>>
>> Derek Straka (1):
>>         nginx: Upgrade mainline release version 1.27.1 -> 1.27.3
>>
>> Ghislain Mangé (1):
>>         wireshark: use inherit_defer for conditional cases
>>
>> Hongxu Jia (1):
>>         ntfs-3g-ntfsprogs: fix CVE-2023-52890
>>
>> J. S. (4):
>>         libhtml-tree-perl: Drop unnecessary SRC_URI md5sum
>>         libhtml-tree-perl: update HOMEPAGE
>>         libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
>>         libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
>>
>> Khem Raj (3):
>>         mariadb: Fix build with clang-20/trunk
>>         ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
>>         mpd: Fix build with icu 76+
>>
>> Markus Volk (2):
>>         geary: add itstool-native dependency
>>         eog: add itstool-native dependency
>>
>> Peter Kjellerstedt (1):
>>         abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files
>>
>> Peter Marko (15):
>>         proftpd: set status of CVE-2001-0027
>>         dash: set CVE_PRODUCT
>>         ace: ignore CVE-2009-1147
>>         apache2: ignore CVE-1999-0678 and CVE-1999-1412
>>         apache2: remove old version references from CVEs
>>         spice: ignore CVE-2016-0749
>>         gattlib: mark CVE-2019-6498 as fixed
>>         monkey: ignore CVE-2013-1771
>>         redis: ignore CVE-2022-0543
>>         spice-gtk: mark CVE-2012-4425 as fixed
>>         apache2: ignore disputed CVE CVE-2007-0086
>>         memcached: ignore disputed CVE-2022-26635
>>         emlog: set CVE_PRODUCT
>>         php: upgrade 8.2.20 -> 8.2.26
>>         wireshark: upgrade 4.2.8 -> 4.2.9
>>
>> Ruiqiang Hao (1):
>>         mariadb: Ensure compatibility with ARMv9 by updating .arch directive
>>
>> Yoann Congal (1):
>>         gimp: fix gimptool buildpaths errors
>>
>> Yogita Urade (1):
>>         postgresql: upgrade 16.4 -> 16.5
>>
>>    ...0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch | 42
>> ++++++++++++++
>>    .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb            | 1 +
>>    meta-gnome/recipes-connectivity/geary/geary_46.0.bb             | 1 +
>>    .../gimp/gimp/0001-gimptool-allow-default-CC-override.patch     | 85
>> +++++++++++++++++++++++++++++
>>    meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb                    | 21
>> +++++++
>>    meta-gnome/recipes-gnome/eog/eog_47.0.bb                        | 1 +
>>    meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                      | 1 +
>>    meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb        | 2 +-
>>    meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1 +
>>    .../mpd/0001-meson.build-support-building-with-ICU-76.patch     | 52
>> ++++++++++++++++++
>>    meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb       | 1 +
>>    meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb       | 2 +
>>    .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 +
>>    meta-networking/recipes-support/memcached/memcached_1.6.17.bb   | 2 +
>>    meta-networking/recipes-support/spice/spice-gtk_0.42.bb         | 2 +
>>    meta-networking/recipes-support/spice/spice_git.bb              | 1 +
>>    .../wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} |  4 +-
>>    meta-oe/recipes-connectivity/ace/ace_6.5.19.bb                  | 2 +
>>    meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2 +
>>    meta-oe/recipes-core/emlog/emlog.inc                            | 2 +
>>    meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +
>>    ...1-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch | 44
>> +++++++++++++++
>>    ...1-Use-a-lambda-function-as-deleter-prototype-in-unique.patch | 26
>> +++++++++
>>    .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>>    .../postgresql/{postgresql_16.4.bb => postgresql_16.5.bb} |  2 +-
>>    ...5-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch | 30
>> ++++++++++
>>    meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb    | 1 +
>>    .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 4 +-
>>    .../php/php/0002-build-php.m4-don-t-unset-cache-variables.patch | 2 +-
>>    .../0003-php-remove-host-specific-info-from-header-file.patch   | 2 +-
>>    .../php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch    | 4 +-
>>    .../php/php/0008-ext-imap-config.m4-fix-include-paths.patch     | 4 +-
>>    .../php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch   | 3 +-
>>    meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch | 2 +-
>>    meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} |  2 +-
>>    meta-oe/recipes-extended/redis/redis_7.2.5.bb                   | 1 +
>>    meta-oe/recipes-shells/dash/dash_0.5.12.bb                      | 2 +
>>    meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb        | 10 +++-
>>    .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb   | 7 +++
>>    meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb          | 17
>> +++---
>>    meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb             | 1 +
>>    .../recipes-httpd/nginx/{nginx_1.27.1.bb => nginx_1.27.3.bb} |  4 +-
>>    42 files changed, 374 insertions(+), 29 deletions(-)
>>    create mode 100644
>> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
>>    create mode 100644
>> meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
>>    create mode 100644
>> meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
>>    rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb
>> => wireshark_4.2.9.bb} (95%)
>>    create mode 100644
>> meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
>>    create mode 100644
>> meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
>>    rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb =>
>> postgresql_16.5.bb} (86%)
>>    create mode 100644
>> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
>>    rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} (99%)
>>    rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.1.bb =>
>> nginx_1.27.3.bb} (53%)
>>


