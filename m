Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4E3C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:30:08 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.13563.1677083403823325135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=edZR+sCM;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1720887dfcdso10460906fac.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwQbEuAbl+Mc3GGFlTIDkA4ioew4JjzsijCDxkZGZY0=;
        b=edZR+sCMt9ilpqxASC7wYSnLkxgnRMiB7Q+HODHE/sSaCZEb8AnYgPXz+mNO4r5zM5
         07SkujutuH6KHu8f9xbX6LD9DqjvQTBrhmZRTiO1KvH5pIDCq2X2I+YEVFumf8Krn4bB
         11ZYKKXnXz4JTMlbJKVtMCknzzKx9FTi20bFZvEptaBQ/C2PIh8gT217NsDgiWFpzumz
         eEPYWRYUQnanO1BwKyyBDaXbFueQhi7QryX8LGEWxpA7IonjpbqhkHqGuzcUvebSgwdZ
         5+UcAtJIuN3rAod5xGiBCYx0KnlinaOMD2aJ3IAadSNaihUT3QakzrVce6bpOfMV/hIz
         sQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OwQbEuAbl+Mc3GGFlTIDkA4ioew4JjzsijCDxkZGZY0=;
        b=6y003Bor/C/A5rr8hCgF7BZdqPNFLHcx4E16sc27fmO1Z2DM/0BHMWuubqkc+mt3U6
         nSF74S0G0LmjMEyUnXRuqLTC5qgHq5aQlu3PqtGi0S5cfcrsSVEWqupJ9KtF0GyOfJAl
         ecPUvJ9UmFC8N5D9nYh3tLnxfQTjhi34HDRz3MPY0lRzXYa9jThbG4tLZm0FE39CIOmn
         EyK2MbWGVtmq76SovhJeEb37OlQyhNtMzo+Ir2wFrGGMgcIX5iZuj3AYvd6+A4pkfl9N
         gkThnf3E1XxtazxFa7ToGkbg+owDBhTIqjXSPkpCjBfHyHjXcEbeYd4kRxt042qA/6Lx
         /d5w==
X-Gm-Message-State: AO0yUKX7wU+tL1GfparOfFnrEQw2lj9t6M1jT2nmUCF6LyQcSCieorDv
	CklAMfy8rQAUdSYe6V4uM2M=
X-Google-Smtp-Source: AK7set9C/sV8y5qiWHUdw1ARHMZvlLr97zR7yKk7ww29ZPVFp9iwq8a9Gn1Exz2H7Fhtz9xf/AmSdw==
X-Received: by 2002:a05:6870:6090:b0:16d:b5b3:128f with SMTP id t16-20020a056870609000b0016db5b3128fmr9237514oae.50.1677083403012;
        Wed, 22 Feb 2023 08:30:03 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:8384:964c:970c:db9? ([2600:1700:9190:ba10:8384:964c:970c:db9])
        by smtp.gmail.com with ESMTPSA id d14-20020a056871040e00b001724d631f92sm767416oag.30.2023.02.22.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:30:02 -0800 (PST)
Message-ID: <454042d0-ead3-9a8c-6312-9e4a4ab3f73c@gmail.com>
Date: Wed, 22 Feb 2023 11:30:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: Feb 22
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 16:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101213

The following changes since commit e707e9b7cf5c62bff4fee029965a87b22dd4ccba:

   postfix: upgrade 3.4.23 -> 3.4.27 (2023-01-19 07:49:31 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 87571345059f82fb7599e3aa82e6fdcfbd361098:

   zeromq: 4.3.2 -> 4.3.4 (2023-02-22 11:24:23 -0500)

----------------------------------------------------------------
Hitendra Prajapati (2):
       net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
       krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing

Mathieu Dubois-Briand (3):
       nss: Add missing CVE product
       nss: Whitelist CVEs related to libnssdbm
       nss: Fix CVE-2020-25648

Roger Knecht (1):
       zeromq: 4.3.2 -> 4.3.4

Shubham Kulkarni (1):
       python3-pillow: Security fix for CVE-2022-45198

Wang Mingyu (1):
       apache2: upgrade 2.4.54 -> 2.4.55

  .../net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch       | 116 
++++++++++++++++++++
  meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb      | 1 +
  meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch     | 110 
+++++++++++++++++++
  meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb                | 1 +
  ...1-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch | 8 +-
  .../zeromq/{zeromq_4.3.2.bb => zeromq_4.3.4.bb} |   4 +-
  meta-oe/recipes-support/nss/nss/CVE-2020-25648.patch            | 163 
++++++++++++++++++++++++++++
  meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 7 ++
  .../python/python3-pillow/0001-CVE-2022-45198.patch             | 26 +++++
  meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb     | 1 +
  .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} |   2 +-
  11 files changed, 432 insertions(+), 7 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch
  rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb => 
zeromq_4.3.4.bb} (87%)
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-25648.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/0001-CVE-2022-45198.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => 
apache2_2.4.55.bb} (99%)


