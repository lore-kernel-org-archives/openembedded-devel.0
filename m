Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A49AEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 11:16:53 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.16459.1689333403679914889
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jul 2023 04:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eUcctnL0;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-cb7b6ecb3cdso1138271276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689333403; x=1691925403;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvvfqOkexX86u1SX3HGw4Awwscx0/hN2J31oAzKXImc=;
        b=eUcctnL0AWnbuejSBVXpWgHFEhrEhSo5vzrL0ygZLUCrAeJzatxRNo+e/7Fuaom9Kw
         UNtgRSHNj00OAkd4pZf04yC2qh8b58a6hA5+KwrbrH2b5j0I8b4S2m5HSjoqRLsKbgeU
         +F7saGQBp2uFKON6MJGRz73Mc9tmy1UzFHp/oD6Cm4R7g8ClL9XBahn+v1J/WiSz3jjt
         bS7u1CxX97RDcoKfZXX5LiFUry4Mh0LveTKKpRyysovGmbJTmll0tosfcdti35bx6h7O
         rLr3PtIwBEaVqHlXSxdrGCd3lAtQ6c7LkvnsaYX7O6igZzC2RdBxUoEFLFN39Iwqdr+I
         c3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689333403; x=1691925403;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvvfqOkexX86u1SX3HGw4Awwscx0/hN2J31oAzKXImc=;
        b=IMmlXZqYGLss99V4wWkqEwqUZ7kbb8pljWQnIH0y5kvLBp9nf1YnBxVy5tayH7wTAE
         TCHTEb5ciyzgzydx3W9k8jxGeD90uBrdvO2ZNZRAdoQ1uXB1z/39rEgpsjZjOsyN0gUu
         7YVlJ24bF7LpMfQZaOwQYF/bnYUiVYmAvNt4c6YvbaWtklbKTa4RTqbEuWPkYpZUmse0
         JJRfRWCykoWgOmPKTPIuW8eg0oFYKtx8rRA7it1yP2MeUUKGmwZ8OqFlfjTT/8S/e575
         /N/fIUH+4haYgxSQjJrCiPvqYja+vpYJgUM9lmvFT20LhZGUIFs6oNHaQhnBB3AuN3SB
         JZ4g==
X-Gm-Message-State: ABy/qLaqshBN8iYZrAEc/G0omuV4TIV6LEttJP6de378cEcTtZI30mdj
	8f/4Hexi6UQbJGAe0LLbrCo=
X-Google-Smtp-Source: APBJJlHM64L6At/kP674TBehaze5YBF1wILnlznfM21BxI+Zn/Js5IFD///ozi3cn1/VM0CmzJwo/w==
X-Received: by 2002:a81:4f91:0:b0:57a:5b6f:d41 with SMTP id d139-20020a814f91000000b0057a5b6f0d41mr4355243ywb.42.1689333402574;
        Fri, 14 Jul 2023 04:16:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:d728:ea97:1c3f:f91? ([2600:1700:9190:ba10:d728:ea97:1c3f:f91])
        by smtp.gmail.com with ESMTPSA id q3-20020a815c03000000b00561e7639ee8sm2251727ywb.57.2023.07.14.04.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 04:16:42 -0700 (PDT)
Message-ID: <68215175-21a2-bd4e-fd1d-af4711dc4ad6@gmail.com>
Date: Fri, 14 Jul 2023 07:16:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: July 14th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 11:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103864

The following changes since commit 6334241447e461f849035c47f071fa4a2125fee1:

   c-ares: CVE-2023-31147 Insufficient randomness in generation of DNS 
query IDs (2023-06-23 06:58:18 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to b5282ece919f016d91a1043769676efb02b4f0fb:

   openldap: fix CVE-2021-27212 Assertion failure in slapd (2023-07-14 
07:08:54 -0400)

----------------------------------------------------------------
Hitendra Prajapati (7):
       wireshark: Fix Multiple CVEs
       wireshark: Fix CVE-2023-0667 & CVE-2023-0668
       yajl: CVE-2023-33460 memory leak in yajl_tree_parse function
       ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5
       multipath-tools: fix CVE-2022-41974
       quagga: CVE-2021-44038 unsafe chown/chmod operations may lead to 
privileges escalation
       openldap: fix CVE-2021-27212 Assertion failure in slapd

Vijay Anusuri (1):
       libssh: CVE-2020-16135 NULL pointer dereference in sftpserver.c 
if ssh_buffer_new returns NULL

virendra thakur (1):
       c-ares: whitelist CVE-2023-31124

vkumbhar (1):
       postgresql: fix CVE-2023-2454 & CVE-2023-2455

  .../recipes-protocols/quagga/files/CVE-2021-44038.patch         | 117 
++++++++++
  meta-networking/recipes-protocols/quagga/quagga.inc             | 2 +-
  meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch    | 340 
++++++++++++++++++++++++++++
  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 10 +-
  .../recipes-support/wireshark/files/CVE-2023-0667-pre1.patch    | 153 
+++++++++++++
  .../recipes-support/wireshark/files/CVE-2023-0667.patch         | 66 
++++++
  .../recipes-support/wireshark/files/CVE-2023-0668.patch         | 33 +++
  .../recipes-support/wireshark/files/CVE-2023-2855.patch         | 117 
++++++++++
  .../recipes-support/wireshark/files/CVE-2023-2856.patch         | 68 
++++++
  .../recipes-support/wireshark/files/CVE-2023-2858.patch         | 94 
++++++++
  .../recipes-support/wireshark/files/CVE-2023-2952.patch         | 97 
++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 11 +-
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235 
+++++++++++++++++++
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118 
++++++++++
  meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 2 +
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch         | 29 +++
  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 4 +-
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 4 +
  meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch     | 40 ++++
  meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch     | 42 ++++
  meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch     | 70 
++++++
  meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch     | 34 +++
  meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 8 +-
  .../recipes-support/multipath-tools/files/CVE-2022-41974.patch  | 162 
+++++++++++++
  .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 1 +
  meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch  | 31 +++
  meta-oe/recipes-support/openldap/openldap_2.4.57.bb             | 1 +
  27 files changed, 1883 insertions(+), 6 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/quagga/files/CVE-2021-44038.patch
  create mode 100644 
meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0667-pre1.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
  create mode 100644 
meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch
  create mode 100644 
meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch
  create mode 100644 
meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch
  create mode 100644 
meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch
  create mode 100644 
meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
  create mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch


