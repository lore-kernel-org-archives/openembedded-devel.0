Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B48C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:37:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.41838.1718570264813447613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HNKxGv+H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240616203740cc4a65b33a664b4208-x0f77x@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240616203740cc4a65b33a664b4208
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:37:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ysif6OPiAbFJxdfIA/MN+UN8JIB4Rbh0CYIan+hp1uQ=;
 b=HNKxGv+Hc/uRp1PLRiPxp1mkJjZuHnJmp7xqbqhz7APraFLe2e9/gLGRAkhwyFybfn2Dfc
 LD85kfU2oXYOxVo5k9Mifh4sG1WMRRC+ZQpRGdYFRq18Ot7lBiLP/Hq9j7mzS8XqEQxGJkFi
 CO0E6tkC8Q6tCGQQ4+bpNSiqqx+Uw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 0/6] backports from master
Date: Sun, 16 Jun 2024 22:36:45 +0200
Message-Id: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110931

Some backports I'm interested in to have already in LTS.
All applied without conflicts.
The last one was is not merged yet is it was submitted only couple minutes ago.

Bartosz Golaszewski (1):
  libgpiod: update to v2.1.2

Gerard Salvatella (1):
  libwebsockets: fix buildpath warnings

Martin Jansa (1):
  libwebsockets: remove STAGING_LIBDIR with /

Peter Marko (2):
  re2: remove dev dependencies from main package
  re2: rework solibs handling

Wang Mingyu (1):
  uriparser: upgrade 0.9.7 -> 0.9.8

 .../libwebsockets/libwebsockets_4.3.3.bb                  | 2 ++
 .../libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb}     | 2 +-
 meta-oe/recipes-support/re2/re2_2024.03.01.bb             | 8 +++-----
 .../uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb}  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb} (93%)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb} (84%)

-- 
2.30.2


