Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7BFC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 03:41:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.7939.1749008464735016725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 20:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eROJXZAc;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313154270bbso53037a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 20:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749008464; x=1749613264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xt8iFyJlZcv7BMybMBbS2z1o6oDgZvj/dwGIQgotbNg=;
        b=eROJXZAcp6LFNvjd2YeaJU6R2hhqm6y/lTNG5N00b/ZcRExHSmVtEeXZnVr5KmMgnq
         oN7ArugE0UXEPZ2RidWTn0w3r5Jlp4gQJeucRTJ9ePtHQ6FzbYH7qF5L6R0HP2hhSeyb
         YaZRi8i8CYrZZRFNWVq+6VYqt2DKGGrZ1Zlxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008464; x=1749613264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt8iFyJlZcv7BMybMBbS2z1o6oDgZvj/dwGIQgotbNg=;
        b=wspHQ8+tUi4RrS9tP+tJTwcz/ixha/2+sQvb+XyIY8/cA0RXTA9kG1qxn0zyEpKTf0
         0TwTStatB5+ENQrsp98Ztbqo6aiEjkqKUj6VCl2DB5eBPaOT9x7jphf9cnA1BmWPHJHY
         Pw93mWVBklRnGFtNn8W2Sgiy1IhpzdJ6OC50uhAfoA7jaW1jfQQYc8RnTHQP/0YbaYKj
         kYUulZ8//pRQTKQRjhLmcJT1h3lVwd+RKKD0oUNd5lUhw8N41uhQyXcqY5DV0/KrXsWZ
         JLNAYyPuupXKeHiyxX6R5IlyQCxLyw3fw49lv109kHs3s4JkxhRuINTvawDmK1kYaj7/
         Pm5A==
X-Gm-Message-State: AOJu0YxTum7LFyiVAZEpb2yKSJlufKeE6Zdfng7YpWcgm9lgmH+Phx2w
	mDL9AjSraMH51GknW+bzRXFwoUdFQwZgtsaUnsiKg6MLlgqCXwzWlKHcfy5QoKj6nvVjlf4DL/c
	Vsip6Ugg=
X-Gm-Gg: ASbGncsjjRAJZYWJe6k37mVAxHrGQkppnILtTjziRVvrl0R+IjuHL8KEzwWDi1LKTCI
	5rkglaOm7DPkz3HMRHFz9G1LMIkOr3CD437M0Q9vnc4d02iPutPTRjENjBz2a/UBRTUbmlWbd1b
	FKw4AAyrOcqyYonRaaAGzH33S+YzBIxZxBhQgibwAVi9tvncUXEwLIi6wUaxEf/EE8mpwPwD09K
	y5rh/bDlF4xvOSX6Xto6Ba7VLWKLaS04CmHirIgHDl1eQl//otqX99pQ2I+RglZ8LBlwAYXGVmd
	ctN8kzAt/gh6pbPxcVBzzquZ0+ckpXNgSqRyiP7BT2Juhe0m618wRyRduUnvHj3/CeXSYnmxGQ=
	=
X-Google-Smtp-Source: AGHT+IHAN+7MUW0GcPCT2+ieP6nl173CwwPEbkfuzQAkvPmHhJdARoqMPFJva8hT+/xdmn4GjMIX/A==
X-Received: by 2002:a17:90b:1e07:b0:312:1c83:58f7 with SMTP id 98e67ed59e1d1-3130cabe818mr2547904a91.0.1749008463704;
        Tue, 03 Jun 2025 20:41:03 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.214.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd75d6sm94876205ad.123.2025.06.03.20.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 20:41:03 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][master][walnascar[PATCH] jq: upgrade 1.7.1 -> 1.8.0
Date: Wed,  4 Jun 2025 09:10:53 +0530
Message-Id: <20250604034053.8065-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 03:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117727

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
==========
https://github.com/jqlang/jq/releases/tag/jq-1.8.0

Security fixes

* CVE-2024-23337: Fix signed integer overflow in jvp_array_write and jvp_object_rehash. @itchyny de21386
     The fix for this issue now limits the maximum size of arrays and objects to 536870912 (2^29) elements.
* CVE-2024-53427: Reject NaN with payload while parsing JSON. @itchyny a09a4df
     The fix for this issue now drops support for NaN with payload in JSON (like NaN123).
     Other JSON extensions like NaN and Infinity are still supported.
* CVE-2025-48060: Fix heap buffer overflow in jv_string_vfmt. @itchyny c6e0416
* Fix use of uninitialized value in check_literal. @itchyny #3324
* Fix segmentation fault on strftime/1, strflocaltime/1. @itchyny #3271
* Fix unhandled overflow in @base64d. @emanuele6 #3080

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.7.1.bb => jq_1.8.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.7.1.bb => jq_1.8.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/jq/jq_1.7.1.bb
rename to meta-oe/recipes-devtools/jq/jq_1.8.0.bb
index a6a1d6a07a..af35324b5f 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "https://jqlang.github.io/jq/"
 BUGTRACKER = "https://github.com/jqlang/jq/issues"
 SECTION = "utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=488f4e0b04c0456337fb70d1ac1758ba"
+LIC_FILES_CHKSUM = "file://COPYING;md5=08ffb5ac7e7e6bfc66968b89f01f512a"
 
 GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
+SRC_URI[sha256sum] = "91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c"
 
 inherit autotools github-releases ptest
 
@@ -26,9 +26,6 @@ PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
 # enable if you want ptest running under valgrind
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
-# Gets going with gcc-15 but See if it can be removed with next upgrade
-CFLAGS += "-std=gnu17"
-
 do_configure:append() {
 	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
 }
-- 
2.25.1


