Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AC9C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 20:52:16 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.39145.1724619133042857728
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 13:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=njCgyf5T;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6c91f9fb0d7so11157257b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 13:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724619132; x=1725223932; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MFsfvUE5x9qXN+uaRsi8xvzcziahfzw4eS2C8lvPok=;
        b=njCgyf5TrZ+wfQ4bR2F7NkUJYiBMOmE83H/Loi1IM0aA+fSS5oXvoCDJBYOWgZ6/3R
         T2Z98yTaLSqVq9g4nJaLnhe7Ymhy4nTB8GD+SOciW1wdz1AC1LBkci0jc2n+67Ou8nq7
         qIeHyrqFkDbfg38icR/UVv1V/BBgA1sTYPtqZh9Nyf/je6GXGQSHxgaqC6iE+LM6IPkU
         uaJfF8QbeVbzqJGFDAXBwTwZ4d+RuE1woodJxjfnvOho4coOIkkBFV62XD5XJSBa7mb6
         6B3sCn002YVuvXp2CASzcJxWDhXSAZM2qhZKhuWrfVonaaIBJmeyucA70T0YhP8+1Ipj
         fhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724619132; x=1725223932;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MFsfvUE5x9qXN+uaRsi8xvzcziahfzw4eS2C8lvPok=;
        b=YP0LSd3Bax4Eoi9Qt5ql2/dnlcBaUINWIC1T1P9xYbs0KbQ90sDdKo95N/ojk5GRaC
         s5KzFmaiu1Y4TVh9VEjKyIO81vf1T1nYElMrPjPUS/d2/qAXbZmy+htxEtrd6xg2bZa5
         EXiskxDCh5bStDxBrkzN9ZRkxC2sd/Vw1wXDlyUXYFvUZrFjLSGT2hCNmRsPnGZcKl5X
         0/AbuSYHMiwxPmEGFdv+DAr9esj1TtgdMFFuOzZECrkO0ICgiW5gK/BMA18K9ltEEea0
         95DTFaNzVMYRfcAcrBNz4BBtosHz+6/ShTvIGK5Xwl2vKnFz+n34c60CMiZtlTM7J1bz
         N8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvCzFc6NB60WfVGMJMskcYTLFXINem56mQ6XG3DJ48brBRXDXGMnXataPnXa2zzXjQSuKdUICvfy26ODVOGa0jT/g=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5GyduC50+rKi9cu+1cWAd9VbMFr3bbKsBZ4g/ivqHtlUPpM33
	Dl0bj2xI5hWwDjY6HtfzXnP+pd/NwGgmJtnZaqQWlLojhf4o0IgE
X-Google-Smtp-Source: AGHT+IG1yfAtvokbm815U4cQ14Av2wknvwtTFMYMWzFu+1jGOI2o2BousN6+x1XMPBdm0kVkRUq0Ag==
X-Received: by 2002:a05:690c:39a:b0:650:a1cb:b122 with SMTP id 00721157ae682-6c6263eb75cmr101678597b3.27.1724619132102;
        Sun, 25 Aug 2024 13:52:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:b8b:c77f:717d:1c6? ([2600:1700:45dd:7000:b8b:c77f:717d:1c6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae12sm12790917b3.142.2024.08.25.13.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 13:52:11 -0700 (PDT)
Message-ID: <38e13100-d14c-4b90-87a9-e181e7d3690c@gmail.com>
Date: Sun, 25 Aug 2024 16:52:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Aug 25
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 20:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111939

The following changes since commit 64c481d017c1b5b5eae619a367a5e8fa00f1b156:

   libjs-jquery-icheck: Correct LIC_FILES_CHKSUM (2024-08-14 10:19:55 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 1235dd4ed4a57e67683c045ad76b6a0f9e896b45:

   python3-twisted: Fix CVE-2024-41671 (2024-08-25 15:15:10 -0400)

----------------------------------------------------------------
Adrian Freihofer (1):
       networkmanager: remove modemmanager rdepends

Ashish Sharma (1):
       nginx: Backport fix for CVE-2024-7347

Esben Haabendal (1):
       netplan: add missing runtime dependencies

Peter Marko (2):
       libndp: Patch CVE-2024-5564
       squid: patch CVE-2024-37894

Soumya Sambu (2):
       gtk+: Fix CVE-2024-6655
       python3-twisted: Fix CVE-2024-41671

Wang Mingyu (1):
       cjson: upgrade 1.7.17 -> 1.7.18

Yogita Urade (2):
       poppler: CVE-2024-6239
       krb5: fix CVE-2024-26458 and CVE-2024-26461

  .../networkmanager/networkmanager_1.46.0.bb |    2 +-
  .../recipes-daemons/squid/files/CVE-2024-37894.patch            | 36 +
  meta-networking/recipes-daemons/squid/squid_6.9.bb |    1 +
  .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb |    1 +
  .../krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch               | 207 
+++++
  meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb |    1 +
  meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch  | 48 +
  meta-oe/recipes-connectivity/libndp/libndp_1.8.bb |    1 +
  .../recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} |    2 +-
  meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch             | 40 +
  meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb |    1 +
  .../recipes-support/poppler/poppler/CVE-2024-6239-0001.patch    | 1275 
+++++++++++++++++++++++++++
  .../recipes-support/poppler/poppler/CVE-2024-6239-0002.patch    | 111 +++
  meta-oe/recipes-support/poppler/poppler_23.04.0.bb |    2 +
  .../python/python3-twisted/CVE-2024-41671-0001.patch            | 89 ++
  .../python/python3-twisted/CVE-2024-41671-0002.patch            | 251 
++++++
  meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb |    5 +
  meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch  | 34 +
  meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch  | 52 ++
  meta-webserver/recipes-httpd/nginx/nginx.inc |    2 +
  20 files changed, 2159 insertions(+), 2 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch
  create mode 100644 
meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb => 
cjson_1.7.18.bb} (97%)
  create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch


