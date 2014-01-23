Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6593E6CBB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 09:22:06 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so1218377wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RX/vlAlLoFZFG2zC95Xf3FKi6ys6TA0xxPP6rSZsUu0=;
	b=YargsA947f+0E5tdT/cAKx92MeVrZjmP9hxQok7ITfGbZRAg6CsE6z5pLTRCOeoX2W
	7MZIRSBFAqcPXmeLot8Y7wSX7DZh4XN3rac5IPcUDA5SB/lVmGS9Y4qozYi5cyQBjs32
	02kv0NyevFC4vNbXXnjpdX9wskkWU4mIJgET9MwQT5ahsx7blMxN2HpGrUoXv+dwUiHv
	h5UKgB3V77EO9jieQnK6h9aReGbdYTKs5VmQ/XUAmJCE0JJCJlYpyZpPPuoZoaRmjWcw
	DvOYbUH4THcEdZ1sz+7yEnXO2HmunNCn5RyDo9trbOCMUv2YATKhjc8mBNT9kW4nr/UF
	Jk8g==
X-Gm-Message-State: ALoCoQnprz9mgCf+mr8EFBff5fgO3gYLzS6SLx1rNRBWsWvH8soiRHi2oz1SsTDoxpLYxoQ8+8/P
X-Received: by 10.195.13.113 with SMTP id ex17mr5948841wjd.0.1390468926871;
	Thu, 23 Jan 2014 01:22:06 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id eo4sm25993040wib.9.2014.01.23.01.22.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 01:22:06 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2014 10:22:02 +0100
Message-Id: <1390468922-32245-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] libhugetlbfs: ensure package strip logic stays the same after oe-core package.bbclass changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2014 09:22:06 -0000

See http://patches.openembedded.org/patch/65311/

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 41fd0bd..5d0963c 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -47,4 +47,5 @@ FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhuget
 FILES_${PN}-perl = "${libdir}/perl"
 FILES_${PN}-tests += "${libdir}/libhugetlbfs/tests"
 
+INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.8.4.2


