Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F71C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 11:03:28 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.127112.1680692605750546142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 04:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XW6urTFW;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id y184so26330696oiy.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680692605; x=1683284605;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfxhOivmCkJ1B+KP4dbovo9siGKPT8CFBdjiXy02UDI=;
        b=XW6urTFWO501ionPG3pHhAi9CHRrRLUaRBM1WKYTmfvM+NdpOoxvgimDTzxeZi/eho
         Jf8QfATQ/I22if2THaFukIVp7EP95ohTOoM6hC/N7/ELJRtHX4NDEH7GeRfaa2pCd2SH
         k/Lu1nMxuz2rUNyRAUSwV3qxxeEozhCSunzqGHBE6jme12+F74l7B7q0EsFFnwvKgW10
         +d/7gAJ20FGBBhS9GRciDzf5el4cKN69g1hmXKxqZngNhEWCG5r5hppn+gB3UtYyN5Ja
         OHyGZ7CKItsl2qeEq1rrsi9Jm/VlBaTHFkzEPI1gCgI0w5g8XFwIBXoxT6hVzCO0qrlF
         tOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692605; x=1683284605;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WfxhOivmCkJ1B+KP4dbovo9siGKPT8CFBdjiXy02UDI=;
        b=kL8s9d+jPpKcoldBgpvr9AJ7l5KQBpoZ82THQV3701wk8vX8tHCkRPLXQUvRblkDsX
         nb9xMwI6EiDA9MON7NqA+HtGDoc3dC9f0N+Uup1U+lHOEwZ3imEsOTpiutq04nfoU6ss
         G2WzUY+Lrzd7lzckWBUwnT+J5rgxnQa3OBavFeW/0MvmFocVtF+XOs9mdA7FWmk0TPyq
         +bWjVejzKNWx1j/7/E7QhQFJNHHgjzjzxFNMlAZPLgpmRClkXJRN+RyQ45fgHiGz1WK2
         0qJ78f0Ayp9oeHgJUQPEtdA/pY9CqiC72OdGhrOY6hRh69k5HoQkpCisQ8zYln7fNe2A
         TM6g==
X-Gm-Message-State: AAQBX9dgS5JZXasIwK3YcF9lYodMjqQXete53sZySXWc+YUSO1hV9+h2
	+VPeeqOViCOBtZPJ5ZENc6E=
X-Google-Smtp-Source: AKy350ZvGSVM934sTCUhxwXP5l0NMR98OQ6NPsyEi/0ZpTlqPvB+ZlY2NO33AsbrNF/l0kl0GtYn1w==
X-Received: by 2002:a05:6808:2105:b0:386:ca6d:b602 with SMTP id r5-20020a056808210500b00386ca6db602mr3245868oiw.41.1680692604936;
        Wed, 05 Apr 2023 04:03:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:36f6:c20d:238e:7162? ([2600:1700:9190:ba10:36f6:c20d:238e:7162])
        by smtp.gmail.com with ESMTPSA id j9-20020aca3c09000000b0037fa035f4f3sm6177216oia.53.2023.04.05.04.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 04:03:24 -0700 (PDT)
Message-ID: <cc70ab0c-82aa-c817-7567-8487c477e5cc@gmail.com>
Date: Wed, 5 Apr 2023 07:03:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: April 5th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 11:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101959

The following changes since commit 084a584897ad2f85f609d84044c548150d583405:

   dnsmasq: fix CVE-2023-28450 (2023-03-25 09:08:29 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 571e36e20e9d1f27af0eb4545291beeb64f280e2:

   syslog-ng: fix CVE-2022-38725 (2023-04-04 09:06:45 -0400)

----------------------------------------------------------------
Dragos-Marian Panait (1):
       phpmyadmin: fix CVE-2023-25727

Khem Raj (1):
       monkey: Fix build with musl

Martin Jansa (1):
       monkey: use git fetcher

Mingli Yu (1):
       mariadb: Fix CVE-2022-47015

Nikhil R (1):
       duktape: Add ptest

Yogita Urade (1):
       syslog-ng: fix CVE-2022-38725

wangmy (1):
       libcrypt-openssl-rsa-perl: upgrade 0.32 -> 0.33

  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 1 +
  ...1-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch | 320 
++++++++++++++++++++++++++++
  meta-oe/recipes-extended/duktape/duktape_2.7.0.bb               | 22 +-
  meta-oe/recipes-extended/duktape/files/run-ptest                | 32 +++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch   | 65 
++++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch   | 150 
+++++++++++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch   | 77 
+++++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch   | 37 ++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch   | 211 
++++++++++++++++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch   | 180 
++++++++++++++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch   | 81 
+++++++
  .../recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch   | 45 ++++
  meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb           | 8 +
  .../recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch     | 37 ----
  ...enssl-rsa-perl_0.32.bb => libcrypt-openssl-rsa-perl_0.33.bb} |   3 +-
  ...0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch | 30 +++
  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb             | 6 +-
  .../recipes-php/phpmyadmin/phpmyadmin/CVE-2023-25727.patch      | 37 ++++
  meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb       | 1 +
  19 files changed, 1301 insertions(+), 42 deletions(-)
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-29644-a-potential-bug-of-null-pointer-dereferen.patch
  create mode 100644 meta-oe/recipes-extended/duktape/files/run-ptest
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
  delete mode 100644 
meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
  rename 
meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.32.bb => 
libcrypt-openssl-rsa-perl_0.33.bb} (86%)
  create mode 100644 
meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch
  create mode 100644 
meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2023-25727.patch


