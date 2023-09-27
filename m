Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2B1E810D5
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 11:43:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.15415.1695815003441224857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 04:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mGqKzO73;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59f4f80d084so100710167b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695815002; x=1696419802; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75DRAlFeC3SFLonEHfdeOEChpniS8Dp9Cw3eYn8n4+8=;
        b=mGqKzO73e7p7WP2Lvk9Bz2QD1na3w9EQDh5kGqYs1sLghGBJJwfy6Gaqo85kB0hiOj
         il08nGGDEw0H/Rp2hpJkxJeD+U75F+yV4AI7oxDTrexdcB7HfETXDN7KiYybdjDvRkwO
         jx/vRkzV2eLmElTa9pqMiBmgjL8VmCS4bjJ+Kr6ksfKg6RhP+cp7m2ZNCkY08cu/PByl
         CZdMRJyHHHBiB0W8zeiKgIYHN9fU90WbuUbpTo9G2IGt9C5ZA5i+mILFnQgjtqHWW0JZ
         fc/2Cs96IudAL6LT8xq2PWapm4UwyQc9n2nhUP5JYlw23N0PjB8pxQYCiH8X6oYJ7nQK
         nDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695815002; x=1696419802;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=75DRAlFeC3SFLonEHfdeOEChpniS8Dp9Cw3eYn8n4+8=;
        b=v4pJCLGLLFd01mxjjjJjkjVLIKXbQAqJqO6XRq0z8Wh0GU9a3fG6hp+YE+ErOyh1AZ
         QQ6fi5+919wut5qXtKqQ1L5ROa7sQsIBtu6tLUYwhGWzLUn83pQuJqRYMJWArNXsfgi3
         vRiv9C+N2dRXARTjHJQHPQ4uwcasHXHfeMOTjV/kaeCAK16YPfkXmW2ZiuZ78Btu0E7+
         ALH3NZ06kG5me0fQ21pqY/B7c0HP+l1gUSIcsL5rdQ1iyADC3auAk+He45F0x0UnHZ18
         sOCvM8N7Or8Bo29CypBdtgY40jzg+raZNvK2R1718VMF5zKWTFuwvifDQHXCsNrLHZ+s
         WpAw==
X-Gm-Message-State: AOJu0YyYlag59o2SMUF6jjt8DHXro/mofPOg0ZPPSFtxkayOUws2a7Km
	eKlMV1lAFTIWPMMTGDC6ujY=
X-Google-Smtp-Source: AGHT+IHdyo77bdT7RobK+GITtU5ZpmwtrYD0s9foNie9c5tj5HiS7odWe/8P7LmkMV3xzD7up3eqBg==
X-Received: by 2002:a0d:e649:0:b0:5a0:83d3:b61d with SMTP id p70-20020a0de649000000b005a083d3b61dmr2092028ywe.8.1695815002527;
        Wed, 27 Sep 2023 04:43:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:961:fe0e:be52:568a? ([2600:1700:9190:ba10:961:fe0e:be52:568a])
        by smtp.gmail.com with ESMTPSA id f184-20020a0dc3c1000000b0059ae483b89dsm3644001ywd.50.2023.09.27.04.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 04:43:22 -0700 (PDT)
Message-ID: <106a5b7b-060d-4a20-e508-82e220c23e39@gmail.com>
Date: Wed, 27 Sep 2023 07:43:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: Sept 27th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 11:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105190

The following changes since commit 32c529d435c45e60151c714936d451ed9e341466:

   poppler: fix CVE-2023-34872 (2023-09-19 07:22:00 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 922f41b39f364e5b6be596b4b51e0fb37ffe1971:

   x11vnc: Fix CVE-2020-29074 (2023-09-27 07:40:56 -0400)

----------------------------------------------------------------
Armin Kuster (1):
       openldap: update to 2.5.16.

Lee Chee Yang (2):
       opensc: fix CVE-2023-2977
       x11vnc: Fix CVE-2020-29074

Sanjay Chitroda (1):
       netkit-telnet: Fix CVE-2022-39028

  .../recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch     | 53 
++++++++++++++++++++++++++++
  .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb          | 1 +
  meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch      | 27 
+++++++++++++++
  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                | 1 +
  .../0001-configure-Pass-pthread_t-to-pthread_detach.patch       | 32 
-----------------
  .../openldap/{openldap_2.5.13.bb => openldap_2.5.16.bb} |  3 +-
  meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch        | 54 
+++++++++++++++++++++++++++++
  meta-oe/recipes-support/opensc/opensc_0.23.0.bb                 | 1 +
  8 files changed, 138 insertions(+), 34 deletions(-)
  create mode 100644 
meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
  create mode 100644 
meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
  delete mode 100644 
meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch
  rename meta-oe/recipes-support/openldap/{openldap_2.5.13.bb => 
openldap_2.5.16.bb} (98%)
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch


