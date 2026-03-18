Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184F2107760F
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 19:36:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22932.1773862560786673280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 12:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwDhNkHv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486b9675d36so1758675e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862559; x=1774467359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3/R2qjWp8pa8+SVch8u2Wgyd6lpKmt+nq5sUUQLXSA=;
        b=jwDhNkHvN4jAvUBm/6URU6S1I+ygC1e8lk0Tqt1P9tV6wvZYhjmIrNCpovVCxqQ+E/
         YeXwaosRrEit4kUqPAkOLBszeJjTPpoC//I0VtVULcK220TeSJ9hFUxlxycxhKvpD13g
         y9Db3hjyxPLdmqn1pPlsLFMuZJWnjflqDN8E0y4lVUCzkBYFdhs6KnvX5HrPD6SoeNaF
         BcuY0VnB50ti7lNK7kHEfa9lAfSosbAvimHQ/Q7s7n7dLjrYOtiTSxUNNh/3ibT7zaQ1
         bQfCAgJ7Kfk8I04yRfxEUBclHqEkJKvP4uHLdUafkxjhDdemSxyXoK5LV/O08o7AA+MK
         ElRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862559; x=1774467359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3/R2qjWp8pa8+SVch8u2Wgyd6lpKmt+nq5sUUQLXSA=;
        b=K/z1sI2jEMyadrygIzP1KmdKy7Km6qx/2jWIHyVQt1YJxj8EC60IH5PSMHGQOFgnvn
         CbygA44muNkmyOodFY2JKgrVfQdDB5IxJ53vkPi7Wzki6B54vi5ich+WpewFJCA4E3qB
         d27RTHu9ROPNKBwzLgR13smK5IDGjEvl3kVe41bj6JAYQ58WwmPJnTtUTjK2mD9JdT3g
         YzffaUVfODWh9aN1NImh6mB5HTwU24qa8gMDb4ak5NeTfXYhaYn93KHSCWEKEFgCLAe0
         V0Dn5mio8GexWsnw238PT6ncd5vCh8LPFt/hhyQwd7BIrnMwi1B4WmAa36vXdVHoriZo
         A79A==
X-Gm-Message-State: AOJu0YxCiwTODdbbvwUl4wgGkNxKLWJ/MQReFuEIqaVcAGpmE/b7K0sQ
	6iqMJSR051/8uagaX41sOFlCUdFi/LsnbXiSTgUZrB0jQF5d0eeLlebwQna0kw==
X-Gm-Gg: ATEYQzxAvFs/kUmxh63ktjYLk7DEq2B8pXHoRVIWiBvaj97FNW1ZgY9GviCV9e7Lk69
	H+D/UZPruOocLj+pO4pwc7e14cNNa5C/h3rTBp8QsW4F2lR2qci5fEFACXg6FOYxlVfF4hd45J9
	loLgZpL742eZHoQTW/tGS6t89J+9PrR5FKjjLRMGUY4vscdwInP0vuL+ErRqF7g/3e2tKgH/hc8
	hv1tCDjDjgGBkJwod7v2dKKQ4d7jIWjrOq2Bftm4C5W2ZGO22Zn5WQk9udtwP6vTCY8r4zztKRo
	0kHcJc1vZJi8cl2fiP2HptDn2fWli/NBFZeN2g4tUM+q3RFIvWxzhRb5fCgmR/kQzw4MVDbM7lO
	GIOE7a70ud8L04F36WI4j0HhxuY5hBU605JQHk/+zqsVdFa7fC63IE1cbY3s0f/qAHh/HiAuX+Y
	DYbM9HkhPP4aBrpXW0UHXp
X-Received: by 2002:a05:600c:3f10:b0:485:3af5:7e53 with SMTP id 5b1f17b1804b1-486f4448577mr83767425e9.19.1773862558915;
        Wed, 18 Mar 2026 12:35:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm14486505e9.2.2026.03.18.12.35.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:35:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH] python3-marshmallow: mark CVE-2025-68480 patched
Date: Wed, 18 Mar 2026 20:35:57 +0100
Message-ID: <20260318193557.3163899-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 19:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125363

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68480

The vulnerability has been fixed in version 4.1.2[1], however
NVD tracks this CVE without version info. Mark it as patched explicitly.

[1]: https://github.com/marshmallow-code/marshmallow/commit/d24a0c9df061c4daa92f71cf85aca25b83eee508

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-marshmallow_4.1.2.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
index f3a905a36c..f058bd7123 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
@@ -30,3 +30,5 @@ RDEPENDS:${PN} += " \
         python3-pprint \
         python3-packaging \
 "
+
+CVE_STATUS[CVE-2025-68480] = "fixed-version: fixed in 4.1.2"

