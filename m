Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF384CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18175.1777549634329614392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Df153oku;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-362e50b4641so468035a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549633; x=1778154433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hf4Zgmiv8DLQCxJnwX/FCIpqDUgzM/QvlrIc+bmUjs=;
        b=Df153oku+X3jKmv6RCQ/cPgvZyjUSD2bBQJvJj/Tl4N0W+xl8pg400kMxvSe/9EZjQ
         akKg3eyHKHr1drS/l31EuF4b2sUDZBMwL6lem9mPXbfZ1f2iUfiABbKfAO7GPcTHuIKp
         +QNp8ycJ/8aW4ln+5v67+6fJpv8rjBxrCPq0Z/z6ejuEe3JwyWhAvntJS2XPorTv2M+y
         +DXx+NcuBB0sZUj59o0Akbw7ACYTm9d/BEJdPlOF0sFqlitcm57ahk6cHCbzJsGtM5NW
         lOI4rLeniHANMCSGa4ZjmETgNrh5ciSJpouI6XPrBRKQ7XAW4ST+HyGLA8/UfSxbTNfW
         o0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549633; x=1778154433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Hf4Zgmiv8DLQCxJnwX/FCIpqDUgzM/QvlrIc+bmUjs=;
        b=ekZnxnKPl/Ee4fPZgrsQhn+mx0MDVPHKSdPuiAeeXpJXOiKtZrUUZfo+Ps4pTAulj4
         g3Apk+NK+nfkc0TZ7Uj9ij/8HX7BYYVtCCyDVfdL5X7+LsLpz+hrUlQ6cKoW/dJZzfgM
         nUDBv05uk/YFCmIuRCk8u3CLL0sCoDONh4yC2MBht8Y+jDb+YoSJ6KH5jih2W7jQMi0G
         9FtzZ7YRXALnnRJR10tbLUx83ceck46FXK4UCYPtUi+T5A+TFTkaXpNRVVqSWUu/jSjt
         yCXjNqXJ26El+6f89B/6GpR0+R4dHLDYiOrCX2bjo7745I06nRgVICdBrrby8OwQJpRF
         HWPQ==
X-Gm-Message-State: AOJu0Yy98l2pCDK/tMuMpOcfxYaRsMEqqywmHut8vu7hOHNPgROrnobg
	pSXGYQLBat7nBgzDLfxQtKqV3qibdyXsB95neFZcXQ3ki+BGz2ZcVqMOR8TixtbW
X-Gm-Gg: AeBDieuIBmZyYIFf2wlfTALnG7O/DDUPyZfsFP8Ude+vPTq3E4LSUCntrfEqVMUWbny
	h99eCPkLQ2aTZJH2JcQVvmgLZ1DMTbm6XQQrO+MRbItEHbVTdXh2wUwHDzfb/HTXXUkyJ+An/7C
	LZP46oWfKJ9j5y+XPws6Ih0nh2hu/tj2Ka21EMZyLgjoSgQyTEjVFLsl253NyzoV1S1FR1YJ/QH
	QSiZ/LpEArsqyU9ea2zEKfe+eJyt0n3CONlbObON9GxKWXos2j+ZJEVZF9TfIgopdH4Pbq5oOIK
	mJwpARY1Bszg21LxaC3hzBQqaxzBLnOm7n36t5euwuD1a75UT9VQSKkrqy4FdkxJN7z32bOsv4/
	mTGumaTefzMskI5C52ADinERY2MNf76ME8h34QP2kH4ljUU1Cf7ln77f4MJde69rjFjafyolfsY
	B+mRU/qPBa1WhIFEip3RyvQLqDT08nT/OqDBNfH8S65Mll/cw=
X-Received: by 2002:a17:90b:3d0b:b0:361:423d:2026 with SMTP id 98e67ed59e1d1-364c2fce7cdmr2912128a91.12.1777549633494;
        Thu, 30 Apr 2026 04:47:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 5/24] corosync: patch CVE-2026-35092
Date: Thu, 30 Apr 2026 23:46:28 +1200
Message-ID: <20260430114649.4184890-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126739

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-35092

Pick the patch that mentions the CVE ID explicitly (the same commit
was identified by Debian also[1])

[1]: https://security-tracker.debian.org/tracker/CVE-2026-35092

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit af73e716bc7150ae8d912d8af00f6995e25f2031)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../corosync/corosync/CVE-2026-35092.patch    | 57 +++++++++++++++++++
 .../corosync/corosync_3.1.10.bb               |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
new file mode 100644
index 0000000000..8182647840
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
@@ -0,0 +1,57 @@
+From 8f8a4747a0223b8897deda9a40a8a099c61fa80f Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Thu, 2 Apr 2026 09:44:06 +0200
+Subject: [PATCH] totemsrp: Fix integer overflow in memb_join_sanity
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit addresses an integer overflow (wraparound) vulnerability
+in the check_memb_join_sanity function.
+
+Previously, the 32-bit unsigned network values proc_list_entries and
+failed_list_entries were added together before being promoted to
+size_t. This allowed the addition to wrap around in 32-bit arithmetic
+(e.g., 0x80000000 + 0x80000000 = 0), resulting in a required_len
+calculation that was incorrectly small.
+
+The solution is to cast the list entries to size_t and verify that
+neither exceeds the maximum allowed value before the addition occurs.
+
+Fixes: CVE-2026-35092
+
+Reported-by: Sebastián Alba Vives (@Sebasteuo / 0xS4bb1) <sebasjosue84@gmail.com>
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Also-proposed-by: nicholasyang <nicholas.yang@suse.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+
+CVE: CVE-2026-35092
+Upstream-Status: Backport [https://github.com/corosync/corosync/commit/4082294f5094a7591e4e00658c5a605f05d644f1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ exec/totemsrp.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index 94d6c21..6845cec 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3786,7 +3786,17 @@ static int check_memb_join_sanity(
+ 		failed_list_entries = swab32(failed_list_entries);
+ 	}
+ 
+-	required_len = sizeof(struct memb_join) + ((proc_list_entries + failed_list_entries) * sizeof(struct srp_addr));
++	if (proc_list_entries > PROCESSOR_COUNT_MAX ||
++	    failed_list_entries > PROCESSOR_COUNT_MAX) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received memb_join message list_entries exceeds the maximum "
++		    "allowed value...  ignoring.");
++
++		return (-1);
++	}
++
++	required_len = sizeof(struct memb_join) +
++	  (((size_t)proc_list_entries + (size_t)failed_list_entries) * sizeof(struct srp_addr));
+ 	if (msg_len < required_len) {
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received memb_join message is too short...  ignoring.");
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
index 7ccccefed5..77dea16e98 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
@@ -10,6 +10,7 @@ inherit autotools pkgconfig systemd github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
            file://CVE-2026-35091.patch \
+           file://CVE-2026-35092.patch \
            "
 SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

