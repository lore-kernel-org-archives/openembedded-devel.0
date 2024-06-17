Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8207BC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:22:55 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.55361.1718626969148942260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+4KuJmC;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-630daaec9c7so36719127b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718626968; x=1719231768; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7fOrSzomLcFXfGOcFJpbeZMa1prOTvfmwccUBBk+VQ=;
        b=a+4KuJmCzCHAldycjfNq/Vx0wxC1VSrlisZhUeI5WsDdJDQKo+0NlrMfUwt4syTkLW
         +ZTgfPftDZKFsIWGSEVPltKqmWFE27Xvbbun7bG4IvJ3JWl9LRLmgmxn303VpvN5F/Oa
         KlguxUCSHGcoZdqblew3NUJ3NPF29o5jxHWT7jkMY62Kg6P5BCfRBetxXVkqRbGBGu+8
         fhJBOs0QEsfDNujGBaZxrvKL3/idCqTujew9uCpMjIkrtg86FO9y28rloqvSZEN7BY4y
         bATsdR+MqTXuTk0lNCeAa2Zcw3vpCXtdDJMN+hE24M4YQn+9FfNPXtVg5BA0fJYDbz08
         oWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718626968; x=1719231768;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7fOrSzomLcFXfGOcFJpbeZMa1prOTvfmwccUBBk+VQ=;
        b=gnLTJuN3ViuHMB0Cd62K1ymJhFRUOmrwuI0fv5lvD8yXMAiC9PjQmyElKzzEXxLHua
         krSRAr0H5k3NcbMaZswmg5I4bS8MMHfv+PiCrf3vFqYIXRVtplIFqt2IZq23KmkLmec5
         ZpT51+URiMrTQtj5MfcLwbpy+mtdfjfdZ8sDXYmK0tgqTAJN0sW+EsNMhmPPRQ31X3q+
         uhK9wLRFX5fc1gCL92/GmStvzBoa1CvZLU2VJEJPaoRC27LvdaCOj7r2P9xamoMoMoIt
         +7YJ7qilPzeJVUqpB5tk14LpUAiSZzQCk7KITXR8DkqgMPFGrbE8FhSZL46Py0XcsPrO
         49tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmulDuUoaVg6Mihc71wnm0zzv8O4HiBiLX11wSj0BGji4fALQ+xa0/JZJ2b63DT6riLzc6NY9Dzz14GHFOHTJAMULLVrvA+cEOTsdN7UzVVmkmPGHqVjf07w==
X-Gm-Message-State: AOJu0Yxfe6DtQLL6f+ZwQRl+4K1g6kLLSUEPU6gIAj5Koh75qBNHcO/+
	31FNTkXY6Z2Rr+KQMEhsM72b3bdCdYc0i82JVd6zWHDsME/TQcztbLhfYQ==
X-Google-Smtp-Source: AGHT+IEV7JwoZ2OE/fj9I6D2LPCc2WVzFz9WQSVh1QbSbDnyJeWciJ5mUE6rG76I3UjUxhOFZsuNuQ==
X-Received: by 2002:a81:84c7:0:b0:632:bcd1:233f with SMTP id 00721157ae682-632bcd1a44bmr84184857b3.43.1718626968218;
        Mon, 17 Jun 2024 05:22:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:b4e4:2c13:2414:65ba? ([2600:1700:45dd:7000:b4e4:2c13:2414:65ba])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311a445eb1sm13928187b3.95.2024.06.17.05.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:22:47 -0700 (PDT)
Message-ID: <c7be294f-d3dd-4596-8fd0-76c4410c5778@gmail.com>
Date: Mon, 17 Jun 2024 08:22:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: June 17th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 12:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110940

The following changes since commit 0560b848996a0feb410a8cd8ca07c60fe2f3b5bc:

   ITS#10094 libldap/OpenSSL: fix setting ciphersuites (2024-05-28 
06:17:26 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 8e297cdc841c6cad34097f00a6903ba25edfc153:

   nginx: Remove obsolete patch (2024-06-02 15:16:32 -0400)

----------------------------------------------------------------
Archana Polampalli (3):
       nodejs: fix CVE-2024-22019
       nodejs: fix CVE-2024-22025
       nodejs: fix CVE-2023-46809

Jasper Orschulko (1):
       nginx: Remove obsolete patch

  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch     | 625 
++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch     | 556 
+++++++++++++++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch     | 148 
+++++++
  meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb               | 3 +
  .../files/0001-HTTP-2-per-iteration-stream-handling-limit.patch | 92 ----
  5 files changed, 1332 insertions(+), 92 deletions(-)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch
  delete mode 100644 
meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-stream-handling-limit.patch


