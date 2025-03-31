Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6253EC3601B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.3931.1743454890582764188
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NPwTM/vl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso848060666b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454889; x=1744059689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/NLvUBIBh8o1sIMSrClnhdDnep40tZngAwibwHNHtI=;
        b=NPwTM/vlQUGYFdkEIb3QQVmD8T+6u151nhxYehhaGVN1SpGFTQbMJpGxKu5EP3dANJ
         qpRbiIINthGetFF8nLN2zLLQaqU+0UNu4N68UWnAfIAiI5WdQsAAXWQEvnCWaJ+j1Q8h
         XAoMQw0PdwxxThaGb62CCJjz/uG/raOgVURIa3083+FVRiS1F3rnU9xPZe5O40wRNC/O
         6UGRHj93yr7JVOxdvJuVewYMwc1oKJ9eyoEbAWn7UbMsZcnJgB1OFbIKQkleX3Vkn7kB
         k0dQkOltFZz+cv4ir2/BZQBQMkQYUQ0et31ATqAfFMEXQ1acm4zaV5LoBVn5lFOwTQ/p
         TgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454889; x=1744059689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/NLvUBIBh8o1sIMSrClnhdDnep40tZngAwibwHNHtI=;
        b=ShEcz2IxTFAxit+KuLv2CRjI2JcjQZj10l84Eh8ZCYTi21NU5w5Cu/xf94Msn85jDV
         gngUipUcCCbGjnTKi1GcVuc32X1rlHOFFun+IdtbTs+WGkDeMH9weNwRFeuM3xVdI3bp
         BY2vYJjkq8qbfk//vckuTBl+7JBaNCihHNEWE4Z1qUdmDKUm45NT0Havm3R81j0HhQfn
         Pg5O+9ulAvg6fMMNLwirZYShE398iLGZZLVi20DcG1rF0HP/PY9/ZIENK2wcfa332X1H
         pLwS+1FpOzB9z716wiHhDwdPKvBYH7tnDQg2te2MDpaJ15nlMPuYkNrQblqwxjEfxPpE
         FnvQ==
X-Gm-Message-State: AOJu0YxHvjHVG9yl/MtG74BWMIkqmmJOeBuIkRiZZOnAXElIL4rmrLDS
	lcaA5dPSSKcOgsVc1x159n7Kw2mEhIbNFxNsh7NpteE/Qprth78CaL8X8DiL
X-Gm-Gg: ASbGnctBNy7ZLCqxyiRX7JQ0mkd2J8DwV+94jdnHccwQqDdnw20SzJKn/JKe6ERRySt
	SPqnqPMIKWOVFJuuL5qBUSsALs7GBgcdoOMcq56XV/LFgmVcXVpfU6V6MfCDH7iIq5yqk5ok2dp
	sNgbP673k+G89zQhcqMDRYyeOvkTqtPTVdfsEMu6hK8Tjz6SpBxMk8WOtNWLcib4yDxeNKT1TO9
	5cnKwsifyY0kFaW9JYMveWXMXXcEU4iQRXfkP4Xx7PGdyW2mYx78M/QJv3rYurLhfRltyf9Rt8P
	jjQd0/+h/fZMstxw/EWsEYxb9w+j4K6mcQCaZXMZdDmHLOw=
X-Google-Smtp-Source: AGHT+IF0wJHYtc6sKm/Co4DHetjQ5WvdyuHRc3BNmD/kpBWiCyWaKgd6a7r9cPWwleWRXbeflGdSYw==
X-Received: by 2002:a17:907:3d8f:b0:ac7:3224:cbf3 with SMTP id a640c23a62f3a-ac738a51d48mr888102466b.28.1743454888791;
        Mon, 31 Mar 2025 14:01:28 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71927affasm683367066b.64.2025.03.31.14.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:28 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 16/21] gcab: fix buildpaths QA issue
Date: Mon, 31 Mar 2025 23:00:56 +0200
Message-ID: <20250331210101.3460858-16-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116452

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mplate-include-basename-instead-of-f.patch | 37 +++++++++++++++++++
 meta-oe/recipes-gnome/gcab/gcab_1.6.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch

diff --git a/meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch b/meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch
new file mode 100644
index 0000000000..dd6ae1b427
--- /dev/null
+++ b/meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch
@@ -0,0 +1,37 @@
+From 6fa1b6d3f72caf6d0cf61752b522dc19fb9933b7 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 30 Aug 2024 10:44:17 +0200
+Subject: [PATCH] gcab-enums.c.etemplate: include @basename@ instead of full
+ path from @filename@
+
+* fixes:
+  ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c in package gcab-src contains reference to TMPDIR [buildpaths]
+
+lib32-gcab/1.6/package $ grep -R styhead .
+./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include "WORKDIR/build/../gcab-1.6/libgcab/gcab-file.h"
+./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include "WORKDIR/build/../gcab-1.6/libgcab/gcab-folder.h"
+
+glib-mkenum supports also @basename@ since 2.22 which would avoid this QA issue
+  @filename@            name of current input file
+  @basename@            base name of the current input file (Since: 2.22)
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Pending
+
+ libgcab/gcab-enums.c.etemplate | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcab/gcab-enums.c.etemplate b/libgcab/gcab-enums.c.etemplate
+index 194b1e0..2e85824 100644
+--- a/libgcab/gcab-enums.c.etemplate
++++ b/libgcab/gcab-enums.c.etemplate
+@@ -21,7 +21,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-#include "@filename@"
++#include "@basename@"
+ /*** END file-production ***/
+ 
+ 
diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 4278fc9453..503d25271f 100644
--- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
@@ -7,6 +7,7 @@ DEPENDS = "glib-2.0"
 
 SRC_URI = "\
     ${GNOME_MIRROR}/gcab/${PV}/gcab-${PV}.tar.xz \
+    file://0001-gcab-enums.c.etemplate-include-basename-instead-of-f.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "2f0c9615577c4126909e251f9de0626c3ee7a152376c15b5544df10fc87e560b"

