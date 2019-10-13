Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1567C5FC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 20:10:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46rt8v4bwyz3w
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 22:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570997423;
	bh=rVo+WMVjuy1LkP4FkfL5Sq9sD1Tr2aZbeAs+5cKOnkU=;
	h=From:To:Subject:Date:From;
	b=BULCP8l4zhgkJcfsPIvV5XBK7WSiowWNFKQhss6SpE7BOnWxYiDd2Q6qfQI9MlJm9
	r6kOjxLHaZLO8Mlf7lTTs7Kgz1sPhIJgsNPcicFudCGbF+vuOUyLqaqiyjLdle9QmP
	twEzifdSuzzFYj/tNoIoQC9btUXd5FXwgDhjfsYnn70UugM66en2MlEjWVQZ4k9NRK
	Mp3coxhCp8zyBSKY5NLROPP+ln8EPYITh3SavDsnRY4kzrtg4LBeFDuLmIreQgFxst
	wPtayiOcopf5RosO0Xk+ThHnvzAmAJwH2hfdGJ06kEurxgzzCDMzPl8NVDPXC1t+Nw
	9swipVtmLvg4ApJgP1Sv45u2slQEksmqy2BqIkgC0h6iOzEANE03idXHvu0sVcACb/
	JVqFz7OSo7YdknlowbFST8Pt1jvZazjrM3+ppP8P5f5lHc3fgHzZJPiF546HAn2bMn
	QmHdz6ZxaljtGEPJwIsIUo8BcJDfW7N/xhSiRWHAeMFJWESHVFaZ7hm6hX2CUJ2e+8
	+i/yLvFXJBgFoatVQUNNSwoDyilVEF7bkg3Wh3thVqp1SleIlALqsw04dm9AuPQnXS
	nCll50LmxSdq0YqYS6UZ+6y7c9pX+4lNQNcmyL+QQGh0VoNyr23pdBqJwWFBWJF85q
	qnRv98T58h3xEkMTUn7WkMY0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2019 23:10:16 +0300
Message-Id: <20191013201016.10226-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: Upgrade 1.18.2 -> 1.18.4
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
X-List-Received-Date: Sun, 13 Oct 2019 20:10:25 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
index 0d6e1a0b0..085807c4c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
@@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
-SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
-SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
+SRC_URI[md5sum] = "fc86588a3ae54e0d406b560a312d5a5d"
+SRC_URI[sha256sum] = "a3bd07f695b6d3529ec6adbd9a1d6385b967e9c8ae90946f51d8852b320fd05e"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.17.1


