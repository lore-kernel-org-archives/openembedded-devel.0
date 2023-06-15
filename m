Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2742EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:54:00 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.16063.1686830030673352761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cp9hZElK;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-56d378b75f0so19544687b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686830030; x=1689422030;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2SNCRfvtlYjRgnN1DYChmTH1E3ulkWt2vMWlT28CgY=;
        b=cp9hZElKyg5b6X0wLK1PlgELInDRVy3naiay1D/NzWEMjGeU8+K7o15PU+v+5GkOts
         w3yLCnoy69CHDhR9ogoAQsVWXYsLjn+fS89JUR7gEcbkX5kU4DjrskCbvpuBGVIg3656
         hxjpQaxzsuOWSMB8mxgOQ2sVYkVW289RteTMWXtyi7A0IgJAgDVwON4Xd4+YShuYqGRG
         P3xjiRjsp6/HPI05IrobLX1y/431O8dE7/4NwWvcTtGSZgWi4dRy7Mf5kTTZZv+sC1DZ
         qCAvGqq8eWYw+BV/ojiQUHyhpQAT4n9FSAbQjRnr4mEfj4bihRNapqYxZ05s1VV8Z6jw
         6XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686830030; x=1689422030;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X2SNCRfvtlYjRgnN1DYChmTH1E3ulkWt2vMWlT28CgY=;
        b=DD7HtQUTjYu98h7pwVKUURY1ecBPxNtKwPF+jFEkq3CyCaQXiJeRq2kcjQH1STpitl
         iMkyZWT85xwjOewUeOK57GAePUlBHMa8hyzmI0DgB1T8hoRCcKdmpQ30kb0yJyX/khIg
         aQVkqFeb+o2TqbIRwfA5sWbmZF3UdwvtHoj+yBbUBIm+eimSOd04uQ8asxpGFWrWym59
         iWuVwxzrQ5LZ0uJ84ricwiNBtSsjBADNOXruBn/mfVMo6b+OoXkk7RFecQrqfcfVyFwA
         sVy6mW6hAYRJyU/98Tmlj2VWIqJXJvSaBobWFuevHiTe+QhC0gdvx5Ej/WMvMOkHVGqL
         5M6A==
X-Gm-Message-State: AC+VfDwDHKjQqdG68zaAp6cf8vjf6RGrO3ix/MQ+MrmOkr/TOUjuOzCR
	sHeQNbWrnjZdPSh0hvERFgeL11dGTJI=
X-Google-Smtp-Source: ACHHUZ5mjcnfEMHuu7II++zPLUWrVzPjs27zF8rDykM1FICQfn7WYMCtcjqdlI+SGqtPB2pRsRTTVg==
X-Received: by 2002:a81:6e06:0:b0:561:3fb7:1333 with SMTP id j6-20020a816e06000000b005613fb71333mr4288597ywc.43.1686830029676;
        Thu, 15 Jun 2023 04:53:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b6a3:8a75:3124:ba44? ([2600:1700:9190:ba10:b6a3:8a75:3124:ba44])
        by smtp.gmail.com with ESMTPSA id r19-20020a0de813000000b005619cfb1b88sm983127ywe.52.2023.06.15.04.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 04:53:49 -0700 (PDT)
Message-ID: <c60a8966-4494-3a82-e4d9-efd8827a9b30@gmail.com>
Date: Thu, 15 Jun 2023 07:53:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: June 15th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103299

The following changes since commit f95484417e3d3e65ca15b460ba71dfd35773f0e4:

   python3-m2crypto: fix for CVE-2020-25657 (2023-06-03 07:55:37 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to bdad2a789e30703a825b876279665720d06d55dc:

   python3-werkzeug: fix for CVE-2023-23934 (2023-06-11 11:43:33 -0400)

----------------------------------------------------------------
Hitendra Prajapati (3):
       wireshark: CVE-2023-2855 Candump log file parser crash
       wireshark: CVE-2023-2856 VMS TCPIPtrace file parser crash
       wireshark: Fix CVE-2023-2858 & CVE-2023-2879

Narpat Mali (1):
       python3-werkzeug: fix for CVE-2023-23934

schitrod=cisco.com@lists.openembedded.org (1):
       gnulib: Update recipe name to 2018-12-18

vkumbhar (1):
       c-ares: fix CVEs CVE-2023-32067 and CVE-2023-31130

  .../recipes-support/wireshark/files/CVE-2023-2855.patch         | 108 
+++++++++
  .../recipes-support/wireshark/files/CVE-2023-2856.patch         | 69 
++++++
  .../recipes-support/wireshark/files/CVE-2023-2858.patch         | 95 
++++++++
  .../recipes-support/wireshark/files/CVE-2023-2879.patch         | 37 ++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 4 +
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch      | 328 
++++++++++++++++++++++++++++
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 85 
+++++++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 2 +
  .../gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb} |   0
  .../python/python3-werkzeug/CVE-2023-23934.patch                | 116 
++++++++++
  meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb   | 3 +-
  11 files changed, 846 insertions(+), 1 deletion(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
  rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb => 
gnulib_2018-12-18.bb} (100%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch


