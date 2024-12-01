Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0FDD4978D
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 23:18:35 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.162579.1733095106688465161
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Dec 2024 15:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aU0O6uGz;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3989d27ba3so1485412276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733095106; x=1733699906; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNmjjvFrbaEVi3cs+eHXTyTCaxfoPGH9VCetdO5H99c=;
        b=aU0O6uGzpUNzUs5HL7zhNTSwEinfdO9Yb96aA0eF4Ds/NDmx8OTsyfLz3lJ+KdzDK8
         n9zmxPTtyUMMZe9HAJXv6niLtfZHNs8yP+i+cT+vKoyrCIHznQoMA1cfRkrZdzLHeUFG
         d6OnfVX4ZJUnVIkQxrm3Im3skSw9aUd0GKu2fll8JMosAJ1XWlgdu9PGP0WXMdQge0u1
         cK1zzp1AJVnOD9HgmkhdGVWFHh0DXv3emGkWnervsrHDO+Sa+ztwC+3YEVFLfhJvOFue
         VbF/yGs1hAJKQqRZ7iAM6aSSqHpI0X4NR1Vmh73+UsXbAtOWDnXhp0vDLKymYx1BaTRI
         D6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733095106; x=1733699906;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNmjjvFrbaEVi3cs+eHXTyTCaxfoPGH9VCetdO5H99c=;
        b=EyF7jdGQTpvgwvqPjnnBeGMblpipYB5AVqWUZP3QytTp2yDs3Oom1o5yLiXHeyTh3V
         yBQ19bBiDt0MWt+SyuE2EbI4PLAzvvf1AqyjA1cQia2CCLVOrpZGxlmr7sX9rWTMdtAn
         UMONFrfQ73BFK5cm8zltbecx9vNGjr/0wKNNBidP1Q9WEycB4/KyOwACVX+enYGIfaf7
         XXU/4nd59B/4ZeGWUkc+sDzfOb1PmQ7ojv0Fl8n/CQ+DLItdzs1azdW/mrAx63H3mO6c
         YtOVH0+9LQhP7U9QAI1SsOj83+nsT52Zr6SBm+nUNOEEdRbYA7mghrbgHf0E47ZCyd1H
         kGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdRa8cyVp0V3MG0Gr+39ycPYO7mmpmAQMc8SalVZiwkN0CpM65WR5333TGGytwgVKuV+239xjKfHosmlVIr/mcEWc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIekvS74yVuBZFXhd8QWWn7c6BGybb257zlVXtmfTxC5hIhVSv
	3B3R2YP9MO0u01S6J7LerqsrfgyLc9wP/mIjHnE8qJUKIl94W5xS
X-Gm-Gg: ASbGncvwX5+0G3VP4v8WhfstgxfMfjaVhe4eQeRYEKwQVX/Exm3KCq6koCtZesAC8gH
	pi07uu1iLKyEwxeAJMGevdUC6wmRVt4wTPL1qvLrjBUgTSFG///+0Z+tFHzi359wAYAdWJMEQJJ
	JA6XZyHUBNpYSz1offmbPENu5VnPkxM1UhKheoLKA1NISTY90v2mDsSUJ0TyaRLaKhFX+hCa+WY
	ND48XwdBufdVjT6aZqONGEF9NwuxWd3spz27jO3GCB0Lr2mGW+K2Mc5
X-Google-Smtp-Source: AGHT+IGm+kLhS5zrtwA5KdU/lWjfCa0iagbB+Yqpzy0LCmbHg2b4KRI8bEjAf1BCezrqGU5Os39gew==
X-Received: by 2002:a05:6902:a07:b0:e39:9df1:67c2 with SMTP id 3f1490d57ef6-e399df16dbamr4965812276.47.1733095105776;
        Sun, 01 Dec 2024 15:18:25 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000::d? ([2600:1700:45dd:7000::d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3976c6fffcsm2094887276.47.2024.12.01.15.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 15:18:25 -0800 (PST)
Message-ID: <f632f166-e22c-4dac-8bd2-2cd2538287bc@gmail.com>
Date: Sun, 1 Dec 2024 18:18:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scathgap merge request: Dec 1st
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 23:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114131

The following changes since commit 2e3126c9c16bb3df0560f6b3896d01539a3bfad7:

   xmlrpc-c: update SRCREV (2024-10-15 16:59:45 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to b8d1a14f7f3b76457c36752202ea7ae5881b6654:

   freeradius: upgrade 3.2.3 -> 3.2.5 (2024-11-24 17:38:31 -0500)

----------------------------------------------------------------
Chen Qi (1):
       graphviz: remove obsolete and problematic patch

Haixiao Yan (2):
       openvpn: fix CVE-2024-28882
       openvpn: upgrade 2.6.10 -> 2.6.12

J. S. (1):
       nodejs: cleanup

Jiaying Song (8):
       debootstrap: fix do_fetch error
       wireguard-tools: fix do_fetch error
       vlock: fix do_fetch error
       openipmi: upgrade 2.0.34->2.0.36
       tcpreplay: fix CVE-2023-43279
       xfce-dusk-gtk3: fix do_fetch error
       eject: fix do_fetch error
       libdev-checklib-perl: fix do_fetch error

Justin Bronder (1):
       python3-xmodem: replace hardcoded /usr with ${prefix}

Peter Marko (3):
       nss: patch CVE-2024-6602
       nss: patch CVE-2024-6609
       squid: conditionally set status of CVE-2024-45802

Sana Kazi (1):
       libp11: Treat all openssl-3.x releases the same

Virendra Thakur (1):
       opensc: Fix multiple cve CVE-2024-45615-45616-45617-45618-45619-45620

Yi Zhao (2):
       mbedtls: upgrade 3.6.1 -> 3.6.2
       freeradius: upgrade 3.2.3 -> 3.2.5

  .../freeradius/{freeradius_3.2.3.bb => freeradius_3.2.5.bb} |    2 +-
  .../mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb} |    2 +-
  meta-networking/recipes-daemons/squid/squid_6.9.bb |    6 +
  .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb |    2 +-
  .../openipmi/{openipmi_2.0.34.bb => openipmi_2.0.36.bb} |    2 +-
  .../openvpn/{openvpn_2.6.10.bb => openvpn_2.6.12.bb} |    2 +-
  .../recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch    | 39 +
  meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb |    1 +
  meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb |    2 +-
  .../nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch   | 55 --
  .../nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch     | 63 --
  meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb |    2 +-
  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |    2 +-
  ...0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch | 33 -
  meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb |    4 -
  meta-oe/recipes-support/eject/eject_2.1.5.bb |    2 +-
  .../libp11/files/0001-detect-correct-openssl-3.x.patch          | 28 +
  meta-oe/recipes-support/libp11/libp11_0.4.12.bb |    5 +-
  meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch             | 65 ++
  meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch             | 30 +
  meta-oe/recipes-support/nss/nss_3.98.bb |    2 +
  .../files/0001-PR-Fixes-for-uninitialized-memory-issues.patch   | 1268 
+++++++++++++++++++++++++++
  meta-oe/recipes-support/opensc/opensc_0.25.1.bb |    4 +-
  meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb |    4 +-
  meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb |    2 +-
  25 files changed, 1458 insertions(+), 169 deletions(-)
  rename 
meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.3.bb => 
freeradius_3.2.5.bb} (99%)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.bb 
=> mbedtls_3.6.2.bb} (98%)
  rename meta-networking/recipes-support/openipmi/{openipmi_2.0.34.bb => 
openipmi_2.0.36.bb} (98%)
  rename meta-networking/recipes-support/openvpn/{openvpn_2.6.10.bb => 
openvpn_2.6.12.bb} (97%)
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
  delete mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
  create mode 100644 
meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/0001-PR-Fixes-for-uninitialized-memory-issues.patch


