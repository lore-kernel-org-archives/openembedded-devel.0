Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46920C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 11:50:47 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.6343.1686138644142134862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 04:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cbpGQnwC;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-565c7399afaso80823007b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686138643; x=1688730643;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OsjSZnZtgFNmEpDlwO4dETh4JpAxBfEGcnUZMJpJmk=;
        b=cbpGQnwC3F77mEdTsLzr7vpA4NQ7UGW6rWXmIXlY6w5a6EAl0GFHbv0HBjuB1AaK3R
         tgG9IkHsoOewuhIl118VEs2bsCvXMzUsGxQBTX9MsRias8xDFdNVpV/tbXwY15vKDjpx
         IHq0R8BfMvcyK4S8+5aUSrxo+aaj06X9l3pFNAMOpPbnrBaMupAKj4JSulD/qv1XsMNq
         4qTOrAt8ypr92NaUENwIn3OdFX4ft6AllZzM4xInnu7HashCYsnNHGUwNLGIrbj+dbGj
         /+DSkjf3pOo4A9nkWw3UpXPwOQCP4KlLHY1Qgz0xwBh34tZiRb0WUPGgy9HlUHh6X106
         vhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686138643; x=1688730643;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/OsjSZnZtgFNmEpDlwO4dETh4JpAxBfEGcnUZMJpJmk=;
        b=bRO6yDXJ0Mfo3UjtveNUI2XNy7KXNnF3fTcSdac4pcyIXlVMm8+MucF+1V92SyWuxD
         WB1IgfAXJg9dhDxsUhfq0etIMBECbBKKrq4RM4i7TkG7dfODznaXViRTt8D0Ev2C3JG0
         BEMXPjkqBb0Pi8a7ZUAele5xWQfGnwPSyaoRp1IZCEmt4Qm2ZSCi/+5mutT5L3Z1KyOi
         e7ioiR7uFVA5x5qN/n5UoPxFIpVOVD2exvQAQtLNZbCKPPPCZxfuTMMrV9bgAMyOmuBV
         5mWkxnEdqW6+YpQrm6SIB7tCkQi1newp2RigIwV9KLZq07/ffJn08ussNXNfFsEc1OSk
         91RA==
X-Gm-Message-State: AC+VfDyNhYXQv73qz9EbcygeWT4yJh6MqJezf986Hj7YJIC2TAFP6W1o
	nTzLbk9mKKJqWnEqdx8KBQm1DqasUlg=
X-Google-Smtp-Source: ACHHUZ6K8Rvoi5vizVAx1XiofOY5jZ4GUVz3K7Lyf/iU3l0cWpx0+E3yn6stHLmfO4679YHV+Tx9Xg==
X-Received: by 2002:a81:8450:0:b0:54f:179:cef2 with SMTP id u77-20020a818450000000b0054f0179cef2mr6681194ywf.19.1686138643316;
        Wed, 07 Jun 2023 04:50:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c463:b29:d008:874c? ([2600:1700:9190:ba10:c463:b29:d008:874c])
        by smtp.gmail.com with ESMTPSA id v16-20020a814810000000b005688deeefc2sm4698126ywa.20.2023.06.07.04.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:50:42 -0700 (PDT)
Message-ID: <cb477fa0-b7bb-82da-7927-51165747830c@gmail.com>
Date: Wed, 7 Jun 2023 07:50:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: June 7th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 11:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103177

The following changes since commit 5f120a926b0fcd55cfe7565bb7ddf23661cad498:

   libbpf: installing uapi headers for native package (2023-05-23 
23:12:51 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to f95484417e3d3e65ca15b460ba71dfd35773f0e4:

   python3-m2crypto: fix for CVE-2020-25657 (2023-06-03 07:55:37 -0400)

----------------------------------------------------------------
Jonas Gorski (3):
       frr: Security fix CVE-2022-36440 / CVE-2022-40302
       frr: Security fix CVE-2022-40318
       frr: Security fix CVE-2022-43681

Narpat Mali (2):
       python3-django: upgrade 4.0.2 -> 4.2.1
       python3-m2crypto: fix for CVE-2020-25657

Natasha Bailey (1):
       libyang: backport a fix for CVE-2023-26916

  meta-networking/recipes-protocols/frr/frr/CVE-2022-36440.patch  | 71 
+++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2022-40318.patch  | 81 
+++++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2022-43681.patch  | 58 
+++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 3 +
  meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch   | 57 
+++++++++
  meta-oe/recipes-extended/libyang/libyang_2.0.164.bb             | 1 +
  .../python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} |   2 +-
  .../python/python3-m2crypto/CVE-2020-25657.patch                | 175 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb  | 1 +
  9 files changed, 448 insertions(+), 1 deletion(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2022-36440.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2022-40318.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2022-43681.patch
  create mode 100644 
meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb => 
python3-django_4.2.1.bb} (77%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch


