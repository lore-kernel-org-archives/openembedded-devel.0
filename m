Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED4AC77B7A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 07:45:23 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6761.1684568719134658302
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 May 2023 00:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hNt+Tvhi;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ae58e4b295so25901575ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 May 2023 00:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684568718; x=1687160718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ebhywvUvPX2aA06T1P9x2hyzVh/bPu0mzcBGh5C4ew=;
        b=hNt+Tvhi0eFNHd/Um8cGm80hqalddAtjn8aVW/eVuJb9b0fv9EwcAMdi9TOWijM5fF
         W5tdjNMZfCDL0D1ocQHX6GrVykBpuYNGDiffSOjg0RCV00HNnHi7KPNpMV6+ufQm60dU
         8Dde/yVb1sBuQtRCZ7xY/oPG/2OHbR6z6K8k7RkoPDRKYZiZWV3QS2nCsoEVnCpi5fYi
         mmdwB5yb8fO/Tj4ln6xnW4I0PqLl+Pg1n58QJQ/glrTaH37qrZDVcnzgSc8Q5mQ4NFSe
         n21QxZMTh/CMdBNlcHMhvSZVjXRaMxGPq8cU0WYMfWmlB/FshSLME3kLS27Mwl7cJFBo
         F7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684568718; x=1687160718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ebhywvUvPX2aA06T1P9x2hyzVh/bPu0mzcBGh5C4ew=;
        b=UPNZZp+TppbPMoniFXidXUrvB7Em8Ce+hhZKKcDuF4amsIqmFPrT575s9nCxiDCzN5
         uRKKSeWzF3WH8lHexI2zSBMW9GV/lVJItkFhCNei1l6gNENrE393ZMOCCNLZ4UpTjxcf
         BqgtcUeVdz7/W3OYlmZBTOKQhNmuAyIIPxmTqpZGreX9jG0B8e3YzOpOilEAl5rlPC7f
         B8ukFr+20M+CkBIk1olV19PoqXfJM38ZWNPJjPlbIHaf2vOkE25chnZjz7a77N8jzub2
         M3nNuFpN3Eswz6jpbKFyXNeIQnwtQLlxPBYXh0sV/QoVUN57b99p1JsZBUiJHdF2kINH
         W5gQ==
X-Gm-Message-State: AC+VfDyXcPslHbzrO0k0kkvB5fJKlLhjdfeapHpsixpTxde3OWPjKdAJ
	JM1bqcW9AGp9AXCy+rqtGxfGZt15TT8=
X-Google-Smtp-Source: ACHHUZ4Noqnp6nrGCN3nVzLj9sGEuYSLZnvzRIJPZx6c8Pa/csjlTyGlu6GKpokDrwlbfJmJxCBgaw==
X-Received: by 2002:a17:903:1d2:b0:1ac:7260:80a7 with SMTP id e18-20020a17090301d200b001ac726080a7mr6160178plh.43.1684568718180;
        Sat, 20 May 2023 00:45:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001a80ad9c599sm822140plb.294.2023.05.20.00.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 00:45:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mcelog: Upgrade to 194
Date: Sat, 20 May 2023 00:45:15 -0700
Message-Id: <20230520074515.306156-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230520074515.306156-1-raj.khem@gmail.com>
References: <20230520074515.306156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 May 2023 07:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102691

Drop unneeded autotools-brokensep class inherit, this package has
traditional makefile build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mcelog/{mcelog_191.bb => mcelog_194.bb}         | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_191.bb => mcelog_194.bb} (85%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_191.bb b/meta-oe/recipes-support/mcelog/mcelog_194.bb
similarity index 85%
rename from meta-oe/recipes-support/mcelog/mcelog_191.bb
rename to meta-oe/recipes-support/mcelog/mcelog_194.bb
index e713433469..9b5c554d86 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_191.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_194.bb
@@ -11,18 +11,25 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-SRCREV = "a3552acad43ac1f47d3acba1c79462bdece4ea17"
+SRCREV = "8f33fdc47160edce09d75e1316b4d88129ca60a0"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest
+inherit ptest
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
-do_install:append() {
+EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
     install -d ${D}${sysconfdir}/cron.hourly
     install -m 0755 ${S}/mcelog.cron ${D}${sysconfdir}/cron.hourly/
     sed -i 's/bash/sh/' ${D}${sysconfdir}/cron.hourly/mcelog.cron
-- 
2.40.1


