Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB7FC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:53:08 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12930.1787485978887784820
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QgKRrfjh;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so1972752a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485978; x=1788090778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seavLgGOpsHEjytHBSI901F66cZqmZEC3E9Ky9H7UK0=;
        b=QgKRrfjhSQ5F/FIBffZvMLUpr+3TLI852VRlBHzhqeooj6lOUNQBKn8O+89nPATnU+
         7E0DGsquUsay4/19we4WG/RzF5IWVw9WA8DQvjq1EYAezmKqmKfKKgNTr7nzs1sTo9s1
         /+qRiMs3GIFyDyUcRPv/M0HW+OkKOcgaUq+V09LGMIotTItH9OWGtBJpkGB1DayiXFQm
         uwUvHHooH+Q14OVY9CVB4xvrmVGVuo8zKWQrMUR5kRIiFof2EeX2g8bVLSqI8+uf9AyT
         8X9iUdgSpGx7VUU+tq/0mv/hYtcxu8xI3xjkJIZRcTZ+GPe7IToVshPet9W2PzwxVGLM
         CZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485978; x=1788090778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=seavLgGOpsHEjytHBSI901F66cZqmZEC3E9Ky9H7UK0=;
        b=Dp8QA3Wl9U1QF1Xh3aH5uJ89k9Gvi4x/Gm+JPcChOcTwZ8/AjDDjjBmZ1yZcAhElwq
         /1P2gA8LovvuNeckZl7Z72l4ELDjMXdrXb5yeRMOxHTSWy4ThbDJnQwMJ0KNHINwfU9s
         wGFIs50C4DtaVUwSytBxMn8rwXKvccGJfl/FzTIF4LusRd72xnoMo4b8/CCAkGVgmaY7
         y2vPhPQRoFfIYVxG0owfCMh61kIKunQrRZH/F1hA8hGFUTu9L2wKHqqtcEY+qR2MMqRt
         dAE52iS9JIpWAAFeHHZWNJOSzgoZSCbPtKXSJ5iN21hrGhL6/7Kkz+wyuKluXdXIUTpY
         7fEw==
X-Gm-Message-State: AFuF++kNvDMITaJPi2mCmVxBerUiS5KSwxxLL46nj8kK/RZphmeW75kc
	ua4i480PIJVtpBVwoU3FQxCR3w30iqnM3EPUQBcqeFM1nce/ncH6DggqImHsXA==
X-Gm-Gg: AR+sD11uJ/YZZF/Kj3dICPrG5uA3CWXMp+UsPwfY4BX46v5T/dlW54/pD9WXW8aWh5D
	iV5oBwb4j1jVthEYha+nxxFSGGb1kXsFwH0kjon9FvUiEDew1sBJ1dc8xTisl3XEgxL1Tl1XP5W
	E/OX9F1n13uFkyrSgz0BAhitLazf6i6BPKOMiChQM1+8+PAH/k7hWbN/W4DA9/eqgPEyNLbTFRI
	So3jQVSipUQS+Nw2lAKbHqtBRgLxro3QarBEoKui6QTIRkWFEl7lMSSk8WN3/2xgaFhqUeeMpZy
	SqMtvLNuwd0gIbVSF2SOYR91DPhLxanRRoFY+uRxLddnEtExr6hczGmoppt+ZEQ3QXptRUYyDDs
	6WJGez+ZI4vHWfl/4cliod01+Efs8Urdqjuh6qZSK649TJmcU74pixFZtacFDrh5Jve20sMm9Hu
	qWvJAZI88DFx6e/WDIRY6YY7tk+rB8W1NWK/I5rVrYphfp679bnQ5qMiGwECbaTOlRm+5LNbfjZ
	g==
X-Received: by 2002:a17:90b:2cc3:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-395df29666cmr20484210a91.13.1787485978230;
        Sun, 23 Aug 2026 04:52:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 19/20] samba: upgrade 4.23.8 -> 4.23.11
Date: Sun, 23 Aug 2026 23:51:57 +1200
Message-ID: <20260823115158.1582363-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129453

From: Khem Raj <khem.raj@oss.qualcomm.com>

Stay within the 4.23.x stable series (do not touch the sibling
talloc/tdb/tevent/ldb recipes). This picks up two intervening point
releases:

- 4.23.9: bug-fix release (use-after-free in ACL claims/conditions
  handling, CTDB read-only record use-after-free/resource leak, RODC
  auth fixes, among others).
- 4.23.10: security release fixing CVE-2026-6949 (TSIG/DNS OOB write
  crash), CVE-2026-58216 (KDC kpasswd OOB read crash),
  CVE-2026-58218 (DNS TKEY cache-flood DoS), CVE-2026-58221 (LDAP
  privilege escalation via internal LDB special DNs),
  CVE-2026-58222 (LDAP Compare filter used as protected-attribute
  disclosure oracle) and CVE-2026-58224 (CTDB protocol
  bounds-checking gaps).
- 4.23.11: further bug fixes (DRS memory leak, pthreadpool fork race,
  RODC/NTLMv2 trust fixes, CephFS vfs crashes).

All 13 existing patches (including the musl-only pam/getpwent_r ones)
still apply cleanly against 4.23.11 with offset only, no fuzz, so none
needed to be reworked or dropped. LIC_FILES_CHKSUM for COPYING is
unchanged.

Build-verified with cleansstate + full build for qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f971f62ef16f1f6feeef5219baca0c5d4cf8cb81)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../samba/{samba_4.23.8.bb => samba_4.23.11.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.8.bb => samba_4.23.11.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index fb00dd2ec1..c5bc3f8bc0 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -39,7 +39,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "976129847456dc5b78c00f8ffb79dc605c49d6aaca8b2aa772fd22dbb69fae01"
+SRC_URI[sha256sum] = "089fdeeaf83593d8f9a16847a86b6cad2fc90f7a893eb8d9d5f509bbecadc0d4"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 

