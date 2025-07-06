Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5566BC83F07
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 23:41:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.47615.1751845261713733119
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Jul 2025 16:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWBAAOZP;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23649faf69fso20931435ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Jul 2025 16:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751845261; x=1752450061; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V06C8TMtAB1foy6QmrJWklQZYfHiG7nAuRQk/VW2C9A=;
        b=fWBAAOZPdy7JOwUI10EG20vUh1ZI0ohhjrZYDe5bzG6GMjlepdODCqPNgel1o6pUPl
         o39kJHlU9IYj92Colk7wiplZ5Qv6hs747ZAesXqzEDusht7CABoJRPOuCMVoYZg23HkY
         CXVIDXH8nuxgVFh9tHepCKLEPfFjyvlYJPsm/NhIWAOv9esgG07SnmNtkIptSpaFHIzy
         xlyMjYISMcVByFF265EG4QSs0PkcNNlPCJjtxLkZrBvTamhOgktZdDc1vmhx6roTb29X
         frs0MK+kV2JH4O5M8v8kVLcmXCkU3Sr99HJ/MfohlThAozxUxy1AuTN+er0PmElRYUVd
         lLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751845261; x=1752450061;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V06C8TMtAB1foy6QmrJWklQZYfHiG7nAuRQk/VW2C9A=;
        b=Brgrofb+sEU/DN8c2ZCByhIMj/EUKLTumTIpzIzIitVFd1rj2Fw/PnfoNfU7eZUmdq
         dPLlWrPfM+IlbynJAosMHjrh8RDq2myBkLQDrdcy2qG61ZzfGeG3YiLLdWGacrYHlOTe
         oOtBorK14DbklrRSXPCcx8LJ4BBP7kH+OMu+F54U5ZrBMR/DL59/6AwkbVv8Sdp7YHFX
         DPGPL7gtq0tXjQ2Oc8umRJOA7hV6MPLO2gdewEud3Bn5LprjuI/43nSdvSBnqy6tpzXy
         U1DfJgqQclC2ZXiOfr3i9FWhncNp/yNT7TE4z19orJA9NaUZ4OfcO4aDYw7y1DRrgk0G
         Z4og==
X-Forwarded-Encrypted: i=1; AJvYcCVjDxh7sgAxLMjCjhWSIj8I/Ri4BClMvtLcWmX0mE4ja7gpNR05+SxHI8KPXnnILC793nR1jVt18msCwlAUSFl/YWk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyScepMRRM15O1YgF/QeWBPd5lAWOzInNTWZdaF5zpFaPVdsn01
	dDjir848n7+DH1T+fE3LCzSsI3kvFcMftL4ui7TeHkUNJI9sfOiERjF5
X-Gm-Gg: ASbGnctHGhVGnTXtBv0QGE8Y6p0vUlLFKtZarwoV88eyjR7Q8C6NtvGWHjd/rVR2BMy
	i5xFJLRRuTsdoT9HpsXoJITr8fEq3PrCQDuYnSjhKqPftrJHggw9JBmAmeiqHjxDanxGDG67gtV
	zEm/B+lcpBY9+iPV7adRRbkqn4ngrVHOQpsxyVPypeuI1SJsHTmpe0JR4eyII5Bp1RXA9yHTK1n
	VH/NHM6ORthR500m+QNFOvy3eOQ+piykt+LDebyXHm3uPDdKjnLaNi6IsWOKuj34uyr92cLviOh
	gxHcVGUvOVVQTX1Q1SkIJP3nXbsfoIKPqAePLMhUB3p7DYH7yv3d62oQeEZcFIRKxraLuBn3wTQ
	Rb8NQtqQ3rt+qaWP6Ak5YqTrQ/7FbWorlXYJtgcAnGnvRngRG
X-Google-Smtp-Source: AGHT+IHSZg4uuEo147ECvY7MnOgFD/D5EocYuSqyYD1XP974YUS8oTSER0aU390WR8BKX4IDwcnSWw==
X-Received: by 2002:a17:903:22cb:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23c874661bcmr108315615ad.6.1751845260882;
        Sun, 06 Jul 2025 16:41:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:b94d:987c:eeff:647f? ([2600:1700:45dd:7000:b94d:987c:eeff:647f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455eb3bsm75712785ad.115.2025.07.06.16.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 16:41:00 -0700 (PDT)
Message-ID: <4441f655-f9aa-48c2-bc39-98aaf3a05c74@gmail.com>
Date: Sun, 6 Jul 2025 19:40:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: walnascar merge request: July 6th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Jul 2025 23:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118240

The following changes since commit 3c6844219a69d9ca8cb0f1579114efe9a9e2a646:

   postgresql: upgrade 17.4 -> 17.5 (2025-06-20 10:46:50 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded walnascar-next

for you to fetch changes up to c009244a045923a9dfc32d7f2996cb61629870f6:

   udisks2: Hardening measure of CVE-2025-6019 (2025-07-06 19:23:22 -0400)

----------------------------------------------------------------
Bastian Krause (2):
       libsocketcan: use https instead of git protocol
       canutils: use https instead of git protocol

Changqing Li (3):
       netcf: remove EXTRA_AUTORECONF
       libblockdev: fix CVE-2025-6019
       udisks2: Hardening measure of CVE-2025-6019

Jason Schonberg (1):
       glade: update 3.22.2 -> 3.36.0

Jiaying Song (2):
       xmlsec1: avoid hardcoded ${RECIPE_SYSROOT} in xmlsec1-gnutls.pc
       python3-pycares: fix CVE-2025-48945

Jinfeng Wang (1):
       postfix: fix rootfs file difference

Richard Leitner (2):
       python3-moteus: Upgrade 0.3.79 -> 0.3.88
       python3-can: upgrade 4.4.2 -> 4.5.0

Yoann Congal (2):
       python3-evdev: Use Yocto kernel headers instead of host's
       python3-evdev: Fix buildpaths errors and reproducibility

Yogita Urade (1):
       open-vm-tools: fix CVE-2025-22247

Zhang Peng (1):
       glade: fix CVE-2020-36774

  .../postfix/files/0006-postfix-add-preliminary-setting.patch    | 31 ++
  meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb       | 1 +
  meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 -
  .../open-vm-tools/open-vm-tools/CVE-2025-22247.patch            | 378 
++++++++++++++
  .../recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb       | 1 +
  meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch       | 54 ++
  meta-oe/recipes-devtools/glade/glade_3.22.2.bb                  | 32 --
  meta-oe/recipes-devtools/glade/glade_3.36.0.bb                  | 33 ++
  meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch  | 31 ++
  meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb       | 1 +
  meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb            | 2 +-
  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb       | 2 +-
  meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch      | 51 ++
  meta-oe/recipes-support/udisks/udisks2_2.10.1.bb                | 1 +
  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb                | 7 +-
  .../python/{python3-can_4.4.2.bb => python3-can_4.5.0.bb} |   5 +-
  ...001-Add-a-reproducibility-option-for-building-ecodes.c.patch | 116 
+++++
  meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb      | 5 +-
  .../{python3-moteus_0.3.79.bb => python3-moteus_0.3.88.bb} |   2 +-
  .../python/python3-pycares/CVE-2025-48945.patch                 | 733 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb    | 1 +
  21 files changed, 1448 insertions(+), 41 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
  create mode 100644 
meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
  delete mode 100644 meta-oe/recipes-devtools/glade/glade_3.22.2.bb
  create mode 100644 meta-oe/recipes-devtools/glade/glade_3.36.0.bb
  create mode 100644 
meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
  create mode 100644 
meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
  rename meta-python/recipes-devtools/python/{python3-can_4.4.2.bb => 
python3-can_4.5.0.bb} (83%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
  rename meta-python/recipes-devtools/python/{python3-moteus_0.3.79.bb 
=> python3-moteus_0.3.88.bb} (82%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-pycares/CVE-2025-48945.patch


