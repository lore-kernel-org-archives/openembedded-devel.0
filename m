Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FE0C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 17:38:05 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.8306.1667669884711766364
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Nov 2022 10:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ueyw2IdY;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id c8so5477162qvn.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Nov 2022 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5yW0ADfn6HsscvTdDLQ5gX7/wnSIvOdJtKJcxirlQw=;
        b=Ueyw2IdYMmIm4I/jvZDGTJILexPH/IExiXR72eDhKbJ5r3bTnuomNe429oKRXA3Mxh
         qKJ96PIIRIAD3Ko8tsQ19tbKCQxVUSzLnl+wBS9vgx89jorTiVM4JNTtqjPGPSuF+705
         Q5/yafGMzoQ3htEfghkru4Uc7aI9Gx5zsMrFZZ74AbpvLl0OVVLdP1kaOsrVtsd3hR+E
         ECcbmpx1geQ4pyRIwZaUkE5ur+AaFMA1WVtDwCPY5vUK3fFJnA/AGtntkVw2BucquNOL
         6iOQiEkGkY6gvuBUsRhd6VnLSbTW8aytNmrODKm9rrQER/opkmc16YVwmEe4iwwqcWwl
         CN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5yW0ADfn6HsscvTdDLQ5gX7/wnSIvOdJtKJcxirlQw=;
        b=Z5R0LJnx4/NsdJA3SEzimfZAz9s77EbxnzBXW5FL7k64qFZ8lhSbyXHdY/u05AyCA3
         r9wm4zR5pO863ir+/GmTcPiGDOY5juwJ3KD+bSumUgJkx56AXQYVunfgZ4YthCF5lElW
         tdM3nNv5X5UaaRpXs7clLnQZSyvdsN0bG8dcdk6DR+UtDzO+yqW7tc9M9SbwJfS5cf47
         t+681FIBa+PCWiGAdSxdPeKxsJszrZs4/wB4OYao5+yWxMmikzOot5DTFD4W+uBRs9uh
         1VxEbPkbiGGy50msPABWx9U11e/RJlIPZrAD7wWxNONvezN4NTGHC8m07D5oTvxrEWkv
         ai0Q==
X-Gm-Message-State: ACrzQf1pnT8B4r46Z08R5oWap7cOiDrVN5H8CxIHMhm0+pLOCjRD55NL
	uC0qNNxhMTSeIOcVT8jB5cg=
X-Google-Smtp-Source: AMsMyM7MxBpkNiOxJ34eCY/vVxFuWfE9oQeDs28f0GelKzREG1+LjEyLITM8YS+3WVp0U+8v+h/IqQ==
X-Received: by 2002:a0c:a987:0:b0:4c0:3b8b:8f6e with SMTP id a7-20020a0ca987000000b004c03b8b8f6emr11473273qvb.114.1667669883790;
        Sat, 05 Nov 2022 10:38:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b2f4:9028:9984:940f? ([2600:1700:9190:ba10:b2f4:9028:9984:940f])
        by smtp.gmail.com with ESMTPSA id bm35-20020a05620a19a300b006eed75805a2sm2230718qkb.126.2022.11.05.10.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 10:38:03 -0700 (PDT)
Message-ID: <3e7cf342-f958-dfad-cc82-a29528f0dab3@gmail.com>
Date: Sat, 5 Nov 2022 13:38:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Nov 2022 17:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99432

The following changes since commit 744a4b6eda88b9a9ca1cf0df6e18be384d9054e3:

   frr: Security fix CVE-2022-37032 (2022-10-13 10:59:41 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79:

   re2: fix branch name from master to main (2022-11-02 06:50:29 -0400)

----------------------------------------------------------------
Alexander Thoma (1):
       Fix tigervnc crash due to missing xkbcomp rdepends

Carsten Bäcker (1):
       spdlog: Fix CMake flag

Chase Qi (1):
       kernel-selftest: install kselftest runner

Howard Cochran (1):
       ufw: Fix "could not find required binary 'iptables'"

Martin Jansa (1):
       re2: fix branch name from master to main

Philippe Coval (1):
       pim435: Relocate sources to eclipse

  meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb    | 4 ++--
  meta-oe/recipes-core/pim435/pim435_git.bb                 | 4 ++--
  meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb      | 2 +-
  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 8 +++++++-
  meta-oe/recipes-support/re2/re2_2020.11.01.bb             | 2 +-
  meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb            | 4 ++--
  6 files changed, 15 insertions(+), 9 deletions(-)


