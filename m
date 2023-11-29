Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C108C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 12:32:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.31667.1701261146727136968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 04:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIMi2pRy;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cfa65de9ecso40079417b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701261146; x=1701865946; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btKqJMnAAGLmcJs6iyqJGSS1MMhmeh2A1XSmUizUr6I=;
        b=bIMi2pRytmieA8JXoXXwfgcfK5dC1GOXDNyb5ebLLk9KaCZZZdIgV15zwgUSsBh51P
         miJt7H7zEjBt9cta35zNLN8VUSadaSXOpn+Cj97UbxIQCakHxI9Fc3Y1QF3Zh7DxwZII
         E9GTm+EyJq3H3CyaXRXnB/YJi/J3+AlZqkUBf74nuQb0Xz8f21NMuMHnfNuDcCfR9o32
         6lJPdH+jGFFyLeGxzq1ZuB4Evexc8sylW5Ke4S5DrxSE4EeiZITFhUFlqvfcJoMoCWO8
         OG6NAzHqut7LvCW4luGCkwUy9DNG7BQN3+SUd9K5v8an7isdxNzf4jctnlTiTr/BmfHv
         jcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701261146; x=1701865946;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btKqJMnAAGLmcJs6iyqJGSS1MMhmeh2A1XSmUizUr6I=;
        b=ixgDKn/QmuADcGgO9o/US3kONVOlYqRg73ZqNAxMYryTGs3PJA4Ha8txx1FaSUKyXs
         OOVEP+NBT1PPMciihPxEJw/DopoAdlHiV13n5f6HiseSWko2A6M+fclB/0kJC9dT9ygd
         lPSbo+sJs86eYaG1RpprbzhXf0gc4e6jcobUvJm7f4Gn9B+jaifJczTl3NFHn1oV40Py
         rA/f7l/CL4miyVvvXOB+Kukt4vnxZryUqu1VaeZ9tT4Dac4Or59tB2DkQESLnMP3Vlnk
         dd2JKfkJXN0G82+5gwv/JEt9BSC3j/rir57vRZbfo7kSkFRV3TaR/GKbmMKsDG2Bq2w7
         3fSQ==
X-Gm-Message-State: AOJu0YzPaxF1sK9KljxdrpsgnjoXOptxxyAQjUuY+vjBAnex21SFu3Im
	rwpBs74MPRTUYw9b46Oonr0=
X-Google-Smtp-Source: AGHT+IGk9R3fKdQ0dI8LbypnA+RbmmbX/JF0vGpGKKu8n8lS2eqW0tKhJeOM2eMVWTvbjtxS07ZQhQ==
X-Received: by 2002:a81:dd0b:0:b0:5d1:6370:b2cf with SMTP id e11-20020a81dd0b000000b005d16370b2cfmr6695152ywn.29.1701261145579;
        Wed, 29 Nov 2023 04:32:25 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:5571:68aa:6b3e:6755? ([2600:1700:9190:ba10:5571:68aa:6b3e:6755])
        by smtp.gmail.com with ESMTPSA id r123-20020a0de881000000b005cc636ddb1esm4525696ywe.41.2023.11.29.04.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 04:32:25 -0800 (PST)
Message-ID: <522d304e-5148-4d3f-ad9b-caccc8a9fb31@gmail.com>
Date: Wed, 29 Nov 2023 07:32:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Nove 29th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 12:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107135

The following changes since commit 7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0:

   indent: fix CVE-2023-40305 (2023-11-03 10:52:59 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4:

   nginx: upgrade to 1.24.0 release (2023-11-18 10:03:19 -0500)

----------------------------------------------------------------
Archana Polampalli (1):
       open-vm-tools: fix CVE-2023-34058

Bartosz Golaszewski (1):
       python3-cson: fix run-time dependencies

Khem Raj (1):
       emlog: Add PV

Michael Haener (1):
       nginx: upgrade to 1.24.0 release

Mingli Yu (1):
       nlohmann-json: Add ptest support

Narpat Mali (2):
       open-vm-tools: fix CVE-2023-20900
       traceroute: upgrade 2.1.0 -> 2.1.3

Peter Kjellerstedt (1):
       libwebsockets: Support building for native

Richard Purdie (4):
       meta-perl: Drop broken BBCLASSEXTEND variants
       meta-networking: Drop broken BBCLASSEXTEND variants
       meta-oe: Drop broken BBCLASSEXTEND variants
       meta-python: Drop broken BBCLASSEXTEND variants

Yoann Congal (3):
       emlog: ignore CVE-2022-3968 & CVE-2023-43291
       python3-soupsieve: Break circular dependency with beautifulsoup4
       packagegroup-meta-oe-extended: RDEPENDS on an existing mozjs-91 
package

  .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 +-
  .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +-
  .../open-vm-tools/open-vm-tools/CVE-2023-20900.patch            | 36 +++++
  .../open-vm-tools/open-vm-tools/CVE-2023-34058.patch            | 241 
++++++++++++++++++++++++++++
  .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 2 +
  .../traceroute/{traceroute_2.1.0.bb => traceroute_2.1.3.bb} |   3 +-
  .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend    | 2 +-
  .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb   | 3 +
  meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb           | 2 -
  meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb               | 2 -
  meta-oe/recipes-core/emlog/emlog.inc                            | 2 +-
  meta-oe/recipes-core/emlog/emlog_git.bb                         | 2 +
  meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb           | 2 +-
  meta-oe/recipes-devtools/nlohmann-json/files/run-ptest          | 12 ++
  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb  | 20 ++-
  meta-oe/recipes-devtools/unifex/unifex_git.bb                   | 2 -
  meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb             | 2 +-
  meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb             | 2 -
  meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb             | 1 -
  .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
  meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 -
  meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb           | 2 -
  meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 -
  meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 -
  .../recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb       | 2 -
  meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb  | 2 -
  meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb    | 2 +-
  .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 -
  meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb     | 2 -
  meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb  | 4 -
  meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb     | 2 -
  meta-python/recipes-extended/python-cson/python3-cson_git.bb    | 3 +-
  .../recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb   | 2 -
  meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb              | 6 +
  34 files changed, 329 insertions(+), 48 deletions(-)
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34058.patch
  rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb 
=> traceroute_2.1.3.bb} (91%)
  create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb


