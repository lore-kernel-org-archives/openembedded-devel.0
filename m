Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9969BC10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 14:31:43 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.51510.1671546700231956188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 06:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z2iOsv+H;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-142b72a728fso15546375fac.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 06:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55OZU8xGV5ELpJ+iDMcTtkOicR0t/kByJJvzbTeuty0=;
        b=Z2iOsv+HEx21pLgAj9XitoHXtDfp1b46EOWda/gi5AXQk41bJGizwqITkX3COMdv8x
         JimUr5p7iGmsCrH8ljsm/FH7YLUdUPIlsCXbMFVpoPQWrMQ+HeQtZa45KbeIMyMQBEuP
         ZiY6rOgyKQH+AfWcFEgB/L4GXDuexFdh6Sg/v90eX5hJkioHMj29luSScK9MF1B65/ta
         +jjmnckqV3SVVlbn/gKZM530wBFsJlo/J87jJDBalsZYV3OqvX6nek7lsF94wc/THNR0
         dp7JvHE7xdAwcdGPlhmXV0yUxnTBhFqDnBbkX4bKkLZPTDJ+uMuCt5K9OS0cC9M8wauJ
         yqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55OZU8xGV5ELpJ+iDMcTtkOicR0t/kByJJvzbTeuty0=;
        b=yH6lYjH1pp5CT5214KE8Ggqsl2HqFz5NpwCUelWUlI8+1P0rkBgqkfEWXq2va7S5g6
         +226ffwH7st4QIYNvZYrgK0uMtsudsgsiO0ih3CCxYi5c725+jETdNv7dNp5+lYKJyFi
         FWR2/n6Ind3ECeZcfypbSgvbmd5Y8mTBx0+xZeMb1QCaGOhrf7btf9wottX2V25XGYck
         MZhuQEJ1xxZc7ETmQyW7b8OqglknbhzoCIVbanY5LnyOa2AmBQxsBV6tVeyIC3L7Kxwh
         Y7sMtgpmEzcBJg7hemzKSOR/qDNpc+go1HZTjjHY4CTrrgiiU0Ef9YHdv03olXK2xysS
         FU6w==
X-Gm-Message-State: AFqh2kptSRLwvj/xj/ICxo65UL5rQmZgIDzFmJlqrrLlXBobBZWdnDWU
	x0pufyUAwX+97ekJES/JY9Y=
X-Google-Smtp-Source: AMrXdXs8+4hZVe/CTymR1fcIQuxPuZDI7LxdTstWb4QEeUO57iqeRxIyvlOmhWRU4k9nMzQQb5hrAA==
X-Received: by 2002:a05:6870:9e0b:b0:14b:d531:2422 with SMTP id ps11-20020a0568709e0b00b0014bd5312422mr7716882oab.46.1671546699447;
        Tue, 20 Dec 2022 06:31:39 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b? ([2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b])
        by smtp.gmail.com with ESMTPSA id i8-20020a37c208000000b006fa2b1c3c1esm8743472qkm.58.2022.12.20.06.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 06:31:38 -0800 (PST)
Message-ID: <ef4e5634-436f-0501-3add-92bf1fcb0ec6@gmail.com>
Date: Tue, 20 Dec 2022 09:31:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Dec 20th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 14:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100154

The following changes since commit 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79:

   re2: fix branch name from master to main (2022-11-02 06:50:29 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:

   dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)

----------------------------------------------------------------
Alexander Stein (1):
       dool: Add patch to fix rebuild

Archana Polampalli (1):
       Nodejs - Upgrade to 16.18.1

He Zhe (2):
       protobuf: upgrade 3.19.4 -> 3.19.6
       python3-protobuf: upgrade 3.20.0 -> 3.20.3

Hitendra Prajapati (3):
       dhcp: Fix CVE-2022-2928 & CVE-2022-2929
       strongswan: CVE-2022-40617 A possible DoS in Using Untrusted URIs 
for Revocation Checking
       nginx: CVE-2022-41741, CVE-2022-41742 Memory corruption in the 
ngx_http_mp4_module

Narpat Mali (1):
       python3-oauthlib: upgrade 3.2.0 -> 3.2.2

Peter Kjellerstedt (2):
       chrony: Remove the readline PACKAGECONFIG
       chrony: Remove the libcap and nss PACKAGECONFIGs

Zheng Qiu (1):
       redis: build with USE_SYSTEMD=yes when systemd is enabled

  meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb   | 2 +
  .../recipes-connectivity/dhcp/files/CVE-2022-2928.patch         | 120 
+++++++++++
  .../recipes-connectivity/dhcp/files/CVE-2022-2929.patch         | 40 ++++
  meta-networking/recipes-support/chrony/chrony_4.2.bb            | 19 +-
  .../recipes-support/strongswan/files/CVE-2022-40617.patch       | 157 
++++++++++++++
  meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb  | 1 +
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_16.14.bb => nodejs-oe-cache-native_16.18.bb} |   0
  ...g-native-binaries.patch => 0001-Using-native-binaries.patch} |  40 ++--
  .../nodejs/0002-Install-both-binaries-and-use-libdir.patch      | 96 
---------
  .../nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch | 151 
-------------
  .../nodejs/{nodejs_16.14.2.bb => nodejs_16.18.1.bb} |   8 +-
  .../protobuf/{protobuf_3.19.4.bb => protobuf_3.19.6.bb} |   2 +-
  meta-oe/recipes-extended/redis/redis-7/redis.service            | 1 +
  meta-oe/recipes-extended/redis/redis_7.0.4.bb                   | 8 +-
  meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch | 261 
+++++++++++++++++++++++
  meta-oe/recipes-support/dool/dool_1.0.0.bb                      | 1 +
  .../{python3-oauthlib_3.2.0.bb => python3-oauthlib_3.2.2.bb} |   2 +-
  .../{python3-protobuf_3.20.0.bb => python3-protobuf_3.20.3.bb} |   2 +-
  .../nginx/files/CVE-2022-41741-CVE-2022-41742.patch             | 319 
++++++++++++++++++++++++++++
  meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb              | 4 +-
  21 files changed, 948 insertions(+), 286 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
  create mode 100644 
meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
  create mode 100644 
meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 => 
nodejs-oe-cache-16.18}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb => 
nodejs-oe-cache-native_16.18.bb} (100%)
  rename 
meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch 
=> 0001-Using-native-binaries.patch} (70%)
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb => 
nodejs_16.18.1.bb} (94%)
  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.4.bb => 
protobuf_3.19.6.bb} (98%)
  create mode 100644 
meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
  rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.0.bb 
=> python3-oauthlib_3.2.2.bb} (92%)
  rename meta-python/recipes-devtools/python/{python3-protobuf_3.20.0.bb 
=> python3-protobuf_3.20.3.bb} (92%)
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch


