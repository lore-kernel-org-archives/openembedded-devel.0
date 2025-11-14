Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92405CE7AA1
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 09:47:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14459.1763113636800132747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 01:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g/hJZxWl;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297ef378069so17098435ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113636; x=1763718436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4Q6u1/xSau4XsxaH9mJN7ezk7rnMGnAbxGqpBVZgOM=;
        b=g/hJZxWloRrUcvC9PpBMEY6jyd7n4GLfLqN/7XBgL6y0u0gEsTei8kTnyBM48OoQFk
         oMUie0D1u1KMBlxZn8r3sCttzx2NpK492NqeuE+yKmYitEFqS/q7UT2LeB/pJlxDAn1Q
         0B6diSC3fNBB7/8IsGx1B8zCGpkpniJQY0YFo/XJ7/WZlTK96uFFhOMQUXqdXeI9BwKy
         UX9216umbxB7nscgfLbP5r/m9PuGrrl0imQya+zPd+83qU6l5oz4kaGXAouL717LZSY8
         jyq1kiL5AvfLxwEllzpnyjMU0knpz2SzFNYPHwcnREdoj+W55MKXvIOt95WELIn7ihVg
         C/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113636; x=1763718436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4Q6u1/xSau4XsxaH9mJN7ezk7rnMGnAbxGqpBVZgOM=;
        b=S9Lf0D1munwjHLhcGncyFV/AZnHz8pIerKjnXXd8Z3GsIHTZ08mUCNRbo8zdVO4tS3
         7Pp/c8LgZnq1jUEsO+ZSHvVjzFA2MsCPSrYaxGgwwo7srDv2r7EiCFkpmW3xxHgdnEqJ
         u771ugI6Mi8Bxoymdii2Vr8Bq0iglUvY1cXAho0rzff79hYtxUbbDgwHCMJns1+yOtsW
         oeGdTldO1bQQkpnZLd6/cJiQhDXdiHjL2QGsfpPVs9KuK7iVrOFf2IgIXHzcfGY3+5OQ
         y+DcvM2855jXFm+5qHAEut/+JwOHrVW0ltOyPjaiEHcDIGuYqLsKifitP4m/0uph6qAs
         l0og==
X-Gm-Message-State: AOJu0YxQxAw8ZTJZaGr0xr/Fn1oym81vENdAkypEj8W157aX6guh8qgH
	FGCcuxkIawt7mARbT1SXNV2SsPKb9Fjs+orat3Ow5zDEe+TpzZbSEDTAmucYWQ==
X-Gm-Gg: ASbGncsxNiFigCYA4K5YDaoGJ6go9XO3wvviSdOTRQWz7Wa1qL9PHjZ4E6EWvgp7vIj
	KTQZrQ5k84utIvyncrDpJAWAueyrvP8HAJk7FNVjypO+Ro71Agazt4+49gJGgNBtsnxgOzmqPDV
	kQbIVPFcgzscQSLQySYsqb/dS+c3rJ/L4JpJ/46ccJutv+I+AcQZuZMPHcI2+IaQF+CpFnpaaZY
	jFblCa7xsvczj1j+EL+zT7p/45Q1D/88OYsuDTJNZMAAUbt8MXjXBmydReIP2VhckjRJ9+n8b1h
	fqU1iv+ixNI2/H/kpFcVqQXy4qMqWEWnFVfttjGqqpWFlImy1k5+z4Oty91AQE3TeDfvqaKSero
	ZWlpRGbaFfZ0ypYMz8vTu/tIkQjbZr2DPFChlF1WEVP9hffSFBTiYMpGh4STXXaB71nQ0cF2f93
	gjc1dzSsKwXq7V
X-Google-Smtp-Source: AGHT+IETXP9bbK36vhEmlC1rFB5Af+QrWx7IBseMQWOrzgrW9yUiyYNxsm4Z0/tFYnOJMLgOBC56sA==
X-Received: by 2002:a17:903:1b10:b0:296:3f23:b93b with SMTP id d9443c01a7336-2986a6b7b8emr28454505ad.2.1763113636021;
        Fri, 14 Nov 2025 01:47:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c103asm49413995ad.96.2025.11.14.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:47:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 2/5] libtracefs: upgrade 1.8.1 -> 1.8.2
Date: Fri, 14 Nov 2025 22:47:00 +1300
Message-ID: <20251114094703.4091777-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
References: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 09:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121703

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

New version added trace_sql.bash for tracefs_sql() bash completions.

Changelog:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---

changes in v2:
- added inherit bash-completion

---

 .../libtracefs/{libtracefs_1.8.1.bb => libtracefs_1.8.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.1.bb => libtracefs_1.8.2.bb} (90%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
similarity index 90%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
index 6b9e8b9b38..b6bae96896 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
+SRCREV = "03790961bf2e83b7b61fb6d326fb1076a4293adb"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "
 
-inherit pkgconfig
+inherit pkgconfig bash-completion
 
 do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig

