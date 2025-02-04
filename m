Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763F2C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 22:36:20 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.201.1738708578547854101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 14:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DnrHsGf9;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f006748fd1so47016647b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 14:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738708578; x=1739313378; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd4sv84BLIfBHyPiplRiYqeQdOId11TnTdu5SWQDjBk=;
        b=DnrHsGf9L8c1gPiLzqGbIsqNPn8AkokS7va8c5mdcG/pUKDai2++xLMip0HCzYqbhO
         FXZ1NGtbiFsIIqowh+MPpcJaoFEvTw9G7Dr4dlulLz9mRmDYiLtTjWUBrkQMc2z4echi
         4ne7uhV/VBEFhrV9HqjJ3cGN3uzOrvbKrIrYSt1RRdJ+fO5p2ug8XerbNOfUpWJlC0u6
         9z4u/umNWPDs7poV/E3ZVLcoJfoTlV1MiL3JumLI8VrMstOhBPQH8m33+yDSrQMmIbPk
         vYGZiBRgiIJvkoKgv40bVJLpHgqIYrm3C0pi3WMEAv37mwmmux5W/q2XRhCt6B0WR83x
         MDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738708578; x=1739313378;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yd4sv84BLIfBHyPiplRiYqeQdOId11TnTdu5SWQDjBk=;
        b=D+Vgb26ejrzywFA8pdmUVL/WyjP/0fcJRIb3RonuUkzt64MbmuBZRLTQ+w6/gYcARR
         T4nU6rl8zbEGt3Lk9zKLcAtZ+ElM1+TIAS5GtJCJ+x3W53vZ2sLfxivELc260TVNVJuy
         9HXklN8vnRFj/Tf+qgiBMwZiiOIiCllyWqcqueg3gVWvrkK+XfW7eMRs8Ye6bIMBv4Fu
         IDmhwE/acWzyXqbFK66926TKFya83S0W+KKE9heV54PcyOAFPPAf0ZuVgtzx/b0peeDB
         jpYVuwYJ4gVCRWy+AL5x1BcZcWBjDYprmjH3SuPmPzC+0YcN19kmPsO0VTGdCr9tPLLx
         y42w==
X-Forwarded-Encrypted: i=1; AJvYcCW29G+xho3funm7+1HTP6VOpFQxdT+e1eTTiXNaJXGvzNAZUmYP7cbgJrluU/Fa2+8viVIHH3oI+WoTzoBKL6QjsjE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7jxT4sDoxthcEzTD+BJYnvrH5lvb2xU33QW2TPnLq5wh+uS4E
	nyXcUDz3TlsxGkIlff28mIuIi07RIE8TjOqP7jOJ7ibQAeZ78sWc
X-Gm-Gg: ASbGncu+g95J7UYJIAftZWpBYbVHxfMaahRwqVbGJwBHw66YB8clgpZbc8+tMMiwNRx
	JVLvTgA1EaxawhBs04KN6dZplCqKc9UPwee7K3DhF/Ob4RVI9bm8RpRu2flmbEYmv2bh3dlF7zM
	tsUAK4Nu99FfGTvqAhz4QevsJvUMOZb9ULCEc9HDROV5Aje4BOtDsSh3eS3IxBSunFlNrVfhgYF
	qPQObtOyGiuaMyCJcbA+5CPALIJU554qkDHeRPZAxRM/nty2QcX9OaK2zm5Fh5l1Z5vqFQ/W0Ip
	scwsb+thWBJi47Yrrew=
X-Google-Smtp-Source: AGHT+IG7vPdVqxNB0855PBdaMLOKwCvkbDZ2yE295ybA/p8nXwy4eerUyf/+3NRqta8PjTtoS8l/bA==
X-Received: by 2002:a05:690c:7407:b0:6f9:804e:a2be with SMTP id 00721157ae682-6f989edf3dfmr7414427b3.20.1738708577673;
        Tue, 04 Feb 2025 14:36:17 -0800 (PST)
Received: from [10.87.171.172] ([139.104.3.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f8c486e578sm27925187b3.72.2025.02.04.14.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 14:36:17 -0800 (PST)
Message-ID: <11f7608b-0790-4b0f-96c4-398e92f761f7@gmail.com>
Date: Tue, 4 Feb 2025 14:36:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Styhead merge request: Feb 4th
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
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 22:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115277

The following changes since commit 74b08dcbb1d0f4600527602804544c9d63697ebc:

   libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths] 
(2025-01-16 09:17:32 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded styhead-next

for you to fetch changes up to 6851cbf026088a13b2b45f684838d3dc4d7ccfdd:

   lapack: fix buildpaths in ptest also when CBLAS is enabled 
(2025-02-04 14:29:37 -0800)

----------------------------------------------------------------
Hieu Van Nguyen (1):
       gphoto2: Fix /usr/bin/gphoto2 runtime error

Jörg Sommer (2):
       libtinyxml: set CVE product to tinyxml
       libtinyxml2: set CVE product to tinyxml2

Khem Raj (1):
       mpd: Upgrade mpd to 0.23.16

Martin Jansa (2):
       lapack: add PACKAGECONFIG for cblas
       lapack: fix buildpaths in ptest also when CBLAS is enabled

Peter Marko (11):
       libtinyxml: patch CVE-2021-42260
       libtinyxml: patch CVE-2023-34194
       procmail: patch CVE-2014-3618
       procmail: patch CVE-2017-16844.
       audiofile: fix multiple CVEs
       audiofile: patch CVE-2017-6829
       audiofile: fix multiple CVEs
       audiofile: patch CVE-2017-6831
       audiofile: patch CVE-2017-6839
       vorbis-tools: patch CVE-2023-43361
       audiofile: mark CVE-2020-18781 as patched

Zhang Peng (1):
       lapack: fix TMPDIR reference in do_package_qa

  .../mpd/0001-meson.build-support-building-with-ICU-76.patch     | 52 
------------
  .../musicpd/{mpd_0.23.15.bb => mpd_0.23.16.bb} |   3 +-
  .../vorbis-tools/vorbis-tools/CVE-2023-43361.patch              | 38 
+++++++++
  .../recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb       | 1 +
  meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb                | 43 
++++++++++
  meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb              | 6 +-
  meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb         | 5 ++
  .../files/0004-Always-check-the-number-of-coefficients.patch    | 46 
++++++++++
  ...05-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch | 43 
++++++++++
  .../0006-Check-for-multiplication-overflow-in-sfconvert.patch   | 79 
+++++++++++++++++
  .../0007-Actually-fail-when-error-occurs-in-parseFormat.patch   | 46 
++++++++++
  ...8-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch | 126 
++++++++++++++++++++++++++++
  .../recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch  | 27 
++++++
  .../recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch  | 31 
+++++++
  meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb          | 6 +-
  meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb       | 1 +
  meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch   | 29 
+++++++
  meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch  | 20 +++++
  meta-oe/recipes-support/procmail/procmail_3.22.bb               | 5 +-
  19 files changed, 547 insertions(+), 60 deletions(-)
  delete mode 100644 
meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.15.bb => 
mpd_0.23.16.bb} (97%)
  create mode 100644 
meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
  create mode 100644 
meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
  create mode 100644 
meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
  create mode 100644 
meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
  create mode 100644 
meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
  create mode 100644 
meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
  create mode 100644 
meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
  create mode 100644 
meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
  create mode 100644 
meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
  create mode 100644 
meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch


