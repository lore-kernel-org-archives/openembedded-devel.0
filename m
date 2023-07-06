Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB12AEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:23:59 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.19752.1688642629866817434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JX/U2HFh;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-570114e1feaso7035317b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688642629; x=1691234629;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H/oqfFUxFvAlc9uC6TMIo4kR1uT3PVHe/G3YBbuHTw=;
        b=JX/U2HFhljccNqD40HG8XLvDUv3Y0Q+83fZxb47eGq06e0sGWvTu+a4T2KQtNsxYrQ
         hLhERtGKN+zq+xB02kgf+M4ynLUNywLQ75KIqWVghS+nU1RCq3x3HQpo5ypm3etSAfFM
         tIiMwK5UdU/uFjOhD5ISUyHEaiSXYVEflQkr7uOwqJOi3lWDM1Fb+kAkO+5RNhKLLDcy
         7HI7BeZ/cSZJgZbAyOc2pEWE/Xwlj6pJ2+ydPx+ka504RTfCq8YFz3/UP8gqNaQdiaeU
         y29GmI7pxvNSZVvtWbPIPR5MHBpjpuZGKyfinhLh5HXTZiyXRqq3B8IKhTrKj2lYr+tl
         Xezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688642629; x=1691234629;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0H/oqfFUxFvAlc9uC6TMIo4kR1uT3PVHe/G3YBbuHTw=;
        b=ecq7dKQyxlj0ZGGBH86Uk/2CeqlI/BgEEMvtpQO0ZEgYV+AAynM10MB12jnk26qw5Y
         Dh2MXeWE3D4v7iF/u16OZt71mXLls+JAsKtTsq7xsQ896Q53yN0WL/l6/zMuXxNoX7F4
         MfqtldeBzim+zzn9VeeqCH03EJ2j3bbMD4ZfasPYObkDWCiDX8yivLZ7UAmdCRkS/6ZE
         tTY7ZbJz7RGB9W+Vib2ArfJ3yrawxu4/l+NgxpWaD3la5oMQncmTgm/2fizcCsbcopJ+
         UTXJx6nW+Di+vYLv9gTEt/v5qCbEXORe5neq9tTdsM9Y4N2ahstA4eJwMFfLN/gv9/Jm
         ytGA==
X-Gm-Message-State: ABy/qLayXsUeIy5PUewhJSX3bWoB5MiPGV9i50rvXEu01RNPkIrrj5wf
	6csfYhhKNndjTnsWHtVyi5/oixjXPio=
X-Google-Smtp-Source: APBJJlFcPPIHX+vnWa+cO/5T5gIjpE3kEDdciAgrqJtfjwIvSRfQ4XhjuGc9MKBJVqSECaqOop8XNA==
X-Received: by 2002:a0d:cd81:0:b0:577:3bf2:80f0 with SMTP id p123-20020a0dcd81000000b005773bf280f0mr1812203ywd.2.1688642628930;
        Thu, 06 Jul 2023 04:23:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:8e4e:f4a2:968a:a93d? ([2600:1700:9190:ba10:8e4e:f4a2:968a:a93d])
        by smtp.gmail.com with ESMTPSA id b127-20020a0dc085000000b00577044eb00esm285708ywd.21.2023.07.06.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:23:48 -0700 (PDT)
Message-ID: <1623b1e1-d1cb-25a2-f1f1-7c665e766957@gmail.com>
Date: Thu, 6 Jul 2023 07:23:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: July 6th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 11:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103681

The following changes since commit a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d:

   ExprTk: Update package to release/0.0.2 (2023-06-19 09:17:01 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 346753705e49a2486867dc150181a1c7f4d69377:

   webserver: nginx: Add stream Signed-off-by: Luke Schaefer 
<lukeschafer17@gmail.com> (2023-07-04 10:20:46 -0400)

----------------------------------------------------------------
Beniamin Sandu (1):
       mbedtls: add support for v3.x

Hitendra Prajapati (3):
       wireshark: Fix Multiple CVEs
       libssh: CVE-2020-16135 Fix NULL pointer dereference in sftpserver.c
       yajl: CVE-2023-33460 memory leak in yajl_tree_parse function

Luke Schaefer (1):
       webserver: nginx: Add stream Signed-off-by: Luke Schaefer 
<lukeschafer17@gmail.com>

Narpat Mali (3):
       opencv: fix for CVE-2023-2618
       frr: fix for CVE-2023-31489
       python3-werkzeug: fix for patch-fuzz

Peter Marko (3):
       c-ares: backport patch for CVE-2023-31147
       grpc: ignore CVE-2023-32732
       ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5

Polampalli, Archana (1):
       tcpreplay: upgrade 4.4.2 -> 4.4.4

Soumya (1):
       opensc: Fix CVE-2023-2977

vkumbhar (1):
       postgresql: fix CVE-2023-2454 & CVE-2023-2455

  ...1-aesce-do-not-specify-an-arch-version-when-enabling-c.patch | 33 ++
  ...2-aesce-use-correct-target-attribute-when-building-wit.patch | 34 ++
  meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest  | 17 +
  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb   | 83 ++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch  | 52 ++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch    | 323 
+++++++++++++
  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 9 +
  .../tcpreplay/{tcpreplay_4.4.2.bb => tcpreplay_4.4.4.bb} |   2 +-
  .../recipes-support/wireshark/files/CVE-2023-0666.patch         | 122 
+++++
  .../recipes-support/wireshark/files/CVE-2023-0667.patch         | 66 +++
  .../recipes-support/wireshark/files/CVE-2023-0668.patch         | 33 ++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 3 +
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235 
+++++++++
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118 
+++++
  meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb               | 2 +
  meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb                    | 3 +
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch         | 29 ++
  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 4 +-
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31147.patch      | 717 
++++++++++++++++++++++++++++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
  meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch      | 44 ++
  meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 4 +-
  meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch       | 32 ++
  meta-oe/recipes-support/opencv/opencv_4.5.5.bb                  | 1 +
  meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch        | 53 ++
  meta-oe/recipes-support/opensc/opensc_0.22.0.bb                 | 1 +
  .../python/python3-werkzeug/CVE-2023-23934.patch                | 35 +-
  meta-webserver/recipes-httpd/nginx/nginx.inc                    | 1 +
  29 files changed, 2038 insertions(+), 20 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch
  create mode 100755 
meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.2.bb 
=> tcpreplay_4.4.4.bb} (85%)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31147.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
  create mode 100644 
meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch


