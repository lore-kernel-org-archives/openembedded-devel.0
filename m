Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E3BF34C6B
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:35 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.278778.1776103350711184863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cm4KSpbz;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1266255f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103349; x=1776708149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfquxUGVr1Yq42jr5evwA2E4LJMxPVY3hcUa16KIdGs=;
        b=Cm4KSpbzATAwAYeG48h/ivy1hVcU5khD0ofKd6kmbzyvGh0y5NKXt4rndU6ytxQ4Lb
         4gS3gqrLwptL7zQ235bTuTBE0FCBARbFnpRs7LtHZyIrWsecvo8Da9lEMjYFXC9cJ6CG
         /byORYd2c2+wW5lX8qfxHq7GdE27f/4gwGa2u1nwjfLLUAyLKp2oigWOT4bcLs3RNyWf
         2VOblsQ7Q//39VuXnyJof18GxnJiUViaGEwVxsyA07TPZPJQKS3QoE1G2OuCzyhNw8Lz
         vuLaYUtIfU01TxHO0Kdzh1Rp8nqQBguJnLxp/uFerQ5BZmMPf3gZPHCQ2wLe94sXWQYI
         kW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103349; x=1776708149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfquxUGVr1Yq42jr5evwA2E4LJMxPVY3hcUa16KIdGs=;
        b=Ul3zlpcwh0OiAgRvXgMwsRNGcCYARFZPDazqklNF30wNy4F2TDfHjSPm4U5lSfjg8U
         g+lFZV/2DoVzZT/uYKxxwhyUANJ4IcxFumWfVtsn1CTzADlDi6usKQWcCzMBdk/tgycx
         F+eKke+7M5PlJrPwv2GkWgdk4YCXooqpSLapE+ZBzrB6hgWix87Sk8PRKOxWO8l6pQm8
         SaJqsKO0uNPNWX9TXJWbxvEu5tSamLSPRUTqr3ztojZRhg43+9Pf7IzA0mIdfgHnqP3L
         iY1rCpihGTNgoHFcDxbQ6B8Or4xZVU825UGPJ3eAWQld+ZR9jEvRs5TScpSDXS898iYS
         dpNQ==
X-Gm-Message-State: AOJu0Yw+xDq1TFV/rPMSvJHeZ1QE+wA9uUXRAXebyrzXg7URpQyasvD2
	J1ENUJXJdxe4L4Jp/ig6CZc4BhI8jyQHHyKyKmjNwwPmXZw4FRcsBwx6aBbDeQ==
X-Gm-Gg: AeBDieu0tEo97rAMKA7miI5XJCtb/gl/QBQGtuoUViQB+1Hle59fHdIUGiA7tcG1We3
	fT3EnuadbaUWCC/Ec48+KEqr57SBTdlz8HRaZC3IjFycrHVxcFAuBs/BckOJW3GHSsyuh1yhacL
	XnCSD7iHHUXLsS9uEsPkkm28hxb1x9WH8q/9akr7x/g4cIX7lkO8vR7ENuApHSXwV0lshoGoqpp
	bs6ETHtcmNx1Und9ly882kw9AYqdgONB4OcuJQQp3BmANUwfo90e3DSf5dt0+4u68izEk1HwefV
	kiEu/kXB/rSystIevBkPstrC79zGkKaiN8dyG5DoIiQEOpqQBuw/vZYK3QAfDkliMC4MOZRssry
	H/1PiTihhh0/wjWpF46nw9lDKGcWFGuHwImmcHDFCsLRbjybIVO4afoVEtiQJtA0TPW5u2PzxpH
	KwRBZg2v3FXgtZzKzvEZQIOhElWknbMA4=
X-Received: by 2002:a05:6000:24c2:b0:43b:3d80:b0b9 with SMTP id ffacd0b85a97d-43d64291cf9mr20677066f8f.12.1776103348523;
        Mon, 13 Apr 2026 11:02:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm20841686f8f.8.2026.04.13.11.02.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:02:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/6] corosync: patch CVE-2026-35091
Date: Mon, 13 Apr 2026 20:02:20 +0200
Message-ID: <20260413180227.755337-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126281

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-35091

Pick the patch that mentions the CVE ID explicitly (it was identified
by Debian also as the fix[1])

[1]: https://security-tracker.debian.org/tracker/CVE-2026-35091

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

