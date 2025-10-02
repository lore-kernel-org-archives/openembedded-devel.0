Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AC9CCD186
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.7550.1759409976187668142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jB9/8jT2;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e44f22f15so139227266b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409974; x=1760014774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT7rt2VDlELLS0DNSZtBm4QgjFpRGSXiK2v246U39Vg=;
        b=jB9/8jT20Lxrr0UkaceWtMNeV2m73k5JU73adCKIh92iYK0d1VRNNJrrHlwiwdkkig
         wgEHGnBb/CsXeg1wB9I3YyflVz5pZfK5CuJyG3lb4PfJQ6Txe7PnfETfv4ZbxXBoEZAZ
         8NKRJnxEurgOPuJ13UxDy5MZW5lXobuQuDVxJYwRQTpYvsw2njaUUKuNf8GCuu3zca4f
         2bx/UCedFrY11j9Uc3NofEgfYdkU7OFxZOQ6j2T1CyKPvcdayJCyKjCbNTWww+Il8LD6
         6Gj9EDPob+mSXo4B6jc4vxIiJJ+j8MKgDvcFtB1fXRdLPAUQ62leHQ/ZRbL7eXFjTlae
         EeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409974; x=1760014774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT7rt2VDlELLS0DNSZtBm4QgjFpRGSXiK2v246U39Vg=;
        b=BNRX6QJWFsE5mdQGEyRG73/duBoeY20MQc3/CLAhNmlqEC2VcgJofoTgImBoDKxOkZ
         b+lyIEz/mxyV0g0L9u1vmZucIGOcE01KAglfWeVsc4qdwHgmkqXmkPxoZ8/jiCJezIQS
         6cW1pSePGcDFRFSA/5GR3BsqQODAivuasNO3jlKznCqciP09zRV00Rp8IY8+/QZ/LL0k
         OZmHl7hiQqpJirBAnp3rCbgVzaDqZSxeoWhrqgLX3UazySZNJj+DFpg28UEvJJJJ4NZ5
         YbGtBGggQ+62+VIGZZIKbiqzHkGCPmGSNkPchWbuHDqLKPxaj6urvfx9Ko7cm+z0qsJI
         vP1Q==
X-Gm-Message-State: AOJu0YzrjZqx4/BWgBaUGBvtiF8w2kHptYqOwtKbZeZvh8mhqfwB3IyS
	WTb4XaTweNsbyAudoO6766SXBsv6l5KnWnTjK0CCcJSTdQ9kCcwjIBZFeSaP3g==
X-Gm-Gg: ASbGncupqy72WPVsLwEtEadxkmcg9tFifVJl2OJs31qK9iQes37Oy8lQpPKI+gCXSz4
	DmxC6Fx/bSsXSxvzpfwqdBhL9u/yclG53eCbBOCOXqJU2i/OKFTSsc7bTVB58lrqDcOMCk7mbRF
	FS0vaCdpiniJQvKexGxw0oDy6bbykbQsz/kk2n7cmA5n9EE5dW/AGhR10AKwn88XSfPvtHSFK5l
	yHZHqxT2B5PhD8QTQqK33x+oIbJ1jkNXm4rvOtTRQQkArRdYYabWdcnAXRDqEZ9t32OJGey9EG9
	MQ3wEbnlL6S1rGq0C7PfbxHSA5gbr/UscYLF5B260PNnWZCGEHe6uqRqN+9BFLX0+0Ms5QOkAgi
	Dim8ZUGeSiO0uarYEy6VxDEwqinaaqX+2DCoXiTp5sWPxtAA4p98wQWs=
X-Google-Smtp-Source: AGHT+IHqzMTyFF7+Aq/YsRY2Tk6XCjBzPDi8AD1/+0cG3xohd8ZQ+uaZfro4jmIqua8hrojYsqX39g==
X-Received: by 2002:a17:907:2d8d:b0:b3d:200a:bd6b with SMTP id a640c23a62f3a-b46e76d3977mr929803066b.52.1759409974344;
        Thu, 02 Oct 2025 05:59:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/26] openct: Fix typo in SUMMARY variable
Date: Thu,  2 Oct 2025 14:59:09 +0200
Message-ID: <20251002125926.2624522-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120178

From: Julian Haller <julian.haller@philips.com>

Signed-off-by: Julian Haller <julian.haller@philips.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 38f62a5fb36ea55205598830bb683ab7447e7fe2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index a873da6339..08ec36d1e2 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -1,4 +1,4 @@
-Summanry = "Middleware framework for smart card terminals"
+SUMMARY = "Middleware framework for smart card terminals"
 HOMEPAGE = "https://github.com/OpenSC/openct/wiki"
 DESCRIPTION = " \
 OpenCT implements drivers for several smart card readers. \

