Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57099C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 12:45:04 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.52210.1675687500855731278
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 04:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o0hbqAon;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so3151894oty.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQzXdE30UXnLCa/bfhQaUUln2QOvaWixEjPaJaxo6qU=;
        b=o0hbqAonQYK935v1rG96MmvNeF8j8xCopeUW0o/1EaX5f/SncMAn8YAVlXg/KcwdgV
         Ley/tk1lj3UO8Jk/3Vx/QLxwtvh9T+xXRDCX/lCRx7IXItda2m1wjy3G/lZIRZZ/APy9
         BK1Op3MVfXFDswfqRegRi9QHC/ABJKXDZZFmjQqEde/3hvsyamfhBe/BHZQImXngs4IV
         JlxbHFlweTgeaBRL6weNY98rpvu/SK2IGqeFhsKuVfBXOsMut4k1qrh7EGRRZ1bQPrUC
         S9ERcgisH0wsn/qnF5KEgzbOETqJFtMVr9APYV/rMIwvLf3M1WbbCCYHWcUKzdPrDjK5
         779Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQzXdE30UXnLCa/bfhQaUUln2QOvaWixEjPaJaxo6qU=;
        b=QYR3/1rxa0E9H3CrfKwHp2O2/AFgQ2FL9M6jOwUh9UonP3Y2s4rjsBfDKn5XfMSkGB
         8HuZn9bK+jsftVADjEXHddwA2lRcyDfhgYQH5H0wznGimObwcLurwqQGWkky+sX2cs36
         UzMfKkR+gtRPoLNxjk88ar1HtggCEBmNB6l92xLXu4/4chw+HeNYXHnjsTCB7rEeB3QN
         FwuUwZ1/MQ7UYs1B0Yk7WR2SktsvkI4RS1gsNWYLfmqPC108o8UK3Ce/4RBLJBYEIcW7
         r5/UAZDDVRwrBT1kUm8vFb3dJl0qHTM6FuB5mlIWVuqt7bb2xDJ7/Rk9ZKJ/p2Jo97cc
         WuFA==
X-Gm-Message-State: AO0yUKWWQb7kSgpq+5dLPDJn+5fm3fcoPKJ6BW/Net1Ptvyv6BHuUUGe
	K8NrX5ufulQwxqkR+7G0JDUTdIvMbkU=
X-Google-Smtp-Source: AK7set/W1n4RvUlL4GnmlmVFDPGqkdqrw7EV5PieQiv47Dh8AJeZLWOxc5fOVOaJHZb0nOVLR4Jqrg==
X-Received: by 2002:a05:6830:39f3:b0:68b:cc93:28b with SMTP id bt51-20020a05683039f300b0068bcc93028bmr5457036otb.29.1675687500131;
        Mon, 06 Feb 2023 04:45:00 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:5da2:e19c:7aa7:41ee? ([2600:1700:9190:ba10:5da2:e19c:7aa7:41ee])
        by smtp.gmail.com with ESMTPSA id c5-20020a9d4805000000b0068bdca29f97sm4769224otf.52.2023.02.06.04.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:44:59 -0800 (PST)
Message-ID: <9d37f092-3ff0-f29e-d60e-83f03cd09f8a@gmail.com>
Date: Mon, 6 Feb 2023 07:44:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Feb 6th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 12:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100942

The following changes since commit 1f31570d0795da90083d1dbf28127c90908e30ee:

   multipath-tools: fix QA "dev-so" regression (2023-01-10 09:26:26 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 278ec081a64e6a7679d6def550101158126cd935:

   nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:38 -0500)

----------------------------------------------------------------
Andrej Valek (1):
       grpc: upgrade 1.45.2 -> 1.46.6

Changqing Li (4):
       zabbix: fix CVE-2022-43515,CVE-2022-46768
       redis: 6.2.7 -> 6.2.8
       redis: upgrade 7.0.4 to 7.0.5
       redis: 7.0.5 -> 7.0.7

Chee Yang Lee (1):
       zsh: Fix CVE-2021-45444

Hermes Zhang (1):
       kernel_add_regdb: Change the task order

Hitendra Prajapati (2):
       net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
       krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing

Niko Mauno (2):
       nftables: Fix missing leading whitespace with ':append'
       Fix missing leading whitespace with ':append'

Tim Orling (1):
       nodejs: upgrade 16.18.1 -> 16.19.0

Yi Zhao (1):
       postfix: upgrade 3.6.5 -> 3.6.7

  meta-networking/classes/kernel_wireless_regdb.bbclass           | 2 +-
  .../postfix/{postfix_3.6.5.bb => postfix_3.6.7.bb} |   2 +-
  meta-networking/recipes-filter/nftables/nftables_1.0.2.bb       | 2 +-
  .../net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch       | 116 
+++++++++++++++++++++++
  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 +
  meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch     | 110 
++++++++++++++++++++++
  meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 1 +
  meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-43515.patch | 37 
++++++++
  meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-46768.patch | 53 
+++++++++++
  meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb            | 2 +
  meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb                 | 2 +-
  meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb     | 2 +-
  .../recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb} |   4 +-
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_16.18.bb => nodejs-oe-cache-native_16.19.bb} |   0
  .../nodejs/{nodejs_16.18.1.bb => nodejs_16.19.0.bb} |   6 +-
  .../redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch   | 20 ++--
  .../redis/redis/0006-Define-correct-gregs-for-RISCV32.patch     | 15 +--
  .../recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.8.bb} |   2 +-
  .../recipes-extended/redis/{redis_7.0.4.bb => redis_7.0.7.bb} |   2 +-
  meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch           | 60 
++++++++++++
  meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch           | 140 
++++++++++++++++++++++++++++
  meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch           | 77 
+++++++++++++++
  meta-oe/recipes-shells/zsh/zsh_5.8.bb                           | 6 +-
  24 files changed, 634 insertions(+), 28 deletions(-)
  rename meta-networking/recipes-daemons/postfix/{postfix_3.6.5.bb => 
postfix_3.6.7.bb} (89%)
  create mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-43515.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-46768.patch
  rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => 
grpc_1.46.6.bb} (97%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.18 => 
nodejs-oe-cache-16.19}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.18.bb => 
nodejs-oe-cache-native_16.19.bb} (100%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.18.1.bb => 
nodejs_16.19.0.bb} (97%)
  rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => 
redis_6.2.8.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.4.bb => 
redis_7.0.7.bb} (96%)
  create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
  create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
  create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch


