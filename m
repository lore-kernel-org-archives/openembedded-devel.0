Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F0BC5472D
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 17:36:27 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.17440.1724520985146353833
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 10:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aI7nSkDL;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201ee6b084bso25549415ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724520984; x=1725125784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FN9KXrAXLtxnRrmAfSjNJhUH98sSAoLccKvJsN0hHI=;
        b=aI7nSkDLOWa/hhrF1UYM6lCIoKqrRNdT9mkuvU1tkTwehoQpg7oczr8F7s2Zpldr/s
         KLQIfOjPDGXUryY/NgDCtA6PA9H28b/70JQwdXCVrGuSxXLeJOPpzGh6FCb7xlCvoYYe
         ARZ0Q38uYLXBu4NIMpSwzWShXM6oIzXQCSsxEhqPw49ngy8Z45C/wnSLiDOjmbyacpLW
         79ulE1xJ0urpOXLDyp2v2xTnhVzhsBZ7eLoAFgexZQf89/3PNxJXc9UIx+tp8fiBwtjg
         RJrXMRN2F5v0Lp51ZmA8cwbhq2dyETsOV8cYL7s0AePXEdlWGk1YTfeNfnbYXwgQiKVe
         BpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724520984; x=1725125784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FN9KXrAXLtxnRrmAfSjNJhUH98sSAoLccKvJsN0hHI=;
        b=jZN9nCnQ9e89V+YB5mZCs5/78kQ/2+Vdfio0NEdLj7qcVnOtAhrY5CQuJLUDbWvguh
         weiR7oR9bGw33UclK6ePlsD6kSDmdv8BwkfVPcmL02MHuCHAFHm6BqLAIvhFjRW1WQRo
         VLfliZsGeOnzp/65fUdQqDmCqbtxcHln6wbGrqhhVztxWD0D5C/AFE337CaslZOEbRRy
         /33VF0aJOj4dJ8Bqpo/Yh7UNS2sMO8qTI1ENEBjCKYmnIPj5CFTr+2UJ7GwBziIpacN9
         iUcEvQ/s9eTvzHRBut5f1GqXVHC7mCXWERAl3J6Vb85+EVE53hJfCv05iEFwZBZWy2lE
         a62Q==
X-Gm-Message-State: AOJu0YxNshnDddPQmSMSxP/3M4CFiD12N2+BnVTx+IGvVohv+sPzO1lC
	XkOBDIukJj09TGNPUk7k302wbiZaofZDbERD8leQUb9sU0sUtkTI+eSRgQ==
X-Google-Smtp-Source: AGHT+IFPjBjxdRqcK0spnn65R/zAVq8xgY79/G+EpyggcoHFQDa4aTkgsk6A5Jq9CyE/AdDTWs0a3A==
X-Received: by 2002:a17:902:fb8b:b0:202:19a0:fcba with SMTP id d9443c01a7336-2039e51618fmr46388465ad.41.1724520984218;
        Sat, 24 Aug 2024 10:36:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb1fc146sm8860393a91.0.2024.08.24.10.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 10:36:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pandas: Downgrade version check for numpy to 1.x
Date: Sat, 24 Aug 2024 10:36:21 -0700
Message-ID: <20240824173621.1391408-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 17:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111921

Helps it build with PEP-517 backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Downgrade-numpy-version-needs-to-1.x.patch | 27 +++++++++++++++++++
 .../python/python3-pandas_2.2.2.bb            |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
new file mode 100644
index 0000000000..b0ef8ce00c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
@@ -0,0 +1,27 @@
+From d81d95274d84ac51fc02e0fa91affc7f3cbefccb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Aug 2024 10:21:43 -0700
+Subject: [PATCH] pyproject.toml: Downgrade numpy version needs to 1.x
+
+Drop it when numpy is upgraded to 2.x or newer in core
+
+Upstream-Status: Inappropriate [OE workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 5158d60..d3daa78 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -8,7 +8,7 @@ requires = [
+     "Cython>=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
+     # Force numpy higher than 2.0rc1, so that built wheels are compatible
+     # with both numpy 1 and 2
+-    "numpy>=2.0.0rc1",
++    "numpy>=1.24.0",
+     "versioneer[toml]"
+ ]
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index ac8d469847..25b03c8e32 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
 SRC_URI += " \
             file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
+            file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch \
             "
 
 SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"

