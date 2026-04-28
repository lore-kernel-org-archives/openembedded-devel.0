Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB0FFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 05:01:24 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5613.1777352481280107492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 22:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SXKfe+Pv;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35fbca04006so5497374a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352480; x=1777957280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x42WgRVhc14RnVAORzOf5KwfCSZGMqkrELCivQIQBAI=;
        b=SXKfe+PvUlCErjVEkMAuucaAQKwFsIl26+Y371bw8oLiKj43fnj3+6/W4DZlLDQQR3
         xE546STFy4UNelqtV1KoFkwdhnnEdbcMBU+YvSRqQTZFxh+hnPNuZ0RxQevZKRryUwfM
         FJyUyfOdVjVH1JbP9Tmv32PzjpMd1ngpLTV8fzDBoqTSpCYL4MheUm/vpEl9EBYhF5GY
         lcM18YYTsMm5NUhnDWcOJXhuE8Jgr41a4B2OQllFTfXSCZAFd/32E8DO+nE9xtrxpEPb
         21FU/v4iJIG6j9fD19iIwGkzfhEHvlldDnFEqOTi2P8LuWxv3Mc+FC3wnbeTCBgjVqHo
         tgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352480; x=1777957280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x42WgRVhc14RnVAORzOf5KwfCSZGMqkrELCivQIQBAI=;
        b=iLgM8XawEXylCOMVBHkPOhXKC21g9k1RpXVNhiRuPoPtwdOI5/M4aeerwqAzn2nYTG
         5pbf6vplXkkCYLPLx9O4BlPw6tAgqoV3LCZQlbBGURmgTrQXo2bCPC/l7QWEuw1L8MP5
         HOGsESwwbOgB+5x8UX65wzipQcj/E/R1foXQy2J0nzRZUuHzQpZZCBxU5FSx67DgwE06
         2NzS4O2yBm4jalo2sOByLu/s625dKdMHZ0zWgZ9ySE2BFg2z1HmeUdg0/Sa1Xm8zYd+z
         ecc07X66VIpWCjWy+ACXef3UHwpmyb8F9EYAPa/UEOyVHDbjSP3wRf51bwRORKXrhktx
         SkwQ==
X-Gm-Message-State: AOJu0Yz6CaJ5UPGu9jpT9kZ4EaXvsQAyx1ws5k1mxe/gR232yhzTtaYA
	qgA2bjDOX8INByB1PFvf8yZM8m7NDK5ohLmo/QbG/sRLBip6csAr8k8/EzVkxrKT
X-Gm-Gg: AeBDieueGL6H67QuT3Ns1HJhiQn+7pMLc3FAxomkPkzIFt3Amoy0OX9W8cCS5+hXasv
	r6nwOb5b8J9heUCKt/ifB6qsMiY+m9Xtr94dS21ozc05Zyv3b5eaFAVM3h3fmODh2yIPr5+HWqp
	GcEvMUkQ2gTc+do+lW+JLvnNr6DWFBz7Tx+UH6h/NKjDW5g9sOQhOUTL/MY24nDBvN/ACV5+431
	Nrr0JE4cCYDwZslJ1BZcX/r57Aq9yd5K85lK4QnuC4o1EgbYWD4jdia4H/+b/VyP31b0rbCGIct
	YeuMgGeyHwOWiBwt0hX8+bGhKrvmZthvWhzZaAoUQ5OrClLH3jo2vwfkhVkTqqyKqH5s+au361W
	+hqw1cg/u0dESGijASzw+wrLeI9ywIMacy/8Y3yHTADD0S4kTLlZ93h6LVgkCHLQZKQlKFFBkVI
	e5ksQfRQ5eZVpNcUJevNoCFmuZkVVkbrGqb3mDSVPYBbbfnFc=
X-Received: by 2002:a17:90b:3fc8:b0:35e:581c:6bca with SMTP id 98e67ed59e1d1-36491f89b6cmr1509244a91.3.1777352480370;
        Mon, 27 Apr 2026 22:01:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d619sm11798385ad.70.2026.04.27.22.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:01:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/5] corosync: patch CVE-2026-35091
Date: Tue, 28 Apr 2026 17:01:04 +1200
Message-ID: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 05:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126641

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
index 0cb475a4d4..0e7f48272f 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
+           file://CVE-2026-35091.patch \
            "
 SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

