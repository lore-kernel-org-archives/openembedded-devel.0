Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC99C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 08:53:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.4091.1750496025124743690
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 01:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFPuvf0U;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b435ef653so23413041fa.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750496023; x=1751100823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V90nAOPr2KGF0igOZMD0xROt+LCXZuJvcZcNji8TyuQ=;
        b=OFPuvf0UJ4noqXAeVXGK7rGSfuaTXFbuc/4v+sJtoF/s9qwEUHTViGPhpmGI/iXlO3
         E5xh0ik4E3/WMvwPK2pyS6s+eKPLoky/Oc+PjyLCiTZ4C1EJ4gy+GLMZlSmu5ZFSZPO2
         0ph/PuiZxDZIpaqNG0CvGEn9C9mGs0uJ9oVmQY/AdONma+ALJNNaYEPVoH/2UOEDF7Pd
         /Fe7rL04LQAPKpxOfX2uywZzYgzjCrKP9AxGEcwCtyb+qGx2F8Vpoocrb1pE6OEG/Cwf
         B6WhtYMqqFF8fAT2cULNKiAOIV2ZRUXYFDRrCI2tXvoBoSmg7W1+NVW1q1/QdgBcrPV7
         zqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750496023; x=1751100823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V90nAOPr2KGF0igOZMD0xROt+LCXZuJvcZcNji8TyuQ=;
        b=YnQSFyG3fPNgY3pq1VL+6V9GLkCNZzdswV2RqE/mHVmzeRYTrLWjOsKroBEIQcIunE
         88D8HbWe8eslipkspxjJYC4FI6CdhnvDJ+IBPSMi7aOrikVICmWd4qfbE0O7LwSv0vZ+
         s2jr3SE8k0CWLiDa/LZ4wuSeMz+//ZGFu0SlXiuRCpD0VSZA46VQDz5G4aS9FA/v+5C8
         cBjrNfMY5e95QsccONjkJBtE8VDZr+x4c8Cwxr/VODx0atKhm+3gPsgwFwhwCZsLLlRi
         3y1ZIACyyV5wHCVnmRW8yBHC2CYhiGcXXWDT1Yi8gv18evStd7UYyOuSDsSu+OGtifyx
         EqEQ==
X-Gm-Message-State: AOJu0YxzPZtWkRmuivuHFkuQhGE/Cw+XqCsfPuHq6spdL2t2Z0eJfrXq
	KvFqWlLbWv2E7oOwI2vQHO1Iuyk9MHF7iy3BrY55v5AqIJZh2p3JzEhY7Nx2VIWS
X-Gm-Gg: ASbGncuYbJEJ98hPuTH2cUt3nrBPF17GMz7HnNz3b1lyPzf9dJahL537D6JFnQ+O3YH
	Pnqar9IVFO0NcTftgAWDtuedzmt1E/NPiu/Oz5U/Zgk4f0kytlpao4+3mZIhd3MmYrbLU6hSxUG
	U7sBwhwhidGQw91Mf9uMgJYISMSo/DD7B+8aAJXkl311Sv+HWF7+yg7wCwzeMLuFzagEw6ehAcx
	dXFyMXmBB2Hy+JNrzP7Q7NXJJemMUVMMtP7XDQunyaMj7SKtf4yirDtZMYO47jnhKKERr8d/c0a
	FEcfpbYEHW2ODKCUiKFlkHZYmMeqRa1sxsYA0f8gf6YDphoZYAYCQUqWm54FnRTEwCs721g7ZsP
	kXEk=
X-Google-Smtp-Source: AGHT+IFYrm55QUVQcVgBYBRa3J7PeLiODgmHwEWzqLDLoMrOezHFszGWI0NIQAT79fKTqLjnR175cA==
X-Received: by 2002:a2e:8e68:0:b0:32a:7d76:2642 with SMTP id 38308e7fff4ca-32b98eb1216mr15821651fa.2.1750496022246;
        Sat, 21 Jun 2025 01:53:42 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f59821sm5627751fa.20.2025.06.21.01.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 01:53:41 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] e2tools: Fix contains reference to TMPDIR [buildpaths] error
Date: Sat, 21 Jun 2025 11:52:47 +0300
Message-ID: <20250621085247.1414378-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117991

ERROR: e2tools-0.1.2-r0 do_package_qa: QA Issue: File /usr/lib/e2tools/ptest/e2tools-0.1.2/autom4te.cache/requests in package e2tools-ptest contains reference to TMPDIR [buildpaths]
ERROR: e2tools-0.1.2-r0 do_package_qa: QA Issue: File /usr/lib/e2tools/ptest/e2tools-0.1.2/autom4te.cache/traces.0 in package e2tools-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index 40c4f56650..a60fbec821 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -38,6 +38,7 @@ do_install_ptest() {
     rm -rf ${D}${PTEST_PATH}/build/config.log ${D}${PTEST_PATH}/build/autom4te.cache \
         ${D}${PTEST_PATH}/git/.git ${D}${PTEST_PATH}/git/autom4te.cache
     sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
+    sed -i -e 's;${STAGING_DIR_NATIVE};;g' ${D}${PTEST_PATH}/${BP}/autom4te.cache/*
 }
 
 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"
-- 
2.43.0


