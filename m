Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAE3C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18680.1784626289901162855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jcFUlvZu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f7872abb6so916960f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784626288; x=1785231088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gz+g3ihWPx65pnUGgq/1kCM8p52WNHPmLNKyDMzPVyg=;
        b=jcFUlvZuHXnSO4VGGShLbOGrq+xAQFhboff7/T/T0PCwCf7sWmfFfshWxGLZsVS/PH
         Y99PtHRi7KWr/2/gfeCNLsPijZoxVCe6AzEWoNygpC5NNP+lAQyrPgSDLizZ8uBL/lKi
         Fvx4F+gb5MdtdoXmYA0dLktKUUOydWNHe3KWdX5x42bVfCh4Kp28mt2lhK7+v/MKdGhW
         yu1pNRPF35mMXMRentRzh2E6/qLBhzKoRaQwZshpsiVyBSiutbMWeqagnwWJc2Rhiiit
         mp3+TC/87YGmD7ZHm4EDSc4N499rSILvpHkmW7xXyuAdI52EnQaDeE/EMfRzNhIlLhgM
         CYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626288; x=1785231088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gz+g3ihWPx65pnUGgq/1kCM8p52WNHPmLNKyDMzPVyg=;
        b=e5NaRqvGY0+4oLAvAfXRUGn8DFgLXGDN/Y5UwgeXBh8tiVcxt3nsXEQmAFO3IiB0ZZ
         MCvCDOna1R1EqII9f4J9aiCfBwzoqskhsKNDuyhEuoy+/ATzgg0HZ/j/1LvUQ8ZumU5X
         EYrCxChIzl5OScUMDimYeTnYmAH7EFECM7NUMSItvuZavsz/r44IoES7WfPOZqKEJmjh
         SfXwom658HwVx0+ZQ+Mji+o31n/SaDJ+Xb4mostbLWH6gsVFy/dtP5D1UZX1VyNaT46P
         cfHPNDIWodxzg88u0puXezKiG7B+kaCJalyxXwlxiYNDMAKkzftUKMLlvPu4RlZdbxd3
         ZGvA==
X-Gm-Message-State: AOJu0YyUj3EMbunrqLOBKV7EJHMoBZwVk663YphsETOCJO7Qqt5g9KbN
	izLPCICy5+5FWAzUg3/LHF1a0IctVqEhDM5NII3f9zp6mefaGLMPYIdfX/xqvhJS
X-Gm-Gg: AR+sD11ETnBGNcrcv9/HwbcA267xjbUqLhfobq9eWhk9g74N60Hk8fMkMCxJnUWt95k
	NFPeZS2xtvJbqpqzY6/uX9BhD22HbJIwG/1O6y2RDdc4NQOgSty2h+9lpUeD5Iea4eKTYe1qGQK
	QbYfJ1QNPZorJc/5VoGWHLnQKW6Xzb+LXKZKROMKKrdOR4gp5QEhuge/AmUMyN9leB+Cdm9ItJD
	fuxrCgO3b6wvgMVcOlseDyFn9iAaYfddSqBUB62Lskj2c+eqBjcebCfYXACxXjQxZwkedybfW2r
	bEs9KSVysDnFHyuoYcP6a++AhdvKOsJDiSgfWVaHMGlOafVVDLn8FaPwvL+20SFmAgHLeFz2Kuf
	LtgtE8SwofjIUJ+MaTzNkySEVs4Ovce3z00Gudg+8NdQJjuMNY1OdO73SgjgdCCxHf2Oyuz4DOf
	/C3F3aezGDcUyDfcqhEl4LiE9JGwuycR7yQrj3RFq08iriXFgiUdp7x+6QUPo2
X-Received: by 2002:a05:6000:2c10:b0:475:f100:35f3 with SMTP id ffacd0b85a97d-47f62326e58mr19860881f8f.48.1784626287709;
        Tue, 21 Jul 2026 02:31:27 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm37429473f8f.29.2026.07.21.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:31:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] influxdb, crucible, syzkaller: update LICENSE format
Date: Tue, 21 Jul 2026 11:30:36 +0200
Message-ID: <20260721093039.2675786-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128341

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
WARNING: meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb: influxdb: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND EPL-1.0 AND ISC AND MIT AND MPL-2.0"
WARNING: meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: crucible: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-3-Clause AND MIT"
WARNING: meta-oe/recipes-test/syzkaller/syzkaller_git.bb: syzkaller: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-3-Clause AND MIT"
WARNING: meta-oe/recipes-test/syzkaller/syzkaller_git.bb: syzkaller-native: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-3-Clause AND MIT"
WARNING: meta-oe/recipes-test/syzkaller/syzkaller_git.bb: nativesdk-syzkaller: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-3-Clause AND MIT"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc     | 2 +-
 meta-oe/recipes-support/crucible/crucible-licenses.inc | 2 +-
 meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc b/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc
index 417925546c..9acfe04717 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc
@@ -1,4 +1,4 @@
-GO_MOD_LICENSES = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & EPL-1.0 & ISC & MIT & MPL-2.0"
+GO_MOD_LICENSES = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND EPL-1.0 AND ISC AND MIT AND MPL-2.0"
 
 LIC_FILES_CHKSUM += "\
     file://pkg/mod/cloud.google.com/go/bigtable@v1.2.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
diff --git a/meta-oe/recipes-support/crucible/crucible-licenses.inc b/meta-oe/recipes-support/crucible/crucible-licenses.inc
index 27885d6642..1922f7ecf5 100644
--- a/meta-oe/recipes-support/crucible/crucible-licenses.inc
+++ b/meta-oe/recipes-support/crucible/crucible-licenses.inc
@@ -1,4 +1,4 @@
-GO_MOD_LICENSES = "Apache-2.0 & BSD-3-Clause & MIT"
+GO_MOD_LICENSES = "Apache-2.0 AND BSD-3-Clause AND MIT"
 
 # This file has been generated by go-mod-update-modules.bbclass
 #
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
index 65306a17d0..eea869aaa1 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
+++ b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
@@ -1,4 +1,4 @@
-LICENSE += "& BSD-3-Clause & MIT"
+LICENSE += "AND BSD-3-Clause AND MIT"
 
 LIC_FILES_CHKSUM += "\
     file://pkg/mod/cel.dev/expr@v0.24.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \

