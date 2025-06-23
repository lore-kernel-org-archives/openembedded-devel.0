Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B506C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 13:16:00 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.19374.1750684552832270149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 06:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MgvUDJRt;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-710e344bbf9so39772587b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750684552; x=1751289352; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0srtAP46p56goMAcX52tUFZPvO39zfMwQGIJrUgGIKI=;
        b=MgvUDJRtNVEzIdPJr6T/pzmxS8yf4ttvDoZtqO2GvEAPAvYy5rCrw3Gpm58HA9RKWL
         qk9WnclYZR2n/ok53QZiH0Xqy+i1EawjEU5YJfaZXAuLnT8EmNpX2K7HMF/ZJDtduPn5
         7g8etrB97jr6oEyllkOCUGfO365vOkblg5VE+2We/jl+jErVP9GnsRlOH0KyhdH8+npe
         8ZE121DVyaBLBNeLfftiDZunsom0l29KZgZmaCmXkc3em4IOFL9tjLJiX0V/xh5aMPdy
         58lroiJT7dUiBlJz5M/o2c/Ah5vYYFrtOeAsQLjYi4uiDxe6s25jyfjdVQkiSXh4GVYE
         Ey5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750684552; x=1751289352;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0srtAP46p56goMAcX52tUFZPvO39zfMwQGIJrUgGIKI=;
        b=a4Fl24cMVlU/fpc22wll7in9Z3iLKSL0Ijx3IZt9eOZwH3pCMZEk0rImVLleayK8y9
         L2BM+MyH41DHTCCXe2ht5GnsUKBgr5do/KtX7JlkusdAPKCNujbRhkzzr89jqnZqTHWk
         WLieWRXxZ8LacyCdE/OgaoLERwOnwGjxQDC685BpD1uMZDbRxmDAWYCmIysWQnfS1DVc
         1Ez16lfX3QoMDYXWaGfMsislYKNhiEyinglPq4pWulRBYbSnpKVHXsasbW60D72VA6VW
         OoHkbZn+N4/fuWpB7RVEDY2tMvB9eQI6fqbtHOSX5RfIdkXYF7TRo9w7m+paW0/AQiMA
         +SKA==
X-Forwarded-Encrypted: i=1; AJvYcCWPm2OCv1t2c+JVS6HsFvn2vLG/fRTR7vUk8cbSEy4B3RJhU/FqcHWL/8rx07U8NmFnA7EbGxLpt18M0N9PPgkfMVM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBz/0XiRUAi14aDvqV9LVvkhbI897gR/5rgE4Nx+2hHWuAEGb5
	NJqIo1SxcRo4SII7qi0WP5blGcuNspKLdRMERdn89C6NwKIgOO4ZqRhUsjzCBWCl
X-Gm-Gg: ASbGncuDatg22Ott0rKDStc/rBu8faO6pL3lAff7g8uH6FECUzmh3GucRYQIU8Gmwcj
	ydZ3ujdn9BYJfO4ucw30tkyHb4KzpuCAhfuAk8I6diJ4FXF42+n1kplexmNkVendRae94tAOwvz
	R4gVpJV8LE5vibBFjByFzKlVkhKmrVZBORMPVTnI4RxotJfWedAaguqMbMv0RiDk9WwFs81l/ut
	cFz/PlFIPlyaEA7dtpX6YuGNC7NvJ1MxsNiRtAVkf4+l4gj8YxkCbfdwUYjXQnAy0dB0vKna5LB
	vh9Bk9Fw/Un6pfFy9VQqQFE7sL9dW7rOhBLoOMz4uooBG2nSro5X2okM9SBWV0yCyptaAsM3ad3
	bifp2fldIiyD9wNecNCVDxtFnkp2y2vj4Rw2FBQ==
X-Google-Smtp-Source: AGHT+IF6YhXjKiohoprw0oTDC8YlOqrfL1QwApZHvrcIMxfafG+XN7T7WSEmhsxdXvlxTTJufzI/ww==
X-Received: by 2002:a05:690c:7005:b0:70e:7663:8bb4 with SMTP id 00721157ae682-712c654c2cemr179116697b3.25.1750684551678;
        Mon, 23 Jun 2025 06:15:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:e6c8:e7b0:d1b0:fa65? ([2600:1700:45dd:7000:e6c8:e7b0:d1b0:fa65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c49d6484sm15464697b3.9.2025.06.23.06.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:15:51 -0700 (PDT)
Message-ID: <375af1c3-1708-43d5-ac50-4a85205afdc2@gmail.com>
Date: Mon, 23 Jun 2025 09:15:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: walnascar merge request: June 23rd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 13:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118079

The following changes since commit 2169c9afcc0945045bea49f58011080942d4ddb4:

   pipewire: Avoid having pipewire-native depend on pipewire (2025-05-17 
11:56:50 -0600)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded walnascar-next

for you to fetch changes up to 3c6844219a69d9ca8cb0f1579114efe9a9e2a646:

   postgresql: upgrade 17.4 -> 17.5 (2025-06-20 10:46:50 -0400)

----------------------------------------------------------------
Chen Qi (1):
       check-version-mismatch.bbclass: make it work for walnascar

Chris Paterson (3):
       smarty: Drop allarch
       spectre-meltdown-checker: Set recipe as machine specific
       kernel-hardening-checker: Set recipe as machine specific

Clayton Casciato (1):
       chrony: use inherit_defer for conditional inherit of useradd

J. S. (1):
       xfce4 update HOMEPAGEs

Jason Schonberg (2):
       c-ares: upgrade 1.34.3 -> 1.34.4
       c-ares: update 1.34.4 -> 1.34.5

Martin Jansa (1):
       python3-posix-ipc: improve build_support

Vijay Anusuri (3):
       redis: upgrade 7.2.7 -> 7.2.8
       redis: upgrade 6.2.16 -> 6.2.18
       jq: upgrade 1.7.1 -> 1.8.0

Wang Mingyu (2):
       valkey: upgrade 8.1.0 -> 8.1.1
       postgresql: upgrade 17.4 -> 17.5

  meta-networking/recipes-support/chrony/chrony_4.6.1.bb          | 2 +-
  meta-oe/classes/check-version-mismatch.bbclass                  | 33 
++++++++++++++-
  .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 9 ++---
  .../files/0004-config_info.c-not-expose-build-info.patch        | 13 
+++---
  meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 9 ++---
  .../postgresql/{postgresql_17.4.bb => postgresql_17.5.bb} |  2 +-
  meta-oe/recipes-devtools/jq/{jq_1.7.1.bb => jq_1.8.0.bb} |  7 +---
  .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
  ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
  .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
  .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
  ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
  .../redis/{redis-7.2.7 => redis-7.2.8}/init-redis-server |  0
  .../redis/{redis-7.2.7 => redis-7.2.8}/redis.conf |  0
  .../redis/{redis-7.2.7 => redis-7.2.8}/redis.service |  0
  .../recipes-extended/redis/{redis_6.2.16.bb => redis_6.2.18.bb} |  2 +-
  .../recipes-extended/redis/{redis_7.2.7.bb => redis_7.2.8.bb} |  2 +-
  .../valkey/{valkey_8.1.0.bb => valkey_8.1.1.bb} |  2 +-
  .../kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb | 2 +
  .../spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb   | 2 +-
  .../c-ares/{c-ares_1.34.3.bb => c-ares_1.34.5.bb} |  2 +-
  meta-oe/recipes-support/smarty/smarty_5.4.3.bb                  | 4 +-
  ...1-build_support-use-source-filename-instead-of-foo-for.patch | 50 
+++++++++++++++++++++++
  ...2-build_support-handle-empty-max_priority-value-as-Non.patch | 49 
+++++++++++++++++++++++
  ...3-build_support-use-does_build_succeed-in-compile_and_.patch | 62 
+++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb  | 5 +++
  .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb                  | 2 +-
  .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb | 2 +-
  .../calculator/xfce4-calculator-plugin_0.7.2.bb                 | 2 +-
  .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb | 2 +-
  .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb | 2 +-
  .../cpugraph/xfce4-cpugraph-plugin_1.2.8.bb                     | 2 +-
  .../datetime/xfce4-datetime-plugin_0.8.3.bb                     | 2 +-
  .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
  meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb | 2 +-
  .../recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb | 2 +-
  .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb   | 2 +-
  .../mailwatch/xfce4-mailwatch-plugin_1.3.1.bb                   | 2 +-
  .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb     | 2 +-
  .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb | 2 +-
  .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb    | 2 +-
  .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb   | 2 +-
  .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.5.bb | 2 +-
  .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
  .../systemload/xfce4-systemload-plugin_1.3.2.bb                 | 2 +-
  .../time-out/xfce4-time-out-plugin_1.1.3.bb                     | 2 +-
  .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb     | 2 +-
  .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb     | 2 +-
  .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb | 2 +-
  .../weather/xfce4-weather-plugin_0.11.1.bb                      | 2 +-
  meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
  .../archive/thunar-archive-plugin_0.5.2.bb                      | 2 +-
  .../xfce4-power-manager/xfce4-power-manager_4.20.0.bb           | 2 +-
  54 files changed, 248 insertions(+), 63 deletions(-)
  rename meta-oe/recipes-dbs/postgresql/{postgresql_17.4.bb => 
postgresql_17.5.bb} (87%)
  rename meta-oe/recipes-devtools/jq/{jq_1.7.1.bb => jq_1.8.0.bb} (87%)
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
  rename meta-oe/recipes-extended/redis/{redis_6.2.16.bb => 
redis_6.2.18.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.2.7.bb => 
redis_7.2.8.bb} (96%)
  rename meta-oe/recipes-extended/valkey/{valkey_8.1.0.bb => 
valkey_8.1.1.bb} (98%)
  rename meta-oe/recipes-support/c-ares/{c-ares_1.34.3.bb => 
c-ares_1.34.5.bb} (91%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch


