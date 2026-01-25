Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF829E63CB7
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 17:06:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42702.1769360789760607697
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 09:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2QjWuzG;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc305552so3295177f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769360788; x=1769965588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCdVelxIGbqFU5rHAGU3iIvxzSBjTTdQGO9iabhxFVo=;
        b=O2QjWuzGPsHk82P5g7WYhsoHmvILd7mtFO2MTeEcvhgbQiB9SyXZ8hQampltfqKQ8f
         4jfATkKHHnw97Nvukyy+OC5DTsG1+1JNpgzc4J5/oFvF0URwK3tH2O2BdotOReJM457E
         /vbP3nMmneR3Nx8PGwETAW5Z9niPQPdnHr6Pop1Evzd4i6I78yzZRhkJPEq6jngCNJLO
         Hhk3MnpZwMqyhaCGPectim7DucODvIje3eRGvBG7smvrrTKJ2AIOJRZcg+AmWelA08I3
         +qDxNMDSai9kUKcCWH/n8s546fLGULJuTFQPbtbUqoPWPJo7z+I1qgYdWh5GQw93k7bw
         TkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769360788; x=1769965588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCdVelxIGbqFU5rHAGU3iIvxzSBjTTdQGO9iabhxFVo=;
        b=lxdiW3nHk+NcLaDvIfYGW+bUgw+QKx87O7bol7DFNBYK2UFA0XPdbtdlEBU3zC6nGg
         Cr9t/zyt/25+V8P+OjjbXhtIfCsCLpG+rblQklfMfpL7Ob9/iNsnPFtEVYCpWlfwvf/+
         SkmU0x71AHRs2LhzZsgiPPKRioN4w/4IPftlR3E6J5LXCWL1ig9cFWonUmANhfaNJo5T
         caEHgFs6NZ2FTc6Z2LvW54VcmwMrLL9WtE1MMo+UfLgISqPEBOMbDdGC7fAFL2CdU7Cg
         DViomPXMPGb6VIL8Ekpi+uNMmnDCiYNp3kdtdyiMScypd504EgW4GLN2Sd21k5GscWxI
         dwJg==
X-Gm-Message-State: AOJu0YylztO2LJZWCChVWYDEba6qlu6nCtqXyFXZSzSMgPtT8p5p8lGz
	+yYYjLVUBNIcS8LXvJt+uBxCmBX8dxIBevlRZE0JDyXAyWZiCPmkC8bZYabfwg==
X-Gm-Gg: AZuq6aLR8T8fJjvIjUJFBAN1cg/hYOrcBg+KyIcDx2YPvBB3KLN27Q586QV1ucSnWuJ
	+OAkqn+1/eMzpSRK5IcvRv1POrYFrNktvOER3UubRBq4tfxJf4UEQDaZ2FsSMVqp9CjoMfm7Kxv
	Fs4pytUXInZnWJD+9wZL/pVNZB7kl3jlIXy7FA69TeWOB/BuE4GYYu6zxhBIJTVviLR22IMCpBx
	VQlHkx/CKPtGWflPY3LmHj6DnOoDBsxPWRqse5Dl1S12/jC7BfFTbmjUN90scJj669KcUL8NUuD
	VyFPKPIJInK4M5JPOvhWmPSRO5FOAAhxAG7ueICNLewGSM07zp4o3dOvMHtSzskrWp335b0W17A
	6QQgZ5VykgoFtM7masX3kOMrmdWX/YCjj93/em62FaLBmUcpsalbajSQd72PkBQYn42yOqIJHXc
	8VUYeoR3i2
X-Received: by 2002:a05:6000:2087:b0:435:bbd7:1947 with SMTP id ffacd0b85a97d-435ca12486cmr4293505f8f.5.1769360788029;
        Sun, 25 Jan 2026 09:06:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm23431414f8f.0.2026.01.25.09.06.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:06:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] anthy: fix SRC_URI
Date: Sun, 25 Jan 2026 18:06:22 +0100
Message-ID: <20260125170625.3178555-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125170625.3178555-1-skandigraun@gmail.com>
References: <20260125170625.3178555-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 17:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123842

The old URL is gone - switch to a working mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/anthy/anthy_9100h.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index 1826e91697..532829a53a 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11f384074d8e93e263b5664ef08a411a \
     file://alt-cannadic/COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
 "
 
-SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/anthy/9100h-23ubuntu2/anthy_9100h.orig.tar.gz \
     file://not_build_elc.patch \
     file://2ch_t.patch \
 "

