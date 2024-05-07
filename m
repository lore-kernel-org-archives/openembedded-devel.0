Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313FEC41513
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:11:01 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1017.1715044257284011088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 May 2024 18:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbcRWNyW;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f449ea8e37so2274938b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044256; x=1715649056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EbVwGNiqsfnGD0IpzdAZJyRvq7rUihWM7k0A68DQukc=;
        b=TbcRWNyWh6o107doG7+HMu4bB6yL3ULIlZNPrig/mH2FZUgkvE1vofvcI8QE6kUyH5
         Sjo0YaXEVeM1Bvs/jDtbmj6xl2nLYJGXdAJVV0C28YGY1jbOPXStiw+/ssE8vsURPCpl
         7Ml7u6++hQEaGaUumqTw14eS9eVX3pbuv0kVmUPoVzFnBl+ngS0NJkUwLOFxDXq/zjTn
         CT3pHVKhT38u5rg5r7TkfJjKrjx6kWrntvCYc1i0RdMFmUu8/m4OpIG/SKGJacqUhQyS
         gO2B+KQGIG/CVMI87ekKMBLILFbvf1LlKWbSVT2Rd1BRqqU716sM0APW8pM8Yi3e8BPv
         VrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044256; x=1715649056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbVwGNiqsfnGD0IpzdAZJyRvq7rUihWM7k0A68DQukc=;
        b=l7RfwoS+fYg3rD243CP2z7v6K8e1MWLRiPl0OkLQ6WV7bFh37Yb1Bgu7fQunoW3SMm
         44GsA653wqHkBcLM5g3zhl+NMfSd+Xq1/IjsXTJso2+XnouEb6ADKwU1aCW//CO2c+FM
         qz8wSKd+h9rWmbVHRYwgGky6OXg2FDAlZEswjpk+cuiuShKBV5LPdOTpB3nI8KiFxcG1
         Ifi0QwhRa16PmToHSH2/4qHFPguxjHQY7w+GzULr9oVpO9PXq6y1eua9RsvYBFsDZUUY
         ouUFfEGXsJ7tCYa//kclZAAslUTbnnJggpxYK2i2Pe0t62RwPhkSFx2vM03XaNPXVbAc
         8wKg==
X-Gm-Message-State: AOJu0Yyut8oWQtSxJ8/G4jCQbKzf7ITpBfUIuVFuXhnFICb3JOj2YDET
	IqLQo3UoG5mZqX2CugePAX2kn1XmJImhExkeylLEmyKh8TOkG/GO13oYXDoe
X-Google-Smtp-Source: AGHT+IEOyW7cRVH2UqaS+m10PM+sgU85n0eWU96ugbXXIV4vFmbqRDCyHdbYp9n30ZNOZ9jisVE1mg==
X-Received: by 2002:a05:6a21:680d:b0:1af:aef6:7261 with SMTP id wr13-20020a056a21680d00b001afaef67261mr5593304pzb.27.1715044256155;
        Mon, 06 May 2024 18:10:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id sy15-20020a17090b2d0f00b002a5d20778ebsm10693201pjb.32.2024.05.06.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:10:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] librelp: Fix build with gcc-14
Date: Mon,  6 May 2024 18:10:52 -0700
Message-ID: <20240507011053.309743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 01:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110264

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gainst-upcoming-gcc-14-Werror-calloc.patch | 37 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch
new file mode 100644
index 0000000000..cf4f4080a6
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch
@@ -0,0 +1,37 @@
+From baf992f82aa987c608731866876adb856847ea45 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 May 2024 18:03:40 -0700
+Subject: [PATCH] relp: fix build against upcoming `gcc-14`
+ (`-Werror=calloc-transposed-args`)
+
+`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
+   detected minor infelicity in `calloc()` API usage
+
+Fixes
+../../git/src/relp.c: In function 'addToEpollSet':
+../../git/src/relp.c:101:39: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+  101 |         CHKmalloc(epd = calloc(sizeof(epolld_t), 1));
+      |                                       ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/264]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/relp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/relp.c b/src/relp.c
+index eadda36..6268f1d 100644
+--- a/src/relp.c
++++ b/src/relp.c
+@@ -98,7 +98,7 @@ addToEpollSet(relpEngine_t *const pThis, epolld_type_t typ, void *ptr, int sock,
+ 	epolld_t *epd = NULL;
+ 	ENTER_RELPFUNC;
+ 
+-	CHKmalloc(epd = calloc(sizeof(epolld_t), 1));
++	CHKmalloc(epd = calloc(1, sizeof(epolld_t)));
+ 	epd->typ = typ;
+ 	epd->ptr = ptr;
+ 	epd->sock = sock;
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index 9d949c6303..49847047ac 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
            file://0001-tests-Fix-callback-prototype.patch \
            file://0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch \
            file://0001-tests-Include-missing-sys-time.h.patch \
+           file://0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch \
            file://run-ptest \
 "
 
-- 
2.45.0


