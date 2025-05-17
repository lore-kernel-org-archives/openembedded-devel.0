Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBADC2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 17:59:29 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.16476.1747504763516757213
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 10:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TU2lJLah;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e78effa4b34so3537694276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747504762; x=1748109562; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSLB85p8K43/zNezOGoyB4bbmz0+k1SEqvySbwRsMf0=;
        b=TU2lJLahz/73F6S75/ekpm0KcvZYXcY0MNyXJpCmT0DMjwD16q/+9ICeNTyKnrN099
         NdRxjSyriOsxDl7b4xFLYJtuiwOosdcayb1Hce3sII6jYIFbOVkcQBe3OA1J44AmEZ9Z
         914Qx7G6AmjKcUWDrpo9aO9OP6Yl9UOCqMgZKD+jiLfBfWPH/U15OuXP97N1uGGN7Eqw
         ++i6vPDbBqBJuaqTihOF/mbk5o8hHHBQiBHVE/Y+jNO6QZWDZYYLOY8spnfRigvOKxHX
         9r7aT95PQLknSrL2F7HuQ+UvUGQuYLap17+EOhzWUtxn8MwmsNDfcaBVsQKWa8PS9Haq
         5rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747504763; x=1748109563;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSLB85p8K43/zNezOGoyB4bbmz0+k1SEqvySbwRsMf0=;
        b=e5WdPea1YxMtr8YTrZNQv3ruFxI8YpB8p+Xqony5CD7GMfDBY5XTECSPezqdfbUwRQ
         V6XX2/IEnciHArRPi8lYkNNlF/iAMgv/66Rx7mnQ8GqyVpayk//7Pom4yKxzEyffdktW
         DjH9xfIreK9yD9oS/ygEaald3wS/3TbWFxeyiMjCHb1gcTzl6sGShh1Z5zvMGm342s+K
         i8/QV2lARpAqrC0+Ot+tYRqhrQOpF9W/ERW1cpTs5LU9JCa4yDpqUMlkBUbzMac8Q7G+
         vRPL5Oqa54gaKhs96FXzjn9aXMkCjengVKPZCjBSmT+OoNN1sP6/wE7JYYsgad2wDkY4
         hezw==
X-Forwarded-Encrypted: i=1; AJvYcCVWvexNMY4XmxO4U1kK0MwNvUCCMuDMYg11RrQ8Ieu9lAjBj4TwGuBZA/+iM++XIwZPCS5wygh3us9gojgx3lCMGnk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFgOFgnZd3hSEJ9vQ3J9mZ+JP0J2xiKwW+QS10bFubMAT13nB8
	LkNyijmYGHawXZqmnkHomDgc1ghET95KBYvBxRKNXFqVPBKqnOQzcKCR
X-Gm-Gg: ASbGncu8tFrCGJ7YiZ4NoGgcLWoRP9/jmRLXlYfcewpXSRj5f09gWJlJSrruqR87z2R
	K5stMdCwnVSflOCntnt2HNcx0r7NKUFCZbnjqHRKEoNu/+tk7MJV9W4iHbeOcavxiRTzxFSeKH9
	wfkJ1lZhhtZkGuq5/D+9vLtgyfWNMIhYk5SHmfn0k6wv1u9DgKAJNbsdLS59yZJ0rx5NOeLwHUE
	L1X1n7TVWY9yx72YpOWgQumSQ0ytcpE/vcDPAEiCYMNJV+zuVhRX17YefYTjGndtHWUgUZBjtpJ
	6Zc6dzDbpbH1/prGx4P1rIDN5qC69gWO6PJ91S6Iwi8YwzaCdtq4WIva2pyCnxbiqxDI3LGf8r/
	Hz0r33KUNHB2tHYTiWwnFrG9p
