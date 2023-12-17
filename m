Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B151C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 20:45:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.26844.1702845915655766882
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Dec 2023 12:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0pW9Vf1;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5e465506c0bso18179717b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 12:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702845915; x=1703450715; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GwMBIHoUJPvdrRV301xMvGDa5kX1fzWLKnwu7zi+Xw=;
        b=G0pW9Vf1EXyxk0zyWDpc5dLN8dKhlzUq4wAI3sHCmdb315cNxjcg04UGU+5CrReejD
         TBTqpv8zTEQR5BxpaE+k2JkRnBvPZvjuq2Qm+m3r0MCGsQC6m/CqOeIKFYuC0u7GsSDG
         L9BpG3ZjF+UknVL8LBI1et5BmmnAL7NtynhDtMWb7gaFJDQwEEXaYR0kqnhV8Ul+IJmX
         dwgqYq7rC4cbPWxto63z9zf0NNcCSm2nmrVhLoRXJTFOCoonJgwSvMySywWInrHArxHs
         D73gmnh+tY50BvKf+vDqOGYdJp18u40sG3hhEGv/ls4S5uH9g1UmyO8rEDCtte1oA+Qh
         RVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845915; x=1703450715;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GwMBIHoUJPvdrRV301xMvGDa5kX1fzWLKnwu7zi+Xw=;
        b=JMxZh16bugwv34H7Bz1mk9MnH+2+YgPRnFRvrHfiOrHG7ZDXtzyY4M0iHnARzkPN0M
         8YMpmCNac3L2MiVw52dUMPo9tP6GJDKj24KOKrA2ux2CI4iXwnE8XhXPeI8KS9Gu6+g8
         i5hl+nzr8PCNDJMwr8H+Y0rpk10X01XPqQhJt04X8jcM/qsZ+rKwQasvuVvNVbFsFqW/
         dlErAtd2Fawk6zzqvHyuQ0zk1/RS5hZn8OTmwbS8tQ/ij76OO90wgauDtPphe0vCOTX6
         TmCoQd4UCH94MEGlRV9/AaF7JXFEu9tYdVziLcPIZH+5qoLyoG7agN+ErijaaHc80ast
         o/AQ==
X-Gm-Message-State: AOJu0Yxvn3/TGii+p9ULnrEAIaP8k3J+hQXjUDqUWSiL2FXQfZfXXbNY
	MviMOieYM3bkyH5/kmhePLI=
X-Google-Smtp-Source: AGHT+IFMKtlWk0H67XCvohSR5AJUHIJWlNPYe92TltYNCdSLeNItcwClRwdUQeQWGoMJHfhgwumxHA==
X-Received: by 2002:a81:414c:0:b0:5e4:828f:cc20 with SMTP id f12-20020a81414c000000b005e4828fcc20mr2491571ywk.52.1702845914480;
        Sun, 17 Dec 2023 12:45:14 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:e601:af37:f032:c87d? ([2600:1700:9190:ba10:e601:af37:f032:c87d])
        by smtp.gmail.com with ESMTPSA id l15-20020a0de20f000000b005e3175fc655sm1510890ywe.55.2023.12.17.12.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 12:45:13 -0800 (PST)
Message-ID: <e1bc65d1-660e-4430-9adf-2d63989b2fe1@gmail.com>
Date: Sun, 17 Dec 2023 15:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: Dec 17th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 20:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107538

The following changes since commit 9135c7ea7350d5d241f4afc3b28087122ebe2d19:

   glmark2: fix compatibility with python-3.11 (2023-11-12 10:42:03 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to fc632d5bb0936e91e4e0191547b9aa8ca47b4ffe:

   wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka 
protocol) dissector infinite loops (2023-12-17 15:36:42 -0500)

----------------------------------------------------------------
Ashish Sharma (1):
       apache2: Backport fix for CVE-2023-45802

Bartosz Golaszewski (1):
       python3-cson: fix run-time dependencies

Davide Gardenal (2):
       usrsctp: add CVE_VERSION to correctly check for CVEs
       openflow: ignore CVE-2018-1078

Frieder Schrempf (1):
       spirv-tools: Use main branch for all repos

Hitendra Prajapati (3):
       wireshark: Fix CVE-2022-0585-CVE-2023-2879
       php: CVE-2022-4900 fix potential buffer overflow
       samba: fix CVE-2023-42669 denial of service

Jasper Orschulko (1):
       nginx: Mitigate HTTP/2 Stream Resets Flood impact

Khem Raj (2):
       emlog: Add PV
       meta-python-image,meta-python-ptest-image: Use python3 packagegroups

Richard Purdie (3):
       meta-oe: Drop broken BBCLASSEXTEND variants
       meta-perl: Drop broken BBCLASSEXTEND variants
       meta-python: Drop broken BBCLASSEXTEND variants

Vijay Anusuri (1):
       traceroute: upgrade 2.1.0 -> 2.1.3

Yoann Congal (2):
       emlog: ignore inapplicable CVEs
       libusbmuxd: Add PV

vkumbhar (2):
       squid: fix CVE-2023-46847 Denial of Service in HTTP Digest 
Authentication
       wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka 
protocol) dissector infinite loops

  .../recipes-connectivity/samba/samba/CVE-2023-42669.patch       | 93 
++++++++++++++++++
  meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     | 1 +
  .../recipes-daemons/squid/files/CVE-2023-46847.patch            | 47 
++++++++++
  meta-networking/recipes-daemons/squid/squid_4.9.bb              | 1 +
  meta-networking/recipes-protocols/openflow/openflow.inc         | 4 +
  meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb        | 2 +
  .../traceroute/{traceroute_2.1.0.bb => traceroute_2.1.3.bb} |   3 +-
  .../wireshark/files/CVE-2022-0585-CVE-2023-2879.patch           | 93 
++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2022-4345.patch         | 52 
++++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 2 +
  .../dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb | 2 -
  meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb           | 2 -
  meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb               | 3 -
  meta-oe/recipes-core/emlog/emlog.inc                            | 2 +-
  meta-oe/recipes-core/emlog/emlog_git.bb                         | 13 +++
  meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb                 | 2 +-
  meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch            | 48 
++++++++++
  meta-oe/recipes-devtools/php/php_7.4.33.bb                      | 1 +
  meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb     | 1 +
  meta-oe/recipes-graphics/spir/spirv-tools_git.bb                | 6 +-
  meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb               | 2 -
  meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb             | 2 -
  meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb             | 1 -
  meta-oe/recipes-printing/cups/cups-filters.inc                  | 8 --
  .../recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb     | 2 +-
  meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb     | 2 -
  meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb           | 2 -
  meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb          | 2 -
  meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 -
  meta-python/recipes-core/images/meta-python-image.bb            | 3 +-
  meta-python/recipes-core/images/meta-python-ptest-image.bb      | 2 +-
  meta-python/recipes-devtools/python/python-pint.inc             | 2 -
  meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb      | 2 -
  meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb | 2 -
  meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb     | 2 -
  meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb   | 2 -
  .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 -
  meta-python/recipes-extended/python-cson/python3-cson_git.bb    | 3 +-
  .../recipes-httpd/apache2/apache2/CVE-2023-45802.patch          | 141 
++++++++++++++++++++++++++++
  meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb          | 1 +
  .../files/0001-HTTP-2-per-iteration-stream-handling-limit.patch | 92 
++++++++++++++++++
  meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb              | 1 +
  meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb              | 2 +
  43 files changed, 605 insertions(+), 53 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
  rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb 
=> traceroute_2.1.3.bb} (92%)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2022-0585-CVE-2023-2879.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch
  create mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-stream-handling-limit.patch


