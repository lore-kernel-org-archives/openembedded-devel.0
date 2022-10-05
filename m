Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3F4C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 14:40:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.24332.1664980818515207928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 07:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZQ64XiDJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96578E0011;
	Wed,  5 Oct 2022 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664980815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sEXwChtz6yB61Kh5ZikRwDrmG7/PLM9+fHMRzy9x0n0=;
	b=ZQ64XiDJxeoi3ZtejcXS78lGT94hJmStw6gzwfad/VAi0ZH6o/hE7nQaooDAL2hpZIEefD
	SZVow0uUOEEIq/7CWuS9cD2KasvzOz+5nr9j4foK+3omSVtCJeyjrrVbrRhHKEJZdrOfyC
	gftetqxSRcq7LEmKx2qU7x2isTXuC+R6eveY7c4X0o9lOXH5cz8L1eEOlju7AIZ0z/MoIp
	x0hGKPE0cdQGKC/fWrbExcBQE1hOlhOMMNlzQesTXzaX2ljZjouYzWO/Dle31Yyla3gxKg
	5aittmcZLkjyEQVJlffP1bA4UpG+JCZVjS+BT76PhMNptF01E0KoFluDXQhOAQ==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH] spitools: remove unused BPV variable
Date: Wed,  5 Oct 2022 16:40:05 +0200
Message-Id: <20221005144005.2489531-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 14:40:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99073

This variable isn't longer used to set the PV value.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index 9dfb23cc7cbc..c190d7edf10b 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -4,7 +4,6 @@ AUTHOR = "Christophe BLAESS"
 LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-BPV = "1.0.0"
 PV = "1.0.2"
 SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
 
-- 
2.37.3


