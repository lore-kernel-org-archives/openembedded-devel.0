Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501FEC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 16:50:53 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.504.1743526250068197128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 09:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwfKLATf;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6fee50bfea5so52904647b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526249; x=1744131049; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/xWzNVUEpV/x4BJJ5guZOP3JrzhBG+evjFfDFztih4=;
        b=bwfKLATfYmYvcIcnwXXox0vIHvh6rYHYWhdkVTuRyuT3OZJDUO732Z4AoQq3HRG9UT
         QjVbuVDI0os4Tz1iVXZxhcDo3iViE58Fs9TwvF3kWEoPAF2eN8PbDg/rTEAbohCzbTr7
         YzBauK7gsuD39hLI0yGb00pPLXzvvboOhttbIBOmGj/S5Zsk/VlV3iGb7maFG5tTfy/j
         4WQFK4ofn2hEwLv22oEUb8SwiEZxZxGA/YzM5zqgOvoo7VDcgmr4+HvZ+7KVYN+weTJo
         ooXMFiWww5eBptmnqTGkInVpt5VxUieXfdTBJZ5hc19C3rCryOvkW1RmqxlHsyHMsvSX
         hwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526249; x=1744131049;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/xWzNVUEpV/x4BJJ5guZOP3JrzhBG+evjFfDFztih4=;
        b=Mv5BXJl/DXfpET7/9m1GeXq9fyQ5Jle1W2cGZX4AX1J6hrlC19M7kxTWXbM2DMcMo0
         eb1tErKUffkQW/Z/UJ3yhZoTzYESIUM7wtyD3W4EXPZ9s7rAqOSDMjYdD3VhvZF4uYAt
         LPzXS3Qitx3Z2D/3ZwHjBlL+zosoxHPV+NJm+/0mN3Ar5p02ehprPjI8//w8ErLCl3ly
         aEBO+H3BluMegTMZeKVXm4yQ34jJsSIOXdXAlmojjJuI78jTBedEvEismIH98ZAI+wwK
         Rv5BH8fujXvcoFgs3mtsZfxXzGPcqlNAqPyc9WJ1E3VifprHvi5maVr9aXgmgOBXwEih
         drZA==
X-Forwarded-Encrypted: i=1; AJvYcCVpyGQifJE6CekBhb/bIEqDxUBsfZ7QTh9bL8FLvj7cXu3pGzSvB7urMspivRK8BFaExZ8Mswan+rKCUiPpOlBe90k=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/Ao3hoBdeZo5QrMFZlrBcVIXV2trgOAoA9WUa4mPIooy1mvzJ
	w/hH/BEwNiQEjGf/VibZ2h5J+WJLQa1sPEYTOdQFs1Fy/iYk0xj5
X-Gm-Gg: ASbGnctm1qZWvbh4aCvwbeeznawoTJ4SshFbA/dX/dCr8W9cVSz+8Rf4Nl0d7XTTTWt
	dbxb1YFw0OP7lHfkzdJ9zYxCuYRpPpzg+ggZBQjkLbIecKaJObGNBgJwpHzJ5+E+g3joY5chX2C
	kEUf9UAOCQ0Elzdvy+SFplqVUEYOvGyy+UkZpd+540L9L6r9SpA2o5rZHfN2C7yyQaR0B3LVnK3
	hnMKSHndZWKmoYgnMIW6IcPxfTBoyAUTZ389JlVuMuuDLo6fSGDyO3kiUxWQNfcm0GG41x9A79G
	VkL/9ZD2yULnUPjpynuv2HfzD/oH4jtl/Y6+W+sjMpYEnUiwsod7DTBCcKspGUdn4Ea/J8686Vp
	0AydHqK2YfsPicueK2nMg
X-Google-Smtp-Source: AGHT+IERhpA/TLncWdJvOQ5SWekBhGukMkkSqIT74cmuriV94b4J3VoRUGuhMTHYFn+lNtJxl8j3zA==
X-Received: by 2002:a05:690c:6a08:b0:6fb:9b8c:4b50 with SMTP id 00721157ae682-7025712680amr170964387b3.13.1743526249154;
        Tue, 01 Apr 2025 09:50:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:363f:6d11:bca8:93ca? ([2600:1700:45dd:7000:363f:6d11:bca8:93ca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a98a259sm27870547b3.75.2025.04.01.09.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:50:48 -0700 (PDT)
Message-ID: <bd90051b-f319-4ea8-8d3c-4416c109ea4c@gmail.com>
Date: Tue, 1 Apr 2025 12:50:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: April 1st
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
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 16:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116483

The following changes since commit 084df16f561ebce5aea2ae9241cc500247771ef3:

   Revert "net-snmp: fix memory leak" (2025-03-20 09:56:59 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to f8dddbfcbfe502cb71375a7a907e61a92e8d4474:

   openvpn: renew the sample keys (2025-03-29 14:24:38 -0400)

----------------------------------------------------------------
Haixiao Yan (1):
       openvpn: renew the sample keys

Jiaying Song (3):
       xfce-dusk-gtk3: fix do_fetch error
       eject: fix do_fetch error
       chrony: fix do_fetch error

Wang Mingyu (1):
       geoip: fix do_fetch error

  meta-networking/recipes-support/chrony/chrony_4.2.bb |   2 +-
  meta-networking/recipes-support/geoip/geoip_1.6.12.bb |   8 ++++----
  .../openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz | 
Bin 0 -> 28118 bytes
  meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb |   1 +
  meta-oe/recipes-support/eject/eject_2.1.5.bb |   2 +-
  meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb |   3 +--
  6 files changed, 8 insertions(+), 8 deletions(-)
  create mode 100644 
meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz


