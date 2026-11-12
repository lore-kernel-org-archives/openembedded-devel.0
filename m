Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8134.1794465763341780802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Hkm6u0HO;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2479728a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465763; x=1795070563; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWG+iU5k52x7A96/qBOpEd0BPM1hYkjPSBrfQ8O22uY=;
        b=Hkm6u0HOJyZwq30aUVRAzShi2JdlOGvZHHk7+Xl+xRYEjIe0soIBMxR5gLDYZpoVA+
         tYUfxftvRYDP+5bCkyLUBLxxA9TPeQSNqbxBQ8c8hZRiw613CWzDeCWBSktkuWSIQUMs
         cdIdumTP5+jSyIyG15euwMyDtypP9v3w3CMDRbIcSKLHiZQg+bQyRYK58cxBYaK1QeUc
         kWpc4U3XNhNatv01Dg2/J9j76VVnQOsyNk3fMOBuUkr0z0o/WBIPTgghC9Ggb9kntwlP
         e7vLfCJOVfMdUJL7mCB39ykNJNxy6jtFMk9YiXYfBrVKOu+BuFyQyas1SSFF/3AfxgLJ
         7oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465763; x=1795070563;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWG+iU5k52x7A96/qBOpEd0BPM1hYkjPSBrfQ8O22uY=;
        b=h3mKzPTuXLjivijsTFSRRiG4Qy+S3FO37IN94MRdaMJHvFmLiSDQTytbTYt6+4VB7E
         DceRXPd4qj6cKibnBHMupMM+rBZp3EfIoRQId3HuEOhyQCnaLO4aLsgStaw9GhTJ4fCa
         h8VFb9d1eYVaeFC89ab6fLK/3JcebXbnzhwVykVHCYTOdZkLmypeNWHUxFBSvN3Of4US
         lxll8D1XwKli1SoXK4aJT9tduR5jEcBT6rAA6J/kbkeIzWu57nvLSseFbGuOjJ0sMHiI
         ULPyj9A1xxj55cM7/AyOY/eb2BxTuHnteuU5BBqv3CF+K8tRYprTkGgsCynFdkG0+wh4
         ApHg==
X-Gm-Message-State: APuU4Z+qAe16/xfcCmpL6j5fHyvzdI1uzbzZey1JaDgUtj1j26ieFyD+
	pufFgpfmmATAVz4LmRW33MPuNH8AGpDWaZ/Fuaj/N88w6tA3zee0pYvR5N3KzIaBNR0=
X-Gm-Gg: AYBFou3Y3IscQeKOzGalc1MJysWn6urlllO0rVC2HB6gx5FgY2PECq1i+JcTPe6ZmLs
	fcN3k9gVwdu8oZjdVCCV2a/uaxwQjrEEL2U2xJjN9yiOmVcuTt2PoMh7HaZqUVWEy1+SUgo8Q/m
	q4xBDZlMOtxW9B8BQNMjUruMwjIZAeMv+BBcK+ztySHIkkEmg+lQzll0pqAzb3sI7uVHCsKP/kR
	lGaKtv4WD/fNyAdwZiuVAG1k1Kd9ibMcZmty0UgM+o56x3cqdfNPPxkBl1Dn+9L86GadzS8oNb3
	mhb+9FPrRfoYajDsmgoec1WvOgxhNmFb43SAA+vBJ9vpmvyotvOIfL7VJta+oSxM7SajHquhzt+
	aUkx5eTXCxwE1ZE0019AtvQmljAEXcBCFqK3GkeWR4MqnrQNntIOmCeujOu+o0UQxyyuU6INt8Y
	5CTsofDL5jOXQ7LStTVeBdXoXEiwJx4T6T9/aRQ4gY00YhghF/6aO+0rquHJ1U6K/XXXtUvT5FJ
	3l+GeHDFr78Clnr2TFVjVvLjG96TBW3v18ZWm1TNWPtwabQfpWZkz53hxcUpjEvSFYmKYLsKcBf
	6lGggLubPfcuTkLBveHq72hmstw2KJPU15UbjFTYN0CyNTt4zRAI7E5Qz52l02I3U1uddP9HjFZ
	3kEacK0ibvkPEuHSD3I1tlKXk/Hj+U42EO1eEXFYg7ZAImglLhui3opifIOtIhKwgZT6lZF2r4l
	HD0BoppAstW8oLrzC/c/m3r0QoKb2ljVXQA4jowbPRxXHOwAZkmVGR54ZPg+Yfci5D8f73jS67l
	8aH1InyS8mJ6SbKIIYe//8z+qZeTYdY5WfioN/QTFAgZwOEmTXNlXSuhJrkFbzDCc7oCpeQxB7A
	KRVZ
X-Received: by 2002:a17:90b:270c:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b182ebe734mr4489515a91.27.1794465762580;
        Wed, 11 Nov 2026 22:42:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 12/24] corosync: upgrade 3.1.10 -> 3.2.0
Date: Wed, 11 Nov 2026 22:42:12 -0800
Message-ID: <20261112064225.2410019-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132181
Content-Type: text/plain; charset="utf-8"

