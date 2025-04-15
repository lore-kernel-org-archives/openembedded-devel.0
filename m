Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCB7C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 18:38:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.19324.1744721797825976386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1u4fq7-0006Yb-U0; Tue, 15 Apr 2025 14:56:35 +0200
Message-ID: <502a68b9-af9f-49f7-ae82-2c6a8338c479@pengutronix.de>
Date: Tue, 15 Apr 2025 14:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][GIT PULL] fitimage.bbclass Improvements
Cc: Marco Felsch <m.felsch@pengutronix.de>, =?UTF-8?Q?Enrico_J=C3=B6rns?=
 <ejo@pengutronix.de>, =?UTF-8?Q?Ulrich_=C3=96lmann?=
 <u.oelmann@pengutronix.de>, John Ripple <john.ripple@keysight.com>,
 yocto@pengutronix.de
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 18:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116866

Please consider these fitimage.bbclass changes for master.

The following changes since commit 1528a1219bff594035ea3d6d18dce50e7fec8d32:

   meta-multimedia-image-ptest-all: Do not run PTESTS_PROBLEMS_META_MULTIMEDIA (2025-04-12 10:11:33 -0700)

are available in the Git repository at:

   https://github.com/Bastian-Krause/meta-openembedded.git bst/fitimage-improvements

for you to fetch changes up to fa09b630c44cd587d64dc68e16e3061d05934401:

   fitimage.bbclass: warn if kernel is compressed, but no compression specified (2025-04-15 14:13:42 +0200)

----------------------------------------------------------------
Bastian Krause (1):
       fitimage.bbclass: warn if kernel is compressed, but no compression specified

Enrico Jörns (5):
       fitimage.bbclass: fix error handling for missing recipe
       fitimage.bbclass: let image type default to 'kernel'
       fitimage.bbclass: fail early for unsupported image types
       fitimage.bbclass: fix configurations node naming
       fitimage.bbclass: error-out for empty configurations

  meta-oe/classes/fitimage.bbclass | 17 ++++++++++++++---
  1 file changed, 14 insertions(+), 3 deletions(-)

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


