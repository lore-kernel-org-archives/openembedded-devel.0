Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 930B97FDC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:55:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q10so3137970wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TtsAtV+mcBBDgvu/Yx10yEl2dKw/1412VeDTYvIj9Zs=;
	b=ZiCAMjWw9WPXDskgLaGhx75tVHcn0apnoisH79YHoBDG0/xfcuaAnz1zAiscF7cN71
	L0HW4OGlOOwBRpYaAWmGAN/ktt/ljPYf5F3CRVQC9FQd4N9xN4UJu6yT/x/XvbX2A5QU
	rKYyUol0CrhYGmWckjT1q04vFSMHPJU96txR2Da0zsIIPZIoB6EGtIQA/ZMm0SkKsICg
	zWDGidSymchFZkj/Rd3kvYYVLeRywGEFFmsBrRS6srZRGuXechZUxTCjCZWOPRurJiUK
	UQfbIrdilUxwf6WIzoIQsRcvkvTJrDjpzB4mfo7jUAZtsoympuOh8R+BKzf7fkEUt2QA
	1NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TtsAtV+mcBBDgvu/Yx10yEl2dKw/1412VeDTYvIj9Zs=;
	b=k1UqNrTkeYPHehm+PuQ/GukQo3UtU33tqb1Mqy+5dqegDqqwuPrHZAdshYG826oJxi
	BEIySrbj1ZI1oaomQ+0IKiku12jlX7VghC2KtuFUMKButRryBhUnu4YbOtSnZtgCoQ6W
	5R5K1t4oUm1BDqRUl3deT8u+22trl4Z3+IlcBox4Hk6kYjVl7oRogAvva/1qEoh1h44n
	zCNH6Oh+oWAVy0lC7W9MiBQeWl5dCBkpBWkZlbQf0NvCgYXbXqcM2Q3lac/zuwPZSvqv
	bxsq511HO0HfRsLeavevBNuLSS61azFVWPic5uVyBXuxIkVOjeExEuy8NZoPubWNb91J
	SFZg==
X-Gm-Message-State: APjAAAV189sSxnMRiU/XlBpZVBdiQJMdoQrTxSGJkxGX9g1gMvbthBvP
	QiY8jOlHuJlTfG7ZBZxoExcUjfnAFIw=
X-Google-Smtp-Source: APXvYqywqlGi+cXTQEeF9qHG1gg7YOguEEzU5bHPQmEF3gVrFNcZIaaj8yrsjzFrfhxGWowhpyCUXA==
X-Received: by 2002:adf:e5ca:: with SMTP id a10mr19064064wrn.347.1579787702917;
	Thu, 23 Jan 2020 05:55:02 -0800 (PST)
Received: from vpr-vm.corporate.saft.org
	(mey38-h01-176-145-72-80.dsl.sta.abo.bbox.fr. [176.145.72.80])
	by smtp.gmail.com with ESMTPSA id
	b10sm3285746wrt.90.2020.01.23.05.55.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 05:55:02 -0800 (PST)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 14:54:54 +0100
Message-Id: <20200123135454.24552-1-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] fmt: bump version to v6.1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 13:55:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta-oe/recipes-support/fmt/{fmt_6.0.0.bb => fmt_6.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_6.0.0.bb => fmt_6.1.2.bb} (89%)

diff --git a/meta-oe/recipes-support/fmt/fmt_6.0.0.bb b/meta-oe/recipes-support/fmt/fmt_6.1.2.bb
similarity index 89%
rename from meta-oe/recipes-support/fmt/fmt_6.0.0.bb
rename to meta-oe/recipes-support/fmt/fmt_6.1.2.bb
index c35c77b12..ff9bd7ddb 100644
--- a/meta-oe/recipes-support/fmt/fmt_6.0.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_6.1.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "7512a55aa3ae309587ca89668ef9ec4074a51a1f"
+SRCREV = "f94b7364b9409f05207c3af3fa4666730e11a854"
 
 S = "${WORKDIR}/git"
 
-- 
2.24.0


