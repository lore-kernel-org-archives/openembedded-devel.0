Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD8BC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:34:14 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.12389.1705408452482565842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 04:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxR9S3qZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ed10316e22so88577267b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 04:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705408451; x=1706013251; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0X4rMmGGy0EUAJShYleNfB36UEsg3rwu2zf34bWQ1Q=;
        b=GxR9S3qZdsZ960Hbn4bs8B2ck9ThpAE8V7RQlbmfekCz8rsolfMZF91lNmqZkyrRZn
         HcRmyIalGd3VzIqxSZUwuIz4t18TTfB4RoCSP3C5lWqwZ+0yV1kBfJ3JBg4n8xQqbB3u
         C01BuiRuW9J+OqyqvklI9aD79+Vs58MaQXXxYlH4hy4B4ENpvOP1QLh/LNaVJiFFUGf4
         z+uPS1z49OndRs5qfYgcwSWB9VPmT0Q+Only1oogRYEhrKBNOvPVgUT5GJ93QHuk+ocW
         +YKPYqrGuw3EaPqNyw2z4Y4QtFm+WOODXSBn18nirgXV0WU0G2H7k7NfB9B2UXGBNjy3
         ZoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408451; x=1706013251;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0X4rMmGGy0EUAJShYleNfB36UEsg3rwu2zf34bWQ1Q=;
        b=qM9vYf3MbgNs4/isQf72Oe+uVjC9V4GhG9BiwOKPFWRTU59hJtA9zs3zb95+eIWiEj
         V07W0Y4175b++0AKrGgMk1Ow+bCDLTMEoRAPopzeabGfZ/Gns/E463Cvy/8Y+QcIpERL
         6S84YEfHD9WiX38/eTbe1tfoJ2yapTeJ2+TE9Zoo+rdLY69Q5Q4v4mfhM8J/qgnl+TJ2
         4UgWfNLdTsAHh41XqYCr+ETdNbLVrlgVGqX26R/uDrmNWkFHc3JarCJBnU75neNZpAsP
         IxeZ0g3Uooroluh8EMEugWZvL6s+DnFrr+xgEw8iDKSVWB3IUcxmCGLwLechZtX2qFVs
         tNhA==
X-Gm-Message-State: AOJu0Yw1wozWofY3VCETZYi+mHSi2tG0SaD1458KXq0+OVAhUEIK9BIn
	oN84OW9vYXgZN7NQ6B/zS1s=
X-Google-Smtp-Source: AGHT+IEFaFatgILtBtdFUEKB8a8QcbiJsedwZbNG+dTApIZpm+6VDYUeTMr05m/Z4xz6Z/cssF8rMg==
X-Received: by 2002:a81:b607:0:b0:5ff:4c50:1010 with SMTP id u7-20020a81b607000000b005ff4c501010mr787780ywh.35.1705408451607;
        Tue, 16 Jan 2024 04:34:11 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:da88:1700:b0e6:e4bd? ([2600:1700:9190:ba10:da88:1700:b0e6:e4bd])
        by smtp.gmail.com with ESMTPSA id o63-20020a0dcc42000000b005ff407a35aesm962108ywd.84.2024.01.16.04.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:34:11 -0800 (PST)
Message-ID: <3c5ecef2-afbe-4dea-92a4-b79a0bb47a53@gmail.com>
Date: Tue, 16 Jan 2024 07:34:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Dunfell merge request: Jan 16th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 12:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108301

The following changes since commit fc632d5bb0936e91e4e0191547b9aa8ca47b4ffe:

   wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka 
protocol) dissector infinite loops (2023-12-17 15:36:42 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to daa4619fe3fbf8c28f342c4a7163a84a330f7653:

   postgresql: Update to 12.17 (2024-01-16 07:31:14 -0500)

----------------------------------------------------------------
Hitendra Prajapati (1):
       proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read

Robert Joslyn (1):
       postgresql: Update to 12.17

Vijay Anusuri (1):
       strongswan: Backport fix for CVE-2023-41913

virendra thakur (2):
       opensc: Fix CVE-2023-40660
       opensc: Fix CVE-2023-40661

  .../recipes-daemons/proftpd/files/CVE-2023-51713.patch          | 278 
++++++++++++++++++++++++++++
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb        | 1 +
  .../recipes-support/strongswan/files/CVE-2023-41913.patch       | 46 +++++
  meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb  | 1 +
  .../postgresql/{postgresql_12.16.bb => postgresql_12.17.bb} |   2 +-
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch      | 55 
++++++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch    | 47 +++++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch    | 32 ++++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch    | 31 ++++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch    | 28 +++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch    | 30 +++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch    | 30 +++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch    | 40 ++++
  meta-oe/recipes-support/opensc/opensc_0.20.0.bb                 | 8 +
  14 files changed, 628 insertions(+), 1 deletion(-)
  create mode 100644 
meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
  create mode 100644 
meta-networking/recipes-support/strongswan/files/CVE-2023-41913.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.16.bb => 
postgresql_12.17.bb} (73%)
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch


