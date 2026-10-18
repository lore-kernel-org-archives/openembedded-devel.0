Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED4DCCF2CF
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:19 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9801.1792302972272546434
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FNF9ODK+;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35ef6b49813so2184104eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302972; x=1792907772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIFB+ItZIvQZQOpRlaTN/iVB7596HIaW6jeEg2OZjxk=;
        b=FNF9ODK+JnXK41xrI2OrD//LXNnY4nPh6UgqMEqbeGcwxFXApkvIJaiaVWHLloxKLB
         Pi21g0VuMef+Vw9Gr4cAnxRPlE/YdHZHrVVZLnzMdyx8dyD8NG0ZkZgm+01yNpBSNe7e
         joUy+HNN0NVuO8zyjehwyz01FIZ8e0dkQHM9/m0WoyRBRAgcR5cX3/d3O4XKvKAEV5x3
         c6RJASx4+UPy9XEAGDoRPSxgcAsipuHC0a5emfUOJnfyARALFY662cxBWdAS70WgQUWe
         5cqnrmHlHKK9vPfgse9/2av3aT3zCtij/dMcFoxKNXf/1zA4KjHOX+IchphrzUImXigN
         Ccag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302972; x=1792907772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIFB+ItZIvQZQOpRlaTN/iVB7596HIaW6jeEg2OZjxk=;
        b=pzN8AMUPf08rT7tVzEh67z9k+JTlE1ff+SIxKlkmVJylnkzZurqkiKgqPYmYpIvC1i
         pw0R6EeLMtIeNRrzjx4RBnnCIbi6CHmJKk4EGvLEoxndQtlKMagyTIYPBMrTEGphQBE2
         EZ7d6XzYq+daCmQ6WJ9f4K+khSfyNvYnQI4t43WMJIAgZa1VjoJu+hiBUVydyfufGyxT
         b7EQEoyjpwpHAaSkOVYEuH+R89/CNpzWkyccM6oS1KEQEKSzFN7QRiDWjOJjhhQqUQH0
         kTcIyiVXYMQFHMcDBlYiLaj8PN1eb9Ol9rKhVMaGfoLW+H8Zp8IkG/5HLUeupPF85Lt9
         498g==
X-Gm-Message-State: AFq9FYJJ/7uSQuTPi/ksC5YMZNf315HNB3GMHo+TrjDDyDRpN5mdZFN+
	Y932iiyMsXc27aNzQyGbYvYh9F5kDOk4ClJMWl+RsWC5zDs6SXDqZCKPDT16IjMdBSU=
X-Gm-Gg: AYBFou1l/WK6koUFmdOKcdI+x8e8FE+AC2IvRYEHqG+nHDHv/IcEHqZhbEOQs50vp6P
	HU02Tuv8k22+V/jLvG+Xrl9xDNxvIuCc/vbDxMJsCQIHh+TflHJsrPGrXu/iChKW6QgCvZUp7p+
	clKdIGol7IA4gogwnvVRCXESK1xIp7ZtMznY4KAniPF2Y0Dwb8MTrAp6beV8+Md5gmFsqSNJoJd
	GavUvgYC3o5qZ7t77wRzC7FntX9IfTbLOKNXGOaVTPMNv4pcNLEup/YQMDE6fIUJ6hgAND6OKKf
	IekKPwsm7PxNhQrFGE/f6yimrA2CYwr2KHtoWH8bMKeFCnMMpLTRrf6btvNncqrnsiOj+G6UY3d
	iqi8cFvW+GqVzXBv20YDNpM2m5eEHv128MD8Zoua/qZNc3dgPKPvCcRAhObqSxLoJM6sZGj1Toh
	v/HbabgURaQ2QlYATnSPNBZ7DXnPlIx+RXYUaIlMcz/sqYppwB+vwNSswfXo2AVrXykmyj4I8Pt
	ytv4Ae1kkrfMLJnUdZd4O6mVx3Xgnzb7n/j4+5W0QS/2UfDUXiOIrUJ9M50aLOpuBkmdL0UT2RR
	LMriHJIy3/sb/vvHnQzYn5Ve7V7CSZjnjxTHPXI1Xuafn3UAaSlE+dJqSSWuOkFysOsDnmZtC7F
	cDK+jLIpx2O5vjC1chyIVvRG4kybr8bI/ZGPXpqUKTqYsrPNUi2csp67FwwCBK/x0RezIu9Qi6a
	HRlF65FxXsZl1CXmM7umMmYkFPXnv7xIafmqdQSQhHobL4hzuAeoFcJlQU
