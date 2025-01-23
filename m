Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEEAC02181
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 00:07:16 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.112.1737590830955962585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 16:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+8ZbaQw;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso541721276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 16:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737590829; x=1738195629; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GNDZ+gjKyg9S/UdDVzDpu+28C/GE1O5Pl/W4yuNiio=;
        b=T+8ZbaQwxl3UjDxHTftJrxVPUfEcDJD6Jz+2b5KU5YG1y/TUZZ0Ta7DhkMcvZL3JD+
         kBVn9jTfDY566Y6rVHrUJTfa5wZ01G8b2WzL/J8tE/gIa4dfnFbjkjpep5uPoCseD4T9
         fc5fnVOy/iTUWZe07fUYnOHWRw+UGyqRRsZmkttJ2Fetih8zTj+fqrdrvuxi09izn6I+
         /DqpHRW2Iriq/ejsH5Rs5Yklt/xESLGNZZZbWv78juTJwBdRZyFXxbS5PXsGsrx3B62J
         yvXqR5q5ktop9UUknI0kl5V4NjwGbT5El0eE4gYDcHuq5Va3xQM5E5miM0tMsFicAYGH
         FVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737590829; x=1738195629;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GNDZ+gjKyg9S/UdDVzDpu+28C/GE1O5Pl/W4yuNiio=;
        b=HKJS6vd7dsNfKog2hWDIvGjkBCVsd4Rxn0iERYi/JEW8LdBXv+eOiuoKsvjE748lb3
         O4MGBhGMu8l6UlA9sVbzZkbOBl4mCUw2aEP8mIZ7G6x/th1pJGTPTURRAzID2h3rn+Fg
         kY3Nf9rtS80G6PB2dM2QLbW1/+CyPBYbtDOn28JAXUuJ9ylTFjmN+VSLTO/TKU88bwvr
         HFBI4wB1vX83QM9K/vmy7TfTpzEIOqrhaby9a3ex60rWFNAwvlJw8nvb8MadCFCFzY7J
         x9vFuSnCzawekW1XtmNKoZM+yyPkZoiF7wElOqGxyOx2RFKeHvCdXnyZQkH3DiuDX86T
         gfBg==
X-Forwarded-Encrypted: i=1; AJvYcCUzEsrAZQTRBkr5eIcHfaR4CZMBBAMSXhOgymXjzqY+1X0Z0tsKs95UA5XwG90Tsp2MItsd+VLQYPffD8GueoCTD7k=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTTg0EaJ4iAuRp1QYtFMAcffeUd4EzY/Ctp4JgQA0+8DM2bzao
	FohfVs6fMmhmyggEYM7iYOMn7Cmpy1qUV0FsemoLRbIfMJ7EaMpY
X-Gm-Gg: ASbGncswvLRNq06lYAoTs+osD6VFIFV5Wil8r7bLpzgCJ3KFWjjCCDqjofIvCWVqWXX
	rNSFgIANTH5EfDgNX+HE+Z2Phh3GcwqWnO+Ja1C+F2+hoDus6Dyq71yqWqY1v1IXbPvbmLoesv8
	VgqhquPZDeEMTiR37sZuDsbtkN0/7F6m8k1ySuaZ62KQgqI6SxgxlXODQOzHpeh5HTBoPc4+iNZ
	ubjf9zBTDbgA8rZnnHykDenu1HcnphFaRDp81Tc1M4tDoR+15X7mm5mGcbppzHFP5Vabl/8LPFf
	hzjxuUokRRWXIJ0PoB5UPwOXOxXwucJ3OO0qHCZloDfDUw==
X-Google-Smtp-Source: AGHT+IH4Gb+bZ+zw63WurviWt5GDfeNDP/PMjcy1J+q9VD6qUfQ7CdwQVwc4viEM5Rjvf3cvUFJyVA==
X-Received: by 2002:a05:690c:498a:b0:6ef:641a:2a90 with SMTP id 00721157ae682-6f6eb93267fmr195851867b3.32.1737590828205;
        Wed, 22 Jan 2025 16:07:08 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:78ad:9605:32da:4f0e? ([2600:1700:45dd:7000:78ad:9605:32da:4f0e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e63ae5efsm22232867b3.5.2025.01.22.16.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 16:07:07 -0800 (PST)
Message-ID: <8b54fb24-08dd-432c-ae1e-7a10f23eaa3a@gmail.com>
Date: Wed, 22 Jan 2025 19:07:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Jan 22nd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115023

The following changes since commit 5f9f741193f55bb4bb3c974e913d169dd23e40d3:

   ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native 
(2025-01-05 16:46:47 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to dda0d53326017d6758ec6bdfdaf2f484c089d13f:

   gphoto2: Fix contains reference to TMPDIR [buildpaths] warning 
(2025-01-20 19:46:16 -0500)

----------------------------------------------------------------
Divya Chellam (1):
       nginx: upgrade 1.25.3 -> 1.25.4

Hieu Van Nguyen (1):
       gphoto2: Fix contains reference to TMPDIR [buildpaths] warning

Jiaying Song (1):
       chrony: fix do_fetch error

Mingli Yu (2):
       asio: Add ptest support
       ptest-packagelists-meta-oe.inc: Add asio

Peter Marko (2):
       thrift: fix c++ generated code compilation with clang
       grpc: patch CVE-2024-11407

Preeti Sachan (1):
       bpftool: fix libelf.h not found error

Robert Yang (1):
       hostapd: Add CVE id to CVE-2024-3596_00.patch

Shubham Pushpkar (1):
       wireshark 4.2.7: Fix CVE-2024-9781

Soumya Sambu (2):
       python3-django: upgrade 4.2.16 -> 4.2.17
       python3-django: upgrade 5.0.9 -> 5.0.10

Vijay Anusuri (1):
       php: upgrade 8.2.24 -> 8.2.26

Xiangyu Chen (1):
       crash: fix crash cannot work with kaslr

Zhang Peng (2):
       glade: fix CVE-2020-36774
       opensc: fix CVE-2024-8443

gudnimar (1):
       pipewire: upgrade 1.0.5 -> 1.0.9

  .../pipewire/{pipewire_1.0.5.bb => pipewire_1.0.9.bb} |   2 +-
  meta-networking/recipes-support/chrony/chrony_4.5.bb            | 2 +-
  .../recipes-support/wireshark/files/CVE-2024-9781.patch         | 133 
++++++
  meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb    | 1 +
  meta-oe/conf/include/ptest-packagelists-meta-oe.inc             | 1 +
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch | 1 +
  .../recipes-connectivity/thrift/thrift/0001-thrift-pr2755.patch | 599 
++++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb            | 4 +-
  meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch       | 54 +++
  meta-oe/recipes-devtools/glade/glade_3.22.2.bb                  | 1 +
  meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch         | 32 ++
  meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb                    | 1 +
  meta-oe/recipes-devtools/php/{php_8.2.24.bb => php_8.2.26.bb} |   2 +-
  meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb              | 3 +
  meta-oe/recipes-kernel/bpftool/bpftool.bb                       | 2 +-
  meta-oe/recipes-kernel/crash/crash.inc                          | 1 +
  .../0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch    | 89 +++++
  .../asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch   | 37 ++
  meta-oe/recipes-support/asio/asio/run-ptest                     | 19 +
  meta-oe/recipes-support/asio/asio_1.30.2.bb                     | 19 +-
  meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch   | 60 +++
  meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch   | 55 +++
  meta-oe/recipes-support/opensc/opensc_0.25.1.bb                 | 2 +
  .../{python3-django_4.2.16.bb => python3-django_4.2.17.bb} |   4 +-
  .../{python3-django_5.0.9.bb => python3-django_5.0.10.bb} |   2 +-
  .../recipes-httpd/nginx/{nginx_1.25.3.bb => nginx_1.25.4.bb} |   2 +-
  26 files changed, 1117 insertions(+), 11 deletions(-)
  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.5.bb 
=> pipewire_1.0.9.bb} (99%)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
  create mode 100644 
meta-oe/recipes-connectivity/thrift/thrift/0001-thrift-pr2755.patch
  create mode 100644 
meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
  create mode 100644 meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch
  rename meta-oe/recipes-devtools/php/{php_8.2.24.bb => php_8.2.26.bb} (99%)
  create mode 100644 
meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
  create mode 100644 
meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
  create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.2.16.bb 
=> python3-django_4.2.17.bb} (63%)
  rename meta-python/recipes-devtools/python/{python3-django_5.0.9.bb => 
python3-django_5.0.10.bb} (56%)
  rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.3.bb => 
nginx_1.25.4.bb} (74%)

