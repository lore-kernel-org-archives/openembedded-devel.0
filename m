Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F76CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3580.1760484810128164321
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZve1/Z3;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2697899a202so2717875ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484809; x=1761089609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+pX/iBWVbhFSiuV4mQiwsLCfqr7Drp1jX/zU7jS4dU=;
        b=iZve1/Z3w+2nylc+h7rdxteD+LP/4Dd8J45Uw7eVdkHyw024b8njH45W/z+mA5hsVH
         d+oulLALojwFGLyH1EK9T//6Der1F2A54vSRnuNbZmbML4PPR/LNllp+3G87esDH7rVk
         5jMVmUQnzNCJ8wcUS911pNmS0A4hYq1M6Vr3lfYqU8FAFmzwG+vUMyc3nMLn6FUBERar
         gAMuGOdzsaGMW7EWq3IjVqD60Lh4EIYV1miWjVeSDtCaBlCMA+WCCijAquUwWyMeOg0l
         eDuo9OqNi69dI7vSpD6CnW3cMWblfSIKxfcj6vqhlkDeCbvmzIObiMabX1n6jiWGBR8I
         x7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484809; x=1761089609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+pX/iBWVbhFSiuV4mQiwsLCfqr7Drp1jX/zU7jS4dU=;
        b=tNaGTi3DzL6ZSTFZng4JDnT5dvtsNcKDBptNecg9Zf9PlpzDIjiqT2W7VUZX9AiIJv
         n5EN7OZKGlAHMmQHSu3SeQkMGCRnvsKmWdcTXSNkzo6nGu+JYZXfG0t9zirNXuPFWsIK
         yMRj8q56N9MyjjMl9F/c+t+Xc5G1JFp6CM/X/5xNocXa4bqvn1gH/x9wZWi0qVuuy7+M
         SWxgWBr/xMPwnD3aThQIRy7PzEjnG1VCckIfe20UbL4S/x+AUqwMD+fZMfvGByaSCfOr
         AqrWch+tdyNs3+iGzBbdmAVCqvGzYK06vzy8q1yWuhnNijPLvwLxSsfOiHrRRySKJoml
         U2pQ==
X-Gm-Message-State: AOJu0YzKKkeqiq+Gnn/hltF/iet88Smsk0xbyQAOIK0GoohqrE+Ut4JX
	t0cUnGMC2MREj06Os+J42Mv7mmiUVDBdUminrIu+LrjcFLNnrLLf36qjbiHNwQ==
X-Gm-Gg: ASbGncv1nMMIexXhQ/jisPKJYRizFyRRzlNOrUuF3z8M9BHRwcFzy4OYhiRurJhEcDI
	bIhCfmdy/IW5UKulwQE89i688T8UNfffOKAZEVu8viIgrZNFABrsLZUkbHodWhaY4FNbkToU+2k
	A62em/3G/jlsZnblFxBblgbeM0SO+1A/mTQ19apjuYmE8lyCfHbn9ByoGp7MjhM5Bzi3sYCgzDG
	QU8QQ0cA5oXxC6wnNVvNub85NqWewacM4xYSqhe4h3oGH//3b/jhVrF4cDk22PSfIxgSNRignXK
	8WqbQRUKjsMKKaCMpw5cBM0Om15eOk/X7vxgt6/0otyWfISkKzNFojjspDB+H3mQQay/lGC3kZJ
	bhXkgLiITzMKfv8uA/PustYe2DCl7eH1jQel2rMcQUqbH+XDYm4wLhUE=
X-Google-Smtp-Source: AGHT+IGx0evgDLbyv0jnweA8IY7satbOd3nzugScDJyc7sxoeIYXFsEzWxgIY71+AFYG1w5U00y+Gw==
X-Received: by 2002:a17:902:e94e:b0:271:9b0e:54ca with SMTP id d9443c01a7336-28ec9c372a0mr394423345ad.13.1760484809370;
        Tue, 14 Oct 2025 16:33:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:29 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 17/18] influxdb: Update CVE status for CVE-2019-10329
Date: Wed, 15 Oct 2025 12:32:28 +1300
Message-ID: <20251014233233.304125-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120676

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The version don't match and only the Jenkins plugin is affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 524acf0542cafed3f5e82cd94291a653f6cf86e1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 836736dd8c..397b225ccb 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -38,7 +38,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"
 
 do_install:prepend() {
-    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py 
+    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py
     test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}/build.sh
     rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*
 
@@ -75,3 +75,5 @@ INITSCRIPT_NAME = "influxdb"
 INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "influxdb.service"
+
+CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."

