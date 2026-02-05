Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E67DE9129B
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 09:23:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16834.1770283383496716863
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 01:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ipjJJTkz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so7435525e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770283381; x=1770888181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hiXcZvsR+ejH7ARcXbWM0ZEsQpzBKTbHRELU105YzH8=;
        b=ipjJJTkzA9fXjg83CER3Sck2X5Kzqw1N3m3N6eFhrP35sgKKmWkhNG8Hj2GBw96FqS
         cPPLsT+AF6EWXHFsWy7ux69rvN7YNXzQvbeLF++0RNFYbqBrf5D84zxeLn4rOLmvRUPp
         5BW4Hy4mD3Ord5QtrO4YKpGLJaLiGBlIda1k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283381; x=1770888181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiXcZvsR+ejH7ARcXbWM0ZEsQpzBKTbHRELU105YzH8=;
        b=L5mjF2tYopN1q7QuJajdAJs2BeaYMLbt4YCX4PLlv3cYE3jb+GnRXmcLdaUEZOB8c8
         VBknq4B1C1ypZ25YU4kzuSvFWKpOWnS93XM+OJESkuMNqLP7nwZi1l8Ou5Wzb5RUT1RE
         Q1Zr3fq7cLG6i9NBD2SARBQaMB+UORnfZsdKszA9926DeCnD1R9l8bcNpWI8OhGV2RwE
         BAnnE60WH8WstfbM9BUoQ3GeVUzir5Uh5Or40bDtT2hYG87w4CQZIkiIwvryUsRhX+Fp
         RmpqxaMdUmnp8VdzOE9opBpO8TMALL/FXAD3tzj3yJCioiSFrlEU8M7HQCD7FtLoZhI5
         LMOw==
X-Gm-Message-State: AOJu0Ywjd/wCB6u7rpL5ts4QUa9VK0KIkiCrc8a2D/3fpD7x2lWF2gXb
	Y0RbLADo0QHTAhHwUV6sQ42TRaSNp2+C5so00xwbn4+hiJbi+tcs5usMPz9WTvKQv1/klBHVpFE
	b2ZeH
X-Gm-Gg: AZuq6aLO6Ru4o0jq/pamzQe/81ruiar+ODHMhlD1JTEhNdSWeuDSy+6peS3IaDg9omo
	WjzzWY2U35loQ86aPEun/o8Y5AJrUyd2GxREUqRQfvFy+ggNvxgSYveP6Wlti+tkjCWzmJebPdz
	mAPG1Mtm17rLuErRrKc0s1wZwUpBI24Az1IOHWFff4IRoy9UMxvoLppAjeY42811CXHeUhvDBpt
	K8R0Rd5gVtRlnGOU66EciOdPpT+NM4ZFEUqHnLksOqCpwRsi7+fD7dRQwH3+YcyjY6MGUtZ6WnM
	Fefy2IROfeKKduhpMgccmoVcMuSW3QTDa3MFCwEQELosdSqYDt7t26CA5LFjP8OB4JClfFaasOz
	+vsCTbYiJyb1I2a8Uf0wCplfOknpULDDxu8BBg93sKJisPyS99tHYZtQZtsw5BBRDDW6eXkHquU
	ZJDqAZogjzFzqPnND/RlrX64dS
X-Received: by 2002:a05:600c:c10c:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4830e94c92emr63345685e9.11.1770283381281;
        Thu, 05 Feb 2026 01:23:01 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d20324sm39562375e9.3.2026.02.05.01.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:23:00 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] valkey: Upgrade 9.0.1 -> 9.0.2
Date: Thu,  5 Feb 2026 11:22:57 +0200
Message-ID: <20260205092257.1364974-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124202

Upgrade to release 9.0.2:

- Avoid memory leak of new argv when HEXPIRE commands target only
  non-exiting fields
- Fix HINCRBY and HINCRBYFLOAT to update volatile key tracking
- Avoid empty hash object when HSETEX added no fields
- Fix case-sensitive check for the FNX and FXX arguments in HSETEX
- Prevent assertion in active expiration job after a hash with
  volatile fields is overwritten
- Fix HRANDFIELD to return null response when no field could be
  found
- Fix HEXPIRE to not delete items when validation rules fail and
  expiration is in the past
- Fix how hash is handling overriding of expired fields overwrite
- HSETEX - Always issue keyspace notifications after validation
- Make zero a valid TTL for hash fields during import mode and data
  loading
- Trigger prepareCommand on argc change in module command filters
- Restrict TTL from being negative and avoid crash in import-mode
- Fix chained replica crash when doing dual channel replication
- Skip slot cache optimization for AOF client to prevent key
  duplication and data corruption
- Fix used_memory_dataset underflow due to miscalculated
  used_memory_overhead
- Avoid duplicate calculations of network-bytes-out in slot stats
  with copy-avoidance
- Fix XREAD returning error on empty stream with + ID
- Track reply bytes in I/O threads if commandlog-reply-larger-than
  is -1
- This makes it possible to mitigate a performance regression in
  9.0.1 caused by the related bug fix

Fixes references to TMPDIR [buildpaths] and avoids [already-stripped].

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../valkey/{valkey_9.0.1.bb => valkey_9.0.2.bb}        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.1.bb => valkey_9.0.2.bb} (89%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
similarity index 89%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
index 1f27224772..ad9aae3ad2 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "ab3c953b80289d88991095f53c1235fc2f8b44d6"
+SRCREV = "1ac4cfe4c877a6cb8cb2e28fa7094055ac06f64b"
 
 RPROVIDES:${PN} = "virtual-redis"
 
@@ -44,6 +44,11 @@ do_compile() {
 }
 
 do_install() {
+    # Remove debug paths to avoid TMPDIR [buildpaths] errors
+    sed -i -e 's#${TMPDIR}##g' ${S}/src/valkey-benchmark
+    sed -i -e 's#${TMPDIR}##g' ${S}/src/valkey-server
+    sed -i -e 's#${TMPDIR}##g' ${S}/src/valkey-cli
+
     export PREFIX=${D}/${prefix}
     oe_runmake install
     install -d ${D}/${sysconfdir}/valkey
@@ -63,6 +68,7 @@ do_install() {
     fi
 }
 
+
 CONFFILES:${PN} = "${sysconfdir}/valkey/valkey.conf"
 
 INITSCRIPT_NAME = "valkey-server"
@@ -71,3 +77,5 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "valkey.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
+
+INSANE_SKIP:${PN} = "already-stripped"
-- 
2.47.3