X-Received: by 2002:a05:7300:ce0d:b0:34c:5831:8a19 with SMTP id 5a478bee46e88-361a361222emr5400720eec.40.1792302971472;
        Sat, 17 Oct 2026 22:56:11 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 03/11] tcmu-runner: Fix build on 32-bit targets with clang
Date: Sat, 17 Oct 2026 22:55:30 -0700
Message-ID: <20261018055605.179605-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131085

tcmu_lba_to_byte() returns uint64_t while size_t is 32-bit on ILP32
targets, so the type-checking min() macro fails with
-Werror,-Wcompare-distinct-pointer-types. Compare in 64 bits; the
result never exceeds length, so it still fits in size_t.

Build-tested for qemuriscv32 (musl, clang).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...dler-fix-min-type-mismatch-on-32-bit.patch | 34 +++++++++++++++++++
 .../tcmu-runner/tcmu-runner_1.6.2.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0004-tcmur_cmd_handler-fix-min-type-mismatch-on-32-bit.patch

diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0004-tcmur_cmd_handler-fix-min-type-mismatch-on-32-bit.patch b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0004-tcmur_cmd_handler-fix-min-type-mismatch-on-32-bit.patch
new file mode 100644
index 0000000000..3feb06d77c
--- /dev/null
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner/0004-tcmur_cmd_handler-fix-min-type-mismatch-on-32-bit.patch
@@ -0,0 +1,34 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 17 Oct 2026 00:00:00 -0700
+Subject: [PATCH] tcmur_cmd_handler: Fix min() type mismatch on 32-bit targets
+
+tcmu_lba_to_byte() returns uint64_t while length is size_t, which is
+32-bit on ILP32 targets. The type-checking min() macro then compares
+pointers to distinct types and clang errors out with
+
+  error: comparison of distinct pointer types ('typeof (length) *'
+  (aka 'unsigned int *') and 'typeof (tcmu_lba_to_byte(dev, lba_cnt)) *'
+  (aka 'unsigned long long *')) [-Werror,-Wcompare-distinct-pointer-types]
+
+Do the comparison in 64 bits; the result never exceeds length, so it
+still fits in size_t.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tcmur_cmd_handler.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tcmur_cmd_handler.c b/tcmur_cmd_handler.c
+index 01d6a10..c676e84 100644
+--- a/tcmur_cmd_handler.c
++++ b/tcmur_cmd_handler.c
+@@ -768,7 +768,7 @@ static int handle_writesame(struct tcmu_device *dev, struct tcmulib_cmd *cmd)
+ 
+ 	max_xfer_length = tcmu_dev_get_max_xfer_len(dev) * block_size;
+ 	length = round_up(length, max_xfer_length);
+-	length = min(length, tcmu_lba_to_byte(dev, lba_cnt));
++	length = min((uint64_t)length, tcmu_lba_to_byte(dev, lba_cnt));
+ 
+ 	if (tcmur_cmd_state_init(tcmur_cmd, sizeof(*write_same), length)) {
+ 		tcmu_dev_err(dev, "Failed to calloc write_same data!\n");
diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
index 3a61b92630..0256a433cb 100644
--- a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/open-iscsi/tcmu-runner.git;protocol=https;branch=mai
            file://0001-CMakeLists-generate-gdbus-code-with-a-relative-path.patch \
            file://0002-qcow-fix-cache-count-reset-loops.patch \
            file://0003-target-alua-initialize-list_for_each-iterator-variables.patch \
+           file://0004-tcmur_cmd_handler-fix-min-type-mismatch-on-32-bit.patch \
            "
 
 inherit cmake pkgconfig systemd

