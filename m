Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3A3C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 20:17:24 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.27020.1708805837440442631
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Feb 2024 12:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nOaHPIEy;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c66b093b86so1049034a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 12:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708805836; x=1709410636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTHMyuicphSMD3HOCrKCRuvk/S+PqWSlEAUe/DmubUg=;
        b=nOaHPIEy4O6tnTGfm6WyrsRkmNvSRMEvppcSrQ9MWL0iRhwDUQAI1cj6is4cCVeiLN
         H30pqWYbU8rrTIlyJP40DV6RzcMK671LdRvkwoqsSYPBFrXqf/d2qscs6C+pbgBWTQtY
         NFVSU7JFSPyk6zcPqRJKL3EaMK88LJTbASqtxetcTX+IsQ6lZOJbvW8eJiYc6cPWfQAs
         +BmzGAqKZBILxeBPOsxHZ7qB90ZTiSWLKHLOM0qqRtgO91GB/6cz0L36Rb20esOr9WwK
         f0IuVA91/MuJl+aoMh6mgmP88buc3iq7aJTeKWz6/bs4YRtzvQiU/5SIg+kB/evuzOhK
         GdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708805836; x=1709410636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTHMyuicphSMD3HOCrKCRuvk/S+PqWSlEAUe/DmubUg=;
        b=F0jNIuIBDsFozLVKbdNBYJhHfF0B+StAvCk9QILB/UDvHMNpHHckskwX6rKtpZG0sj
         Yu664SFx5Mt790zFR70Ms/39ainKHfviPDcLMiLmyu60P6UroYBGeXV+Z2mTcpZIvkWb
         Hofnmobmsdiz6AAVn3O5ltJJHy8nz6Dcnxeli2BZ+9pMvQv5Oc4IMvnLX99LoERqKUOX
         8spjbHmGgLAsKhcsigoGcbU2c/1QZNnEYaO9HD3ifejYkHAY8spBXlD4sfUSRne+/7lP
         r5IASrLaJ8a8N6EqcLREhD/Uem3ahyaTkmEonFCODufxfFdGrb4q+Rus35lfR33XZu4A
         zofQ==
X-Gm-Message-State: AOJu0YyB/1Zy7n0k0Jmr7vQm+GeiSO4rG4k4sPiu8mY56psdaXw7cMIu
	ToE6xoXnZ8vP05UFLU3nu6rW72e9Fzm+77l3hhLUeQoTBvdqAt5ARdyzs8Hc7Rs=
X-Google-Smtp-Source: AGHT+IG8uc0yflyE3l8KrYzgEtYgzF0uPn4IbWTcjOeBsU0oVKRmhmHstrdEW4PoCvcgTYT6losKPQ==
X-Received: by 2002:a17:90a:17e2:b0:299:48db:1920 with SMTP id q89-20020a17090a17e200b0029948db1920mr4185529pja.3.1708805836204;
        Sat, 24 Feb 2024 12:17:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::a43d])
        by smtp.gmail.com with ESMTPSA id pl1-20020a17090b268100b0029a4f1335d1sm3697476pjb.0.2024.02.24.12.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:17:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] python3-scapy: Drop python3-tox from ptest rdeps
Date: Sat, 24 Feb 2024 12:17:14 -0800
Message-ID: <20240224201714.3179859-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 20:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109027

python3-tox is only needed if internal driver for running tests is used
which we do not use in OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
index d5d4850402..d57cb977e4 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
@@ -40,5 +40,5 @@ RDEPENDS:${PN} = "tcpdump python3-compression python3-cryptography python3-netcl
                   python3-netserver python3-pydoc python3-pkgutil python3-shell \
                   python3-threading python3-numbers python3-fcntl python3-logging \
                   python3-difflib"
-RDEPENDS:${PN}-ptest += "python3-json python3-mock python3-multiprocessing python3-tox \
+RDEPENDS:${PN}-ptest += "python3-json python3-mock python3-multiprocessing \
                          iproute2 tshark"
-- 
2.44.0


