Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9573C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 12:31:30 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.15690.1714048286850649398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 05:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PtPGNHTb;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61ab6faf179so9097527b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714048286; x=1714653086; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgWE0wlSolt3cW6RTTwrlQ9WPp8YEBD9AcvAZ7zhQHo=;
        b=PtPGNHTblL34nIanb4G0R6iKtm8Jes0jpTA/Y45gTV9Mk/JhH7eTLv+8EUbTymZQrG
         J6aiWH7+QjxCvE7fvN1ZMvU+nmMkCX3sCUEvjMzr1JBDx97PsA4vXlCFnq8nGlyTZxQR
         F3Gsl1D4NOcAtUyzu4xEhc0KuhKPzUt+Ewh7Vxh427CM0XD06mQua/b4EzTbchZZ9WpJ
         DpOuQ4vtbqyhXMe/qGmSSMynHZbew5JM/OdfqRNDzcUKMwW4S5vvjWAzi7VI7DGnDsdv
         lRcZTR+VwgZFPmkdKsmbkuI7alPyB1u7EmleERYn65w/6reTEbFAqIpNniYK+xmPB8gL
         ZWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714048286; x=1714653086;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgWE0wlSolt3cW6RTTwrlQ9WPp8YEBD9AcvAZ7zhQHo=;
        b=KKglaa6CCJR4aS+26+80Mde/JguJkUsto/gWiwjBSCYl8ibXrsl/twF6OrtW1aluj8
         0tdES+LpEVUjp9QnNzcLXmv42JIUNhw+acOyPQmB50Brqh2qc67u6MJhwm8Bb0xsEs1d
         xd2PHw6TzTGiPLl+7PV90zy1tv/rvf5nI3ZGLTjoZ7nqbtYC8OfE7ftum1fr0JxA6IhR
         21oXOaxjLxgX63gQnHsNTORCWkbfBc6yAqfR8eGwCz/jgywXIbZnkMmgM95epFlV89+Y
         WAQJTvXOJ+nRicHkwHc4sZr4800o9U5GPDDElkpYpv0rZ6LlVlFHLOk3fxXzhGKpHBzP
         8TAw==
X-Forwarded-Encrypted: i=1; AJvYcCWpYIEtlLJ+9q0yW++oewtCKQ7cOkve/60dROIDx206LaUnvDRpSpnSPC+wte8As/TSGUuNXbmi7joJVYva6ZfcKbIpa28Vu2VjglD82+6wO4WWgvJesxtB+Q==
X-Gm-Message-State: AOJu0YzNPbTv+ZYg1pfvrGlafVKrD/QJIqPvuFdqLcR22FhDgfoaY4D4
	EhWyYBfQ1YgTAJsx8J8QLDEkGHVLeuVZidBaz3UNt3LYmS7XT9oV1MpZcQ==
X-Google-Smtp-Source: AGHT+IHYm1BzwfVrxEgr9Pk/4wc6YE61nXmQ8QYZyVBtFBulVohXA1AEKwnSah6I/hbXF5v8yz/KIg==
X-Received: by 2002:a05:690c:360f:b0:611:191e:1de8 with SMTP id ft15-20020a05690c360f00b00611191e1de8mr6741736ywb.18.1714048285912;
        Thu, 25 Apr 2024 05:31:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:9865:f36b:a613:88e9? ([2600:1700:45dd:7000:9865:f36b:a613:88e9])
        by smtp.gmail.com with ESMTPSA id c10-20020a81e54a000000b0061447e2be82sm3076486ywm.51.2024.04.25.05.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 05:31:25 -0700 (PDT)
Message-ID: <67e563c5-65d4-4dec-bda7-8cb82d393067@gmail.com>
Date: Thu, 25 Apr 2024 08:31:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Dunfell merge request: April 25
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 12:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110152

The following changes since commit c74ebbddfd9dbe02d3f7422016324451eb218e1e:

   python3-pillow: Fix for CVE-2023-50447 (2024-03-03 16:38:27 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 01358b6d705071cc0ac5aefa7670ab235709729a:

   wireshark: fix CVE-2023-6175 (2024-04-25 08:27:27 -0400)

----------------------------------------------------------------
Ashish Sharma (2):
       c-ares: Backport fix for CVE-2024-25629
       wireshark: Backport fix for CVE-2024-2955

Hitendra Prajapati (2):
       python3-cryptography: fix CVE-2024-26130 NULL pointer dereference
       wireshark: fix CVE-2023-6175

Matthias Schmitz (1):
       postgresql: Update to 12.18

Vijay Anusuri (1):
       wireshark: Fix for CVE-2023-4511

  .../recipes-support/wireshark/files/CVE-2023-4511.patch         | 81 
+++++++++
  .../recipes-support/wireshark/files/CVE-2023-6175.patch         | 246 
++++++++++++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2024-2955.patch         | 52 
++++++
  meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 3 +
  .../postgresql/{postgresql_12.17.bb => postgresql_12.18.bb} |   4 +-
  meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch      | 32 ++++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
  .../python/python3-cryptography/CVE-2024-26130.patch            | 66 
++++++++
  meta-python/recipes-devtools/python/python3-cryptography_2.8.bb | 1 +
  9 files changed, 484 insertions(+), 2 deletions(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.17.bb => 
postgresql_12.18.bb} (51%)
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch


