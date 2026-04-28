Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECC8FF8870
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 05:01:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5409.1777352484056242869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 22:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L+qGHS7r;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a871daa98fso71956775ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 22:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352483; x=1777957283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXuDSZMWxl1kvsOS+7cH2Rc/a6AWarCEjguJ6faffUw=;
        b=L+qGHS7ryWn74Eu0pyQqgkNCzoSQZdVtT3tjPUct9wffwMHs0vL96w3U1sQjpuWa+P
         H7G4DnjjNTyUoJlUh4Xvr1h5NrwjGZwqvPXoFLLIhn9LVnvFnok3pTnzhkAIPdgnOo3r
         0xc4ZFlBB664Nvf0QmXqhE5oIFjxcvNwrwKPxlIYHwFnFdWCOFENC0GIldvYcxD+Qgqv
         9ipuJuZnV6aB00sIWvY2sAPZFEnDsleK+mZbYk22sxXQFH7s0rFu8HyirRNd4TkbMQZN
         xbECrnG/+dLkqD19AZCTsQeeWjmQE5NDPORjA0tI4JqsgVN9RIAnUaBwxGEdEg2k/5jD
         uL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352483; x=1777957283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CXuDSZMWxl1kvsOS+7cH2Rc/a6AWarCEjguJ6faffUw=;
        b=hXWBCI0fHgtGA7aho5wXZhuFFtBeWwc7K7bH+du4ujiEpQN5iPQWda0RWUxf5igzo6
         XQ/3cSfuQPCAQ/cHDuSKJwndajnIPwqlkZSHj8cHHAnntpEhmKESmB62baQS3ikvn3e0
         seZdhGeP983sIi1Mrdva5uNY/9O49c43gBokLE7o1TAXRJXtehRx5um9khzs2BJ4Rxg/
         PLZzPAqVOoOl89zUGIVRl67+JoVQDFVCF+oPvCOXgS3SRcinz1sJnJLvJC8DvKQeLJG5
         I3bDizMvr+Mh78hu+RZ8QGL+ttpTMXy67SV9DOy+sTen3LqBLEScIF0mSXIJqojMBDFi
         BqYw==
X-Gm-Message-State: AOJu0YxwyZhdAr+vWrIofBJC85OwOsQpc70fJ/p0ecRFyQi+UAIZ8Cl6
	QkSfYj9e6sns2bBC8omggJ1Akm1bLQsQTu+Z2vzaCkuJMuw02pLp2gMqhnYkBPnx
X-Gm-Gg: AeBDievsC8fHPmgJKVMQYHdVmDh30RPTAiWsCMjChnEG99utaPr88tCaiDVI4NOP3g6
	nZ2TpDvYxK8qfx/V0fpa8wQTA6hMApFTPbXuw0KHWJrGiDoYywWFJhmOwORmGR+LTxAJxfcfT1P
	NyxO7tYt8mh2IPWDx6+d0Wya+64PdzYx2WXidtFZKQctVyuqpnHC0D1TBMJFC8FVpPFCoFvrMeP
	GMqfovdn1A0W+pE34KDxfoEscENP4jSrrNqlYa+iVAErMlMMAEKnG92/lPlD5zoQ6AGFwTTmDy+
	no16SenvFGYyzdYTYS9cma42v2B8cQZ6GaS1xEfRIQ+1a8e+qMpawIPLhRtpvsi/A4yesfMjVaT
	A2bQfQnovOv5cAYFR4gquAd+Cc+usr0CvMVue2ZhBBzuMMdj0PTbAu6rDyTnQw9Ne7q6s/X1BX5
	ftqXbsCwnx4MOvn+w7/lm3yocpMFnsBrF8jXoqVsIkxHGyWpY=
X-Received: by 2002:a17:903:1206:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b97c40c783mr14917775ad.15.1777352483309;
        Mon, 27 Apr 2026 22:01:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d619sm11798385ad.70.2026.04.27.22.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:01:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/5] corosync: patch CVE-2026-35092
Date: Tue, 28 Apr 2026 17:01:05 +1200
Message-ID: <20260428050109.2099228-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
References: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 05:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126642

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
index 0e7f48272f..722dbcbbbc 100644
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

