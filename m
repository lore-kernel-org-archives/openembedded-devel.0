Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A99C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 13:00:41 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.100700.1680613234581729446
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 06:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=YXGyh1EF;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5419d4c340aso611568847b3.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680613233; x=1683205233;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQD7fVezyDcNLFz2gDyGxplUxbGXVxuMW824EkzplgM=;
        b=YXGyh1EFFyh6IWbf+30+a1neF8h/4n0+jX5KNsykc3PCkFEjq82Qr8v9QFXbdQMp0n
         HlHJV75SrXPCViCSZ+hHT4V6gjUw4/s3HEq9d2tGTE7RLjsC1gaR9jIIf0tbP506ue33
         Ee4hz/OjzKLRV0iiutoHyFlcJhMOO/pwF8YDGX47yEmCSByItE+0M2AsG7/Lb3CRz5hI
         c+T56U607qDig6Z8xg/BizpQlpW1Ok6NGJo40Kf4lAegERwNPn4t/kKkG3iZthConmZo
         e3QllpW6GNXkO2Z01uv7rjjPSRsfjCqio/xFssm/yjdnkMLJDdbVvkNlAPRZcpKfkGxN
         ezWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613233; x=1683205233;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQD7fVezyDcNLFz2gDyGxplUxbGXVxuMW824EkzplgM=;
        b=InXlXaobpPwjEWhQ6NUQ9cP0jJYRE+DtWtnS61lLDhkKNxIjP9/xccFAVCC9W6wIx3
         /O6Wk/bPWL3AW7usfrAXtpf8xcS3GgwmzC9k+goupTydbm8XGoWPueDLK9X+b2/6wnt2
         cWXIaKw23nTuDJgznDUe/zqXrkFMSDWkLMobfIujPcYwXXn2zX+uyNJsYUP7ZNDg5Vpo
         bAzcvFXDRtqop+r4RDsKCGI2hCH5IxVv3i88oHbRb97y1DhAyWfFRP9WT5KiGW1OYJFc
         XykR5jRxsL8nAj1/JsH4riDdYLvWhfNMlDeIoTJK4yWQifUwNUezWQMhdzaejT4o1JI9
         tLkw==
X-Gm-Message-State: AAQBX9fpCUtNPUaitOVPWGR2FjiLMivlcKPf5ElAWeukM9QPRq0fym/n
	SkrFmUNrLaX6N4Ev0FJG2YI=
X-Google-Smtp-Source: AKy350aWx4DRXxcVXIdZu46wAUMZnTyKkqm0xFymiYq8ic1QYOl5U490oOeaN5P5mQeWaB4vR7eMtQ==
X-Received: by 2002:a0d:c5c7:0:b0:541:66e8:d4da with SMTP id h190-20020a0dc5c7000000b0054166e8d4damr2064386ywd.29.1680613233119;
        Tue, 04 Apr 2023 06:00:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:36a4:266a:a865:5f55? ([2600:1700:9190:ba10:36a4:266a:a865:5f55])
        by smtp.gmail.com with ESMTPSA id cd7-20020a05690c088700b00545b9498c1asm3155152ywb.12.2023.04.04.06.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 06:00:32 -0700 (PDT)
Message-ID: <2cfa3a10-db72-7ea9-0a13-d1ce1b6b7b2b@gmail.com>
Date: Tue, 4 Apr 2023 09:00:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: April 4th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 13:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101945

The following changes since commit 3f9340a9241d497753b330d90d6a3d8332c1ba7f:

   mbedtls: upgrade to 2.28.2 to fix CVE-2022-46392, CVE-2022-46393 
(2023-03-21 14:37:51 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to b4ff73905b887cf7c489248de80dab2721090cbf:

   dnsmasq: fix CVE-2023-28450 (2023-03-25 09:07:27 -0400)

----------------------------------------------------------------
Peter Marko (2):
       c-ares: fix CVE-2022-4904
       dnsmasq: fix CVE-2023-28450

  meta-networking/recipes-support/dnsmasq/dnsmasq.inc             | 1 +
  .../recipes-support/dnsmasq/files/CVE-2023-28450.patch          | 48 
+++++++++++++++++++++
  meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch       | 66 
+++++++++++++++++++++++++++++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 4 +-
  4 files changed, 118 insertions(+), 1 deletion(-)
  create mode 100644 
meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch


