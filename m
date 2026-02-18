Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0ADE9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:41:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14747.1771429311682987807
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kwTzepd0;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4401569f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771429309; x=1772034109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6xrAi3bybJ4db3SoiaOL841x+7+241W6DWvzwKS7ks=;
        b=kwTzepd0lQjLKBDh8n7AdSXa2OKiEsLJYgUsI4nU5C4sAKfHyYqT3sLmu53Tlz0pTv
         ewOFp0w7FD38RU7shRu5MrB3NrKelpoAimvin47X9pIDZNjtnE55JGz5EKXpG8Azdoc4
         yYrX0Uc3YHuGAJaN0Lk5jxpADXkDOjoEt/Xv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429309; x=1772034109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6xrAi3bybJ4db3SoiaOL841x+7+241W6DWvzwKS7ks=;
        b=Z80VJJOJKg0mYWw9jF7YlCO+KQME897MMyh06sYzYvSildgEx9ycKs7DbQYOpYHCFi
         QIZvmEwl3TFk8u0IeDi8Ha82qWHdXyrYvFbZrgiINnQKklwfRaEur1+XtbKKUjDaWEn3
         EaGXQDxUiF0TFS/rRXpAJgzCmtX8GtjIo5xUIOx0wjV+32CuDNz7YDy7b7AfVx5stKX4
         +bXY8OxRFYMdouU0BkiiwenfKvHFqy+5O3tGAIOndcYevp2tHPeGs4rySSYOeTNgwn73
         59CIHKgFy0no0bSJ7INV2vCIckfdztoSDeJqmElJlSJPYCa6M99FJ5r5/kUF3vE628fc
         0/OA==
X-Gm-Message-State: AOJu0YxBdpbmo5VcGXOCALR1WFM+hUWARqVIscsCPn6JLqXpJdVlRoRJ
	4qXtvNJBMpzZn0SLqmcyd3ZnMzhNDoWt3cJ3y26xNhcdnXGzTEoELfxr3giydH7uksJu2xFNArP
	YQobg
X-Gm-Gg: AZuq6aIG6i5QR3y0AD1mfJO8zbEdMPYbDYitBq3HOo6f+7+1yJBE6EOVMYDG0hS1D/g
	gb34Eh24mWmHJ2TEseACcAscgqGeu8tjcJvzYK/s/MNgYqS8r/2zb7d73PepPJ12LFr1rvsMFcj
	NPirL53DCPXHujSMoqFgtY1MHyOVFJgg3GJxj3ffTo5hbmCnMFa78LB5GOBCq8J9ET0BhzPx2Ad
	0uD5KwlEmZT19Yz1tyLB8L7LlKnyV4i417ajmXVeWBuVw9R+P1jr/lbVghgLVcRddLYkpreC8l5
	261ZzavOenmC/epfSww8/OWzW+5r0wD0ZEsFf2cv844zRJQJjsG5sMIenf0voXRkJI+AX2cX4kv
	cTrn/muVP0zMJD+q+utmN2zihrnAYNCgLYYonU64logkt+YLA5CGaRML4af/4NKaM2TS/jlcJ9h
	FltDY8/iV7rbhwxnptXlxCxoT9kWmPz5QDJII1J5AintjhDyE=
X-Received: by 2002:a5d:5d05:0:b0:437:771b:26b with SMTP id ffacd0b85a97d-4379db71b34mr29361977f8f.26.1771429309248;
        Wed, 18 Feb 2026 07:41:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm45102522f8f.16.2026.02.18.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:41:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-parso: Upgrade 0.8.5 -> 0.8.6
Date: Wed, 18 Feb 2026 17:41:42 +0200
Message-ID: <20260218154146.3267220-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124486

Upgrade to release 0.8.6:

- Switch the type checker to Zuban. It's faster and now also checks
  untyped code.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-parso_0.8.5.bb => python3-parso_0.8.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.5.bb => python3-parso_0.8.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.6.bb
index 2bde8c3f40..1659f1babd 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "034d7354a9a018bdce352f48b2a8a450f05e9d6ee85db84764e9b6bd96dafe5a"
+SRC_URI[sha256sum] = "2b9a0332696df97d454fa67b81618fd69c35a7b90327cbe6ba5c92d2c68a7bfd"
 
 CVE_PRODUCT = "parso"
 
-- 
2.47.3


