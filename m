Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DBAC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:30:12 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.14342.1749036611040418979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRnak2fc;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-710c4320bb1so6951237b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 04:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749036610; x=1749641410; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JG8xM7fPjpRclSSgqj3FAaLBXl5jE5uBxgwYq0UE28g=;
        b=kRnak2fckdKIL8UWdcoqg6f1cC3eacezqCiqjMcA+g+cWgsUlpryu268HmM3lTa190
         jEzQp+SDVcZ9aP9xrWLI0T6PWo7flG9xW8Kz6tQsPnWzL38zP688TGg7xB/em/W0RK2t
         NzPatwCMfPDrQalDnfGP5/6KZBSh0zRCcbVhVFMqoagtvM72g81r0tDxt9C5D9mcDWhy
         8aYbtdqPpe+zjvxm4rnX1mfKzxvQTYwfeu4HBak4pdjFakhdxh0/nWTiHh4f1mm1Y/vL
         sur4t+8E4QR8ZyHczyfM2cGAYCyLdqanGycR5gdEJ8XIppNeqHYHV6ua4H6gP2VY/DIO
         dkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749036610; x=1749641410;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JG8xM7fPjpRclSSgqj3FAaLBXl5jE5uBxgwYq0UE28g=;
        b=J9K8PGtO2jF0xnKuxppkVE2Yowh/4PjS9R1hgOzZiO5YHS+5QqVn+2Kmko0nDqGNa/
         gxUxsTYUSa+mWFnz9AjiAOAUWvfpGIVlbWWHnUM5cPk5sjtcmOe4ZQpBxtNNnsMsgyXj
         Bq0M0UrP8vT2DDv0lP9QZLI0+b3g8Dn/EEePVQAT3QT1zHEUbhd6Ge9Ln7/Nmamhv23c
         kLwsKtsksALGEJ1A/xBA7izH0D5kg7ijJIK5+VQ8FmyPLnqFA1mD/WqSGcxHNadMeyQX
         LvRSBDgPNPwUUix7wwirruMU6YyD71LQJyfnfRDyQPn4W5WQqZoxY3DjxoFbr1Driaat
         rr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4PNj0rcunxOb9urVTQOuDn+GCkOJYBiPDFooNzYl2hvFblBCOIkyi+wi6LXnDrzjCcXe74FFBIghudM/RvUP1znE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7/uZ0DE5AfD7xhXcDrdb0Erh/PoJ+YtMWdhW9Y2tUPqUe64Wg
	DPmeL9ltmqca4Nut7ytQkoZGBG8f2sX6KHxQ90D5GZhYs35uI+eAQa4tytGwnw==
X-Gm-Gg: ASbGncuwYkZ2QRAmul8qs8OqGwJ8frdpxXXC8WmTK2kpHQ9MSqHuPM2FOn2IqEDZzYo
	wk7uAjy7G8iovDhCrLD/vYaUomUb8dMKM2pn0XkMIZhdymjYOyo/ktA6hylwKd5lx707vTdEc9a
	xxTQzsxueA38QCz1gmKQvX88vbJSDlLEPCt2OuY6EfAdYotrmoZsErEp5zUBcri+CF2jQHAaz6c
	eY+ndYzeVj3aJzF3Ai7M6sFxgtxRnveMV17BJJu+USUgpWdod+OyO/ONiuuUnG/EMTq3WmWtc+s
	0wuGCWu5Wgz27DpB/99K9bo9V3rmBinFzzQ0lA8eJJDtgUK8DrEVBdUDTbUDZWi4qrPm3OarbWP
	woJl9/Irwx3E6pUNtKkQIQsSnmL0=
X-Google-Smtp-Source: AGHT+IFrAMN9TiWv4wwxqHj4OBZTYvhuw3EfT9P8dwSqp7atCmkHHyyq/sE8RdY8V0jCUmeN7ibK+w==
X-Received: by 2002:a05:690c:380c:b0:70e:2a7a:4c52 with SMTP id 00721157ae682-710d8c09afamr34684797b3.1.1749036610083;
        Wed, 04 Jun 2025 04:30:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:415e:ae21:75af:204e? ([2600:1700:45dd:7000:415e:ae21:75af:204e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710dfc1f39asm1234377b3.71.2025.06.04.04.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:30:09 -0700 (PDT)
Message-ID: <54a40e2b-8aa2-4cca-84b2-cf1b3ccbec49@gmail.com>
Date: Wed, 4 Jun 2025 07:30:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: June 4th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 11:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117737

The following changes since commit e42549cef364ae09b3b7c8b64bbeab32e50f1bb0:

   net-snmp: fix memory leak (2025-04-20 13:43:55 -0400)

are available in the Git repository at:

   git://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 45bddd258a3d1ded925faf8389e01bb948dc7f5b:

   poppler: fix CVE-2025-43903 (2025-05-25 14:48:44 -0400)

----------------------------------------------------------------
Soumya Sambu (1):
       python3-twisted: Fix CVE-2024-41671

Yogita Urade (3):
       poppler: fix CVE-2025-32364
       poppler: fix CVE-2025-32365
       poppler: fix CVE-2025-43903

Zhang Peng (1):
       frr: fix CVE-2024-55553

  meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch  | 304 
++++++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch    | 28 +++
  meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch    | 41 ++++
  meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch    | 54 +++++
  meta-oe/recipes-support/poppler/poppler_22.04.0.bb              | 3 +
  .../python/python3-twisted/CVE-2024-41671-0001.patch            | 33 +++
  .../python/python3-twisted/CVE-2024-41671-0002.patch            | 196 
++++++++++++++++++
  meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb   | 3 +
  9 files changed, 663 insertions(+)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch


