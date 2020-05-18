Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.43869.1589813447932701681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHe130+h;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y198so3486256pfb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EyGWlkHGU4DDiFpDzTEWxbvKGsFrSFESWOWcq9l0xno=;
        b=QHe130+hXQq7MKpuzFyQPvjIiklwVEFEKjpoTzrq3JCFRuXR1P572bdDxfAyW3cS/u
         8+k4CuOgqe/mTDvzQJZH2R9t0GSZkiTf5GvEnz1qasylNVBm6wIe5Ql7pcvRHcrlPAlY
         TKVhedRgfxOmsJYdZ2V4csvhVShJ99B6pekFnBu1JCzCip4awJPB9P9H1sdUG8/VKM8/
         9Qdw6t3WrTTnyTDLgsKrn93C00H+nW3FV1J/iMPTitDWnoGsRyTzEWsDNgdADZxkEkqx
         kHgLMqwuCYcj8PCMVclNd6S6PKCP68GtXjTwjas4dxHiFQo6BfkqaFa3K/hgFlVFOCN9
         TiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EyGWlkHGU4DDiFpDzTEWxbvKGsFrSFESWOWcq9l0xno=;
        b=r/FwclgMO+CD8IX7U1HYEgV3PyPJqKSLK2ssVNA5jnK8OKo5k9TBpodO26flzu719x
         VTFIkB+S7Urdmbo7F01CCEhS/sqVZHvMERzhQtgUM8hDsL9dnd6n0yER3e1pTPFsHKVx
         o2BM8s3/+1wdHEv5uIpAzBL6b+U3EWVS4Q0yQsDLNIfeSTsH/2M6nr0Bgqy6CgA7imjW
         rARdBoBcVTn42zj2V1KlPLBBqvWh7t22rBdWpKm/n8ItN3XwJdZLHycjrh/MLA8mRWxE
         7XiNHnm6Ywz+rH3MSn3A6M3dETE92220jWUliPp0ePX7tlXHGMCvcV7Qzl07YrUkkPHh
         82pw==
X-Gm-Message-State: AOAM531yMWACZOn4vI7h2M2vGfLY/bEjL3KTvXXl62r9Uq5o/ygTNQYI
	/I9QHSysQpYbt9SAyjE2E4un8e6p
X-Google-Smtp-Source: ABdhPJywOR5M8CVQBd5Sc0EUYTvkjOuhQdT98W2elbEwtfu2WNmm9WdC+V5kursGJDA7TKFfOyRz5g==
X-Received: by 2002:a63:d00e:: with SMTP id z14mr15392338pgf.125.1589813447335;
        Mon, 18 May 2020 07:50:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 36/57] python3-pyasn1: Modify ptest output format
Date: Mon, 18 May 2020 07:49:41 -0700
Message-Id: <2762e6e1142dd6c64437bb2d1c68c70e2dd7d3c8.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4f8809a1f7337f686fa112e1b224f4f8132983ad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyasn1/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest b/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
index 5cec711696..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

