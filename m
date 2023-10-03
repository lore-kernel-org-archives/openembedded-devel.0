Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCC6E7AD4D
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:43:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.108241.1696340592535987673
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 06:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FD4liR93;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso708566b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696340592; x=1696945392; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RFdB0SI6ybPp0sT1qK/f/rfTQjYgzWDyXpcRG4ASg4=;
        b=FD4liR93FOI9naa+F6h3wmne4BGhmVEz4kBGeP19RDjhPzG3t4dxuvY5NbvAAF+mlL
         u34bVqdiB3t+UugZDSUFHTkiOpqmSB4Ok1C6V6uunvyKlVEwoy1YCnzfEFMF4dww9lki
         iS7sOJLyspvjDrn9MqNN9pAjSrbp+U81A7EzPO8h+gN2SwuX6XOoWXd0rHGxUtYEx/Or
         b1k86v1zqyQ3/VBKsyH8fqSSPXp9jUkghN7NRA/zkAi2xO6ko/FidIDAyB+s3sphMVUq
         u6mQyp2jzZkxmwnMTgLt4VGiwnp8JhQrOcZ+ZrXrITDg/vBtIZgPcLWJwk5DCWO80gDV
         9sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696340592; x=1696945392;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RFdB0SI6ybPp0sT1qK/f/rfTQjYgzWDyXpcRG4ASg4=;
        b=QhJSrzMkV1tNc2PElZDtUA/NRmrcE2Yw3tpasPjqiSTMmy4aee3bu7D5VjUlF/ZTJI
         7DOMVn2UcXlyOIHhbu7gEWduHcomJuWAkL5sQlRasn7ZUroSUcp5v9EnHxQZuqovqrH3
         6mROgtnlTQeu871rrXbNga39GigSoK3IfO++gJcjy5seAOWpmrAeo8fJ5qSsRszAcM87
         Am/IBj3j+G/T8HQRCmszxCVu4D49HD+FIMgzyaqrQT/3a2LjI66jqQVTi3WQ+QEOJSEN
         HQwboyanpts0Y9Vl615Qav6Tjtnpp0oSDESosIsZ+EyJT5EIUayhbEIhUB0xg3j3aRVs
         A+Lw==
X-Gm-Message-State: AOJu0Yy7H0L92sqG6yh7/VOnQVdW5tOqoO0b47tyJHvNkR00uEQ8djx1
	tAY6N8QnEk1lFDUXhf662r4=
X-Google-Smtp-Source: AGHT+IGm35egJrRtSGDOlynwh9oG+MDniyUGNjcxqhFkz8h/mEaxXI9QCUiP8Qatm/vxh7gQtQK9Xg==
X-Received: by 2002:a05:6a20:9719:b0:162:6588:7174 with SMTP id hr25-20020a056a20971900b0016265887174mr12861297pzc.28.1696340591719;
        Tue, 03 Oct 2023 06:43:11 -0700 (PDT)
Received: from [10.0.237.240] ([50.202.47.34])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902744c00b001b8a2edab6asm1534995plt.244.2023.10.03.06.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 06:43:11 -0700 (PDT)
Message-ID: <368e66df-f33f-ea8b-b380-d0920e438ee9@gmail.com>
Date: Tue, 3 Oct 2023 06:43:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: Oct 3rd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 13:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105323

The following changes since commit e42d1e758f9f08b98c0e8c6f0532316951bb276f:

   postgresql: refresh patches (2023-09-09 12:52:03 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 0f10a0d394ddffeeb1db0ea94046d86792d704fe:

   php: Fix CVE-2023-3824 (2023-09-30 08:55:03 -0400)

----------------------------------------------------------------
Bhargav Das (1):
       iperf3: Fix CVE-2023-38403

Hitendra Prajapati (1):
       wireshark: Fix CVE-2023-2906

Kirill Esipov (1):
       catch2: switch from master to v2.x branch

Priyal Doshi (1):
       open-vm-tools: Security fix for CVE-2023-20900

Siddharth Doshi (1):
       php: Fix CVE-2023-3824

  meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch | 
38 +++++++++++++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb |  1 +
  meta-oe/recipes-benchmark/iperf3/iperf3/0001-Fix-memory-allocation-hazard-1542-.-1543.patch | 46 +++++++++++++++++++++++
  meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb |  1 +
  meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch | 91 
++++++++++++++++++++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/php/php_7.4.33.bb |  1 +
  .../open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch | 35 ++++++++++++++++++
  meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb |  1 +
  meta-oe/recipes-test/catch2/catch2_2.9.2.bb |  2 +-
  9 files changed, 215 insertions(+), 1 deletion(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
  create mode 100644 
meta-oe/recipes-benchmark/iperf3/iperf3/0001-Fix-memory-allocation-hazard-1542-.-1543.patch
  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch 


