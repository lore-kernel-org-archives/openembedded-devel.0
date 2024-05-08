Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF7CC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 21:45:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.351.1715204706264886688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 14:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CLxaj/zT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 097F5C0005
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 May 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715204704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=x5OK2VDRvLKgfA+KIOLbaNpC8NsTEX/M+y2JpG1fEiE=;
	b=CLxaj/zT3wmbT+jWre3eZoF3gOo8hGVKV5ppStCKjG/x8ytyTXiFdXrXJk20QF9c7+0JAP
	vkRLdWTaCl6xY7Gki9IMvCU2J6muXsKihUqJmKWiJg9i5HDQ9altveV9nssg38FSCcz19q
	MFeAHLboEdU4x2UkRrMCMoN4kTGvy9AcjX3NvBcfnJ6Rvv+t5CzbhIJdXspfF49ZFujmMw
	itKBne7n8iDJ/lZA4tzkdhf455+merzMKeUriIW4zfQboOiGR82rWctBSO0y2UZFTyOwmw
	IXQZ4giDtX3+Ra/vQRkP43fJTqqcCzGNgSXdAyV1+pzlHneankanL7Sj8NCVbw==
Date: Wed, 8 May 2024 23:45:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE checks failures for meta-oe
Message-ID: <20240508214503193c3316@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 21:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110279

https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/1612/steps/16/logs/stdio

ERROR: Nothing RPROVIDES 'python3-unittest-automake-output' (but /home/pokybuild/yocto-worker/metrics/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-unittest-automake-output' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-unittest-automake-output']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

