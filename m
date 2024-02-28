Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74443C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 13:22:34 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.12895.1709126550352849018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 05:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jVLhat5H;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60943ad307fso4431297b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 05:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709126549; x=1709731349; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+9jfM4/G7+zapKrQ/2gbCnlEU+CYlBFuznGuyQdlys=;
        b=jVLhat5HAe7vrKM83s443phhh96j/wqOysmn/8+i+wpGLVs2k8jB9uBMUK/BJOzdEJ
         91p06DWhX0JZGUzZ9LjEMg3gfaxpOjpMFjHFI3fCIgNfihNi1j2NDU8eRdUSrbSK/58I
         YrS0mYAPUKEKaMZ7/iLNKxhFM+p4CrPuYZM4X/5YZkoc7ldhQrj/rpg03HexuNpVdpFw
         WzeZcbYHhJE9UQ9oKVTZ9pXlJNER4ZVeHHKNuOMlewSy3neczb8hIj6vIHH1znakzgU9
         PaVBkFH/PEkq2XgLL1ratu4J/V+xs3fF66TEdpTMLKh9ZvS5J8lvZXoj7CIQygPSF9Yl
         JLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126549; x=1709731349;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+9jfM4/G7+zapKrQ/2gbCnlEU+CYlBFuznGuyQdlys=;
        b=Zk7wbGAA7byPoKNJmC/fjsI4+Ig9tW5TeD3bk41/soy007DBP8mXPmynDFSFeaWqyc
         aYoohsuW4SUFkNz2stjj1mtOJkUMjFoODl2ou2tNpoSNtP92txmw9Ipk1P81kdzEJzqC
         czHMmhXrQgKYQeZHDGNYbFXbUqa1vEtl+T/r7mqLT0YE9arvWQTN06NOjN3zW/B+62kO
         G8KybOPOMJRDMSaOspR0BkElIiVAl6hZ33993Jhw/vznce9LADIA68CUwa9VBMaG7Bet
         E4t3EJFRvgqoyldXP6Zh/T7pihsbFj9+UDEF0tmIdVueJEQoXKzCy8VMlY9/+V2swTzN
         TZMw==
X-Forwarded-Encrypted: i=1; AJvYcCVFJxpcvWhB+nNVm4mwZkU6YSdjWwcgLhW27F00F+QG/g1Wr//1+bvXpKp3lKRzLalmVa8TULO6nCx2lWcHiMqaepzTH9DZidxqGqSRTEfU8aDbHjL1eGyAGg==
X-Gm-Message-State: AOJu0YyO8wlTZIEFQJHFadvfB1TtQVCqZaJEyyd1aZLhOhRCi/06qUqf
	Yt6OKE7nVu9ur7P8jTcMW7G+kx++SH31Iz9Fku94VIZEhYomC/OzBbH9FSJa
X-Google-Smtp-Source: AGHT+IGYjmpSZ3MEdOR2TBPN/+Divxn02rHgCMqvGFJnGwID0FwvK5OPkVkXtj5U8kIA4DpHEyAnlA==
X-Received: by 2002:a81:e249:0:b0:609:9b7:9aa7 with SMTP id z9-20020a81e249000000b0060909b79aa7mr5014874ywl.48.1709126549399;
        Wed, 28 Feb 2024 05:22:29 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000::41? ([2600:1700:45dd:7000::41])
        by smtp.gmail.com with ESMTPSA id d14-20020a81ab4e000000b005ffc15cea80sm2295442ywk.26.2024.02.28.05.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:22:29 -0800 (PST)
Message-ID: <a7d682bd-3f5d-4b16-af5e-b762bbf64420@gmail.com>
Date: Wed, 28 Feb 2024 08:22:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone-next merge request: Feb 28th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 13:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109050

The following changes since commit 8609de00952d65bb813a48c535c937324efeb18a:

   Revert "libcroco: Add fix for CVE-2020-12825" (2024-02-07 18:41:41 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to fda737ec0cc1d2a5217548a560074a8e4d5ec580:

   mbedtls: Upgrade 3.5.0 -> 3.5.2 (2024-02-28 08:18:18 -0500)

----------------------------------------------------------------
Fathi Boudra (1):
       python3-django: upgrade from 4.2.7 to 4.2.10

Meenali Gupta (1):
       graphviz: fix CVE-2023-46045

Soumya Sambu (2):
       mbedtls: upgrade 2.28.5 -> 2.28.7
       mbedtls: Upgrade 3.5.0 -> 3.5.2

Vijay Anusuri (1):
       squid: Backport fix for CVE-2023-49286 and CVE-2023-50269

Yogita Urade (1):
       mariadb: fix CVE-2023-22084

virendra thakur (1):
       nodejs: Set CVE_PRODUCT to "node.js"

  .../mbedtls/{mbedtls_2.28.5.bb => mbedtls_2.28.7.bb} |  6 +-
  .../mbedtls/{mbedtls_3.5.0.bb => mbedtls_3.5.2.bb} |  7 ++-
  .../recipes-daemons/squid/files/CVE-2023-49286.patch            | 87 
+++++++++++++++++++++++++++
  .../recipes-daemons/squid/files/CVE-2023-50269.patch            | 62 
++++++++++++++++++++
  meta-networking/recipes-daemons/squid/squid_4.15.bb             | 2 +
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 1 +
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patch          | 91 
+++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb               | 2 +
  .../recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch   | 38 
++++++++++++
  .../recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch   | 39 
+++++++++++++
  .../recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch   | 31 
++++++++++
  meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb            | 3 +
  .../{python3-django_4.2.7.bb => python3-django_4.2.10.bb} |  2 +-
  13 files changed, 364 insertions(+), 7 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.5.bb 
=> mbedtls_2.28.7.bb} (91%)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.0.bb 
=> mbedtls_3.5.2.bb} (93%)
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch
  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patch
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.2.7.bb => 
python3-django_4.2.10.bb} (77%)