X-Google-Smtp-Source: AGHT+IEg39mPXveq5Rkn4j3Hc5U2a5wNnOLdSbuWC3/u/SRaoio25/QChrGXJAOAKBoqPbqYQX3iGA==
X-Received: by 2002:a05:6902:a87:b0:e72:b52c:c0f with SMTP id 3f1490d57ef6-e7b4f87827fmr14651451276.16.1747504762585;
        Sat, 17 May 2025 10:59:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:9080:18e:3479:2e6d? ([2600:1700:45dd:7000:9080:18e:3479:2e6d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6adaa66asm1456634276.45.2025.05.17.10.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 10:59:22 -0700 (PDT)
Message-ID: <b890ddb1-a925-4b80-997c-15d7486d12b2@gmail.com>
Date: Sat, 17 May 2025 11:59:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: walnascar merge request: May 17th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 17:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117444

The following changes since commit 0d2d2d193a1619b6dbebaf335f1ef785478049e3:

   meta-openemnedded: Add myself as walnascar maintainer (2025-04-16 
18:20:05 -0700)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded walnascar-next

for you to fetch changes up to 2169c9afcc0945045bea49f58011080942d4ddb4:

   pipewire: Avoid having pipewire-native depend on pipewire (2025-05-17 
11:56:50 -0600)

----------------------------------------------------------------
Changqing Li (6):
       version-check.conf: add CHECK_VERSION_PV for pn-netperf
       python3-pyyaml-include: update SRCREV
       version-check.conf: mute bridge-utils version mismatch warning
       libuser: correct the package version
       turbostat: make turbostat's version align with kernel version
       lvm2: correct PKGV for package libdevmapper

Jason Schonberg (2):
       c-ares: upgrade 1.34.1 -> 1.34.2
       c-ares: upgrade 1.34.2 -> 1.34.3

Khem Raj (2):
       apache2: Scrub -ffile-prefix-map in build.nice file
       python3-posix-ipc: switch to PEP-517 build backend

Peter Kjellerstedt (2):
       meta-networking/README.md: Correct the branch for dependent layers
       pipewire: Avoid having pipewire-native depend on pipewire

Wang Mingyu (2):
       php: upgrade 8.4.5 -> 8.4.6
       python3-posix-ipc: upgrade 1.1.1 -> 1.2.0

Yi Zhao (1):
       catch2: upgrade 3.8.0 -> 3.8.1

Yogita Urade (1):
       poppler: upgrade 25.01.0 -> 25.04.0

  .../libuser/0001-configure.ac-update-version-to-0.64.patch      | 25 
++++++++++++++++
  meta-gnome/recipes-support/libuser/libuser_0.64.bb              | 1 +
  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb   | 4 ++-
  meta-networking/README.md                                       | 6 ++--
  meta-oe/conf/version-check.conf                                 | 3 ++
  meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch | 11 
+++----
  meta-oe/recipes-devtools/php/{php_8.4.5.bb => php_8.4.6.bb} |  2 +-
  .../recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat.bb} |  7 +++++
  .../c-ares/{c-ares_1.34.1.bb => c-ares_1.34.3.bb} |  2 +-
  meta-oe/recipes-support/lvm2/lvm2.inc                           | 23 
+++++++++++++++
  .../poppler/{poppler_25.01.0.bb => poppler_25.04.0.bb} |  2 +-
  .../recipes-test/catch2/{catch2_3.8.0.bb => catch2_3.8.1.bb} |  2 +-
  .../0001-Use-default-cc-from-environment-variable.patch         | 45 
-----------------------------
  .../{python3-posix-ipc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} |  8 ++---
  .../recipes-devtools/python/python3-pyyaml-include_2.2.bb       | 6 +++-
  meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb          | 2 +-
  16 files changed, 82 insertions(+), 67 deletions(-)
  create mode 100644 
meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-version-to-0.64.patch
  rename meta-oe/recipes-devtools/php/{php_8.4.5.bb => php_8.4.6.bb} (99%)
  rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => 
turbostat.bb} (94%)
  rename meta-oe/recipes-support/c-ares/{c-ares_1.34.1.bb => 
c-ares_1.34.3.bb} (91%)
  rename meta-oe/recipes-support/poppler/{poppler_25.01.0.bb => 
poppler_25.04.0.bb} (96%)
  rename meta-oe/recipes-test/catch2/{catch2_3.8.0.bb => 
catch2_3.8.1.bb} (92%)
  delete mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch
  rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.1.1.bb 
=> python3-posix-ipc_1.2.0.bb} (51%)

