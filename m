Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id BE84460097
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:01:11 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id w7so1072930lbi.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=az7qPfJVawMT0YogjCBdh9ntzQZU6fyvJBx4tFz6G2E=;
	b=it1NwQ/o0Gw47LXY6Wf5vRqWwsclpkpdYI8p2SEkSGTko/x47iAFuQuIvNLtCJZQcp
	I9w+awb1P843/iEK7CELcb9Zh0VEiKM+NBI/CWEbM7fAvevJXKNspWSFv6nOOdh8rf4D
	gDhbQDBxZ8YsEMtYB1jgHbU8D8k1h/LKCpODuUDhpjvHL8zbLvsfJIptMZ8bVYTYn9gG
	LAl3AQ+qrgrWIHZv9DsNtvfmTph1Bl2QPlnmvDk3hcLrjCGdHK2FWLN8jvPp/S/aAu7s
	NNn1NNOUUTpr3ODWcgqtwcmGbtEDY1vVnUrqNgXwBNZFWOYHrGgaJFlJAjHwqqZbKoVM
	3f6g==
X-Received: by 10.112.221.226 with SMTP id qh2mr35195860lbc.5.1413900069160;
	Tue, 21 Oct 2014 07:01:09 -0700 (PDT)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id n10sm3818659laf.38.2014.10.21.07.01.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 07:01:08 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2014 14:01:01 +0000
Message-Id: <1413900063-1999-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.2
Subject: [meta-oe][PATCH 0/2] A couple of upgrades
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
X-List-Received-Date: Tue, 21 Oct 2014 14:01:15 -0000

The vim upgrade is fairly minor, the toybox upgrade is slightly more major. The
new package versions have been built, installed and briefly ran on qemuarm.

Paul Barker (2):
  vim: Upgrade to v7.4.481
  toybox: Upgrade to v0.5.0

 .../toybox/0001-Match-paths-with-busybox.patch     | 44 +++++++++++++++-------
 .../toybox/{toybox_0.4.9.bb => toybox_0.5.0.bb}    |  6 +--
 .../vim/{vim_7.4.373.bb => vim_7.4.481.bb}         |  2 +-
 3 files changed, 35 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.4.9.bb => toybox_0.5.0.bb} (89%)
 rename meta-oe/recipes-support/vim/{vim_7.4.373.bb => vim_7.4.481.bb} (99%)

-- 
2.1.2


