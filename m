Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE61FB3D09
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48198.1774867151175678743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KvAFvrNT;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso1311967a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867150; x=1775471950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cktH3eFWUEb2htXAEEc17Qm4DtS+a2f02SSwCTVpw/Y=;
        b=KvAFvrNTqWb+x8Aw1dHp/vdDi31XV8o+xrQfT9WWz7aQa0HFxsAU38cI8DsSXGINjG
         T4as3ZqMd5j8f/fKbjrbuwLGEJVdC3PccL1ouRV98ZkHiVl5Dc+6PyBlX337pK94I+WV
         +QOINb8eoogn7DNCc1e/dySy5e5gUy70Itfqx5OEqtN578jWG8K80/VlxJpM2TPDrZBs
         O4kxjj26S/NVhQmda/OR95GNllHA/iAx6iYNbD+ln8OsnGTGWwuRvtIz+mMKL+I+4hl1
         LubosVFrdxtZGHHDRSMqFbA1KiwoGcHrTs1AQN1UHegV/ZlCIljpSTh1jM6pvyAIg5l6
         REKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867150; x=1775471950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cktH3eFWUEb2htXAEEc17Qm4DtS+a2f02SSwCTVpw/Y=;
        b=eGlHVhS7+GILApNTeL9m84M4uu4YiNRDk8Bn2SlKJWWNeI6FuIG5Sqip2DdQ37WMzQ
         ntqpZIt9xAKgivUtT8oXIZQJFbbYT92aNtOu/mq9cQQg7JWnLXld5nkj944JmyBg+4JK
         O8SvDRwG/mdLhbxQPgCEcCoMJDj2ng0O1Kk/NpjdbvcBb9sK+qkkEVXYUoGtKVWvJJ2V
         4zZslJh/gED9PSbn6g1ngGOgVQpP84ZUTAyCBRvK/6lA3OHvySjnsMPAr0rSg56S4+3U
         oUwn5NHNIbu6ecHSEzsRVLXGjAkxJQeJLir9Fp9KiNywedp4KAcZKH4nMKG4vJGUvNrM
         yvNQ==
X-Gm-Message-State: AOJu0YxU8Q2qpOXJjjF/eMJ6x8s8i1Eac3WT2B0rAPgMtExCzPuqfWhp
	upaK9RaglfIcu26J9C/Dgls1Wz6qJPieqaZLZDoWJKe6MnZru+7vOU9OzmcWGQ==
X-Gm-Gg: ATEYQzw3BRq790m0RZd98Tza19siFlZmOuWSNUv8ncbXPtSmeR5TxPVqtCBW+yr4L4a
	rkGr7GLcSS2sPumpUghXApcvT8E/zkdoQeIKXQF52N7qLwz2h0hEPDhk28r+qd4B5VXyKWlZ4bf
	MF6lE5+pGla3LS4yb0y2Lm92rYtYfF25DOwdiOs9gnka24c0/FSse7WTKH2sNMPNTHzlL08nwwc
	JkFaEgHnHD8cxV9RmJdSvMlMqQi7G+boQOxctGBEuenV3KbPW9FIeFXFzH75Gl745gnWRjOUUgv
	ICi3THs+tWyNRWIVMLXmg6IrIK+h5MfE2aw6ePZSfmU38LoBVEokCvq6eWSiL78qDWR7e32zLiG
	fP9XxXofDwrKzvNIAE/m0xKEYWEruYLUYWczbX6uo6x1zwK4HTUCCVV8iOC0xyKDQfTO1nzZEOt
	DH6BDUeeEQv09i1mjyfDr0bg4AFr9+GpTSu8U=
X-Received: by 2002:a17:90a:2c83:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35d9d28eb8dmr3415872a91.28.1774867150394;
        Mon, 30 Mar 2026 03:39:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 3/19] openldap: upgrade 2.6.10 -> 2.6.12
Date: Mon, 30 Mar 2026 23:38:30 +1300
Message-ID: <20260330103846.3381644-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125846

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6c54894209663b048f67ae29b65182f1b540f3fa)

Changelog:
https://git.openldap.org/openldap/openldap/-/blob/OPENLDAP_REL_ENG_2_6_12/CHANGES?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openldap/{openldap_2.6.10.bb => openldap_2.6.12.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.10.bb => openldap_2.6.12.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.10.bb b/meta-oe/recipes-support/openldap/openldap_2.6.12.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.6.10.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.12.bb
index 9ef4a83584..beee1b2738 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.10.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org has listed this license
 # since August 2019.
 LICENSE = "OLDAP-2.8"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a41b4ed95ab4a20f366a8d82536afe4 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=e71f8d80fdc11f3cea5dee6ad13679ce \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "c065f04aad42737aebd60b2fe4939704ac844266bc0aeaa1609f0cad987be516"
+SRC_URI[sha256sum] = "1716ad779e85d743694c3e3b05277fb71b6a5eadca43c7a958aa62683b22208e"
 
 DEPENDS = "util-linux groff-native"
 

