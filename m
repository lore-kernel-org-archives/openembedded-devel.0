Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A567C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 15:38:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21999.1784907480721376921
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 08:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mkzipEG9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so651080f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784907479; x=1785512279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLA8w/bVr/sP6uvbl3a7urx8szvAPS9wKe89dxausqw=;
        b=mkzipEG9oJ95gXWzBeFJUn++zuWRrNdIVJivR7gkiUHaEM/BO5bdMUyndfnfBm77+1
         Eki1g/sW5Kv7Hj0Wdg9CKSVtUvxt/rMKP/4j63VM3n/vXKfSdmkysKzK+ZD+CnIFEbNQ
         qXy1mLOazK3Ad/SeaBJhfapOi38wL1YYudTCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907479; x=1785512279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLA8w/bVr/sP6uvbl3a7urx8szvAPS9wKe89dxausqw=;
        b=JgmKNto8GI/BPg5a8UrtmAF7CadGONLaK51lf3eJdQfhnV1ZPGdNaavTLWWf+29D7q
         7DqtYRQmaKLSPttgw7K+VNqijpjNzALGbkHjLb2NN+Nl74YECb4Z9xENfUc/2Kh424zH
         +CtKy9USdl4I1b3kgzgILPZ9xVOZAaPyOWLs9B8cAd3gC1GsnjnoERgyh6QMEXG2rO8M
         Yb3FzPjauy6yAHkeibLyINn1PtwTamnCVw2ymfVyK7qjUEv//F8Dzt7F4T3qu4JPxhsm
         ejBe8dWBV75Ivn9xs41+ShzpQ2+KPc8yj0D0Pc8+hm/oUZjO/3lpwNT88YsovB0Mvn3u
         o3xg==
X-Gm-Message-State: AOJu0Yy/nYIJfsC6L619Mq2gWmDisdZIsgc+hko5Jjd63gY6KjRp8tIC
	Wg+OyGeN/Axu0GH8QqbYKc6C2qzUzfgls9egoHslolT/6bcsdH9/sQbTit3nVbeGtdIJglUox6P
	JuyZi
X-Gm-Gg: AR+sD115CXKLy5kN3Cb+BbH8A+TmeTQgCxRxT4KuQOb1gkndpUjGOZzuakmfU1xf3b5
	HrTljmFeEXLiUvTS3ivO+Hx6MzgZwlwH2Dy9GVsIibt46ACYTbVo6iZMxuL+PaPsUHAcUTohRAD
	uhERNU5b4v5o8WenaVCA0SFLKP2F69DLVuMI0iCRw/WBRy7OmfQoAkOOSi7OE+NFHi216O89eWB
	SLa+YG/yLvsXnRncoIN3rXaf4zEjBEC+ykUcT2UenQCx9U/ov2hxFrbdRgTWe8FF1tYVEOnHwAL
	Wb5+8gLTvVZqoufhW60wwgR92NI01IVL7SJ/CS6+LoFzwMT2qx+eoLrjoQWuqi2kIKJbIfU5x+8
	BBUjbyZOQKl+yCTRtKaNvPjM7QE5IK2/ZLxlZM1mjLwwTGWb3Vs7AKnbxWxthww+LuIWAvyPwCj
	L+O4xmSNiNrxv8lmtmqCJTr0vJP0p9dtMp4fXB0EelKVfqyI5G/A0MNcNR071ya4Idxn6i8SEPq
	fmRhyCZwHbB4Tg8ux+HFtGA4LVHL7zBAsFY1QHIaw==
X-Received: by 2002:a05:6000:260c:b0:47f:96e6:6e3 with SMTP id ffacd0b85a97d-47f96e609bbmr3979986f8f.23.1784907479004;
        Fri, 24 Jul 2026 08:37:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm23839780f8f.29.2026.07.24.08.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:37:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-faker: Upgrade 40.31.0 -> 40.35.0
Date: Fri, 24 Jul 2026 18:37:54 +0300
Message-ID: <20260724153755.2259698-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724153755.2259698-1-leon.anavi@konsulko.com>
References: <20260724153755.2259698-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 15:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128440

Upgrade to release 40.35.0:

- Fix: add correct bban_format so ru_RU iban() generates valid
  Russian IBANs

From release 40.34.0:

- Fix: correct BBAN length so da_DK iban() generates valid Danish
  IBANs

From release 40.33.0:

- Add alphanumeric CNPJ support for pt_BR via flag

From release 40.32.0:

- Add allowed_path_traversal_elements option to file_path()
- Fix Windows file_path depth=3 test regex

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-faker_40.31.0.bb => python3-faker_40.35.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.31.0.bb => python3-faker_40.35.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.31.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.35.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.31.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.35.0.bb
index c3e5449a46..a951d60ae8 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.35.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "af163a937aec99dca5abaeb94dd5008c51c26c6e9af1a26c8db4b3c4e7ca4403"
+SRC_URI[sha256sum] = "13495348ec6f80d22c8c1654906ffeae336d485fea476544642ea24b120d9e13"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3


