Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id B44CA7D53B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 15:39:53 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y6so9014709ljd.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=osX/nZTwThnZwLBYlBgWvKhzsaAcRZssuifVfnqtEQY=;
	b=Lqyqo29N9mNj4V2L5sy8s2fLEm+TvUMBuUTAkQP84Z58rtZHbLUrF4OrAhyWjDH3N1
	jBtlrM8yHQJ4EMzxOrtlKK651cSTW0SCr6lH88WTr+wB5msx5lAYPOSp2JLcM5jLiGbY
	Yx5xJ6z6kCtkW4OTxP+YAA9anSeF12LPaehMRPoYvLMDaG4TAocYVgBmOez9Nnz04S/Y
	/blDwAw8KPgEhilGckQSpExwUE7MocbBIRIJ8nM5sxfh2ZEDM9wOxmqqFegZOkHZxpgN
	tQAi9Q3HgnGfByRHAHiw1RiUqilU0CBJhf1qijSTscmFDPVu0wmlP1A/duY6tS5MZmDB
	EbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=osX/nZTwThnZwLBYlBgWvKhzsaAcRZssuifVfnqtEQY=;
	b=FJOWCByZGLqEABiK8+3XjtvmmENWNEqdf0ptoMSZtuQO7D7l8i9iSAIcDWjsD2jPqp
	zp9Dp0Adm45LMIoxYMMONzROjfiS6YsA12BVcQ88P33oeBtCxMPk8vvRsRx6jUDwZ3Wi
	ozv8qNAmeqReL6yfuIxPiWpH49xFIWcVL8HwVCS5GZVAFOgLNAAoHFeQLqjqRNb6maK7
	iUt6K8sjwD8YEcN8km/CtxoOc/obKJhHRyo2SBqiXk36nBcXCLfHjokPloOzOMRqoHhf
	NoGMpXhJFUr7iMno3PmBtSXTithJ4t5MiGhkkVlMCekykCXHV6T8GoVBJH17+Na46FyR
	0DWg==
X-Gm-Message-State: APjAAAXpZXWVGVwzBBk0TkGx309DENzhyT8u+nncVQdJ2xG4Yr1BeL2D
	vW3FMpMdxf98Hho3HAfmz8oUkm5ByCM=
X-Google-Smtp-Source: APXvYqzhUDxn00yqHgt/jILaz0gc8aaZ2mLM8MC45B5qpbvHTRo2H8z2ek4D7KO2KdYkP//nZa3BPA==
X-Received: by 2002:a2e:968c:: with SMTP id q12mr12861338lji.36.1554651593992; 
	Sun, 07 Apr 2019 08:39:53 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j76sm2360216ljb.78.2019.04.07.08.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 08:39:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 17:39:51 +0200
Message-Id: <20190407153951.22589-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] babeld: update to 1.8.4
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
X-List-Received-Date: Sun, 07 Apr 2019 15:39:54 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../babeld/{babeld_1.8.3.bb => babeld_1.8.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.8.3.bb => babeld_1.8.4.bb} (93%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb b/meta-networking/recipes-protocols/babeld/babeld_1.8.4.bb
similarity index 93%
rename from meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.8.4.bb
index 8f028474f..550e126f7 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.8.4.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
-SRCREV = "535184173fcde5ddc43020cd197d01d1ea0e9a8b"
+SRCREV = "8627b6fcd4992f2e7992ecec97a4a4aa2d7ff099"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


