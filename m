Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E95C4450A
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14726.1782634314643830245
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bgktyN8I;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778500eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634314; x=1783239114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aBDsJDbPZMJswalijgCgdflB6Xt8z0auHe3DuYCubM=;
        b=bgktyN8IwPc4JEoAaBUSySslnN6LITXzvcEICsarFVEby633ygCeeiRcG8c9jcuCED
         fttVKyAg5DWTtgwhz2No0Sb0PL6FlkPCAbfccfqxyGHCqZPQms61yF5Z4r3pZn1B2y+u
         K8wuFez+MrHZtcmrBaFzeouV+4Lw9q83MA9t/94QmyMAAljwDP8e0sWc4BwgkcivKcsE
         Bwb5N28XjgSJfERKnEDlDpJkigwJRoL11YCyP97K9T+6IYWQ4Ml28wKllswPPc0FzN7d
         iNORE7NWRV1fKQrIkUrvx6fmVYZmLT0srMeaBY8TPjUViwpLGcd/7AgTG1W5awMhM4ff
         Czeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634314; x=1783239114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2aBDsJDbPZMJswalijgCgdflB6Xt8z0auHe3DuYCubM=;
        b=eXmOjafIDoa4uYggh13VhOVK5RnglBs1/pmVAlnA4fWSv56e0OdUD4TQBeC3pmGfou
         a96ATbnUe3pyBnzvhQcS94/OP1b2DvW5Lvp08dFsqyRcsj7xD8bGucvFvcS7GpbTV8HL
         1RKlpkXb8vcASDnnXEMVsZwc231mOSYHGypzVh+DkhAFAoWjMw6PSaYOR64V59beKQz6
         05k24DsIhdgPu4tflBpbs4raRx41wC4ml55g0ukrowLnKmtEuH54nhNM2Qex7QS05YQS
         YmY0mVMbbUqdoe5Cpl8jESfqK1H6lPdrnefWOtn18cd8ODvL5FaDnnMPHgiHhYu2dtZL
         tq1w==
X-Gm-Message-State: AOJu0YzzjwqbEl9+RRQsGkT2Vsjlz6A3SOI2igV7YsG8cxdi9oONOPzr
	3Vrng5+ioYFZmx08znk1Gmq9v0X+nBQPlO5Wlkj/QThDEsYm+3OhPr90npmgj+eGySxFEg==
X-Gm-Gg: AfdE7cnXapYLlSMSb/vkIdYCrZVTdcPbZ9llNf4JSrutXx+mgAeE370meyiVuMF5BiM
	hAwQ6KawxxyYqA44oezgDHPimXxn5KqmNXk9THIjWy6kUDHvorzWMDXhUtoOAWzQJCvxo9DYyCL
	JZPT6mxGwdr5joaMAIL3PgFwETNHDAs0CGALQ0CkXSDhu25p/lTQQLqRxFcZbDBQiJHmOnvUDkT
	J9wSmZsdF7usUHx3VWvvwiiViVWNsFdatOw5Ch8MH5TqOzL7wBW6GTcmd4hBRcS/UDtH6YdTwZJ
	6njQIAiiNuc3iMeKsk4+BJU2aYAYaQJzpAZDw2WwwyYi9VjQcxQ+ARqAp7SENSobDcGKMdw3lZu
	dkBeGln9RZgU1uPWF9slir92X0aYurfxeJUe9/pqt0QMwPDBdGuPCC7+rYQmoFxvscz7oKOjYuq
	ctL//PLn0eOHI8wqHPRoMWrMpwzwr7V+tK6L6+S5OaXkc7XPndCZJfIxhovPiO7WTIGEK8vCI/m
	ECxqK1NvIsB0zZlmY7CysPi2UReCd1NiJC+oVNVh8QnnPpXc5D5KOhOINY6Lc1YFqRm/+eaoTud
	zygUxFpcLEoVG+hlNuJSpYFSo5OhMA==
X-Received: by 2002:a05:7300:e61a:b0:30c:ab4d:da47 with SMTP id 5a478bee46e88-30cab4ddc3cmr6145931eec.43.1782634314005;
        Sun, 28 Jun 2026 01:11:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 031/128] libmaxminddb: upgrade 1.4.3 -> 1.13.3
Date: Sun, 28 Jun 2026 01:09:42 -0700
Message-ID: <20260628081122.178348-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127841

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libmaxminddb_1.4.3.bb => libmaxminddb_1.13.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libmaxminddb/{libmaxminddb_1.4.3.bb => libmaxminddb_1.13.3.bb} (88%)

diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
similarity index 88%
rename from meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
rename to meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
index 204148e638..102a074202 100644
--- a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
+++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 SRC_URI = "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439"
+SRC_URI[sha256sum] = "a66502ea76eadbe17f2cd6fd708946777253972d2ae8157dee1b23a2fb528171"
 
 inherit autotools-brokensep
 

