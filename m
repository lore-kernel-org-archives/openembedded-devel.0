Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472F9C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 12:52:11 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.44426.1674132729751187189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 04:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Njqn0X3n;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-15b9c93848dso2430211fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1VBVLvTtGcFF3gLHE2Ga4iyhq6FSHpwiZ79vk41tEs=;
        b=Njqn0X3noUeK4H1ZOgwgcTk5GfqOQ2E97/EUQ5H0RyaKTK6eoA8OOLFwsXBzvmcNYN
         QCYVQwpIOt6Gw3xrcwoCIYEJ/xuuv0mzk+wU4Q48G4ciUQl5cn2VSzY/HQqTC8l35DCf
         eyIpDilDxDHrDQTtCv1ehunJCRaXD6rZHmgcWVuJGC7Be0KJ7m+uS1fs3bq8EgmYQUri
         4x7ElzK44IJdpaR3o9XY5DYy1w6o6zQrlpyvHR231KDX78ZegLcRxJquL0qGzZd5Wql5
         wMBFA0osUWYJjHi7zyDMm1PSYKZMrN7OaJgFLVh9+jOzrofqI6IC4UzxWI3Tqj5Akhq1
         hHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1VBVLvTtGcFF3gLHE2Ga4iyhq6FSHpwiZ79vk41tEs=;
        b=30rc4gAEt8WQ4tR0Nrudw6+mYFdCYXlhWSDHWD9tqheHDLL3Q5+0ZqQnkRktJl8P1W
         Xx8MNIGdRo1UIOfiCmuKxxCh5oCfxHDhO0hluDLfseI/lbj0sy47i2gZU/QenaDTqYrc
         mEoA1MEUdH5dbw/XLTeZkGls8EJTbcKIF+qmFfV653CPxDlKkdvdGf/+h0sBEmNot2D4
         M0rKPp/JI5nYIypZW59lKmC+jRRi6VfrkVCb5st0dwns+FEgXEuBYZ2hfgXsQHX5o7i+
         DW3ue4+hcF9g2RP+A6qL/3nH0LA6p3gTRBPWUBmzTtGFImtm0m4ClpVUTp+c1BPAPxIi
         gw0A==
X-Gm-Message-State: AFqh2kq6l1apgDSZiJpCyvMKBuMck3QffUY6c3ScmDb6GrHnOm6PdapZ
	tjFddJfQ2gs2rv7PmEDaXv4=
X-Google-Smtp-Source: AMrXdXsTIgLAz1OI3EFr8lIYZcc90w1tArsYEOKO2VqSXOYGmKfAOBvofNSnOU0UFtH/mC9n4D/Pvw==
X-Received: by 2002:a05:6870:348f:b0:15e:ceca:2d16 with SMTP id n15-20020a056870348f00b0015ececa2d16mr5653707oah.35.1674132728638;
        Thu, 19 Jan 2023 04:52:08 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:de2b:5601:1f38:5202? ([2600:1700:9190:ba10:de2b:5601:1f38:5202])
        by smtp.gmail.com with ESMTPSA id u14-20020a056870440e00b0011d02a3fa63sm2333099oah.14.2023.01.19.04.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 04:52:06 -0800 (PST)
Message-ID: <21844dea-df37-ed52-f0b1-08e76a02cccd@gmail.com>
Date: Thu, 19 Jan 2023 07:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Dunfell merge request: Jan 19th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 12:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100657

The following changes since commit 7952135f650b4a754e2255f5aa03973a32344123:

   postgresql: Fix CVE-2022-2625 (2022-12-11 16:01:15 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to e707e9b7cf5c62bff4fee029965a87b22dd4ccba:

   postfix: upgrade 3.4.23 -> 3.4.27 (2023-01-19 07:49:31 -0500)

----------------------------------------------------------------
Hitendra Prajapati (1):
       proftpd: CVE-2021-46854 memory disclosure to radius server

Siddharth Doshi (1):
       xterm : Fix CVE-2022-45063 code execution via OSC 50 input 
sequences] CVE-2022-45063

Valeria Petrov (1):
       php: update 7.4.28 -> 7.4.33

Virendra Thakur (1):
       capnproto: Fix CVE-2022-46149

Yi Zhao (1):
       postfix: upgrade 3.4.23 -> 3.4.27

wangmy (1):
       apache2: upgrade 2.4.53 -> 2.4.54

  .../postfix/{postfix_3.4.23.bb => postfix_3.4.27.bb} |   2 +-
  .../recipes-daemons/proftpd/files/CVE-2021-46854.patch          | 51 ++
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb        | 1 +
  meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb           | 4 +-
  meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch   | 49 ++
  meta-oe/recipes-devtools/php/{php_7.4.28.bb => php_7.4.33.bb} |   2 +-
  meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 785 
++++++++++++++++++++++++++++
  meta-oe/recipes-graphics/xorg-app/xterm_353.bb                  | 1 +
  .../0004-apache2-log-the-SELinux-context-at-startup.patch       | 12 +-
  .../apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} |   2 +-
  10 files changed, 898 insertions(+), 11 deletions(-)
  rename meta-networking/recipes-daemons/postfix/{postfix_3.4.23.bb => 
postfix_3.4.27.bb} (89%)
  create mode 100644 
meta-networking/recipes-daemons/proftpd/files/CVE-2021-46854.patch
  create mode 100644 
meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch
  rename meta-oe/recipes-devtools/php/{php_7.4.28.bb => php_7.4.33.bb} (99%)
  create mode 100644 
meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb => 
apache2_2.4.54.bb} (99%)

