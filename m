Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A84C47DDF
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:01:18 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.21715.1706101277242718068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BEvE1DVF;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ff7ec8772dso46846987b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706101276; x=1706706076; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfnkvC4DVVgcu9M37K9t/L34OYDOeLqiO8hXj93l1bA=;
        b=BEvE1DVFXnpdjCYejuB2ZReWaxCNry1H/ReqUSIb20hMONAxxwohzRFsVhsIBkMaIR
         aPy0jKb1icjBlNo6z1kai9m6Oy885Qm3+SQ1Qyyspo3HhynyegH4JUJeU+M5yLv2bhV2
         UFnQ/kRP3HtWtHMTREnj44exbZEodKpIBHwWOtVbwRMQokJCsQzw+qxHFZHj6NhA/K/m
         iOL1NjiQZU8m0SD6xcusM7tta8wbo0yuD7RjJsoik7G1Sl6Z2yeCH+35PQQc2NL4XiPF
         yesWzhyFsDiNVgoezt7IaktfLOa7ES3AtKZAyL+z2uNQzzE8Dk4WhKIzb03kwAzyKP2S
         1y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706101276; x=1706706076;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfnkvC4DVVgcu9M37K9t/L34OYDOeLqiO8hXj93l1bA=;
        b=cWwKU4oZCik/mxjy7kw1Y/tAjpk2y+02JgyrG5h1S6fsq6Igc/mBPUsj+5oh7A4nC3
         l2MTl/74NPNJNhT18Fe42SP04wQZCLD1q7qOOC34YyyG17si0XITgtDFCG7y7g6YXU9Z
         2SUEdC9S1781MHBoWT+Ru5iE8JhScq6SwR8wLo0u0zNj03zMWDXg3FZIhF6dk9AJoI4B
         yH3g6uONrWhoD+/UhHVPE2H8sjIUdNBJbmg/7BWt+4BCjlCl7fh9hjVqGjSl/5laXRt6
         uKt9sO6zsJlH5i2AIlj+D7XMxgcT7WQnFOJTKsAgmBDcymFbPicfdBLBMQxsN76cFPlJ
         lUJQ==
X-Gm-Message-State: AOJu0YzpVZI092qGS8vMaR7jX3IBQT/F3jYjPzJiTlhMGpCPnfKm81NT
	8z993CdHq4zcwDd5Czi5uw7Hns5FkXrj4Olq3w3wl/+XjI7rpLfw
X-Google-Smtp-Source: AGHT+IEAqAxyBH1rn5yKfyR04noSYx7t/keSgngFP75ooRwcjo4KMB68UW/abAOtmRDugc8AANDqkg==
X-Received: by 2002:a81:a00e:0:b0:5f9:d912:400e with SMTP id x14-20020a81a00e000000b005f9d912400emr729017ywg.13.1706101276330;
        Wed, 24 Jan 2024 05:01:16 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:d415:a751:b824:7c97? ([2600:1700:9190:ba10:d415:a751:b824:7c97])
        by smtp.gmail.com with ESMTPSA id w82-20020a817b55000000b005ff9b3e6dd4sm4022845ywc.116.2024.01.24.05.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 05:01:16 -0800 (PST)
Message-ID: <3fcb8c36-55bc-4dcf-bb2a-cdb45da97113@gmail.com>
Date: Wed, 24 Jan 2024 08:01:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: nanbield merge request: Jan 24th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 13:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108446

The following changes since commit 2da6e1b0e43a8993fd422fee3f83940100b59f4c:

   poco: fix branch (2024-01-05 07:52:17 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded nanbield-next

for you to fetch changes up to da9063bdfbe130f424ba487f167da68e0ce90e7d:

   libssh: upgrade 0.10.5 -> 0.10.6 (2024-01-16 19:29:51 -0500)

----------------------------------------------------------------
Changqing Li (2):
       postgresql: upgrade 15.4 -> 15.5
       redis: upgrade 6.2.13 -> 6.2.14

Khem Raj (1):
       webkitgtk3: upgrade 2.42.0 -> 2.42.1

Meenali Gupta (1):
       nginx: upgrade 1.25.2 -> 1.25.3

Mingli Yu (1):
       mariadb: Upgrade to 10.11.6

Wang Mingyu (5):
       strongswan: upgrade 5.9.12 -> 5.9.13
       webkitgtk3: upgrade 2.42.1 -> 2.42.2
       webkitgtk3: upgrade 2.42.2 -> 2.42.3
       webkitgtk3: upgrade 2.42.3 -> 2.42.4
       libssh: upgrade 0.10.5 -> 0.10.6

Yi Zhao (1):
       samba: upgrade 4.18.8 -> 4.18.9

  .../samba/{samba_4.18.8.bb => samba_4.18.9.bb} |  2 +-
  .../strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb} |  2 +-
  .../{mariadb-native_10.11.5.bb => mariadb-native_10.11.6.bb} |  0
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 3 +-
  meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch         | 68 
-----------------------------
  .../mysql/{mariadb_10.11.5.bb => mariadb_10.11.6.bb} |  0
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 8 ++--
  .../postgresql/{postgresql_15.4.bb => postgresql_15.5.bb} |  2 +-
  .../recipes-extended/redis/{redis_6.2.13.bb => redis_6.2.14.bb} |  2 +-
  ...1-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch | 10 ++---
  ...1-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch | 10 ++---
  .../libssh/{libssh_0.10.5.bb => libssh_0.10.6.bb} |  2 +-
  .../webkitgtk/{webkitgtk3_2.42.0.bb => webkitgtk3_2.42.4.bb} |  2 +-
  .../recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb} |  2 +-
  14 files changed, 20 insertions(+), 93 deletions(-)
  rename meta-networking/recipes-connectivity/samba/{samba_4.18.8.bb => 
samba_4.18.9.bb} (99%)
  rename 
meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb => 
strongswan_5.9.13.bb} (99%)
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.5.bb => 
mariadb-native_10.11.6.bb} (100%)
  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.5.bb => 
mariadb_10.11.6.bb} (100%)
  rename meta-oe/recipes-dbs/postgresql/{postgresql_15.4.bb => 
postgresql_15.5.bb} (86%)
  rename meta-oe/recipes-extended/redis/{redis_6.2.13.bb => 
redis_6.2.14.bb} (96%)
  rename meta-oe/recipes-support/libssh/{libssh_0.10.5.bb => 
libssh_0.10.6.bb} (96%)
  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.0.bb => 
webkitgtk3_2.42.4.bb} (99%)
  rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb => 
nginx_1.25.3.bb} (51%)

