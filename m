Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 61FD97F2AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 14:55:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so95232133wrr.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fWk+TUkOZGq0EsrRsgQyrZVMW+edB7YOwNCbgcxbmSs=;
	b=WJ637TW7S1A7OMjZdoguttx1raoCpgPlGRFZGRq3NEXuDsQk9uYpbfIzVnl4r0/f1X
	LXF6xci9GI9h63z/+iRBcfaT+3RNYHii82hmVLoociHmQBaoscAWKHq1wuL8iWhYWTju
	/Z2eNIjFSsHtCjQ3iAXHefVdLvTsoTWRPNtiR91dYML1cBEb+YlsVucr+SxFY0v5AbHn
	7a0dEHIwUBwbLnRsWuFefdZqNyGHDr/XJHOAyLe8xkjY0pTURKkg38kf4egTSRj0Yc90
	y6BbcGlWz3o3qTxhEN0wFsUjRuKzLGgBUOB6D+vyEFz47hSbNquhVScicYo4kaBeeJZ9
	Kvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fWk+TUkOZGq0EsrRsgQyrZVMW+edB7YOwNCbgcxbmSs=;
	b=UIoaM143AGGblU9ZJA4CrUYeMd96oDtjIkhZhJolMnV3axSxWtVMqr4Fbs+A9yz5qV
	AAs559+508/kg6/Y3UN8O5WdVPNJuSKFalrANHSBxAutSZJoowvBRItrrtFQ5asEaQ0c
	zaE/3nn9DeVGuTNkn9X+GZZVmhQ7B2aekY1wjkDyaUtV6KZSJ1sINTByC6TGMTTrV8P2
	acx5wkGnMHB0/TE6aaQxmMqnwd6iJQsZzJJDtfcA0lcLPlqBtesncu9gtdapsJiH0vvf
	FT8JlXKocPhwg0kG4kYguay+klLc66XH63QHuzOSnAnNBQdxvmQd4LfNgi0j8s1ILqhb
	JOpg==
X-Gm-Message-State: APjAAAVCrszZFMSsRWv/akEf1dO62G/3ppyXauGRrGRiIVkL05qRz+AW
	GlQeXO3SoebOb6LnSlD7jybQGSsy
X-Google-Smtp-Source: APXvYqwwaNpPN3LsMkBTq+0ZA5IWA+V1NB505Fkzy/R56/obxHHqCbL8ioH6sVYvpq2ergmqH4mCuA==
X-Received: by 2002:adf:db0e:: with SMTP id s14mr5225702wri.333.1565276117623; 
	Thu, 08 Aug 2019 07:55:17 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	b5sm77490103wru.69.2019.08.08.07.55.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 07:55:17 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Aug 2019 15:55:14 +0100
Message-Id: <20190808145514.1338-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] iwd: Upgrade 0.18 -> 0.19
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
X-List-Received-Date: Thu, 08 Aug 2019 14:55:17 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-connectivity/iwd/{iwd_0.18.bb => iwd_0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_0.18.bb => iwd_0.19.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.18.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.19.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_0.18.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_0.19.bb
index f56c88b821e1..2b4530e3c5d8 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.18.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.19.bb
@@ -7,7 +7,7 @@ inherit autotools pkgconfig systemd
 DEPENDS = "ell readline dbus"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "c923448bacf8a855b40017fe53ba2edcd062eec1"
+SRCREV = "899d802744b7e12409e259f546ba5594ab90262c"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.17.1


