Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.13226.1605395289380629684
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 15:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ArHnswHC;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id q10so10355309pfn.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 15:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eh/to6iwQ4PNx/NLKqDlYA+rGbhNZQXu5weP+vFDIQs=;
        b=ArHnswHCNLTcE3uyMhmiZNNDIZ8Wt9kMOK29QodVuAiM7vgWfGc7IBrRrWN+YmTH97
         WJyli2XvPN7Xoywr76MvElxuPAfNym4EBtBckzZ4hcK+IaQGPmnz8zKH5IOUFSJ+cVg2
         yF3r+QNLKtju/1yASJXeAmEOqzOOlHjw1/o/oRi4ybG7ymiPVRzYVjQYioCN3D/X2GUV
         L64qv3+eSkrpovFdX34IyypQ1fv97JaI49fLRbazeFBjEbDId0XY+WJi0Z6iXcizzVFQ
         yj8hccMueb6TCSmvIzC2bUcMwAlcRwrYNS/6nn9iiAvho3esgr+J/ZNghp0riITgmxyZ
         1Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eh/to6iwQ4PNx/NLKqDlYA+rGbhNZQXu5weP+vFDIQs=;
        b=hY9mex+6kIbKR+JZ++MOwRnaz1JE8xG8HKU/4Iv3P2uSZFKCLeDuCVMQHZqrgLDL0K
         g2EHp+3TiAtsyV5J3wGIK7xfhVA7e1j221MPJNQ4jc8+jUZANRmpaNNH961CS6e1FYlU
         FQfzZiUAgKGW3N1tIZGfdOSXqmw2PJDqOduW8fat2vMetc7bCofGjLOmAWE90pGZqxsu
         5myESbT5plTNQ7RtmwrPUxpLv4QmcAXi4XUPMnNR+n9dRl0dwpMewxsSysXR9ighFBSz
         Oa45pYLEKqVp40CTkbTp3JxfoHLqGLzGBon5avyWpYdrxwCVWL77mmXdA9NhyWj8ZgCu
         0WMg==
X-Gm-Message-State: AOAM533kCqe9OLp3Qm/bEooPVOEPd5DEz9GMwL20uK27H8WtQpEWwrzy
	Ac20FpzJPDTMgDmclnF92uVbnGP5WUqrYVCb
X-Google-Smtp-Source: ABdhPJwO3XKG+fBK3g7jqcqiKE2qflr5+GPI9z5dGZNKFwFw8DDbJFfzAwQI6A4rM24S000ELvkBcA==
X-Received: by 2002:a62:75c6:0:b029:18a:d510:ff60 with SMTP id q189-20020a6275c60000b029018ad510ff60mr7943136pfc.35.1605395288618;
        Sat, 14 Nov 2020 15:08:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v191sm13520318pfc.19.2020.11.14.15.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 15:08:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] libtorrent: Aid riscv32 build by linking with libatomic
Date: Sat, 14 Nov 2020 15:08:03 -0800
Message-Id: <20201114230806.370074-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The needed atomics are not available in compiler
libtorrent.so: undefined reference to `__atomic_exchange_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 3ee69554b6..fa5e829c9f 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -26,6 +26,8 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_EXECPREFIXDIR}"
 
+LDFLAGS_append_riscv32 = " -latomic"
+
 do_configure_prepend() {
     (cd ${S}; ./autogen.sh; cd -)
 }
-- 
2.29.2

