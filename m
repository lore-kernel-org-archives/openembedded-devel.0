Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4871EC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 12:57:49 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.17224.1698152268102234539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 05:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VW9qBavD;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7c08b7744so44094647b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698152267; x=1698757067; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umY+lLM7A31wEe54/FQr115CfccuIIp4OJv4fEJhYHU=;
        b=VW9qBavDlY2jHcFZEVOp0KeRZQbUFJ5sM2OXJjU0eShYEZgkevUoCcOiOgemMS+WGA
         WIVQNZHa/dUD+88wXyr+xt8HqnHtqW1lcbMmnOWJIZ5ZpWbE7yNZYcwvYIuFmSr5noY0
         zuShynMAf1DQPmMM36DI+JvYbUEFIZTuOEVy4MlE3NWjRs7E27TYdTjzh44VlM03wCQU
         KBd24L6jHz00Zb0RbxojyBhdwYAgvbaIVxcfnyt2DrWfbATu+DF0Ut4oBuu4w6IsbPil
         23cN3RPnyIifXBkKvlhprRc6vJFUkgSYPtKtW8IT9pvSKbYuBziVOBA16VxdC7pH5c26
         Gr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698152267; x=1698757067;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umY+lLM7A31wEe54/FQr115CfccuIIp4OJv4fEJhYHU=;
        b=maL70coW3TS0jeMDoCzUKrJYMgLYi78F2ZXAjTPz88ODqYJYZ2C7k3wR5GBn0sqW9i
         DgO5si7Dyr0XMdwrmA6zp27w3BgpzZH6sXfbbPpmtitpphPgMqF/MkHnVjJ2LG2Hnidk
         ya+QPwZR8WiERTaOnJnDPOTD1zl7VARl3gfLalzIfgRCHmRWt+LDXBisWi5p8bUxqkp8
         335ZFGbHVtHvS9LVNpmnIzcfWeybQv0Mh7A9gkZmdVeudIdjBG8XX6BbovAvCwfr+UMM
         fdKkq2z2mN25B411l3PbXdXvsReVeqA3V9yNxFfV4nEndqwE5k9NhUrFu1Th/JL5P0cl
         tG2g==
X-Gm-Message-State: AOJu0Yz0YMkkldxkmDRadIu3lEXTHd88e3O/XZmb7N2UcBk6gvDnQNMB
	l12bvPZG+WNi9XzaPryVzoU=
X-Google-Smtp-Source: AGHT+IFTR4ba3s6p3Twqayf/hmDHVizqr4wTD2gCIG9VH7W5kiDSYLVtS3bjno3DkR2/E1DmwgCeiQ==
X-Received: by 2002:a81:8943:0:b0:5a8:1058:5d97 with SMTP id z64-20020a818943000000b005a810585d97mr12238569ywf.45.1698152267289;
        Tue, 24 Oct 2023 05:57:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:500:2287:c731:4756? ([2600:1700:9190:ba10:500:2287:c731:4756])
        by smtp.gmail.com with ESMTPSA id u131-20020a0deb89000000b005a7d46770f2sm4035007ywe.83.2023.10.24.05.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 05:57:46 -0700 (PDT)
Message-ID: <21c3c1d1-ecfa-4ac4-8a58-ade5504339fb@gmail.com>
Date: Tue, 24 Oct 2023 08:57:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: Oct 24th
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
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 12:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105721

The following changes since commit 0f10a0d394ddffeeb1db0ea94046d86792d704fe:

   php: Fix CVE-2023-3824 (2023-09-30 08:55:03 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 300be975359fdb3a3b2bf7c6fe15dea7acac575d:

   libssh2: Backport fix for CVE-2020-22218 (2023-10-21 16:31:35 -0400)

----------------------------------------------------------------
Vijay Anusuri (1):
       libssh2: Backport fix for CVE-2020-22218

  meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch | 39 
++++++++++++++++++++++++++++++++++
  meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb           |  1 +
  2 files changed, 40 insertions(+)
  create mode 100644 
meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch


