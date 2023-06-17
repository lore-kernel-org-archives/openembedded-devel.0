Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E17EB64D9
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 17:15:15 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.9537.1687022106021270767
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 10:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jDVlpNFJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-570654fadf8so20083417b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022105; x=1689614105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klVGPO/ctHB/c3MyA39Ztx7nXMDKi8BnLO7Jqd16InM=;
        b=jDVlpNFJqDQATIg1WeahZfGt7j4m4Ln9CE1xez318aHbVo1I8JreZByny03vosUn8z
         n6Y2eoUaKBWppClDhc70v4nBAq8zNjB0vXRsBYgQgm9oqB9ib7Tl+c2D3p9CbBTQzraB
         cCdp6JZzXrPRQeMUyjmFhj6RvPet2HZB8owO64buNClLWa2uHw3zYgQv9lUXVlQZ+Krb
         KNAgSj0N6BVHhP7bdGmttJ0xmT4AYuFDCAvPxwsD7kGJp87PnWeKBfGWyTh6QfIL14RP
         HZGlX4vb6Uok+PxldlIoG+mmqjd3iIrTevXWfwHAmZWIuh6v13/zUADfD/vnkm7eQpTY
         UsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022105; x=1689614105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klVGPO/ctHB/c3MyA39Ztx7nXMDKi8BnLO7Jqd16InM=;
        b=Db91E0WEAQ9b8Q+M7rS5sWXaQizjU6l6TBXvc6sTuW3WAAL+9VywG/XCmQQ8QPSLRN
         9mGPjLEiD2sIJgijM616RVHI4/D9DzDVUwx76M4m0i5QS5JjiWMvuC+wRJ3ot8N/MRZA
         tTCoLJzVeg5veRrUwCyhItAfo3u4CBJHDkG0m4s0wtz+rOOFRicMmceGd14iV8cC2BDV
         eiH7bgs9AVQx1s8pbMkZli8sGgF/sOVgjkvusvHKoWbFfOIN7eltUgccCqaPs9lrA+Zm
         CYFHhdGTalNK8CngbFmXuBIHruYa6XFmsQ6mZoXlrJ0qEe8gGdVCezcyqJeZp3aveBLo
         rGKQ==
X-Gm-Message-State: AC+VfDxLJq5r9UHa4F8cnCLBJq3p2mmQr9zh+ikqUS89qnZwFMOiC1yG
	cYjzKOcFHgrW1YlQhCJIAuAb4nUFnzw=
X-Google-Smtp-Source: ACHHUZ5Ku29+iWNJTKXkgypRsoIv8ToUoGvsvsTu9qiI/a0Ei4xs+RvZD56As5rzNMBBaE3m4LmxsA==
X-Received: by 2002:a81:9209:0:b0:556:ceb2:c462 with SMTP id j9-20020a819209000000b00556ceb2c462mr5203846ywg.2.1687022104997;
        Sat, 17 Jun 2023 10:15:04 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id o125-20020a815a83000000b00545a08184cesm5737043ywb.94.2023.06.17.10.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 6/6] system-config-printer: Delete __pycache__ files
Date: Sat, 17 Jun 2023 13:15:00 -0400
Message-Id: <20230617171500.70558-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171500.70558-1-akuster808@gmail.com>
References: <20230617171500.70558-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 17:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103351

From: Khem Raj <raj.khem@gmail.com>

These pyc files include references to buildtime TMPDIR, therefore delete
them and let them be regerated during runtime if needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b1b7ee87ac55fced4bcf88b0e374025d7f908731)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../system-config-printer_1.5.18.bb                      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
index 883d582371..f0ff24f376 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -21,6 +21,15 @@ do_configure:prepend() {
     touch ${S}/ChangeLog
 }
 
+do_install:append() {
+    for f in __init__.cpython-311.pyc cupshelpers.cpython-311.pyc \
+        config.cpython-311.pyc ppds.cpython-311.pyc \
+        installdriver.cpython-311.pyc openprinting.cpython-311.pyc \
+        xmldriverprefs.cpython-311.pyc; do
+        rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/cupshelpers/__pycache__/$f
+    done
+}
+
 FILES:${PN} += "${libdir} ${datadir}"
 
 RDEPENDS:${PN} = " \
-- 
2.34.1


