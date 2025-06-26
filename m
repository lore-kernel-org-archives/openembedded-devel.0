Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAFDC7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 13:37:22 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.8277.1750945029542428689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 06:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WT/tE3sF;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e3e0415a7so11250267b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750945029; x=1751549829; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PenxctWWuYp+7kQ9MCzEMg1ifZpBWGpRe7EKpzMshWU=;
        b=WT/tE3sFBqrQPMMeXGV6nc36FJMTdSZ4InhGsbmhx9eoWVEwi+qDGj1K4KbXu0HC8t
         +Yaa81gBhPMZ/s1xao+aMBKQhor/l5XI65Iv4UyzdfGKH5ORIQnzYFTQOgbBJlKJsV07
         Ot3kblbjXk+5RUxlBa1Pi5mWFMVIsUWBSApa33lRfWiNwjQSc9iFItGVskXtjJDAe2WN
         nK5gDFCaHXjKg1ReGLHHTd7VXKI8pFlMlS+cb6tvooMO+r1osSHq185mZhP0FWCPEGxw
         2XAfiETgg9cTq6yV1QnhPnmRvwSiL1XalEXGkkSNRwQpVuHt7eEsbwxhiFqm0La2PPEJ
         i8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945029; x=1751549829;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PenxctWWuYp+7kQ9MCzEMg1ifZpBWGpRe7EKpzMshWU=;
        b=uXFevb/A803XZjusThbxoFTJwmOSjV9s1rAwdS0A4si2DOG0FNTL/wgWzqSbT2FPor
         r0aV2HdXsKirMnUE/ThJdho4oGj7Q/GY/9yn10tiT6NyLxEDDciq2tP0AaMQxEqWD5EL
         QthJTQ/OBRQWt1IMa2o0s8kAGbDTja4X3oRrtLdVl6oi3vb0f+Z/D/Tslnhx1VAXSy27
         Lqhn6DdiECdY2IQsDqIh7HNTc1OgmLHHV3jIHfL1n7eZalFlis9RSnD6KrQXmbvDeIcA
         pYfRMrw0WjpAjY6rlyU1niIKhEhaMTzdk56gh+dEwN9eJLMhRWkL+2r8zNg9zdjcZnK8
         Z31A==
X-Forwarded-Encrypted: i=1; AJvYcCXIdzyHVDt3YSaxeaEeQyIWJR90L4fmllkLnQP876wY7ybkESlK5s4g4ZX47KvJ/QK9/vLBdj4uaMueaEEHNNFpTTw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPfyF7iWQtlQYTj99DDfdHTo1VaC9REci91sj3ZBtUaGOk4zWA
	Y9PJGsqURWksKyAhFl73a1M8QN7djlTKft6q0BKC8oaMY7xKQeESiAlB
X-Gm-Gg: ASbGncujeEhKT2x8so3nmQey2qkmbLDZBGf+Gf0zqaTmHFMZcwXFkvMdvB8/NGp2Qrm
	Shfnb+ffOx26sf2GMA8el4+hkPp1NWu/7Fv0bBXIG5zd1y4+ZlKS4VBamsQW8TS0MIe7UC5gh4s
	SrbgHdXkiEwIiDltw4vbMrZodGn52baYGq+D6PE+Al43YpiZidz07wW35Myccz3jp93FSFI8YbA
	b7E9C08mFNnZJoudQgP3jlxqDf8FxoseVg0AXJ3YDMqiWPudDm8gEJYH0Ws0VEEEIvicBbi6mmm
	YOUZw8LkTKn2X+kXT+6qzU3vlSv3gctSgN9A1mlf6DkWMi9fsIzbNyVuYvLQMoWQnbilMZELsNs
	k5STLGkTrx5QoIpzE6xcWilFZLFF4DWSi+VE8uw==
X-Google-Smtp-Source: AGHT+IHPneSOrNAxdUU3giu/ytD/96jR3C6HatyqTHdjnUiC1vINWhRTEmdYEWLjbvwCChHPyb1gPw==
X-Received: by 2002:a05:690c:e1f:b0:70f:8830:809c with SMTP id 00721157ae682-715094f9e26mr58886817b3.12.1750945028504;
        Thu, 26 Jun 2025 06:37:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:53f4:d95a:6d49:8b09? ([2600:1700:45dd:7000:53f4:d95a:6d49:8b09])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a219b3sm28771417b3.44.2025.06.26.06.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 06:37:08 -0700 (PDT)
Message-ID: <ed4ee502-403b-423a-99c4-f41ad6d1fa06@gmail.com>
Date: Thu, 26 Jun 2025 09:37:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: June 26th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 13:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118121

The following changes since commit 491671faee11ea131feab5a3a451d1a01deb2ab1:

   proftpd: Fix CVE-2024-57392 (2025-05-21 09:17:27 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 727811eaf256b88fd135be99559f2cbf14c82fce:

   imagemagick: guard sed operations in do_install for optional files 
(2025-06-23 17:03:24 -0400)

----------------------------------------------------------------
Bastian Krause (2):
       libsocketcan: use https instead of git protocol
       canutils: use https instead of git protocol

Clayton Casciato (1):
       chrony: use inherit_defer for conditional inherit of useradd

Leonard Anderweit (1):
       lmsensors: Fix build without sensord

Sana Kazi (1):
       imagemagick: guard sed operations in do_install for optional files

Vijay Anusuri (1):
       redis: upgrade 7.2.7 -> 7.2.8

Yogita Urade (1):
       postgresql: upgrade 16.8 -> 16.9

  meta-networking/recipes-support/chrony/chrony_4.5.bb |  2 +-
  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  5 +++--
  .../files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch 
|  4 ++--
  .../recipes-dbs/postgresql/{postgresql_16.8.bb => postgresql_16.9.bb} 
|  2 +-
  .../0001-hiredis-use-default-CC-if-it-is-set.patch |  0
  .../0002-lua-update-Makefile-to-use-environment-build-setting.patch |  0
  .../0003-hack-to-force-use-of-libc-malloc.patch |  0
  .../0004-src-Do-not-reset-FINAL_LIBS.patch |  0
  .../0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  0
  .../0006-Define-correct-gregs-for-RISCV32.patch |  0
  .../redis/{redis-7.2.7 => redis-7.2.8}/init-redis-server              |  0
  .../recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/redis.conf    |  0
  .../recipes-extended/redis/{redis-7.2.7 => redis-7.2.8}/redis.service |  0
  meta-oe/recipes-extended/redis/{redis_7.2.7.bb => redis_7.2.8.bb}     
|  2 +-
  meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb |  2 +-
  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb |  2 +-
  meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb              
| 23 +++++++++++++++++------
  17 files changed, 27 insertions(+), 15 deletions(-)
  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.8.bb => 
postgresql_16.9.bb} (86%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/0002-lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.7 => 
redis-7.2.8}/redis.service (100%)
  rename meta-oe/recipes-extended/redis/{redis_7.2.7.bb => 
redis_7.2.8.bb} (96%)


