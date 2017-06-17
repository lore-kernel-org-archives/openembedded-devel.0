Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9022C78372
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so11054358pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xpdusrfb+zq7KtG9p71vk9fYJmFg3Ss8dIhtoQ1Lo9U=;
	b=EWBUCpfDtsHkUefzom+5ny2hL8eBKQ7qU2s1lluNPuAJHIYxwmkWzwPBrqKgWKfd/E
	FMTRkpvFf4LQZ800PaL1jDuoFKDN4+eO6VORJjYufxbTo9UKwjnR4NEB0QWrmGgF1Fpz
	X7YwWafVY2cORcpMvpgVsnQ2tzfgnh5Monblp2c+wcFcvDEud8VkAFafLFlmtX1uNH96
	sy3oPgNTsYpJpMVSft48xY2IIUVnYA8kqfdmOQzJLB4wh+DBR8yRw0b+emXp9oOyYNrA
	VgDIYmUWuNopG7N+jzKUFPIFQdbVPNdoIGVr5k4HYWNjZtmF3QVLZvHYbStfEn++SvBq
	4qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xpdusrfb+zq7KtG9p71vk9fYJmFg3Ss8dIhtoQ1Lo9U=;
	b=buaZkHMqq8wtShsSSwt9ToTSOf5eeN3kw28YQFTtw6vfKxIm14TngL+5KevmTTmpUv
	AYCL0s12y0M1OefOOWZn6gUmBxmUv8Aw+75c3mWKRldKkmDCBipEXMQsfsYXvCQB/mEO
	86tOjXdzm24ltH2fwM5c/qgnKKOHoTuzBAV+nVXeF0qk8PI2UcVJlowv8QSOqOjBo6cf
	lcpZwaNgL2AwDFHTDouq94wRen/C+gt6qYZOj2E4IHDh/6PSNU3WGTBrf53jguodzRsD
	R1rVbtJUxXPjOsElBddVt3Ir0TOqd0Qiz9tXF4yV3qGo8jMRHHQqy1Hf0OP8gT8zHVVq
	ZneA==
X-Gm-Message-State: AKS2vOzqjpY0csw82EcHvneKagT6skseASSCbU3mZcrxpHeA7fZ9Z+U8
	2Imhu4V5f3CKMU5O
X-Received: by 10.98.43.7 with SMTP id r7mr13346557pfr.202.1497720117924;
	Sat, 17 Jun 2017 10:21:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:38 -0700
Message-Id: <20170617172142.1311-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/9] relayd: Upgrade to latest
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
X-List-Received-Date: Sat, 17 Jun 2017 17:21:56 -0000

Fixes build with hardening flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 50297f38d..ef28d2c42 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab
 
 DEPENDS = "libubox"
 
-SRC_URI = "git://nbd.name/relayd.git"
+SRC_URI = "git://git.openwrt.org/project/relayd.git"
 
-SRCREV = "2970ff60bac6b70ecb682779d5c776dc559dc0b9"
+SRCREV = "ad0b25ad74345d367c62311e14b279f5ccb8ef13"
 PV = "0.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.13.1


