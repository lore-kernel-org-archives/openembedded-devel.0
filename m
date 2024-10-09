Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D06CEE327
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:55:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.20538.1728489297866707775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 08:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtlfeYNl;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5389917ef34so8067692e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728489295; x=1729094095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o21Z1N9s9aJNb9o9+Uhu70Ui0EiHVTAEtfk9Zkbizk4=;
        b=ZtlfeYNlH+/iSmKG1vmA546hQRzEHqlTz19rtyCqMQakcGbLdvmxrEp8dKZRVJZA/o
         1z8s21R9y6L1Gt94Qfn6KzTG7FGfK2DvLQ5QtukHZvm3i0Rbsirz30L5uxW3X0hyovJG
         7xgcGVBIpNyIlk10A5lNy2P4FnC2nPpdxpf1LMnlbjmnc/HId0+xgTJPGCbUo9UEnv8E
         Lnj87YQmp/V3oar9gayxGKY5fEWaFxpjmi2FY9aIkwsaKFCqV+JNPK/GC42y75FfNImm
         JhMXFn8Bjuk8nV5mXRXQ53zB9eUBXJQWUYZ7ctlunrrvwwxB9HUpqEq7USIhvmwIbfwM
         dmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489295; x=1729094095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o21Z1N9s9aJNb9o9+Uhu70Ui0EiHVTAEtfk9Zkbizk4=;
        b=CQbstENnZzsrvceIc7gluhDocrK2WX8wBH3+oVCQBi+TlQRzsg9hqZlosiy0qtrWFr
         p8o6cTaPc776wFliU2zdkeqKBRcARFTYwyg97uT6oJkj4GRolyjmz0dr4agD5JpDBYD/
         mueOt36bhXwp5a2XHh3JEHVUktzBP0amp9AGcZr13yUVlgEQnuL9oueyKCGAcbEyJ1bI
         owucvBWWMhejEjPpJdgAbYx367Khsnfa7hWfMvFnTL9gtNOBmDJoxHOnm+Be/GiPCrzr
         6vpa1DCk/DJdzapPuB4e4J4hkBz2yHWdVaueP6qV2rHFxMdT8iMyHbxHGYrCPOqTmC+5
         EiBA==
X-Gm-Message-State: AOJu0YxjdqbHBz+wAzHyt6+UpKLUs6kFSwRP+Lq68hpSgfLF2PV0OxXR
	P4ScrRzFm9Ug1K/lnpHYlDM9RLmAoM3mX8Vps3V8gIZq8g8OSrKBUEf59w==
X-Google-Smtp-Source: AGHT+IEI0X7+vg31ILR0tjrs68ZjXZcLSLJkV0j1vDr6hbjXIcqzO/DUL5L3w2y3RDMMp3HCHORBzA==
X-Received: by 2002:a05:6512:31c8:b0:52c:e3bd:c70b with SMTP id 2adb3069b0e04-539c4892653mr1751136e87.1.1728489294908;
        Wed, 09 Oct 2024 08:54:54 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a995f48b18esm349904066b.153.2024.10.09.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 08:54:54 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libhugetlbfs: Fix contains reference to TMPDIR [buildpaths] error
Date: Wed,  9 Oct 2024 18:54:49 +0300
Message-Id: <20241009155449.39592-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 15:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112733

ERROR: libhugetlbfs-1_2.24-r0 do_package_qa: QA Issue: File /usr/lib/libhugetlbfs/tests/obj64/dummy.ldscript in package libhugetlbfs-tests contains reference to TMPDIR [buildpaths]
ERROR: libhugetlbfs-1_2.24-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index aa1c0ddd5..389c1a869 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -72,6 +72,8 @@ do_install() {
         -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
         -e 's|${RECIPE_SYSROOT}||g' \
         `find ${D}${libdir}/libhugetlbfs/tests -name dummy.ldscript`
+
+    sed -i -e 's#${S}##g' ${D}${libdir}/libhugetlbfs/tests/obj64/dummy.ldscript
 }
 
 PACKAGES =+ "${PN}-tests "
-- 
2.25.1


