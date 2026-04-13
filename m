Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222A4F531C0
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.278779.1776103351330935725
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QSn2h7uJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso45035995e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103349; x=1776708149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYPuPUpN6Y4UXSvwJq742vxQBWSNjm3kQvZiRSr9/a8=;
        b=QSn2h7uJViiDLl8heX5t0ykXqRcKrdKSwupIOupz/q4b7FKsS3ROHdBeYOaOxytEiH
         UNDMxppMEx8dhxLthVtJyahmUz0URxNJmr3ZQTEZgnBfuAd6me/DNHfI/Y5ACx0YapTZ
         U/rlyshg/xXQO3w2eXVHK4GAG1Y4PFEzsfpfNjsVqTuHbV+aAn2Yu969i3kcs6K2tRKP
         cxLE2yKVHjvUFV3/6hhHY86OTY6HUxSeiQIXijLhWSjKmJQMJsX25Nd5Ai2Fd95pBTE5
         n96/Oog7bsnRKWJ+c+mgZsrkLQ6V8+rf1hKADFYQhyPoZckATIAN8fMe1j92UZ/9ulG9
         1kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103349; x=1776708149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYPuPUpN6Y4UXSvwJq742vxQBWSNjm3kQvZiRSr9/a8=;
        b=aYbcxIQOxRJY2TYDvuF5izFiz83qt8bGxfF+sMY25/K0y5HwUnb/VQEejkuJl4G7o0
         /Tlasr90/QSRs5IlXNZO1moJC/CmnAqsyxDQefwNOh6TsdPNFHXYef3KlRxNUNaMS0xL
         57SMgFxC4YVHqQ+JTK29YR4j//He524wYgysqrK0wPxCQoZko7GcBQLGli5oO9vM9gpJ
         3qbE4GwntI0nX23JEoBK9lrtAVQjCfSIHSWZuYA51Zs5mx8Rzg/Ies8mEcqNRuNQLrUF
         44wHu5S/38VE6b2iS+OIlnn/KNY6chWBagMgSztLXFolM8BqX+WvZNtwdRWbRM2zGtze
         a+HA==
X-Gm-Message-State: AOJu0Yyfy82VV4GEe2IqLo1SBcktmOlvsBzrFcPR/M8YcmkXp+WGo6My
	cUMQxaBJDxeCc+KEZMduyxq0tHmlIdVstV5HkAySqG72cl368I/KWPNO2yqPcA==
X-Gm-Gg: AeBDievIXhjPATXCdlPzyJb4LNbg07c+un7/IgqFB1I0RlK+ihX78JjeSaKP8+sGz9R
	IE0aliyA1PJmVXnZlgMxUrc5/WyUJ9JbvvOyR98WLI5gSprDazoM7pNFHDYket/DPhREQFDIaGS
	Q588vRBA2rprv4TBtWn+Wg/T3N4F0TV2JSCpJoPuNprW/TxAu6nxgIOH+3EXSfnCeEwvzlg8qTA
	JsIsHa3zbcS3AS+yiYmI2x6Ke2cEXQ5M9fdBySjN2thTA4X6a5y1Ho/Rl8y9smVuVx93uduHmkj
	Vv5XhjtHGIrHM/heyrIw5G7m5pqRAQhwNLh2esp5tDnkA4P4HFaEU1EhgcbpOAaSQIy7nCFDQYt
	C4vnDhRcC5It5bOqbt2aild9n/Xl0Aub8Yn9AHGtd1OQxdsDVX64533asR/T19CRrPgnieNxIo4
	EI5+5z3D289fUKermW/xHJ02Ftfnb5vow=
X-Received: by 2002:a05:6000:2583:b0:43d:7d24:b506 with SMTP id ffacd0b85a97d-43d7d24b82bmr3910100f8f.38.1776103349340;
        Mon, 13 Apr 2026 11:02:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm20841686f8f.8.2026.04.13.11.02.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:02:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/6] corosync: patch CVE-2026-35092
Date: Mon, 13 Apr 2026 20:02:21 +0200
Message-ID: <20260413180227.755337-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413180227.755337-1-skandigraun@gmail.com>
References: <20260413180227.755337-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126282

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-35092

Pick the patch that mentions the CVE ID explicitly (the same commit
was identified by Debian also[1])

[1]: https://security-tracker.debian.org/tracker/CVE-2026-35092

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

