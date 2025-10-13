Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BB6CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:19:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.53504.1760383164072110489
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZBpMCRzY;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e29d65728so27457515e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760383162; x=1760987962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8LxwbiYCBKRrcS38oQ/Pw1afQOOBW+HN5ttR7Sd9xg=;
        b=ZBpMCRzYYNxhd/jaop04t/4xE5Mk4PFaZkm2oDHPewxXhgL0QJv6nMgQcQHx9TeCAV
         nngjPe5Ciik3JS4i620Y8z14bi8v7rzu+jVP2XliuHflO+7ITu484nzQgThv/gp6jGtx
         qF0Q8auykvUwyRbx/Zp/JVYTRT7b6OFzIJv0BJbrl5A5tenI9w+IQctS2kJD5rIRXCub
         edE+ZcqJArOfiMzatTY2yajQRRqDeo4xeso1GmiL84Z2Z2GGpiC5DVqwvMsdLE40U/+u
         EA090V+TAqfWB+pBQM6sRXWBWM4+Q+qejfE3pfQB9R8HsYWt2cVNby9aVtVCBV2EifqU
         p1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760383162; x=1760987962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8LxwbiYCBKRrcS38oQ/Pw1afQOOBW+HN5ttR7Sd9xg=;
        b=TxDjyF30cFatmXLUZSS54tiRkDIcJPEuAoSMxZs4jN620cBlK0Wi9rtQl2daExPA8a
         C0CytmMrqXJeculf3b0T3Xg3b43DlrFJS63JaYLgbeYRVdva5YHjojcxeRgcaTDZKfdc
         GXA1vV5C6OEpGT+63lsghTOY4J4OYff6mzZE52wzjRKsa+uJGgcqrhenp35U15v6i/KU
         DqfkbmZ2UVTifDzLcavkKhCsa/8yhTDPUaGGtfucJeNvVzhkXHEXXCBBTv5WO/KUDOJA
         fdvQMjV1nc+97gqMmzB4w+PHoj7cgvq8e9ggBvv4Bup+NDpuhH/j2fQRW+um3Fg2woJG
         NH/Q==
X-Gm-Message-State: AOJu0Yz8q7R98l7tKDniQyoR7u16nv6y5PihE4xH1tvLsZUFkLFZKh26
	1K61mBPLS8MSh1Hri6DQfuKIXon2AXnV+HY8IcX45MwUu1qGsu0vZqo53aD3DQ==
X-Gm-Gg: ASbGnctS+UUgsi9/QB9qMhdJd27g5EVAjU1Sz0nnRGXY20XIBsmtA1v5NH6xOtPgeVi
	+9j6Y0ndt1XaUfa35NLUd+wR16mKE5Q8c+3QkW/zK2q7E/Wkr0X5LLzz92miXZeQ7VQ9SiApIeD
	DwU+oef1lbQ3puL98ZJOiIUZAOpMD6Y/5bZQW9t4CHydW5pliQ+4EirSjjwwTlLap8TJ89b2e+x
	0fJbrGSQ4g3dcHyVuiJSA4RcuC+MZIQmVMSqgczjIkuPjqz2bOLDaVjEAgtmr29dmJn5RjTC2cQ
	F+DOnAGoX5WYNYvz+rpiv5LSpUkvICdMYDK0nmSneeJxnqUgQN0IF0Z5/GL8DPqOzROXvnA/D7d
	ccCED4bmtdJgnxtxny3xY/T2QMG2EcJXV4r+LOopOj47gSqA9VQ==
X-Google-Smtp-Source: AGHT+IF7Ad0Abn/sAPlDM2U9+jgWHbsH6vPFjh+c4eOD3Dbn++qzd9OwitLZQLJdw7K1YKO6zHvKvA==
X-Received: by 2002:a05:600c:c162:b0:46e:5a5b:db60 with SMTP id 5b1f17b1804b1-46fa9affbe0mr166397525e9.31.1760383161884;
        Mon, 13 Oct 2025 12:19:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489ac60sm204809385e9.16.2025.10.13.12.19.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 12:19:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] xsp: CVE status update for CVE-2006-2658
Date: Mon, 13 Oct 2025 21:19:18 +0200
Message-ID: <20251013191918.496188-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 19:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120550

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue.
Package used in `meta-embedded`: maemo xsp http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/
Package with CVE issue: mono xsp https://github.com/mono/xsp

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3cb411a05744eaa6e822c3d435d9205aa87ff632)

Reworked for Kirkstone (CVE_CHECK_IGNORE vs CVE_STATUS)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index c611da48c0..fbd3ee09b5 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -13,3 +13,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
+
+# cpe-incorrect: The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue.
+CVE_CHECK_IGNORE += "CVE-2006-2658"

