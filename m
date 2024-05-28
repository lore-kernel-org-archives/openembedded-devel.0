Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0208C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:21:01 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.18655.1716891656629589105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCzxkve2;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a087bc74bso6222927b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716891656; x=1717496456; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLiA+AWsLAckP9jFly5c2hBDQUvRYBodLw9Snqca5ZY=;
        b=aCzxkve2cy4WAUapohZq5LhLIbljv9CCxhBBgiSBzloioMc8EYCGDxPtR+Snf4C/wL
         C9Yw21hK+0rmENe5wn2N9Pm1PcdpBKX5NiQrpIde7UuTCn0bFggy4zkH9WTvmVkfrTcG
         9WKeJDgRVYoMzsMktRcb3RkOf3zTqBTc5I4T7arJVZO2nSfP6x0qVfF/X++4rq9aaitV
         WqJU0nsxf1OYz+MVHu7/C2w+ZN6kD6DSRK4wgLU7U8qCsYkKCE/mBRD3RrZHq5ZA+VNM
         vQVmQa081V/fxBZgTcTxXeRoD4LMOlTuCjGBCly7zVWIWP+Bu550RzOMTLZPRozuxIFu
         4XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716891656; x=1717496456;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLiA+AWsLAckP9jFly5c2hBDQUvRYBodLw9Snqca5ZY=;
        b=eXJejwG/QjytCM1sZpmgqpMLJkUhtsVfx/NRQre/p1Mq6M/9gfeoVmmljIeY8Bn4Gi
         cKBoRkFsViMEAcOu80/3ZjgG/ofvY3g0pki3L9n/7TIwBw9zpv9LttDMgOyRBQEopzMu
         xhOvqhUWTXT5a4Sn/SFxXc5eIGWv9JZaahYYX780F1y+TaRctfR1iy0A7IUXiPGXsy+Y
         PwkTHtviq3bPbuNOvvgFODOANzri6UupqgI1FPSzovwWE8AAbg4dimzUT6jIkxsLHxeD
         L4vXp5QEpwx7SgZCXfW5q4sjT2xoZe0fBbo4OvV+dFjPPbjjk91sZpCq/pDKp+Ip17m1
         gpmw==
X-Forwarded-Encrypted: i=1; AJvYcCVIAuOWfVEhOXgjbnIW+G9yPsbQLgpWr5sS8L6Ns2tcmKMcFd9M1x6bMWy+Z+P5Wh6mR6MhmWYBfRcIGsJiE70uZoT7FRvdCDFsBmmxI7RBUSpEj2OYaKcK9A==
X-Gm-Message-State: AOJu0YzAtOEBm0lLtbwSWs2S4Z5JHWpheOirOW2TSAvt5I1IdGa70fHr
	0zZz0CZId4VxdFs73hyur/gQemzKJ139qiAjHlIpzLWUImNPA7x7
X-Google-Smtp-Source: AGHT+IEZe4nurRCn6njVcrEFS2VixWpLehflWga5t+eoaVnsvVARtzT/IE1vVtSqb65MtG/tXDUT1g==
X-Received: by 2002:a0d:d583:0:b0:61a:b568:a3cd with SMTP id 00721157ae682-62a08d6253amr119161257b3.2.1716891655537;
        Tue, 28 May 2024 03:20:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:9f87:6ec9:14e6:1b94? ([2600:1700:45dd:7000:9f87:6ec9:14e6:1b94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a534d10sm19933767b3.117.2024.05.28.03.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 03:20:55 -0700 (PDT)
Message-ID: <b1a6597a-0aa1-43cb-99a2-9894ac502123@gmail.com>
Date: Tue, 28 May 2024 06:20:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request May 28th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110584

The following changes since commit 70b217ecc812296d98e1aa027a7d182a8019dded:

   python3-pyyaml-include: Drop pytest --automake (2024-05-22 12:50:26 
-0700)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 0560b848996a0feb410a8cd8ca07c60fe2f3b5bc:

   ITS#10094 libldap/OpenSSL: fix setting ciphersuites (2024-05-28 
06:17:26 -0400)

----------------------------------------------------------------
Meenali Gupta (1):
       nginx: fix CVE-2023-44487

Peter Marko (3):
       nss: patch CVE-2023-5388
       nss: patch CVE-2024-0743
       uriparser: upgrade 0.9.6 -> 0.9.8

Priyal Doshi (1):
       ITS#10094 libldap/OpenSSL: fix setting ciphersuites

Soumya Sambu (1):
       php: upgrade 8.1.22 -> 8.1.28

Vivek Kumbhar (1):
       nss: Backport fix CVE-2023-0767

Yogita Urade (1):
       mbedtls: upgrade 2.28.7->2.28.8

akash hadke (1):
       libeigen: Update GPL-3.0-only to GPL-2.0-only

nikhil (1):
       libssh: Fix CVE CVE-2023-6004

  .../mbedtls/{mbedtls_2.28.7.bb => mbedtls_2.28.8.bb} |   4 +-
  meta-oe/recipes-devtools/php/{php_8.1.22.bb => php_8.1.28.bb} |   2 +-
  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb              | 2 +-
  ...1-config-Move-common-parser-functions-to-config_parser.patch | 464 
+++++++++++++++++++
  meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch   | 30 ++
  meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch   | 83 ++++
  meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch   | 117 
+++++
  meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch   | 57 +++
  meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch   | 142 
++++++
  meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch   | 117 
+++++
  meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 7 +
  ...1-Bug-1780432-CVE-2023-5388-Timing-attack-against-RSA-.patch | 681 
++++++++++++++++++++++++++++
  ...1-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch | 40 ++
  meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch             | 102 
+++++
  meta-oe/recipes-support/nss/nss_3.74.bb                         | 3 +
  ...001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch | 69 +++
  meta-oe/recipes-support/openldap/openldap_2.5.16.bb             | 1 +
  .../uriparser/{uriparser_0.9.6.bb => uriparser_0.9.8.bb} |   2 +-
  meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch   | 79 ++++
  meta-webserver/recipes-httpd/nginx/nginx.inc                    | 1 +
  20 files changed, 1998 insertions(+), 5 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.7.bb 
=> mbedtls_2.28.8.bb} (93%)
  rename meta-oe/recipes-devtools/php/{php_8.1.22.bb => php_8.1.28.bb} (99%)
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
  create mode 100644 
meta-oe/recipes-support/nss/nss/0001-Bug-1780432-CVE-2023-5388-Timing-attack-against-RSA-.patch
  create mode 100644 
meta-oe/recipes-support/nss/nss/0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
  create mode 100644 
meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch
  rename meta-oe/recipes-support/uriparser/{uriparser_0.9.6.bb => 
uriparser_0.9.8.bb} (84%)
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch


