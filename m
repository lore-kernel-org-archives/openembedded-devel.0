Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02832C761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 11:39:05 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.156031.1680781142256429037
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Apr 2023 04:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=AyZuDN6F;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id y69so2408522ybe.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680781141; x=1683373141;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VobDpXOIRir+56vovkla7TXDfOeTGa8n005nI+cg5bk=;
        b=AyZuDN6FERw0aKDBCgfMWVjSuf/OQ8wGNjJY+YXMLyQCm4AXb1krNZZ3MhEYzsFUBf
         M3hlnNm7nMJSWcnUhPVNxG8j+aUuK21DnkmMKiwzqq1fLKMRnME1K2MPIMBmJnagkore
         ACFNEewX3AmT4058OiWu825y+3JwZrLRGnCvufmJt5svmKTQAnQLPh4iysk9f6rRJZ2e
         Q0GRKjMUya+aDDC7CWAMDyXo2AXFN/ui0jIwKveLTEsAEgiE826Ff3uAvT9A+gUz4CG4
         P/bhNtZRxvuYlI8eA5PCAr1U8hJtClhEUAR6VE7FydhwlH/bVy8Au7y8qgtlZj5AyL3K
         hoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680781141; x=1683373141;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VobDpXOIRir+56vovkla7TXDfOeTGa8n005nI+cg5bk=;
        b=4P14BCz5X4OTXKL10/nBQNSJk9ZKR398TOK98m8LiW6ZEZJF0H4uxjm7fWUdeXVGPJ
         ZlSGZmd04Yr7mlsxDtNId6CEpzg+Wjw0NqW4Y14Gm5+YujEViRCQA74RPEmJmjh6oH7i
         KeCq3voaBUvo9oYQc/NblGT66FuQ7gRTtfEWW8e+wXIAVmMx9h8zCNyW57yhM+QRNAfe
         i0SU/jTe/pGu6wBgCGCX4aTy316Z9gkkRG0X8uon50XBy7Spa18ub+pWxoMvaFAyEvnz
         jGdkk1FBeKg6YsoLqsLWYUfN+OWGjtAanfYgkI03SSOTdEmowkBgy1tKSrksq//AeRke
         Qz2A==
X-Gm-Message-State: AAQBX9fcgLXuPwQl3fXZfqxS5ZviIR1dvkyWts1Jqq/EbVVZFl5+SASp
	LBIrhftAwTO9tvOyL4s5uD8RwX0JhAeivA==
X-Google-Smtp-Source: AKy350a6p6KRDG1UxDmT2bi1DgzGHRI3Yzh9GAMKcEVtcoFhLJdjx0fgZ5BaHdSsn8hqtHNi32wZKA==
X-Received: by 2002:a05:6902:18c8:b0:a09:3c5a:c0d7 with SMTP id ck8-20020a05690218c800b00a093c5ac0d7mr2377079ybb.61.1680781141370;
        Thu, 06 Apr 2023 04:39:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3249:c5b2:756:1575? ([2600:1700:9190:ba10:3249:c5b2:756:1575])
        by smtp.gmail.com with ESMTPSA id 5-20020a251005000000b00b7767ca7473sm368852ybq.16.2023.04.06.04.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 04:39:01 -0700 (PDT)
Message-ID: <b8064d86-fcba-4b03-8392-dc221492051f@gmail.com>
Date: Thu, 6 Apr 2023 07:39:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: April 6th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 11:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101972

he following changes since commit 7ae42df58f2bcc730153715c3339a6875b0b2497:

   xterm: Remove undeclared variables introduced by backport (2023-03-18 
16:16:42 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 7007d14c2558f86a49c2e2acb6154432c2ba4092:

   mariadb: Update to latest lts 10.4.28 (2023-04-06 07:32:45 -0400)

----------------------------------------------------------------
Armin Kuster (1):
       mariadb: Update to latest lts 10.4.28

Hitendra Prajapati (2):
       postgresql: CVE-2022-41862 Client memory disclosure when 
connecting with Kerberos to modified server
       syslog-ng: CVE-2022-38725 An integer overflow in the RFC3164 parser

Virendra Thakur (1):
       nss: Fix CVE CVE-2023-0767

Wang Mingyu (1):
       apache2: upgrade 2.4.55 -> 2.4.56

vkumbhar (2):
       dnsmasq: fix CVE-2023-28450 default maximum EDNS.0 UDP packet 
size was set to 4096 but should be 1232
       mariadb: fix CVE-2022-47015 NULL pointer dereference in 
spider_db_mbase::print_warnings()

  .../recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch        | 63 +++
  meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         | 1 +
  .../{mariadb-native_10.4.25.bb => mariadb-native_10.4.28.bb} |   0
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 3 +-
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch          | 269 
++++++++++++
  .../mysql/{mariadb_10.4.25.bb => mariadb_10.4.28.bb} |   0
  meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch       | 48 +++
  meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 1 +
  meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch             | 124 
++++++
  meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 1 +
  meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725.patch    | 629 
++++++++++++++++++++++++++++
  meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb           | 1 +
  .../apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb} |   2 +-
  13 files changed, 1140 insertions(+), 2 deletions(-)
  create mode 100644 
meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.25.bb => 
mariadb-native_10.4.28.bb} (100%)
  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.25.bb => 
mariadb_10.4.28.bb} (100%)
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => 
apache2_2.4.56.bb} (99%)


