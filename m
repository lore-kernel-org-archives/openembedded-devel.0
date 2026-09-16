Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84486C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:58:28 +0000 (UTC)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14995.1789565365999997572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 06:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@b2open-com.20251104.gappssmtp.com header.s=20251104 header.b=daRsGVgD;
 spf=pass (domain: b2open.com, ip: 74.125.227.43, mailfrom: cleiton.bueno@b2open.com)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78565b4db79so435851137.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=b2open-com.20251104.gappssmtp.com; s=20251104; t=1789565365; x=1790170165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AgY10jdC/lhWruxm6XFAuVTQz32OrCpo2+sNUkbfVpI=;
        b=daRsGVgDZ7VOTpIx3tEDbt4FQdxpXkeHF7vFa7v9LBIINnJZ3K7Bf79hm7zC8vGNHh
         bsnHBXFXG2hwvaxpIPo64yjQ/xLToSq9xeyvp0KZmXMjLgjA+rjcW6G61WeXjntm1KJo
         kYxxCCiGGJjZ3XDwwTKIMx+1B6It5mWkwqhOiuY3ImbnTAZK5MmnzCaxMjxLB/XhPXVi
         YvErtuEPd5vEdq3KPO6eUK/2B9ytlko2K33HLqBKqN1CqIwuxiotiQ3LN7lgZstcx69p
         QXmEVo2gOraIRSqWHYjCzazkoUVUmILPcaydnlox/N/uDs9Ug4WIkgdXw3aiNTZY5irG
         S3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565365; x=1790170165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgY10jdC/lhWruxm6XFAuVTQz32OrCpo2+sNUkbfVpI=;
        b=MSBm1IhMffw9eJ/v6pthm4MdUxgUftacZXghjD78t49mTsS/fn48rq7Xo0IDYWTOjM
         M9Pcw/gPd+DFba2IQEAfiXo9ZuvVybpT/nwL3wzcjNEqg5i/pS0SoBqQg5cb0Gst9YAk
         qRawPNLEFzlSKfKrPWxSxBJe5t0UfPIgwOkJCTuw/t2BZv1MT1zCeOdZX8BxoRKgmpxM
         mPssJLGrVIlJXSHw2+ikd8X9Ri0kk0miHINGPXC9xuVhi6FIx6OGtv2/C44bHqvX7HR7
         MStQKW1FNuUMGqkQZUuoclbP+JxRZi+LO611fSyaEg6N4P866qxrBNiaQfM8clG7N9I7
         GRsw==
X-Gm-Message-State: AFuF++kGjv2vgCg1HO2fgFTjxUMqZXX++B4nfHNq4SdLYp6Q2TsRlSuk
	hpyNOM6TxHJraZSVhaBWUD7DW2cQaZFzo4DFHmcCVqVKtr44glbBrURbcH0YchhtFFCjTXsKOg1
	oXOHy4UA=
X-Gm-Gg: AYBFou3WhiKcGN4d7POKiD4FfSWlUnpltTWi89370eEmPAF6ZAqglj1qG2gAx+MIKjw
	MiGTxuvyTxK9Ks3xh48QVcy8ipQt7u17o9bNlb51viXgcM+aqSoVHelSyObQv5zRG4Dnd1vpWL3
	LBd2ZMFD5Z3JVIki/+j4csQdU00DwdeDuQ6a4uOyyWVgOw7++h86PDwFGBuEXdzzFnbsV6luzNV
	Ap+xIZPuqP9IZe24qBUxjD3IMR7mhZ3qj5Csns2LcpGU6ZD4kR+yNRQlSTp8gr+ghDqnc6Sgv6a
	E8Y439aJqqOnrfpc/2+7fD57oD96hYzmaPo+HhrmFYXfcgkj40r+WVfz0BDlrcwq87qMUQfEcHN
	PgcF6rnWvL+N7lsS1lNt4Gd7OZoBMjVhZZEkLTKc11G71o07OqQt87A6aJkTuWDj9VJTMaSMi6E
	9js79ikxlpC9uPY0o1M39Z8kN5diLra3Fr92eySFVnZTVTzy8BtVUL+rjJH5vslWEUFLD87T8n+
	HHgaw1+19vsthE7+IpJLF2Ee0hV2dbWIpKKVxswTCAi1oiv8jNDNFEcNg1s5zWWaRiUCVDeEBy8
	Xfo5ECwlf6pY5/umxQ7WeVfOzMCHdescch6HpBmMwOxy9VPoXnbkarguVX6nm6ezSX2D/9TiOoT
	rkZTMKwHTBrU=
X-Received: by 2002:a17:90b:56c6:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e2e797eb7mr1213466a91.6.1789564917427;
        Wed, 16 Sep 2026 06:21:57 -0700 (PDT)
Received: from b2open-a70-hyb.. ([2804:1b3:a300:a73f:ccef:7a6e:53c4:6e4d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf56d7e5bsm8321382eec.0.2026.09.16.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:21:56 -0700 (PDT)
From: Cleiton Bueno <cleiton.bueno@b2open.com>
To: openembedded-devel@lists.openembedded.org
Cc: Cleiton Bueno <cleiton.bueno@b2open.com>
Subject: [meta-oe][scarthgap][PATCH] libfastjson: fix branch name from master to main
Date: Wed, 16 Sep 2026 10:21:47 -0300
Message-Id: <20260916132147.3926195-1-cleiton.bueno@b2open.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 13:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130086

libfastjson$ git branch -a --contains 3a8402c1de7c7747c95229db26d8d32fb85a7a52
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/stable

Signed-off-by: Cleiton Bueno <cleiton.bueno@b2open.com>
---
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index f16126d936..2a8b52d720 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
 
 DEPENDS = ""
 
-SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=main"
 
 SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
 
-- 
2.34.1


