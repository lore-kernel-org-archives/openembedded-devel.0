Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 15EDC6D73C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:32 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id w73so8552899pfk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=axsz1O/Zh8NqdVUVqNvkMcw0hukFs9PrMLOgMyTkxVw=;
	b=DrfbFshMFLrxBw5wx6rSQQB3Uz4v7hSgye/somCZ7QQqkMUIi2D3GtthGmgzdnwWrO
	voCK/BYxP1eTZPvreTLW3CVYdNldhNBLgleXT492oBoRs1onlIC7emA0qlXHm5K52g2D
	l5RVWZhua8zsKsArELvjqsiauw86SEN0giIj9lAZ7M9TleCbCzejgSxiUPGyT2y00aOr
	7ARQ7IdH3sushm84K6fGmLZiB4FyliAQhE8Mbxp+xYJeUZ3JkK1V+GBHx1LYiHsgePJG
	J9r7q9HQ6TvvcWf+NvPRx4DCCMTuh/HKJHdDyFO4BuPQsApfDGlmQ30bQUzKxI7vdhFb
	yeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=axsz1O/Zh8NqdVUVqNvkMcw0hukFs9PrMLOgMyTkxVw=;
	b=Wf4zhPj8suEuuCeKLFmUhSJib2Ne08l/C1YU2XktSySjqyA0d9v030zzMn/h64pWVq
	qBG/ssqrMpnkVy22lOjatvvvhywtMjmKGd7PVDBdIWruUsG6hsaJ5ci30sh/jEqoPHFb
	OgewB8r5RKKpz3kyJVEBdC8kDPiB6lslDH6dy1H3q7BwVRQc6ujjoDxIAhU2xXkVt5Ep
	rbTnKXaSHuxOCpDVNMTvyqDC+kBbgZVGYC/D3EUx8HWVs5SuHLxentPAo40kQPP7XDXW
	WmZM/QV8eawpifD9vRX5oeqZF6aiCPTpubuOsS/9qg9tJPrmvnRDGvwH1HcZbyaaclDe
	3OHA==
X-Gm-Message-State: AJcUukeHjh+sKulRD9XgapDOw4BvGjsf3YhPWx17k80rQzvNSPy3TCcf
	CvH8p6Z2k/HLMAvx1GF68iE=
X-Google-Smtp-Source: ALg8bN7xITG3Gq44aCQmvuh0G2c1dERhl1EzHkrtV0+ep05ChMFyaRgiTQuh3EmQUof8wb72chDGHQ==
X-Received: by 2002:a62:9719:: with SMTP id n25mr20479259pfe.240.1547328693994;
	Sat, 12 Jan 2019 13:31:33 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:24 -0800
Message-Id: <20190112213132.2501-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] drbd: update to 9.0.16
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../drbd/{drbd_9.0.8-1.bb => drbd_9.0.16-1.bb}             | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd_9.0.8-1.bb => drbd_9.0.16-1.bb} (75%)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
similarity index 75%
rename from meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
index fa4d10b4c1..8794c4f917 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
@@ -11,8 +11,9 @@ DEPENDS = "virtual/kernel"
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch"
 
-SRC_URI[md5sum] = "c1dd58043f46e9926b579aa65d4ea980"
-SRC_URI[sha256sum] = "87f72d46db9bad926415b3ab9f5f1397de8c581d2e2ec1addbdd5ce2604e6123"
+SRC_URI[md5sum] = "6414a9eef2807c8210b6403e36ce3ea4"
+SRC_URI[sha256sum] = "6074b0d643f4bbae4641d3b4bc30f4840e74f2a212dd9c6555b8141e530e5789"
+
 inherit module
 
 EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
@@ -20,5 +21,3 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
-
-PNBLACKLIST[drbd] = "implicit declaration of function 'setup_timer'; 4.15 head file issue?" 
-- 
2.17.1


