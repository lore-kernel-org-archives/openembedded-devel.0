Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6C9C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 19:01:30 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.14036.1682190081952415304
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Apr 2023 12:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cTywrJFH;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-54f8af6dfa9so42313647b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Apr 2023 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682190081; x=1684782081;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWblrUSdUsY0VlWCWb9UEyGOoQVj58O0Ldtgmk/Nxmc=;
        b=cTywrJFHj7WKGmZfAFZXeT4XneqJiX48vxYouO7in1rblnNFSVY/1s2dEzRem22F0e
         y+4ViX1kjiKECOwsSpthwnUXG6kOaLt/o2RnkOVX7SgXTNxnd9CoY7l9kA6zY9xQQgb4
         9015UDGvDGMekVkeu1zmJM0s6Tdu24WcSWT0kRGkPCZHOkkm9+d+EpiR0orjzRNunTQl
         DBZ23oNXQYiZoCP7J++mxum4hWWglTCQVdXOETl80l1uC7Ry8CU1rlbm9Li3P6cSNkao
         d5JNUcJH455gx0S6+cRtIzk6Km+wRXx917H5DU0yUa09/Mpsx8bIEfcHVr1uA1RGAqky
         evIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682190081; x=1684782081;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UWblrUSdUsY0VlWCWb9UEyGOoQVj58O0Ldtgmk/Nxmc=;
        b=IXNjQn+FVyH3+Xxh1HlI2QeMMKMJ/CVXHhF62A1QtnsuNLsoGimVp32KIKZ6e4bzBm
         g4uXxYHofXP45Zj34otw9k3VESR9NFzYKKv6TD+QAJlOrbYtUCvQmuL7qd6j7QAUbwd1
         0Us+beoZ9EQ4X3pS4MWKgEfwOsExYFFF5kJSKioUq9h350y2dlAt2oNKvq7b0mnMhtF7
         xZLe5Nm1/WxF13VKbsCa5mX7wto7WCu90aPiOMBBVHQmNfqbxdQW4Z37BIy2qxM1Et0D
         FOR8ORtQo3Y8cljXDzal2koxtTxFq66FiykqNDuSH8kcM9rmvsvOfJunI+9YwKI5vU5c
         +Teg==
X-Gm-Message-State: AAQBX9dd+acL3aAoSweMMYRwsmtTL7VWdm8NqS/PRIZ14xQ6Mh2VqtQf
	Y3PqCwNTBTif2TO6yYpcRQE=
X-Google-Smtp-Source: AKy350Yy8Rh6Kr+gYiE3EYfN3TdkoG7jNQ21EThQenhuF9vp7UatddkqVdUJt0rQPpJSQcgPTqSU6A==
X-Received: by 2002:a0d:df4a:0:b0:54f:b4fa:3271 with SMTP id i71-20020a0ddf4a000000b0054fb4fa3271mr4630328ywe.21.1682190080978;
        Sat, 22 Apr 2023 12:01:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:e657:faa7:932f:a273? ([2600:1700:9190:ba10:e657:faa7:932f:a273])
        by smtp.gmail.com with ESMTPSA id h1-20020a81b401000000b0054f80928ea4sm1764547ywi.140.2023.04.22.12.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 12:01:20 -0700 (PDT)
Message-ID: <36fcb067-96d6-d2a6-c5b8-a695715febdd@gmail.com>
Date: Sat, 22 Apr 2023 15:01:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: April 22
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Apr 2023 19:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102146

The following changes since commit b4ff73905b887cf7c489248de80dab2721090cbf:

   dnsmasq: fix CVE-2023-28450 (2023-03-25 09:07:27 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to 3d1ec70ed319c1b7f561fcda7b8cd0c2e0b2c262:

   dleyna-{server,renderer}: fix dev-so QA issue with multilib 
(2023-04-18 06:45:59 -0400)

----------------------------------------------------------------
Martin Jansa (7):
       zsh: fix installed-vs-shipped with multilib
       restinio: fix S variable in multilib builds
       mongodb: fix chown user for multilib builds
       pahole: respect libdir
       lvgl,lv-lib-png,lv-drivers: fix installed-vs-shipped QA issue 
with multilib
       lirc: fix do_install with multilib
       dleyna-{server,renderer}: fix dev-so QA issue with multilib

Wang Mingyu (1):
       openwsman: Change download branch from master to main.

  meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb | 2 +-
  meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb | 2 +-
  meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb | 4 ++--
  meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb | 6 +++---
  meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb 
| 2 +-
  meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 2 +-
  meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb | 2 +-
  meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb | 8 ++++----
  meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb | 8 +++++---
  meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb | 6 +++---
  meta-oe/recipes-shells/zsh/zsh_5.8.bb | 4 ++--
  11 files changed, 24 insertions(+), 22 deletions(-)


