Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B412ACD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18367.1777549630898553615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IcyaMiyf;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so481083a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549630; x=1778154430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKdwbkhPuFQ0MyhsfvWL/5UpZi2aDcymWWrgH+1Gaf8=;
        b=IcyaMiyfY5RgfesNBqR/gpxOgrlZQHqg3QL7Kt/Xdebc/rU7Q3Y2OdrqOx4ijPm8zY
         SJ3i8KLPju5k5xaQsRc76rNz1Q1FLwFDr6zoF4YN5VNusxyOeygJMuzI8AArGcFUFbTU
         CF8KTsaAPmmbkVITATX1mulxKGBzQ+hl/PHcXNVO24UgQQo1V7BMxZsYOQhf48BTqFSG
         SL510biBLMCTILZqnJ9WediQDbauY+pbldTpYhxpSj2hti9XVurnkLOGDbff2ZVx4rLS
         g7noZEmK9N+MPn6OkAu+2uGNAkdbU8jFl5j32iMWlLwUDhZgjr5bXgaEBuEoGQtSiEd9
         E48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549630; x=1778154430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKdwbkhPuFQ0MyhsfvWL/5UpZi2aDcymWWrgH+1Gaf8=;
        b=mfwqL9hBDuNTC48sYbvmodEcYYXdS8GeZfRgZoYJUjzA0hihl0ko1NppRcajrDB7AD
         T6skTKJ+3HEpW1Gs2z0YysTD1hJF9K69sbfTJPNLweMFT51gkF8F/hO4usF4uiy/hhHB
         OB9lmZ40PSySKy4aGJeTHWvagOXUH/46yEYny+SdEF6dcFFErAYI4ill5yn0iM3oQrCv
         t1/TQasS3yNijHrU+ukWowJAtmyEYBnJCGnbG3aTrFuYKA5Qcs4Y8N7hCPFfYp7zH2gD
         erd5vul8/G0YJ3kiLr4zudohrMXw5M4rIt7Pv1I6n95vootyiavIT05Ku2PopUpTqDxO
         aljg==
X-Gm-Message-State: AOJu0YxLslbOzSRqqN/2qB4jBtjbMMlUYm3mVWF6XIPh1nN8/XPdZrXL
	n1Rkg6o14ovwceWQXrmqZasJjoPw5Smufj8HGbhcF3QScMce48kic8SWQpNilLUB
X-Gm-Gg: AeBDietW+qsR5tH4A/E3FajHb9SbG1cdSJ4Knh967CtKGhHK7GiC1BDKMMshCXPjKuC
	eUZSPGnKYgV3UhxkwlsLcsP78swNx4EAQSO4zEOTr8QFG4C/mjvh8dgVf/AeuDkEdGRQKfaVysC
	XCIeLDGUhGflHCsVGofU8jPEFLJG0kH5yx2fZZCgvILA/AJYA4AQDPzDIE6IS9VBxGNjxipTXjB
	EohYFyVy0OjXCwX2WWgt4YfgwUAJZVXVdkkTcgG49gezL/qk5emPR2+oddkfn2ELDcJYWpyaa+x
	ih769hZZITGA3XrYLd7NG+73KFVfWOyoFCP6//xKgkOmUPrOrGwv+Ht7jyNEYW12cvYxpft/VYA
	WnnZ0J8T4COHi+zXVlTs8hzvmrobx5Fw6aIMr1tI7PtJHvpgtOw9g89FCFtZxPg10Dkfu+FnIZ5
	LBxBpZZuedAS95OdX+GcHB/XiG99Y8yKJ31zJEv7hSa9IwXKFPg3NnfKF0DQ==
X-Received: by 2002:a17:90b:5783:b0:35f:be09:1a2b with SMTP id 98e67ed59e1d1-364c30042bcmr2769765a91.10.1777549629917;
        Thu, 30 Apr 2026 04:47:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 4/24] corosync: patch CVE-2026-35091
Date: Thu, 30 Apr 2026 23:46:27 +1200
Message-ID: <20260430114649.4184890-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126738

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-35091

Pick the patch that mentions the CVE ID explicitly (it was identified
by Debian also as the fix[1])

[1]: https://security-tracker.debian.org/tracker/CVE-2026-35091

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 701b22fda35648efc333d6e6e7abd8e70aa49870)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../corosync/corosync/CVE-2026-35091.patch    | 47 +++++++++++++++++++
 .../corosync/corosync_3.1.10.bb               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
new file mode 100644
index 0000000000..8afa5d6841
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
@@ -0,0 +1,47 @@
+From b9cb461121c8721c94a94309eb345a3c2f9ee9b4 Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Thu, 2 Apr 2026 09:00:39 +0200
+Subject: [PATCH] totemsrp: Return error if sanity check fails
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Previously, the check_memb_commit_token_sanity function correctly
+checked the minimum message length. However, if the message was too
+short, it incorrectly returned a success code (0) instead of the
+expected failure code (-1).
+
+This commit ensures the appropriate error code is returned when the
+message length sanity check fails.
+
+Fixes: CVE-2026-35091
+
+Reported-by: Sebastián Alba Vives (@Sebasteuo / 0xS4bb1) <sebasjosue84@gmail.com>
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Also-proposed-by: nicholasyang <nicholas.yang@suse.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+
+CVE: CVE-2026-35091
+Upstream-Status: Backport [https://github.com/corosync/corosync/commit/a16614accfdb3481264d7281843fadf439d9ab1b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ exec/totemsrp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index 35bf971..94d6c21 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3811,10 +3811,10 @@ static int check_memb_commit_token_sanity(
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received memb_commit_token message is too short...  ignoring.");
+ 
+-		return (0);
++		return (-1);
+ 	}
+ 
+-	addr_entries= mct_msg->addr_entries;
++	addr_entries = mct_msg->addr_entries;
+ 	if (endian_conversion_needed) {
+ 		addr_entries = swab32(addr_entries);
+ 	}
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
index 07d9333ec8..7ccccefed5 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
+           file://CVE-2026-35091.patch \
            "
 SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

