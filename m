Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73A7C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 06:21:44 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.12830.1706595698170825840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jan 2024 22:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ii0qrXQ6;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5111f40b8beso58164e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 22:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706595696; x=1707200496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWRvpIVNz/u+/941u+y4niScVvGXSMVSeWt3838qmUg=;
        b=ii0qrXQ65VhKP7e9heexR2yCytAA0LkmmgKZo2dmV9FNeRGQwzzYTiwNQf6rq3J9/F
         eQfHR+DuyBDZO0TXyyf6wrOoucrReY7JkNDNK+yRs49rxXHlDr4WuaB4fqlHd5AL86qR
         G7aawDaKGGSZPB0xgk7s27hjlNYemsPomJfWOLh8P4mf5XANJUQTuALI8rXDQ+gmUYiY
         9/KC46XAW0JIIYrdREM02yQjhrHzmysqDNxXMKP62Bep0NqL7x4nXNpCzdHIbu8tYbZu
         lH2UY4I5cP3BiLd21yXkV9w/vCFOl15/jH83/SJBSxYQt4FFXU479XsgKlzDgxDspDB9
         vgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706595696; x=1707200496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWRvpIVNz/u+/941u+y4niScVvGXSMVSeWt3838qmUg=;
        b=Ws13rHqn85+aaRsE0g1nfnTaXuqQdZ2RHOCiiJiJE02ptXnabXUC+lH3wWaGYJcpca
         SPN4pfLO8caVLerUzouK62e1nrFTa7YAuNVpicNDmByk41iTV432E4rYGGZbASExHZsN
         sYrpKavArRTk7tVCBj5CN9jOs/UCAKspipvdOCBslOC4U4ojYSCzaIw7mppimvCbYZSY
         DMbrqRT4Cc9qqKtwCJ51cpKCHmfsnhVm9b7G50ZuaLm5Ftiyczf9+T50drda+StCBkyE
         iDbnF+fX47XBEnZB1rfgIgazbbyjIPiC2vDZarUQrslJg6h1yhy9Q6Hk9TLF3vsQq33V
         VANQ==
X-Gm-Message-State: AOJu0YzW2/5Gp9rnt/Oa91QWsNLJTxdUsui6P87UyBRIbSpNAuQ2JA4L
	roonqUrRNErnHdrNNTyMuCRXYsOFYSPvRDqsDTxwz+3AUd0UDsCEHbKSufPYsIA=
X-Google-Smtp-Source: AGHT+IF4yhYO6kPkSHBtC/HkUkSbQ/kjfhTpDGI/R3TpXCmBBOvbEjE6AAxPY8omUE/dkbJWQMvzzw==
X-Received: by 2002:a19:2d1c:0:b0:50f:738:a5b1 with SMTP id k28-20020a192d1c000000b0050f0738a5b1mr4674063lfj.61.1706595695680;
        Mon, 29 Jan 2024 22:21:35 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id fj17-20020a1709069c9100b00a2b3bb73b83sm4787913ejc.94.2024.01.29.22.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:21:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-eth-rlp: upgrade 1.0.0 -> 1.0.1
Date: Tue, 30 Jan 2024 09:21:31 +0300
Message-Id: <20240130062131.58056-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 06:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108490

Changelog:

* Add the missing typing_extensions module

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...python3-eth-rlp_1.0.0.bb => python3-eth-rlp_1.0.1.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-rlp_1.0.0.bb => python3-eth-rlp_1.0.1.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-eth-rlp_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
index 5cd0d0544..243f75f5b 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
@@ -4,12 +4,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "a988d713a36452e7c6da71186798343f687eaf3aeb7f99266750dd9e1f754c7b"
+SRC_URI[sha256sum] = "d61dbda892ee1220f28fb3663c08f6383c305db9f1f5624dc585c9cd05115027"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
-    python3-eth-utils \
-    python3-hexbytes \
-    python3-rlp \
+    ${PYTHON_PN}-eth-utils \
+    ${PYTHON_PN}-hexbytes \
+    ${PYTHON_PN}-rlp \
+    ${PYTHON_PN}-typing-extensions \
 "
-- 
2.25.1


