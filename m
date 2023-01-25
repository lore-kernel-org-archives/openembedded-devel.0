Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E12C61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:30:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.44835.1674653449782455665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hsnkdQBc;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id qx13so47556704ejb.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymS32/1b+nmJNrJW/RZAwTGdCCf17IrvGq4QBHqS8N8=;
        b=hsnkdQBcD7eFjw4+De+Shok2pBNhZe137MOe3ytLjAalO57/mOAiGRa6FP9T7/c8KE
         n4vuYyLWeJ6UeJsxyhv7Bghu2LgZaWVXWkSEdh+LgbgzCRHznsJqLuIAAM11CbB5FRZB
         LHYhbBQ9j6kQ1HIXKnjwj39cvhrI+lb9WjFYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymS32/1b+nmJNrJW/RZAwTGdCCf17IrvGq4QBHqS8N8=;
        b=Xzu1DHnIyteQ5EogiV0kwA6xynjO1a3FTuq33JgNoPaHiYxLC6pD9gfvcztCQhS9BC
         RNUHgu8RhYcsXBlFAtj73m+Ga1SIlY19khCgeh6Xvirn8pWE+jmbDHjY2IZPVDCblldP
         OHxa1y4c4G1DewZwHpRGIolF0K0LuDMWONhX6cGOoxxhTd2wOlDWbOsDEf7JTifQ1E0s
         bePJPAMaN2eAwUA9s2h9SiTqyAsbncxRf7hWimXsYSMAhSHchcgh9z0doWRbowBPiBtk
         KB61GuHLCQ+ik04aDoCnM3E8DMHIbINtiK0G3uWjnIue+iV7l1U/DKjb4Lg/pp29J+r4
         UXHw==
X-Gm-Message-State: AFqh2krrbjQPk25QC34dItiPbiPE5uO0lfDU17UDV/c/1/g0l6GABqR0
	SaNKETt0TkzGYBvGcIgBWgm/cyMp2qhFdjGi
X-Google-Smtp-Source: AMrXdXtgfZ1nCNMQLcub7IGzSmUJCLc4Jwz0e5e+Ca6IAQD1AcuVVYE3g6Vj7uYUkKRVqs8FS4sRnQ==
X-Received: by 2002:a17:906:16c6:b0:877:6141:9b16 with SMTP id t6-20020a17090616c600b0087761419b16mr8714507ejd.54.1674653447780;
        Wed, 25 Jan 2023 05:30:47 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id g23-20020a17090613d700b007ae32daf4b9sm2382648ejc.106.2023.01.25.05.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:30:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-email-validator: Upgrade 1.3.0 -> 1.3.1
Date: Wed, 25 Jan 2023 15:30:42 +0200
Message-Id: <20230125133044.2331059-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100732

Upgrade to release 1.3.1:

- The new SPF 'v=spf1 -all' (reject-all) deliverability check is
  removed in most cases. It now is performed only for domains that
  do not have MX records but do have an A/AAAA fallback record.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mail-validator_1.3.0.bb => python3-email-validator_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_1.3.0.bb => python3-email-validator_1.3.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_1.3.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_1.3.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-email-validator_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_1.3.1.bb
index 76dfdd601..2350c4d75 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_1.3.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
 
-SRC_URI[sha256sum] = "553a66f8be2ec2dea641ae1d3f29017ab89e9d603d4a25cdaac39eefa283d769"
+SRC_URI[sha256sum] = "d178c5c6fa6c6824e9b04f199cf23e79ac15756786573c190d2ad13089411ad2"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.30.2


