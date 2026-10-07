Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4E6CA600A
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7172.1791371278186752009
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pvfnn+Mc;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1016886a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371277; x=1791976077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mm/6prMt+sx9v4KyYZ+PQUFcPB8n0XZaEfM6G3VFF8c=;
        b=pvfnn+Mc48UEe57LWVMgJE6ss6XnDpyNvGxBQelMEF0Heu/XhzZy7pDyOt55g4Ey1z
         luAgeISiYuQ+Qm/5kr55erdXAu0v1VNRNvhfo9dJy145LoBCrHdgmo63Kuegd9Vr4gSB
         BsXMtOKbbE18l1+pQDaCwhmdxZ4iV45CVDmS8eAAL5yTAVZeXMM+SVwZF5BqXZgsplcG
         +oT81VE4+Yt5IR9DZprA3XEfV3dCgBy28TXdYul29aCI6Y+4AVEzhlnmiLHoV+14xYSZ
         bC7FWIZpspEV6hM3G8HzZ5iCNK7R07Mt8sLOE95K2NmqQEViGYnCuHv2LKb7EgXF3kSw
         aRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371277; x=1791976077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mm/6prMt+sx9v4KyYZ+PQUFcPB8n0XZaEfM6G3VFF8c=;
        b=w6hUCUcnUicjOoqZ7HxZEOh4p10P6UiRmeqgjbWm5cyJj6KOujGeUbHuIVDPwBmKpY
         a1lxD0MGfu0wW8RHHDTycMcMnwipbTeKI3cYLcvscx6ek01Ldd8B19ZuMHJzQ0VVKqfP
         Q0qhQfU9Ht1qBozGR4pNp4TdP9DGTZmusqVUZuv/q4TiDWU4KXCvA/FPGLVzHN5pAZ5e
         8SjR/u3UlPO0pj6YFiL516plkFjINs9GZXMC/rP5ySts0n/IDE9whjv4nTZog3a9gsqe
         LHTIeIA9h1nvS14wEj7r654sH0fSL+XfoIbsD0YAkaDaY7Mvl+7rlxiXOhtlC1wubCzn
         h0xg==
X-Gm-Message-State: AFq9FYKe5S5BbDGR9vPo/7cjPtGvf949OL7/IZKrqtyRVbj+U3OFG00p
	ddedfsFBEYMBfKa92Qiyif8YAcsxdRCUymJg7WJY84M07nmMJ8yx5rX+etBhUuUc
X-Gm-Gg: AYBFou1bBSyWNfNwSPKOjS6iCf9YO6KuuQDVSzlDqsbKxYvdk0u5PHuDCw3gc1TqRve
	QSkhw4SBMAMZQqj1wWXu+bTnDoSxHeUNI0FAINREtjUTIuznT+I9MsthZnycTOPsqNj+HedZf4P
	uRkOftf41ufcBLay4OlWjo7RaWCHIqHvnRqQ31qBKUXKN0CHicjJ8r39jZUBmwHyn/Kfbutb0Dm
	zwmRdHhpBrYsGwQhaO6yA0NEBS9TIv4N/fQ7URRrp5MOlIEerlrPphPitbftpwvnERodG9NrS0X
	xW4SN8rrQ7gHZ7YoFe+4lo1simt0vlmojF4LgEU65fQL08WISpCoJjd2ok+KVDmxQ9272xkW720
	VOVnjQ0QmhlOtonx9FzQV3+vcR+3X6Mk4x2gMW+/+2021N0yOstocgTR5rBIj1A0G0nM56XlzET
	GeMiOcgKtRW0OpMyW8GJyxPQrKz/RlHwQT+6bLXz0bJphXgwexumgOc7bKGkuU/AcPdf9ESGByp
	xSBu5IoVJVqjCX8CnzV6gn2qUVUo/c1Mw==
X-Received: by 2002:a17:90b:4d0d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a8a0728aa1mr1717213a91.14.1791371277432;
        Wed, 07 Oct 2026 04:07:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:07:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/15] python3-zeroconf: upgrade 0.151.3 -> 0.151.5
Date: Thu,  8 Oct 2026 00:07:28 +1300
Message-ID: <20261007110740.3179543-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130645

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.151.4
https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.151.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
index beadc0b3ed..4111f49a11 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ede793c8b5508eab1acfad7c0c4e335"
 
-SRC_URI[sha256sum] = "ce6c548e665759b6150cef4db9ab9d7bdd89857e90c513abd6b7340bdd7dbd6a"
+SRC_URI[sha256sum] = "28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1"
 
 SRC_URI += "file://run-ptest"
 

