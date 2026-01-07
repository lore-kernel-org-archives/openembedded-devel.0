Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A128ECD5822
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2662.1767779579113120266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Pqz8C5wU;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so1501378a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767779577; x=1768384377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSKyJC+echlWEy5dCoJeEeJ09dQwZ6lsfBC3kSCnw6g=;
        b=Pqz8C5wUtBoQn8wF/v0zUoomozwP6+26b/fML583LYu9u67/G9WFuy/YyHF0TMkkBp
         P/WcfYivNyfjBOBM7xg77XIwrGGhBxiSNe7O6bsLGtP7RS6D5UZqAjlWhfQKhMjWY11P
         7GA41co8WI9K8GZ85R3Ybw3X7oJoIm24BaqC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779577; x=1768384377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSKyJC+echlWEy5dCoJeEeJ09dQwZ6lsfBC3kSCnw6g=;
        b=TYn0/liwn2TRvTFnPPlbUS772e+tPHIshRWVoIJORp7L+yX2gUAoPAL4K5J4dRXqKM
         TdpdivZ3xAdoWolPQL2BEx4yeNriuKtSV7xtWY+Yh5kXsrHuhreL8eoLwzDodSjYhwaQ
         ocV4mBdmamGatz72d2y+nIr7L2OzYNptkTgDtmJUBtyqql8dgNHlJ13RsLLtTPCMEZd1
         4+96e9ow5S8KG48yFNceWTEDOZvSJBMhDEA6uJsNqOeJW/Tw62BQoFdt8H2U7eGKntz0
         1pJuZtW3o7ztn0LBujc4r+PytcgybjcOoD52VjrTzrS2bOtLeENtnZtYCYphm0dC8Fki
         NaCQ==
X-Gm-Message-State: AOJu0YyeByqY37SgaYWEys7VBAauYIpNwrO30NxALj0bfgz6vktCt+mB
	dwKUNNkmQbk9otbHtVooiHpfTV2f3FY36gmQAzyaz/qyViDHSyuX6Z3e88sZya7xs9Sq/VtsLGk
	4XahV
X-Gm-Gg: AY/fxX7XzHoSCNSOyGO9j4eIU1oldhbG9pgC4TaQJGEFpOjsfCYkIQ/oT5E2de+/Dc0
	DrcVwi1BFc1jfUGiHWWMO8RVubRzSC2jTNq7UUc4RTmbcPH8yUR1uUqD5vpuJ+50T7vhd82xPYQ
	BbKSTPZ3de1qhSLwvMOQL3XZXkk+/+KiltaAMrdRqF6W2B5KGjUQ5kJm5muJ0/sQo+fl8qRCr9G
	L+A8h8l80faKXH/lpW8bcqZDYD/BT760MaoY4Vipn4cS6nPLIVw9WEMC0Sd9Ds7Urs9ZKjd1SVT
	onTzvqnYNw9Hw3GNjCr5ZO22bGnRDY+bOODbgjswAtNiYCTs3yrcZJjPG1qSlFFbc0ClSZry4Tt
	Ehf7wOzW6/oIZ+RtNI1KSOlHt50EgRs+NC+7MofP+advD65yAKKUTJV93vbVHk9M4UdGh2VVSSi
	TD+7+rrUXidazVhVhhmG3iGnpoI1lUfEXNiVc=
X-Google-Smtp-Source: AGHT+IEL3kZYrqi7fhnf8C5UDOQXRVpXAtsrHlqGbyAqA+pz5YHv3oXvsb3uf8pH3CP+3QqmJR9Mqw==
X-Received: by 2002:a17:907:3e20:b0:b83:fccb:c0a8 with SMTP id a640c23a62f3a-b8445345d01mr193848366b.30.1767779576899;
        Wed, 07 Jan 2026 01:52:56 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm72327666b.15.2026.01.07.01.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:52:56 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-bleak: Upgrade 2.0.0 -> 2.1.1
Date: Wed,  7 Jan 2026 11:52:49 +0200
Message-ID: <20260107095252.1351613-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107095252.1351613-1-leon.anavi@konsulko.com>
References: <20260107095252.1351613-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123192

Upgrade to release 2.1.1:

- Changed default connect timeout for BleakClient from 10 to 30
  seconds.
- Fixed some cases of BleakError: Could not get GATT services:
  Unreachable in WinRT backend by adding a retry when getting GATT
  services.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-bleak_2.0.0.bb => python3-bleak_2.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_2.0.0.bb => python3-bleak_2.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb b/meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
index 161b21b88c..e3725afea0 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "718e5d76cd051910a9d5266266af632c2529c03c"
+SRCREV = "5d76a62a549a4674c64ee151d38e2339e8ba948a"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
 
 inherit pypi python_poetry_core ptest-python-pytest
-- 
2.47.3


