Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360EFC28B23
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 14:16:13 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.14335.1741270572248390601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 06:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LRgs0T8H;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e53c9035003so644706276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741270571; x=1741875371; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgUqkK35xPSzbN+RbbXT89DhS6NdE49xDPrClWcBEoc=;
        b=LRgs0T8HA1v5zILgLXObFFCcj4HhVQn5glHF/tPvnPRHku4QDfAhWgDjkfMu/4H1jB
         Lw+Qrw51q0uLEQ8taU60NbkPiTxuOapspRNENPT6EUZ30luBZXVJh9ZgQIQqHygOQcXR
         N1FKhK6OsXqYxxs6eYUn8WJM5vF5KVmaq27LtvP/xtUGQOx8NQaMhqumsjIEGs/Ompel
         DCxtmu3WdldoXW6tGIxsUvT4hjRRm3CzAvqAmCGc7isQS954EQ+ahSAMqzoA3hFA15am
         2HGuGl4gEZIm4QWonLkzUkOuhXDgUCwl1C2CEUOJUbXwo8EdkdaJlXcLCDwl9kLD6/2l
         nCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270571; x=1741875371;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgUqkK35xPSzbN+RbbXT89DhS6NdE49xDPrClWcBEoc=;
        b=idlTfGTGRHA9K8IcQOif5UVxNjRbF+buoA1X0/M31m/Gks9Hj8vbCLsE8k5/D6WiDw
         0yVBONL/h9rmfdt6q9/JOtmbOqRv5kfj9huLdLsPUxguYopCI1UMugeSGrB0OgYfAxIh
         1z5WpVWmFnygAeOKzLvxwSrHFUscY6KO4Ti5pREwDicGFz5+vg1YBYcXpACX0T3WYfpi
         i6TqvofOzPW4ejwvtJ85Wv5jufyyTyKSlCI+EPh1ufhLgMNJtI0AGG4QMotDidiTbrNn
         +47FpInQUmXLPEid+D6zSeYH/fab703sJ6kt/DY9WffMTxEzhfubVLNemYG/GTt2d4Hd
         98Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWHC85MlhuJuKpqU11XC6/3KaqNjJyXqmSdAm27X4wCe74QrCjdbM1WBl1yrvPWNu5Ix45Zvza75hvj/fDln/3AO6g=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1baBjuUCNAKQ7cdrkre1WUcs6tvJsCCsTQ3+/hAhXQi30zqw4
	bZ20kJGkuqE4x5R0wCK8BVHEUaNsr0rqJ5/GCcN2SEt0hvjpVblXf6MXApxH
X-Gm-Gg: ASbGnct+D6pveBSr6raL9nVpWkuyRp8IkLlBKjnrTcf/P+w+hmU0xCE12/7bQDc8v6F
	P6dmLkkY5OnbjNBXFkpLS4yovoYHifEe87xFvMWNG8DegOtO5zp2MK5WdX/yOLvHtjPIbd8fggp
	arfMxsJbX+c7FhFYN5lgamD/3O7GNgtJeCRcXdywhjXZvzxjHMf8tfHWq+IYDV9Aj40PpgDXzbw
	O2VZs17TevaOOYeOPJSFgoB0pA4BprBg4qXf5yzmNUvl+uApvryEONaSa7tQ6O78b8sw33KVfxt
	jaFRdMid4VXhUiQw4J+20L7ohjhhmzbrwsfhHXBGJbK8p4xhIRzGGgtvtK78SyGwrX9bqxGVBEM
	pxFCuLJ4iEUpQqLo9iXyD
X-Google-Smtp-Source: AGHT+IG5GhOAmoaIufyxaGPfkp09Kvh/8uPHH5Pn5uEBnMMVE7pKs3u2T45tKAbuALj1GreR+N+vOA==
X-Received: by 2002:a05:6902:100d:b0:e5e:6fa:80a7 with SMTP id 3f1490d57ef6-e611e19a0b4mr9749860276.9.1741270569848;
        Thu, 06 Mar 2025 06:16:09 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:e881:39b2:ebad:452e? ([2600:1700:45dd:7000:e881:39b2:ebad:452e])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e634b735a87sm331151276.11.2025.03.06.06.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:16:09 -0800 (PST)
Message-ID: <06c0f429-d13a-49bb-8289-e80b49f4be76@gmail.com>
Date: Thu, 6 Mar 2025 09:16:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: March 6th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 14:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115771

Clearly I missed sending this earlier.

The following changes since commit de8681b4a2a101b99dd2c48d89a7de2ccd9a961f:

   python3-sqlparse: Fix CVE-2024-4340 (2025-01-22 19:29:37 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 880df90c865b57d38f1ff836fe8900c94434322f:

   phpmyadmin: fix CVE-2025-24529/CVE-2025-24530 (2025-02-09 07:58:44 -0800)

----------------------------------------------------------------
Changqing Li (1):
       phpmyadmin: fix CVE-2025-24529/CVE-2025-24530

Divya Chellam (7):
       redis: fix CVE-2023-41056
       redis: fix CVE-2023-45145
       redis: fix CVE-2024-31227
       redis: fix CVE-2024-31228
       redis: fix CVE-2024-31449
       redis: fix CVE-2024-46981
       redis: fix CVE-2024-51741

Martin Jansa (2):
       hdf5: add -Wno-error to allow building native with gcc-14 on host
       python3-h5py: add -Wno-error to allow building native with gcc-14 
on host

Vijay Anusuri (1):
       openjpeg: Backport fix CVE-2023-39327

Virendra Thakur (1):
       libssh: Add ptest

Yogita Urade (1):
       mbedtls: fix CVE-2024-28755 and CVE-2024-28836

  .../mbedtls/mbedtls/CVE-2024-28755-and-CVE-2024-28836.patch     | 67 
++++++++++++++++++++++
  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb   | 6 +-
  .../recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch    | 63 
++++++++++++++++++++
  .../recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch    | 72 
+++++++++++++++++++++++
  .../recipes-extended/redis/redis-7.0.13/CVE-2024-31227.patch    | 33 
+++++++++++
  .../recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch    | 68 
++++++++++++++++++++++
  .../recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch    | 49 
++++++++++++++++
  .../recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch    | 32 
+++++++++++
  .../recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch    | 89 
+++++++++++++++++++++++++++++
  meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch       | 72 
+++++++++++++++++++++++
  meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch       | 68 
++++++++++++++++++++++
  meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch       | 49 
++++++++++++++++
  meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch       | 39 
+++++++++++++
  meta-oe/recipes-extended/redis/redis_6.2.12.bb                  | 4 ++
  meta-oe/recipes-extended/redis/redis_7.0.13.bb                  | 7 +++
  meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch | 82 
++++++++++++++++++++++++++
  meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb             | 1 +
  meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb                     | 6 ++
  ...1-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch | 38 
++++++++++++
  meta-oe/recipes-support/libssh/libssh/run-ptest                 | 45 
+++++++++++++++
  meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 19 
+++++-
  meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb       | 4 ++
  .../recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24529.patch      | 36 
++++++++++++
  .../recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24530.patch      | 42 
++++++++++++++
  meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb       | 4 +-
  25 files changed, 989 insertions(+), 6 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2024-28755-and-CVE-2024-28836.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31227.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
  create mode 100644 
meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
  create mode 100644 meta-oe/recipes-support/libssh/libssh/run-ptest
  create mode 100644 
meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24529.patch
  create mode 100644 
meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24530.patch


