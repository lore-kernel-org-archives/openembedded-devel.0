Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC9971C56
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c198so144500pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nHqvy+lDBqBX4LzgTzCHmZKGlaa+2a682k0XCO72hlg=;
	b=k0sIwH/aT0BummruVN6xccf4BJs7Ui659K+QZWhe4gkRGsnRAlSlc1I0H1uR15CZrs
	WeVsd8HWy0bVHcl7uD0c9H84VK0oVv8I2vn+A7suKtzfgiYFs/6aS52V1tgMkKj6ifey
	kZZdaY+kinNOu3elHMfOnljsc01A4q1zxQA96ObIkxbeIsujksuvfle8LiTWzlTY/1Bg
	fcARqPz5eVn4T0qhRhDsPOlqHxUE++2lK8vIvLOCkE4KqkEjf42x3dqbKD4y//JAoERN
	gp/0QlaTs1TzlQ6AINaIGR645n0mHpg7/jk/Lvs7RYdKtLb+nsX9qOmvbR6IIT5tuNo+
	4zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nHqvy+lDBqBX4LzgTzCHmZKGlaa+2a682k0XCO72hlg=;
	b=ShZmefQb47P8NgMUyCyDJ50XUZ6MnZVdJCdMe7XS5kWidPt/BeL8c855MjGDBerrzM
	qmJbX570L+dcW1ENSvjE8Xu1/in9jejkJtDDGXwua1UZQMeKuTZLedwLIaLV1KZxnA5Y
	8jM8kwZh138q7a6RSERzQAYznxsENEP56JSjWdFkcHwfPf9XXMHki1n6bCHHB0r9Kw/5
	IRCQsan66F8RcPOtQea/ztfgmcZx6vTUwfXFLKozPUB0RTnRF72+qYXN1+IS5DTyd8FK
	uhtlezQczzn3UfnMsdG6ha8BvgAtN1pypfJ/7RtTzSMU7c53HcLY+lNnaEaAL3H4QnhM
	AeTA==
X-Gm-Message-State: AN3rC/580Wb1GIrM4RgVOpTrJz2Ym/Qy5XruBPUo134A/rW4RZs8wsx6
	FFR04sMMa4InvQ==
X-Received: by 10.84.217.12 with SMTP id o12mr25743681pli.87.1492539726905;
	Tue, 18 Apr 2017 11:22:06 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:20 -0700
Message-Id: <20170418182142.27253-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-networking][ 10/32] nftables: Upgrade to 0.7
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filter/nftables/{nftables_0.6.bb => nftables_0.7.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.6.bb => nftables_0.7.bb} (72%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.6.bb b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
similarity index 72%
rename from meta-networking/recipes-filter/nftables/nftables_0.6.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.7.bb
index 5dd93627a..3a3a94665 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
@@ -10,7 +10,9 @@ RRECOMMENDS_${PN} += "kernel-module-nf-tables \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://fix-to-generate-ntf.8.patch \
           "
-SRC_URI[md5sum] = "fd320e35fdf14b7be795492189b13dae"
-SRC_URI[sha256sum] = "dede62655f1c56f2bc9f9be12d103d930dcef6d5f9e0855854ad9c6f93cd6c2d"
+SRC_URI[md5sum] = "4c005e76a15a029afaba71d7db21d065"
+SRC_URI[sha256sum] = "fe639239d801ce5890397f6f4391c58a934bfc27d8b7d5ef922692de5ec4ed43"
+
+ASNEEDED = ""
 
 inherit autotools pkgconfig
-- 
2.12.2


