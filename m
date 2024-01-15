Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D577DC47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 15:14:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.81571.1705329384903825908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c8Kx9tfa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D0D31BF20E;
	Mon, 15 Jan 2024 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705329383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T27OpcTdjNQ+QFy1RNHhqa8YYfRTGxoFprvhAJymNgQ=;
	b=c8Kx9tfavv5ZOvMPO8uYoN4PxzeD8Yd/ef/+L3wWNvqlNF9MX+ElgiwfD/g2m6y4eZqXIw
	AyhnB5MzH0jc+z041UJw5XnKowebCUi9BWwngBnlUmx29et/siRSv5GplltjchXG6mzEP+
	FzgzLyhRNmNznJNxFHt4bK9FdQ9+5cL94n4fDO3oEGdIsxIuJzHdRt+r9ZpnmVJDnCM9mN
	Tj2lCQWLL9y+FGT8VB/oSPiUeVVHMWSAT+tCPGE39F05Ie7Hh2/TNs+PU39OhSk+BzAfQ9
	naPN+i3l4fCsmph662aoKa+jWokVZUpeVpPRt4j0G7s86NwEf2yZEXQn0656hg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	Wang Mingyu <wangmy@fujitsu.com>,
	Armin Kuster <akuster808@gmail.com>,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [oe] [meta-oe] [dunfell] [RESEND PATCH v1] openwsman: Change download branch from master to main.
Date: Mon, 15 Jan 2024 15:36:16 +0100
Message-ID: <20240115143616.2164725-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: joaomarcos.costa@bootlin.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 15:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108289

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Backported from Kirkstone
(cherry-picked from commit 84425db660a30570044e334509e174e5c92173ed)
---
 meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
index f635a9b13..e96c97745 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
@@ -17,7 +17,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SRCREV = "d8eba6cb6682b59d84ca1da67a523520b879ade6"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-- 
2.43.0


