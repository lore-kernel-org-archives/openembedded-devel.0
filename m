Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF95CCF9F0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.33912.1761574569000684282
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ixtNHRsr;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-421851bca51so4387458f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574567; x=1762179367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUAo/0N4sxiXoDVkg9Jj5r0MJYU7Sz/KxCvtdi5Rg2o=;
        b=ixtNHRsraS1LVzSk9/NE5aUDK2W26K8qGYdZnhe0Zhfx9FrwEbGkl9KwjoMSWpG9Ch
         CErgNJriYaDK1h7JwhCoiRcx/RE9yjywLD7tUTwLuEHSpM/qYjOSTIsUp8+CQc7jcNyE
         49fvkW3x9HKJ82rVv++319nHyk+7mlqljmXkPpMnHJOeRA0/KVq2+uJyZ4MdAmmZEbmd
         AKEKXWGV3/lwPWbVr8wGs5dqPBBCwIhBUhZhM4XOxw3s6TG1BmE0oKureAotjOcYb7A7
         ZIlrt8r9o/TePQcuMPFfbDyr1qyeBad8OAEcSmu8NolJAiKLrizvB5ny/dnQx5K1yWTu
         o4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574567; x=1762179367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUAo/0N4sxiXoDVkg9Jj5r0MJYU7Sz/KxCvtdi5Rg2o=;
        b=m9sYW2tlbnHRTerzY0uY52jcjoa4fvMBJ1l5SP6XEJH8phTgh8+OxBcL/sJvOu3BBZ
         U4KXB5/nXytSj8CZ3Cd/PMqgaiUwefZ2XB+WSBJr04dYR4Rkluvt5P4HgLlXVZkCPDTv
         WuI+IJCl5j9lqZixYdrbHHF2606e3o/LWayISxh3Pzg9EfhvC9GZlxnjIzthYDkvrrMy
         J0QSrAsSG4+ly95B578B2ywIx6CoVF//QV2z597SVqcHmx52XDyqImVqMvgNtBeg8f0x
         q8qf8KPFs0rySJt1VdfvHQAlYPM8V0AUQlW6mF3bdp82bgbBqw1yl+zrf8i0X3sNcVhx
         l6nw==
X-Gm-Message-State: AOJu0Yw+U+wriNOQ2CAYoZDEUY+9TzQYdPs1QWVPH0YEQM09kCTejpEU
	WKF4nhgQW6SoCF4TI/JZXYpIJccyQBsuOPooT/cikAKFwhzG5f0Ji3+vh5yaZA==
X-Gm-Gg: ASbGncsy8LGaCDzDo7bwnt9Mnvxscq8pr5nb0p7Uvh6FnqZnzq6fki9H/fvqgCBjw7N
	la79HljLfIiZ6dK2J8qNpH86YPTufRvaITFyVl96GobqBn8zAzRewyB0CldMq1DYrFxIfXt1tBL
	XgJEAO/C/+SPALUh8IIdNOLoVFidX2DjrNtFSh0VCKP17TUufJ2xHAkg+mIqjgoK13MmdBgvXlx
	70i/ojiZpPfBeVDIfFl0waG1CjI+eXkR8sX/AgePEHNbrqWTuNqJ2qP0H7FwrFjF/QT4fu+T3ml
	GXl3hXVJYBglp6kunb2eADW9JjTUiiWfG/EoJwGahJ8rUNEbhlkvga4njrwHnDPRXiq5Y+cPUQM
	eTLvAj/zpkYAPtucZ4ShB3pn31+A6Bk41PtE9w7anA+5RponN3R1fxXmoTfhH5FxO/8E6xXSYtg
	==
X-Google-Smtp-Source: AGHT+IG+8PwOWvclU25hsRKTC6YhGRnrDCXwByhsbCqVkqO6j5uXOMH8lFNANNkJrktZ/C3kbEezYQ==
X-Received: by 2002:a05:6000:220c:b0:3ec:ce37:3a6d with SMTP id ffacd0b85a97d-42990755939mr9892546f8f.47.1761574567153;
        Mon, 27 Oct 2025 07:16:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/10] id3lib: mark CVE-2007-4460 as fixed
Date: Mon, 27 Oct 2025 15:15:54 +0100
Message-ID: <20251027141557.1893563-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121047

From: Peter Marko <peter.marko@siemens.com>

This is fixed in id3lib3.8.3_3.8.3-16.2.debian.tar.xz patch included in
SRC_URI.
Version 3.8.3-7 contains patch for this CVE, we use 3.8.3-16.2.
This can be verified by checking the debian/changelog within this patch
or diffing [1] and [2] and verifying that this can be reverse-applied.

[1] https://snapshot.debian.org/archive/debian/20070819T000000Z/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-6.diff.gz
[2] https://snapshot.debian.org/archive/debian/20070819T000000Z/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.diff.gz

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9fff0040f1694b09c6c68cf59615f42d801d62f5)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index a7d645f59f..20a03bdbe0 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -15,6 +15,9 @@ SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b687
 SRC_URI[patch.md5sum] = "997c764d3be11c9a51779d93facf1118"
 SRC_URI[patch.sha256sum] = "ac2ee23ec89ba2af51d2c6dd5b1b6bf9f8a9f813de251bc182941439a4053176"
 
+#patched: fix is included in debian patch
+CVE_CHECK_IGNORE += "CVE-2007-4460"
+
 inherit autotools
 
 # Unlike other Debian packages, id3lib*.diff.gz contains another series of

