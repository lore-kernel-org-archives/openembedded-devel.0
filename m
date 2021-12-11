Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52F9C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 20:04:02 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.26071.1639253041822722699
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=MYXUbBjx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id c32so24011021lfv.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n/zUfyl4QkmugAqqSrgRi36GjFbCufX97U6lyCxTx3g=;
        b=MYXUbBjxHXDwlBZmfvyvKCZNLBc1jX7WshGRiCY/5H8lJuhKCHxhWRmQePt5LGrZC0
         rRqcJN5S60LoOG+LXE0pVUgAp1Bzz83H2IetHTNAoK4AQuWR7cs/iOLtrRcOmsjOO8Vf
         So7coLaqMuPOU2MmGHr47Dc0PuWANR63xIxr1xgMjRU8IVx2ItBeMTneolts/WzzRC9C
         qApJBHL41Q72Z4xFOyqcZH9xxb9EkT5NhRYqB+nU/EEJRZ3DVyUWuZ0NzDx55Kox/KpU
         DKzDaevOMx9a1NS0zreVY1V8LbnBEyhXnMoeBdUenqS474h04ncaUhcuOwlbHQAABwCt
         /3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n/zUfyl4QkmugAqqSrgRi36GjFbCufX97U6lyCxTx3g=;
        b=Lwws9eG5vCdOrzurNTXtnLBzyiogeg4fH8XUZyyiGOLD1h/dwjm42noCHF++q4L+Aa
         9fijHbZoWMyg/j8wuFNb9hB5AuPiz7eTApX7PW5UcuJQoE/MfhUfL87XtXW0npCR1eEg
         0lpk03HwCUQ+CiD3t6oZlp0+MwQfmHf5FPY8aWAHQS3S47VotiVytbTY7RXx7IP9Do1i
         xHv5dMlqMUS1d+mfxtcBdvKaBKfrWFF5WM8suW19alCSCQvt5s8ughN8HRXrj8pIFkHZ
         PTry2HtBnMC8ctmm8s47Bzy/X1DbWo3yS/YGGtXqNt9K9bvL0Qa78+ZQUgUOZKi5SJ7n
         TOaQ==
X-Gm-Message-State: AOAM532t9RCaPGMQ8MGzx/PiFjueSrmHhCn91BZcbrlQ/FuCQFCfBx7a
	U8XeTZ4eF5frmA7NUP0W+nu/fp7gzubdpqlR
X-Google-Smtp-Source: 
 ABdhPJzjSXYVvoto0sRTRs6I+dOTFe67oQrLfrq8FDUIpzWugYjjCNofeZan98fMHdB9L3YpTg14fQ==
X-Received: by 2002:a05:6512:128f:: with SMTP id
 u15mr19432127lfs.92.1639253039887;
        Sat, 11 Dec 2021 12:03:59 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id n2sm752930ljq.30.2021.12.11.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 12:03:59 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python-cantools: update to 37.0.0
Date: Sat, 11 Dec 2021 21:03:57 +0100
Message-Id: <20211211200357.2612244-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 20:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94301

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-cantools_36.5.0.bb => python3-cantools_37.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_36.5.0.bb => python3-cantools_37.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_36.5.0.bb b/meta-python/recipes-devtools/python/python3-cantools_37.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_36.5.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_37.0.0.bb
index 6fbad3fdf..c8c2b2592 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_36.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_37.0.0.bb
@@ -3,11 +3,10 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "651b6ea67999c1106a582fd54c92b5b27a1a5f2896e0058beeb96a4f318cb33f"
+SRC_URI[sha256sum] = "ac5f8901940693ce4b798e7ae07ed69a60856ae8a1ca47079088530813b57287"
 
 PYPI_PACKAGE = "cantools"
 
 inherit pypi setuptools3
 
 CLEANBROKEN = "1"
-
-- 
2.25.1