Drop CVE-2026-35091.patch and CVE-2026-35092.patch, included in this
release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../corosync/corosync/CVE-2026-35091.patch    | 47 ---------------
 .../corosync/corosync/CVE-2026-35092.patch    | 57 -------------------
 .../{corosync_3.1.10.bb => corosync_3.2.0.bb} |  4 +-
 3 files changed, 1 insertion(+), 107 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
 delete mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.10.bb => corosync_3.2.0.bb} (93%)

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
deleted file mode 100644
index 8afa5d6841..0000000000
--- a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b9cb461121c8721c94a94309eb345a3c2f9ee9b4 Mon Sep 17 00:00:00 2001
-From: Jan Friesse <jfriesse@redhat.com>
-Date: Thu, 2 Apr 2026 09:00:39 +0200
-Subject: [PATCH] totemsrp: Return error if sanity check fails
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Previously, the check_memb_commit_token_sanity function correctly
-checked the minimum message length. However, if the message was too
-short, it incorrectly returned a success code (0) instead of the
-expected failure code (-1).
-
-This commit ensures the appropriate error code is returned when the
-message length sanity check fails.
-
-Fixes: CVE-2026-35091
-
-Reported-by: Sebastián Alba Vives (@Sebasteuo / 0xS4bb1) <sebasjosue84@gmail.com>
-Signed-off-by: Jan Friesse <jfriesse@redhat.com>
-Also-proposed-by: nicholasyang <nicholas.yang@suse.com>
-Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
-
-CVE: CVE-2026-35091
-Upstream-Status: Backport [https://github.com/corosync/corosync/commit/a16614accfdb3481264d7281843fadf439d9ab1b]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- exec/totemsrp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/exec/totemsrp.c b/exec/totemsrp.c
-index 35bf971..94d6c21 100644
---- a/exec/totemsrp.c
-+++ b/exec/totemsrp.c
-@@ -3811,10 +3811,10 @@ static int check_memb_commit_token_sanity(
- 		log_printf (instance->totemsrp_log_level_security,
- 		    "Received memb_commit_token message is too short...  ignoring.");
- 
--		return (0);
-+		return (-1);
- 	}
- 
--	addr_entries= mct_msg->addr_entries;
-+	addr_entries = mct_msg->addr_entries;
- 	if (endian_conversion_needed) {
- 		addr_entries = swab32(addr_entries);
- 	}
diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
deleted file mode 100644
index 8182647840..0000000000
--- a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 8f8a4747a0223b8897deda9a40a8a099c61fa80f Mon Sep 17 00:00:00 2001
-From: Jan Friesse <jfriesse@redhat.com>
-Date: Thu, 2 Apr 2026 09:44:06 +0200
-Subject: [PATCH] totemsrp: Fix integer overflow in memb_join_sanity
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This commit addresses an integer overflow (wraparound) vulnerability
-in the check_memb_join_sanity function.
-
-Previously, the 32-bit unsigned network values proc_list_entries and
-failed_list_entries were added together before being promoted to
-size_t. This allowed the addition to wrap around in 32-bit arithmetic
-(e.g., 0x80000000 + 0x80000000 = 0), resulting in a required_len
-calculation that was incorrectly small.
-
-The solution is to cast the list entries to size_t and verify that
-neither exceeds the maximum allowed value before the addition occurs.
-
-Fixes: CVE-2026-35092
-
-Reported-by: Sebastián Alba Vives (@Sebasteuo / 0xS4bb1) <sebasjosue84@gmail.com>
-Signed-off-by: Jan Friesse <jfriesse@redhat.com>
-Also-proposed-by: nicholasyang <nicholas.yang@suse.com>
-Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
-
-CVE: CVE-2026-35092
-Upstream-Status: Backport [https://github.com/corosync/corosync/commit/4082294f5094a7591e4e00658c5a605f05d644f1]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- exec/totemsrp.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/exec/totemsrp.c b/exec/totemsrp.c
-index 94d6c21..6845cec 100644
---- a/exec/totemsrp.c
-+++ b/exec/totemsrp.c
-@@ -3786,7 +3786,17 @@ static int check_memb_join_sanity(
- 		failed_list_entries = swab32(failed_list_entries);
- 	}
- 
--	required_len = sizeof(struct memb_join) + ((proc_list_entries + failed_list_entries) * sizeof(struct srp_addr));
-+	if (proc_list_entries > PROCESSOR_COUNT_MAX ||
-+	    failed_list_entries > PROCESSOR_COUNT_MAX) {
-+		log_printf (instance->totemsrp_log_level_security,
-+		    "Received memb_join message list_entries exceeds the maximum "
-+		    "allowed value...  ignoring.");
-+
-+		return (-1);
-+	}
-+
-+	required_len = sizeof(struct memb_join) +
-+	  (((size_t)proc_list_entries + (size_t)failed_list_entries) * sizeof(struct srp_addr));
- 	if (msg_len < required_len) {
- 		log_printf (instance->totemsrp_log_level_security,
- 		    "Received memb_join message is too short...  ignoring.");
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb b/meta-networking/recipes-extended/corosync/corosync_3.2.0.bb
similarity index 93%
rename from meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
rename to meta-networking/recipes-extended/corosync/corosync_3.2.0.bb
index 77dea16e98..d8e697ca4b 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.2.0.bb
@@ -9,10 +9,8 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
-           file://CVE-2026-35091.patch \
-           file://CVE-2026-35092.patch \
            "
-SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
+SRC_URI[sha256sum] = "be92a882ec738b17528777d344f54c6784245fb7b9dec20fcd9022adaac12bfe"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
