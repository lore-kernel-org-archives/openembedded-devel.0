Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ADACCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.332.1760475289644343504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6g9TfZE;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so4857832a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475289; x=1761080089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUBBfd6aAwoxlRKb+QK2tOi9JT/wFOoS5ypqGD7WYjM=;
        b=K6g9TfZEN+E66hlqkYycWnMNVr1MHR0c9G30ssCMc+ILnCRTVR6ZThJFkoEOftek3E
         aUjYTxghLAC00twZlWDifoxYQq+BbbUeARA2zUUZ8mgtg9PfmotSUF973miMnEAF4HFw
         r8JR898pfHzOsalSxBDvDSkKCj9QCbj9sVgWcm2tiDt4PaTt3yd4hAxSvnSvsSKKQpfh
         TAM0I9TfM3Y0NtwN1Mk8LRAtsleBKYqm04wq921/FwjaEsIJaXr+jBkZLweUF/9xgtjF
         7PHhCuGsUuDI/tOP5v9L9wmE+z3+kVNkH3EseoJZpNqck9kWSobZrIGCZIqSnzaqhUN+
         BRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475289; x=1761080089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUBBfd6aAwoxlRKb+QK2tOi9JT/wFOoS5ypqGD7WYjM=;
        b=hYFJZc3sfanJa/Gx40Ms9DDF6ZNPJ7ZEpuO5zTlfRns82fraYYLPUJ8sY81EZb0FOn
         f49mvTaWGUEYrWRQzML3xzqHJIVEAtfwNpJXgfTTim0vZSXy6EjMYL6g3XoQiSwqCZBH
         4CALEstRwyS1cFdHDIJROMa3Vt27tNgza3VM+SaZv38z0mPlBhSAK/w11IEihjaMjOVz
         TvX+Q+wCvozRhCpNqwvGJ5wmS/JaCD3fQ2gs9Cyp4YVZJ94XJuH8TZKkg4hkCJbx7lMX
         FPwVxmFGHx5ilJ9rTS6SyCfe9wxK66SvyAhfjKTss9BwqYg5HYtebpOvQ4TVooxXOW5q
         yhGw==
X-Gm-Message-State: AOJu0YxFQu2yxPtOVhWVJHsysUSp+i6uE/oQOanoxxuaKz802DQnDe3D
	cH3wqfRtoAtvzzgOHiD1Z7O9ZFuk12U9b4N1u7NfJHiJzF3MiJeU1Zl/q3T3Hw==
X-Gm-Gg: ASbGncvjbz9hX8P2Xi5FgLQMry/S+oHxwsGHazQxflSJCzXc3CfTZXMwqTXuNvj8gz8
	zZjqijN7utphFqutUK1OTGDF1BLVHQDJmBEPKlpq+f4cXDAXncTMNXbQPr6IGYl4EBgeYon4k1r
	X4nxXtKn7suUJTW0Ye8bfoQ6sZszsroQb1TN2KGogDqZq1fyRVwxmXhwjRNoeWmvzLWVOoPudoS
	W8Ew1xoE9Vkz+n649U72nBPdrkJSYTn/DweljYO/E9/zN/Ul9LsYMcAaRg3/D0XN7CY0AWBGHC5
	Z2+cnwbKpYLF97IfH3lDzUc+jyeGEe6jtAD88wZPyTVVFl4aCT44WA3hpp/R/Upduc3ABYIiny8
	eefY5Wt+vrqdfqqv6pcy0ny66oj4A20ZAH+hv/EWOe5lG1Pt6Pj6187izUTN1+QNbfw==
X-Google-Smtp-Source: AGHT+IERMv/UpLv9H5BLNtZUPxMQNsU4o4nhexBieGpdgT3mei0kIWjrbOm33l6glM6rJovSLXodxA==
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr283829225ad.22.1760475288938;
        Tue, 14 Oct 2025 13:54:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:48 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 17/18] influxdb: Update CVE status for CVE-2019-10329
Date: Wed, 15 Oct 2025 09:54:00 +1300
Message-ID: <20251014205402.1487867-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120650

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
index 9506d0e55d..cc8161cc3d 100644
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

