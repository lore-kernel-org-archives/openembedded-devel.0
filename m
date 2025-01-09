Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B83E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 13:05:29 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.47649.1736427927684714142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 05:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWWTjx+9;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so1359345276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 05:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736427927; x=1737032727; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u23bFJST3BIUcfTvbOYMaYsGxslNy0Bc2L6sxcF5f80=;
        b=bWWTjx+9ot+uQZ4dGN0UplY+Zw37AzkMKN1AoXyzDE25EKCRdUUk3U//Jib1nFG5C+
         g8IDg13x9LIClJTqBdGxPkY2hKOG3dsnVavdWNz5m9BfrMI8wjh2LDllfwKaxTr7XMhJ
         H8BYoCGJy90gmbz5YK0M5ipDCNBq5Sy1yMo1jYshJYoGJfqa+435CDI/8I/uow3xpFr9
         4Q0iZWcyES9HYsIy20VG+RmCjrkmaOmjYfnBrh17HhvQe7TuJ5RqNNXwmawKIQUCTMMA
         ajpZlGXKjzQbs1wG5OQlBTTCkPZ/gcbLntIJGBl2TC8X8ld8mweGwGdTzhE3OMoF64Vl
         GzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736427927; x=1737032727;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u23bFJST3BIUcfTvbOYMaYsGxslNy0Bc2L6sxcF5f80=;
        b=rFFkDflPFBjZYFgxAYX214MOvRJfuv2irNdGVenSsNmSOu0SdkuuJke/hGFrPyYv7f
         M5HOM02QVBtYHHVyz3wYR2Wdp1m1v3lIaRRF+anvnBsmM6bfQ6w6d+lxrBhyJBbgS/gh
         /hrHC1tp6aY+vp6ARlyPz04XdENQNnKnpQDjeB9KHMAVNDf75kIBc3+yoBXSO5Nh8YSg
         qNKwUTtFQ7Py88Uar5KF0sRD5Z7+iKhgqSnP2CZ6j5yImIUxHy+08ngPlXvir0U/VMjg
         fq2zUGreDBLGmwO5pSINt84dhxY5TPqfa2WqvOxdR8DvqFyawWLcKeRTwQ/no8LeKvAI
         ObdA==
X-Forwarded-Encrypted: i=1; AJvYcCWqiAY5ZhPwKODfex8lme/gpxygX8MrZug9iK5/l3SleShHMVBewM3k0HAH438+5ImDeYSu1jdddUXQA9Oix9aNv1E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCOMHKpz+jQVyz+1zrbtm8+bhKnFgdy60PKwN/9XUFkQ3OnMw2
	xhJ9QzNR6mb5uIrTNfWfK8q/YMUK4joSqRAbMrqrlJvSG54Ekqb0
X-Gm-Gg: ASbGncu18gi7q26gDY3T68sUmBNDAqSwXJo6KsEPD7YP6Du+jFv3o+8P4YTBUTq727V
	wQi4gmI/egFqzT8axKjQ52U4u0Yw8g+8wJBgFRB83Kp0X1t2qGxECPZOA0w+OtZUHXqkCCSjqXE
	DwQTbUAPXH+MjH0VPo78rkfZdJ709Dx560IrGIKYv/07T5j/mkukgQJYlJqMcg4rfJ+WMQSDo8L
	QhGV2YrXijEEej0ZlgtywZ8aFxn4U4YAkvSnv9VOXvDfIAaBsT9NfrY8Aa6IrA4IGvBNhlgTBj5
	aM1n7FyQu7Vc7qFYK4jLT42uacb/qmY2
X-Google-Smtp-Source: AGHT+IGGDPAdFxKsvKvsp51fK2Xfn57CjvjsJqIdR01EXWCI+qF2YmbY82SWvp1qYDZVJ+raQt29GQ==
X-Received: by 2002:a05:6902:2701:b0:e4a:9ef8:802b with SMTP id 3f1490d57ef6-e54edf151a6mr5995447276.2.1736427926659;
        Thu, 09 Jan 2025 05:05:26 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:da88:766d:b728:95c7? ([2600:1700:45dd:7000:da88:766d:b728:95c7])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc30927sm10178046276.23.2025.01.09.05.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:05:26 -0800 (PST)
Message-ID: <ac413271-b152-499b-94f4-e04fab4ae9be@gmail.com>
Date: Thu, 9 Jan 2025 08:05:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Jan 9th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 13:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114751

The following changes since commit 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf:

   libgsf: Upgrade 1.14.49 -> 1.14.53 (2024-12-08 15:04:56 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 66ec16850573a7ec69248b81f9904cdfba79b930:

   packagegroup-meta-multimedia: Remove library only packages from rdeps 
(2025-01-01 09:13:52 -0500)

----------------------------------------------------------------
Colin McAllister (1):
       lldpd: Fix CVE-2023-41910

Fabrice Aeschbacher (1):
       mosquitto: upgrade 2.0.18 -> 2.0.19

Khem Raj (2):
       nspr: Fix build with clang16
       packagegroup-meta-multimedia: Remove library only packages from rdeps

Mingli Yu (1):
       asio: Add ptest support

Peter Marko (2):
       hostapd: Patch CVE-2024-3596
       hostapd: Patch security advisory 2024-2

Soumya Sambu (2):
       python3-werkzeug: Fix CVE-2024-34069
       python3-werkzeug: Fix CVE-2024-49767

Vijay Anusuri (1):
       php: upgrade 8.1.30 -> 8.1.31

Wang Mingyu (1):
       mosquitto: upgrade 2.0.19 -> 2.0.20

Yogita Urade (1):
       postgresql: upgrade 14.13 -> 14.14

  .../packagegroups/packagegroup-meta-multimedia.bb               | 34 
+-----
  meta-networking/recipes-connectivity/mosquitto/files/1571.patch | 22 ----
  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 -----
  .../mosquitto/{mosquitto_2.0.18.bb => mosquitto_2.0.20.bb} |   4 +-
  .../recipes-daemons/lldpd/files/CVE-2023-41910.patch            | 26 +++++
  meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb            | 1 +
  ...1-SAE-Check-for-invalid-Rejected-Groups-element-length.patch | 52 
+++++++++
  ...3-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch | 38 
+++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch | 82 
++++++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch | 165 
++++++++++++++++++++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch | 62 
+++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch | 52 
+++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch | 51 
+++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch | 46 
++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch | 105 
++++++++++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch | 47 
++++++++
  meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 10 ++
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 7 +-
  .../postgresql/{postgresql_14.13.bb => postgresql_14.14.bb} |   2 +-
  meta-oe/recipes-devtools/php/{php_8.1.30.bb => php_8.1.31.bb} |   2 +-
  .../asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch   | 45 
++++++++
  meta-oe/recipes-support/asio/asio/run-ptest                     | 19 ++++
  meta-oe/recipes-support/asio/asio_1.20.0.bb                     | 21 +++-
  .../nspr/0001-Fix-Wincompatible-function-pointer-types.patch    | 39 
+++++++
  meta-oe/recipes-support/nspr/nspr_4.29.bb                       | 1 +
  .../python/python3-werkzeug/CVE-2024-34069-0001.patch           | 149 
+++++++++++++++++++++++++
  .../python/python3-werkzeug/CVE-2024-34069-0002.patch           | 120 
++++++++++++++++++++
  .../python/python3-werkzeug/CVE-2024-49767.patch                | 87 
+++++++++++++++
  meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb   | 5 +-
  29 files changed, 1227 insertions(+), 92 deletions(-)
  delete mode 100644 
meta-networking/recipes-connectivity/mosquitto/files/1571.patch
  delete mode 100644 
meta-networking/recipes-connectivity/mosquitto/files/2894.patch
  rename 
meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.18.bb => 
mosquitto_2.0.20.bb} (95%)
  create mode 100644 
meta-networking/recipes-daemons/lldpd/files/CVE-2023-41910.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.13.bb => 
postgresql_14.14.bb} (84%)
  rename meta-oe/recipes-devtools/php/{php_8.1.30.bb => php_8.1.31.bb} (99%)
  create mode 100644 
meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
  create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
  create mode 100644 
meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0001.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0002.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-49767.patch


