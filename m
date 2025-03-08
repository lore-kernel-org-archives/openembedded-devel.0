Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C01C282DE
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 00:20:18 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.391.1741393215747657808
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 16:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxU/7DEH;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6feb0742878so23521517b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741393215; x=1741998015; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcrtiDJrC9KzoYhEwPzz24Uk6uC+QWSxxHwuKGw5gEE=;
        b=LxU/7DEHZ6iPuhIRgHNjTBhBUD5XuyEbF3XwYwBIZzeUFtoVfAp5QBaj+9psd/DQl0
         1FKag1Xl7TRoVOef/6DVlsOTEb72Ve+VX11ZUMWxeXOb4EWN11IwJdbp7uW+Oj6sMBtA
         pD62XADdNOgc5TmuaoVcUkL4XbSyPCepOqdYZRW7ehjm28DJ/cMaojB5Aie1VOah8pd7
         GQcQQeWKLJ+9yPo95mv93UgRgVGFnzEEveS9rxUf8LUHOYIGlr1919wljxCAslCeM+yt
         uSOHCKtjj8CTLQbnLoybUPwKR0wGmFOLVZ6ACPf5aFvhXFJ9tkCUQEJEdxnrIbDRd/En
         BdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741393215; x=1741998015;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcrtiDJrC9KzoYhEwPzz24Uk6uC+QWSxxHwuKGw5gEE=;
        b=hVd3oa4dqMzTqT4ZNBkG3yA3nsiUyLcrh4ddsSC3pE4wf4aQgc7iTew828aLN9siEb
         LsAiePvfVXmQi9bZL6CKokAUzPmhwskjsgNoq2imDi9zSOXoUt1jM3K8Fm+6lctqBmEY
         ne+fHSCa/9fzNrYqeeLczw55iaj34HitzHA7VajL+B4fhMd0sG+eNGi6QU/7aOURprE/
         nhBCgbTHXH+r3bBSYz/BdHljjd5xBtTTuDP+V6+QFIrW0gqi0EZdNlNhtz81ZBeQolf/
         FhQEc+Mq7yrWiAhm4LKPBZWjw+xvCMAgJCRNUCjVRPwkpcKdOdbWojBURaMUa9F4RFCe
         DkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXighLG4IPHpwCmi6Ir/RGQkB8wIpfc1/7GnE4uNdTnK57cL8qDYkEGfw3oEga8Qkcyll5U7jKFBFriNUctr37WyrU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDr9QlYgWZ2D8JcGZ5/7dvL7lofDf2X3x0qpWgq3SRrr2Xw6IJ
	H98edjRAlv+xiKzsb4+rPCkjytlYtbHD8N97XHBVm7galiBAR388k7k5D8Uj
X-Gm-Gg: ASbGnctzmh8P+WUJ83wDNX48k6Z8y2kUJ6e/kq2+F2RmKCk/dm9d+h3jB86TouHP3V/
	INmfltxd58tvaYmQ95NswJvvrKL/RSK+zqKzoGMsfK9GqLOgdQ20fOgrKOvec+BR63x0KitMNta
	02W9Eh0pXwyM54fG162dV43EtopcTGJSMEjlL6rtUrpP+1AS8TvQQR4StXFWBoI9VsqoaXfTBmU
	rp8DCSpElOF+ATLMTj9lPu6UtWyNvP00ghcXyBAoSaRpkenKKQJw13WvgrfXnQqYkkp3Bd2Puq+
	dqJwL7BKJhTD3JjlQIs4IJz/dWPGFqB6SBNZrVSHEw44szlmJ7Oz6E6T4KElebnwBagNHFDF0kM
	Fv7bLu9UUxPraxbfjTD8e
X-Google-Smtp-Source: AGHT+IF5ClT+jFJOFWWN+swpKgqoy5P/WC/tBm0ZeTqSB+ht2XqV+tdq4l1jWqI0joYLTCqze6MH/Q==
X-Received: by 2002:a05:690c:2d85:b0:6fe:c803:b471 with SMTP id 00721157ae682-6fec803f955mr40140227b3.16.1741393214808;
        Fri, 07 Mar 2025 16:20:14 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:1e21:dfd9:6403:66c9? ([2600:1700:45dd:7000:1e21:dfd9:6403:66c9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6feb2a5be9esm9675507b3.35.2025.03.07.16.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 16:20:14 -0800 (PST)
Message-ID: <25c3cee9-ab12-4db6-b5bd-96a435557f59@gmail.com>
Date: Fri, 7 Mar 2025 19:20:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: March 7th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 00:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115801

The following changes since commit 880df90c865b57d38f1ff836fe8900c94434322f:

   phpmyadmin: fix CVE-2025-24529/CVE-2025-24530 (2025-02-09 07:58:44 -0800)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 7e18b3fc774b7efabf9a20ae3cd6abd0e0715b59:

   lapack: upgrade 3.10.0 -> 3.10.1 (2025-03-07 19:18:02 -0500)

----------------------------------------------------------------
Changqing Li (2):
       abseil-cpp: fix CVE-2025-0838
       nginx: fix CVE-2025-23419

Haixiao Yan (1):
       freediameter: fix do_fetch warning

Jinfeng Wang (1):
       net-snmp: fix memory leak

Peter Marko (1):
       python3-grpcio(-tools): fix build concurrency issue

Vijay Anusuri (1):
       postgresql: upgrade 14.14 -> 14.17

Wang Mingyu (1):
       python3-future: upgrade 0.18.2 -> 0.18.3

Yogita Urade (2):
       dlt-daemon: fix CVE-2022-39836 and CVE-2022-39837
       dlt-daemon: fix CVE-2023-36321

wangmy (1):
       lapack: upgrade 3.10.0 -> 3.10.1

  .../recipes-protocols/freediameter/freediameter_1.4.0.bb        | 8 +-
  ...0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch | 40 +++++
  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 +
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
  .../postgresql/{postgresql_14.14.bb => postgresql_14.17.bb} |   4 +-
  .../recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch  | 114 
+++++++++++++
  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb           | 1 +
  .../lapack/{lapack_3.10.0.bb => lapack_3.10.1.bb} |   4 +-
  .../dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch   | 251 
++++++++++++++++++++++++++++
  .../recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch | 32 ++++
  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb        | 2 +
  .../{python3-future_0.18.2.bb => python3-future_0.18.3.bb} |   3 +-
  .../recipes-devtools/python/python3-grpcio-tools_1.45.0.bb      | 4 +
  meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb    | 4 +
  meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch   | 87 
++++++++++
  meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb              | 2 +
  16 files changed, 547 insertions(+), 12 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.14.bb => 
postgresql_14.17.bb} (71%)
  create mode 100644 
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch
  rename meta-oe/recipes-devtools/lapack/{lapack_3.10.0.bb => 
lapack_3.10.1.bb} (86%)
  create mode 100644 
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch
  create mode 100644 
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch
  rename meta-python/recipes-devtools/python/{python3-future_0.18.2.bb 
=> python3-future_0.18.3.bb} (70%)
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch


