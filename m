Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67969C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 19:06:27 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.21710.1742756781535867121
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Mar 2025 12:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qu2RIE8j;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e643f0933afso3702312276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Mar 2025 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742756781; x=1743361581; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvw2PHHy0/lV7TggVCPlddZ9U0zeiKMuLK1v8qIAlrc=;
        b=Qu2RIE8jlOWaZTq9GibG6AL0dJqcqEa2rzvmjeX0WxROW6OfkNngQYy9Y4S6HABBk8
         3rwdRQvK/zg0RG1cSDBQ3xxg4gj5kdjVN4PTc0bAewGusrnjwVhBb+eMhk+QlMkPczmf
         tcAFvnL0z5g58V0GceOYq5qlX4/2DSFsGFYLyN6F6dPM1iQCuz4JPLaokqih46KbPXST
         0WaZFcwJHDbq8fDklnCa3WbmRbWbGbOhBaVSrn0W0lr7KlL7LXxu7T3/YSQtC5gvhEgY
         vMR8hHLY8YsoPKaqDD5X/STPzjK0MBvo7aTFgIqOS/lntlOuCvBmk/drJFjIT7+h2efh
         xg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742756781; x=1743361581;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tvw2PHHy0/lV7TggVCPlddZ9U0zeiKMuLK1v8qIAlrc=;
        b=V471S6Zz2IA29U6LbwHlxme6QPjd23wwsQc8BS71lYfR+aDwyAylElJrLO+8cobTg+
         AHnmGJ1+XFXBqujYKd8KhlZoHEwGuC3uKnW5awvpaCQNWkXg0fUUu2hppdislfVFerqo
         qn65zQjegeiMAzGitnYUvgVBmTvZS1YQ+KYqZj+Il2g2+vHxqRGLp7I/HaoUd8cuha+x
         OQV+BtlNtbXhi69SV/MxzI0/kNbyPvcKYiWEdrFFVv4xrYfV5DnMcGKKS1FQrYsOS7vg
         djYr72sZDmvPe9aAhmRsT8BIt+VSfZYb0qFLf1zTDVjfjZ/OfX9e8/hmBiefho4o+TKi
         ZA8w==
X-Forwarded-Encrypted: i=1; AJvYcCWCWGFfTCuAjYGYU/w3Fqr0O5uD53pMeSQva15mFGxxREkYUiuxwAET657joh8ZNk5NMJHmnnM61lK1cr8Me69oTTE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTnkX5IzNJ5cVgeE6nkE7hPwN1QF+J4vCuEO9MX8cs1JDw8EvW
	khcgMNtNayid5SnJsKdh+qnak2Na/KRYWn2cpKxgWxhJYIF4D4E5
X-Gm-Gg: ASbGncseocP1zZwHX0G5al2EN1xP+kSQFoIY6w1HTK5J5nSw9BR5FeGJxAOTC4lM3NI
	ANz2wnqvI37+05UEQ8Ukxzjet0duEOQdmDXQjluAlG77LVFz+1HpnHcXbK+VsBxaDP41CT78cz1
	yJ0EP8tlpqn3pVWE74H5Q9zviZbaq0byzTdxxXxluB+7vS/IXTLod6AAfJQ8dmvOP2e2rDTHRdR
	DsJa3yiYmt41oJSdw6jDfYSIZKTpnUAkhQzF/WussGKf9s5XbaZd6IJpztdP4F6cvuumDheZoO/
	p7GknF5AYkWMvx4v5zgU6Y/GPGufBaneEyj/iopAcE7UVDxBmo8hCZUvMtrk9d4txLoWZrr5QaD
	pndJ24T4cuxnSNz9MOg0M
X-Google-Smtp-Source: AGHT+IEHj/wLMorVGUlIozXchVRSqy0uBEBRNfsi0VFkI+Uooki2fAgfJLu4arAhc1Uc2syeVoEDJw==
X-Received: by 2002:a05:690c:630a:b0:6f9:4c00:53ae with SMTP id 00721157ae682-700ba34b433mr120357287b3.8.1742756780653;
        Sun, 23 Mar 2025 12:06:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:2b2e:e9ae:f928:6629? ([2600:1700:45dd:7000:2b2e:e9ae:f928:6629])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba76a3f8sm12183557b3.31.2025.03.23.12.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:06:20 -0700 (PDT)
Message-ID: <952235ba-b7ee-4ba7-831f-3a679c900cf3@gmail.com>
Date: Sun, 23 Mar 2025 15:06:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: March 23rd
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
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Mar 2025 19:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116203

The following changes since commit 6c9f1f8d4538119803bf793747b65e4d23c33544:

   nginx: fix CVE-2025-23419 (2025-03-03 08:09:03 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to edd1a1e284fdcb80cd48d411f235d47f23bc27ae:

   mongodb: fix build with python 3.12 (2025-03-07 19:40:51 -0500)

----------------------------------------------------------------
Awais Belal (1):
       mongodb: fix build with python 3.12

Peter Marko (1):
       libmodbus: patch CVE-2024-10918

Virendra Thakur (1):
       unbound: Fix CVE-2024-8508

  .../recipes-support/unbound/unbound/CVE-2024-8508.patch         | 247 
++++++++++++++++++++++++++++
  meta-networking/recipes-support/unbound/unbound_1.19.3.bb       | 4 +-
  .../0001-moduleconfig.py-python-3.12-compatibility.patch        | 57 
+++++++
  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 3 +-
  .../libmodbus/libmodbus/CVE-2024-10918-01.patch                 | 177 
++++++++++++++++++++
  .../libmodbus/libmodbus/CVE-2024-10918-02.patch                 | 121 
++++++++++++++
  .../libmodbus/libmodbus/CVE-2024-10918-03.patch                 | 84 
++++++++++
  .../libmodbus/libmodbus/CVE-2024-10918-04.patch                 | 239 
+++++++++++++++++++++++++++
  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb          | 8 +-
  9 files changed, 936 insertions(+), 4 deletions(-)
  create mode 100644 
meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch
  create mode 100644 
meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patc

