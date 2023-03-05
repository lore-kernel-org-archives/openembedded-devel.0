Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2667AC678DB
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 12:32:27 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.7792.1678019538272893384
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 04:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lDeXpdAn;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id r5so7806607qtp.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 04:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678019537;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xABfYpq36gj19onmXfA7g5VmcLJ3WqlzCYtwqhEHhmQ=;
        b=lDeXpdAnyhsWM9faS1wmMSojfI4EfXks6gKkjdwGHMn4aX408jbf6VD4S8oLV/PcSZ
         pfH27n4XKQaVXkhmqsLmMLFwLd0XngeIbI4Iu+9siVuLz4kgV/xctzYQiqEi590/LUg4
         BiJ8Xj79lWyfhGb626GHmWtEkizHQDZn3wGobqtu7Z9VWWcOINOO0UMy6REyB7GVVFXC
         3eITyDaE4UAC50FnxBXKPiuPmSNyxICNtCkcfS4l9wbdPNyxXiDBp3W+FPxmFhhPIaWs
         XtC3wutShTwez6WMxw66H5IGQi4okV9RPJUPew4/9dlRoJPVIVNuWF3X57TQw4LbOAss
         S73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678019537;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xABfYpq36gj19onmXfA7g5VmcLJ3WqlzCYtwqhEHhmQ=;
        b=oN7yUoMiaq+PDfrBlWrNGTcWbsiqn1YVmkvbCpllnoJA7zrFsJVzhgSs3dqLw/DYUP
         y6pj9CMPHkQ+miElutHNUfOVRz9JPjZeRbTCz71bboFyvdguNIYy8mOYuWznJd6e7u5Q
         BmxAoCGhiaH0ZDu52AprkqnTDGcMsjVNgGfbnqd9ilzXh36NtXe9ammmjnT7SZFVcece
         KweZgiQ2a5A+Z3xTAuOj6xvBodNEkxjQVWvuXmjM8h+lL43fJKPg4+xgUO/g8YzMhWQk
         R4JfMmf1pGOW7NvkDq0O+NiRAsLZGaINUNt88hZrFpHiRVso8oopBDurV1JPjnuTvE1H
         10eQ==
X-Gm-Message-State: AO0yUKXJCK94MdqIeShxV5XYH20HqFw7JazRctCxap/CIgzR8LmcJyBG
	wNi8uplJPWQsDqqod/x8ljo=
X-Google-Smtp-Source: AK7set/8UKUWwy0KJvmCvz9gpwxhpEiIrh/gr5ShUW+GaSNbodeRNdVmSLmRMhD1HqDL7cSM9ooGRQ==
X-Received: by 2002:a05:622a:1042:b0:3bf:d1c6:d375 with SMTP id f2-20020a05622a104200b003bfd1c6d375mr14179741qte.36.1678019537341;
        Sun, 05 Mar 2023 04:32:17 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:1884:8f23:cb82:a85f? ([2600:1700:9190:ba10:1884:8f23:cb82:a85f])
        by smtp.gmail.com with ESMTPSA id e20-20020a05622a111400b003bfa66b7484sm5707320qty.35.2023.03.05.04.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 04:32:16 -0800 (PST)
Message-ID: <4fa9e7b0-618f-ce8f-dae2-ab075d0d7217@gmail.com>
Date: Sun, 5 Mar 2023 07:32:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request March 5th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 12:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101384

The following changes since commit 30f4c2b3ae182513b967185e06bc8409a0ee6092:

   mdns: use git fetcher (2023-02-15 08:02:50 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to b5b732876da1885ecbab2aa45f80d7a3086c5262:

   mpd: Upgrade to 0.23.12 release (2023-03-04 07:24:09 -0500)

----------------------------------------------------------------
Geoff Parker (1):
       python3-pillow: add tk to RDEPENDS ptest pkg only if x11 in 
DISTRO_FEATURES

Khem Raj (2):
       ncmpc: Upgrade to 0.47
       mpd: Upgrade to 0.23.12 release

Yogita Urade (1):
       multipath-tools: fix CVE-2022-41974

  .../musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb} |   2 +-
  ...1-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch | 37 
+++++++
  .../recipes-multimedia/musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb} |   3 +-
  .../recipes-support/multipath-tools/files/CVE-2022-41974.patch  | 164 
++++++++++++++++++++++++++++
  .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 1 +
  meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb     | 2 +-
  6 files changed, 206 insertions(+), 3 deletions(-)
  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.9.bb => 
mpd_0.23.12.bb} (98%)
  create mode 100644 
meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
  rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb => 
ncmpc_0.47.bb} (92%)
  create mode 100644 
meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch

