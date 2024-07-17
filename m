Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDD9C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:00:44 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.14504.1721221240544858944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 06:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Di7wZ20J;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-651da7c1531so61301937b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721221240; x=1721826040; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M79LX0XBKf58x5+NvA4GKMFNJyp6obHm3gKD7r5y3t4=;
        b=Di7wZ20J0RXn4G61gHmaCeZhHErksO+kUXovp1hTvSu86/E4BaPPVmaVSyQq5lvLcn
         Ein8x1Iu/HQTfaDWDuhF8aBdgP6fcVSsfwhtI7Z/TXWynm1v1gMG/7DuXGarvMASzw8w
         AG0AFPFonHsGouT1i2zQVCStj1g3SVG5VI1Bt71Wyw0tj2lfpOtftbtQknvdgogQHWIH
         JJqmm7fsPJKl7hR6TzlGyugjfpyleUoe0UMf1Eu9K1GNx5Ex7eQX5clC03eV7sWjigNN
         x9ZG3xFkGbNNeKkZku0LDz8naNtLp6s9Xp4Hrzzt75MpqAGaxIF9WguxP5A6ixqJd1TC
         3RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721221240; x=1721826040;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M79LX0XBKf58x5+NvA4GKMFNJyp6obHm3gKD7r5y3t4=;
        b=S9I5MG4UOmXJjbl82Ip8xhe/vOlHiJMFWBGnXXcNtg9kjg55m/2j7++aG9hg+BVVs0
         197BdI+64EgriGK8H7KOcoR4gDM341vXgbWsbHqqLEVdQ3uOX/RYp+/Aw7bLpy2OEJjk
         umJd4SCQi7IqfeIV8Tyajef4u7nLdRXRKrQiPPS5Ca8fGMhnS6F9o+4sK76rFBBResQU
         Vty5PKiWLxhJO1Ev6ay1myybTyKGtsdxDxtV8ZgNSilvvWU7cdyMSmKTxJPuSJLALUFU
         iccP2lGC+Cj/zsQ4ky7bqF37i20CfIHUp6xT1qGjClebkwx9KPzwG48m5klic2rOPeq1
         CT4w==
X-Forwarded-Encrypted: i=1; AJvYcCX6Vge3JWB4rRai6YWMYlKOF00ZvEWGfaDSTE1hk+UMD5Jj3DcOxamcjBuOTYhXwhqyfO4MV/cIA5dzVZvLoAlfoZBvJR8cZbP70YA9+lG3S9L662LmkWUStg==
X-Gm-Message-State: AOJu0YzIX8xL1u5VpdYaWEP7mEr4TVaK9yAKRWNYAQ7L7O9rQL5QofT/
	rEVZ1cIdlP8tJ1DpC9rjwEUJ7kjT9Hk402NepY5AA2TltAiX95ALff3Udg==
X-Google-Smtp-Source: AGHT+IHKCcKwYGR0BLEU9kJ57pfU0CFhfPeQaFPxTJdjP4q94vPay1BYdrOuxcoOG5JlxnXR3EcCiA==
X-Received: by 2002:a0d:fbc5:0:b0:615:b6f:ad35 with SMTP id 00721157ae682-664ff8da7f1mr17825417b3.33.1721221239647;
        Wed, 17 Jul 2024 06:00:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:cb37:bc34:634e:9201? ([2600:1700:45dd:7000:cb37:bc34:634e:9201])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc2af3c77sm15251377b3.64.2024.07.17.06.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 06:00:39 -0700 (PDT)
Message-ID: <44e317f2-4858-4031-b95c-052d67ce3969@gmail.com>
Date: Wed, 17 Jul 2024 09:00:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scathgap merge request: July 17th
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 13:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111381

The following changes since commit 78a14731cf0cf38a19ff8bd0e9255b319afaf3a7:

   php: Upgrade to 8.2.20 (2024-06-26 07:33:55 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 18f939a5fb37528a5415b05077ece383c346a119:

   libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage 
(2024-07-09 08:18:46 -0400)

----------------------------------------------------------------
BINDU (1):
       flatbuffers: adapt for cross-compilation environments

Chen Qi (1):
       libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage

Libo Chen (1):
       thin-provisioning-tools: install missed thin_shrink and era_repair

Randy MacLeod (1):
       python3-pyyaml-include: support native and nativesdk build

Siddharth Doshi (1):
       apache2: Upgrade 2.4.59 -> 2.4.60

Vijay Anusuri (1):
       krb5: upgrade 1.21.2 -> 1.21.3

Wentao Zhang (1):
       meta-oe/conf/layer.conf: remove libbpf from NON_MULTILIB_RECIPES 
for x86 and x86-64

  meta-oe/conf/layer.conf                                         | 3 +++
  .../krb5/{krb5_1.21.2.bb => krb5_1.21.3.bb} |  4 +--
  meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb             | 5 ++++
  ...0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch | 40 
+++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb        | 4 ++-
  .../thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb   | 8 +++---
  .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +-
  .../apache2/{apache2_2.4.59.bb => apache2_2.4.60.bb} |  2 +-
  8 files changed, 60 insertions(+), 8 deletions(-)
  rename meta-oe/recipes-connectivity/krb5/{krb5_1.21.2.bb => 
krb5_1.21.3.bb} (97%)
  create mode 100644 
meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb => 
apache2_2.4.60.bb} (99%)

