Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF0EFD065D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:49:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16056.1773218948439963036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Scb5ihdR;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so10380699f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773218947; x=1773823747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=36YWUbkrFtTvrHukXaCpI/Q2CE/N8+JQb+VQpiNd7qc=;
        b=Scb5ihdRI73FleT05bSxkjCwG8/lfZzHgCgupiBjfnRCG9pSFhkd3RsDDaFMVU7qvQ
         xhHrb286er0X3b47mXl/DAe6bxn2FyeEXPTJYkG8oOv9sYIrNvyhMucLFFU3Gab49ED9
         LDy/kMUYnXK81WO6lcgi15Wa/XRji0uBXZ6g92HzJ1mEDTdX/nRoJTYztxnxZaut8BX8
         EIeCM9jS1uhsPDvJE0tjmvWZsxab/Pzi6apUL7Ea166INCkcBLP8eHp2G8/n7MALAdAu
         s8hafKM454d8TLzCz/lsLVUIkAT1MyRVP42X57Ter7fyTFXhMLp11HyyIenkRMA38Vgp
         uvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218947; x=1773823747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36YWUbkrFtTvrHukXaCpI/Q2CE/N8+JQb+VQpiNd7qc=;
        b=LSeTR4bJO5N1ye+l9TKiQW7Gvd7Kulf/KhqsvjiDP+sHd5NbwGG8X+EMw/S01tlkWH
         HppcXgRk4PELOjysjVEMLSh0Md5dx+34sFIJiZt4PkabIgnpvQNvNk6iaWTOtxwY7Tso
         Wj/yClFZTWNQW1CTWwxf3G14JRlZhcVR3W5KYAqbEQu9OBT/HgLB/cRXnbGRpfcrw/g4
         hYuQMgQk7dIEsQN6J60sNFDg8rTWoJ+MjdkHkiK31qb2Tf+ruxgy8YJbIMJ5tNzNwfoM
         7ETBqpL6JkYiXd/qEFobs6K7jCfrTBoMi/T7E7ixmvpphIhD6T/ws9TChDIK1C8+i5n/
         Zcqg==
X-Gm-Message-State: AOJu0YxMRpqpg22XpYdBim+5TR+mJxQC32STqsCyZ2CXjOgFGPK64dEm
	4SAz8sJOLQbxzUDzzuZ9zr6nIJqNB7ntcG7YODPA4LQb3oQH9ucmTnILUqT/Ng==
X-Gm-Gg: ATEYQzxtLZxWT8+3f1LA9kNvgLmgMFYd7DhgT0pX4ObhCCcACBJ/HW2ThDs9FNObftc
	yOPzWf1D8jg0fHI0h0CKos9cnzUsQ6Tgfm8MF7VsjoTjkx9W+TtSFQlJyyZID/RirXc8gBd/Rkl
	x6SAIp+cS2NgUJhoa7vdy6DRLaLwxYZ04IWbHduL3HigWvBax0h0Yak/XNtzFc9MuZ+HKjkujTI
	/e0dRYpCNxhczkWuUAlsmzx9qCtLZM0WGTPHLtJlsusV/SFsCgNKP1V4uEKnyBfWH4SkzVRpZPO
	s03U+bHNwaz3/avsQNzhzodZgwP9KQoYVBDN2J5ZoST7dJ4bGJhP/U+v43KIPR1JUlBLkre3gIR
	/mwaP+tizb4MtH1ajbpUfoRNBOgfmOlezrGzrzotRXYdcvL63NLf/nnSKOH0Ves5sFrzCt9Mw7c
	tUPYF6h3nnU/XccCUxt9ax
X-Received: by 2002:a05:6000:230f:b0:439:b7a2:60ff with SMTP id ffacd0b85a97d-439f820982dmr3358164f8f.32.1773218946731;
        Wed, 11 Mar 2026 01:49:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81f215bsm5503845f8f.18.2026.03.11.01.49.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:49:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH] ettercap: patch CVE-2026-3603
Date: Wed, 11 Mar 2026 09:49:05 +0100
Message-ID: <20260311084905.1574824-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125070

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3606

Pick the commit that is marked to solve the related Github
issue[1]. Its commit message also references the CVE ID explicitly.

[1]: https://github.com/Ettercap/ettercap/issues/1297

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ettercap/ettercap/CVE-2026-3606.patch     | 48 +++++++++++++++++++
 .../ettercap/ettercap_0.8.3.1.bb              |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
new file mode 100644
index 0000000000..6d3df3e596
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
@@ -0,0 +1,48 @@
+From 9b281e30a1e7fec481af7e07b40a00cd9edf1cf8 Mon Sep 17 00:00:00 2001
+From: Alexander Koeppe <alexander@koeppe.rocks>
+Date: Sun, 8 Mar 2026 17:57:39 +0100
+Subject: [PATCH] Fix heap-out-of-bounds read issue in etterfilter
+ (CVE-2026-3606)
+
+CVE: CVE-2026-3606
+Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/41c312d4be6f6067968a275bf66b2abd2a0ba385]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/ec.h                  | 6 ++++++
+ utils/etterfilter/ef_output.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/include/ec.h b/include/ec.h
+index 4e363b0a..66da146e 100644
+--- a/include/ec.h
++++ b/include/ec.h
+@@ -81,6 +81,12 @@
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+ } while(0)
+ 
++#define SAFE_RECALLOC(x, s) do { \
++   x = realloc(x, s); \
++   ON_ERROR(x, NULL, "virtual memory exhausted"); \
++   memset(x, 0, s); \
++} while(0)
++
+ #define SAFE_STRDUP(x, s) do{ \
+    x = strdup(s); \
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+diff --git a/utils/etterfilter/ef_output.c b/utils/etterfilter/ef_output.c
+index 2530e599..2f49177e 100644
+--- a/utils/etterfilter/ef_output.c
++++ b/utils/etterfilter/ef_output.c
+@@ -150,10 +150,10 @@ static size_t create_data_segment(u_char** data, struct filter_header *fh, struc
+ static size_t add_data_segment(u_char **data, size_t base, u_char **string, size_t slen)
+ {
+    /* make room for the new string */
+-   SAFE_REALLOC(*data, base + slen + 1);
++   SAFE_RECALLOC(*data, base + slen + 1);
+ 
+    /* copy the string, NULL separated */
+-   memcpy(*data + base, *string, slen + 1);
++   memcpy(*data + base, *string, slen);
+ 
+    /* 
+     * change the pointer to the new string location 
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 027b6dd190..b3b756dddc 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -22,7 +22,9 @@ RDEPENDS:${PN} += "bash ethtool libgcc"
 
 SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
            file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch \
-           file://0002-allow-build-with-cmake-4.patch"
+           file://0002-allow-build-with-cmake-4.patch \
+           file://CVE-2026-3606.patch \
+           "
 
 SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
 

