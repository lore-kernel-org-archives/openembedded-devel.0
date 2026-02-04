Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209F8E9D3E8
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:36:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21710.1770215769115708473
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iZ3eoq+d;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f2599980so41690125e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770215767; x=1770820567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgsVtM/KZ/JeBXaeCCwbOFFKe76TjJavBP5U8Z0ZYkk=;
        b=iZ3eoq+dJX58vmJyFPb2diQjOtdY+NZx9mn/q7AU60DQCaTHdedBtYR0rnQvpnF2qG
         TDasNsQkJ1We51+hyYOYIauuKghym6PQPSAI3t1Msa+BUrCDSgIS1z5++HmhiRUP/0mi
         suLwrgX6VwZw15eCqDaaeFpIKWkZpErCANcz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215767; x=1770820567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgsVtM/KZ/JeBXaeCCwbOFFKe76TjJavBP5U8Z0ZYkk=;
        b=OsfBfYEUUWj/BX5ik5tH95KpC5G45Pgrv6p9kDZFZJ0H4r/Gb7x11ALavoNBm1v/gZ
         VQr+dMOiG7MNnmku0YZ5V2yZuuQ6bfW99pju8U7zsTKjYUcZz+UR0fekP6ERrBMnvLSK
         +74RWQ3dKvrZPo0vVoWeroTbTsvgDuZgOceaKNUBmj8PhDBjb79Q0dXXvadVr7mEDLnu
         /PB7OITTw3vjq1uccQKN7CAs9BsZ9bc3asFJkB0LRgvdvDw6fOpeM5iDxeQ604uM0Y1j
         ySkkLiSe0XCekej6grlUZj4v7E9U+CsJMX1TlgMiZHBgFYoPTH1F6hj0DinxXpdwTiOY
         uRTQ==
X-Gm-Message-State: AOJu0YyOYU6LQZcUHPCP7wy2kFBKNnclIChiiwT2G5A3kYoQV1xK+yPN
	AGH4wKidcDmIUqnBQ+0f0wZ5Bq/PiRRoFg2drtmU6JSCL6cVpxhFSLc6SLI2jlGgHKj0ezsG2p4
	Fbg/Fhuc=
X-Gm-Gg: AZuq6aK1tyix4I7+2Aya+OlpPuI5nkJ1QHe3Rtgd36RmxzI9mU18I7I+nhbnIUtJ94Y
	OzAGxSe1waizw2GOotnrw3VMVTizgkaoe9N3rw/2JVpadI5IHK1hjv8pEF3C6+0iscTAeBl2bcc
	ziysjr912CZTHvoUC8hgLqoH9kxplvCpMVRCzYdzmYgQkVnSy4abAF71X6jWL/WUfAojIy9ZqYm
	d9iGPgQVNXBmfkTWDUTiba8wL68WBRetzjzb62ap18uqs3GDLDuilMOLxOji0dE82UM+yvHnWjw
	59zovkVPjNPeo0J6xBv+wZxstdijjhl1AhD0QK5rzk67ax8Fx70sqnynUQbRsQmuAnIPyEGCjsO
	naCIDM6zOF34w+Aub1xaKceZfneOcY5LGHWMaoUvvDBcXw3NEPzwrcBp040Si3vdrKtBcNY/soa
	0f2NFBM9tJzWa1v939BQgL1cvl
X-Received: by 2002:a05:600c:c04b:10b0:483:a21:774a with SMTP id 5b1f17b1804b1-4830e9926cbmr32916745e9.26.1770215766590;
        Wed, 04 Feb 2026 06:36:06 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108ec315sm43864095e9.8.2026.02.04.06.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:36:06 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] valkey: Upgrade 9.0.1 -> 9.0.2
Date: Wed,  4 Feb 2026 16:36:03 +0200
Message-ID: <20260204143603.1103031-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124129

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
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.1.bb => valkey_9.0.2.bb} (87%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
similarity index 87%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
index 1f27224772..3334f57599 100644
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
+    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-benchmark
+    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-server
+    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-cli
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


