Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5186B70179
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 07:23:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e201so8640094wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7TEbsAADMg3JZlP3dIxkd8bo25NYvZP6qfyoNuXjZjs=;
	b=HJ0pOqOqexf40NNN6TJNidZ8PjkRnMyTbpd0JpPgno8QTGyLPiwPZl98GdbaM7Xlr3
	Sib8uuMM4eck1cG8UNcu4P45HeT3Ve6I5kp4L3E/6QasO8xpJQ7fXusUyAlHXG7dAeFB
	WT5Vzw1mld9gGXqOmA/7BaT+OcKfXcR7TNLnlp4+B0GPm+sdzye9V/T+zZcLjCkmkWbW
	TTBzoW3lh4q5FsgGyf3xEtZ++EEksquHfLt/l7b0TQ902tGbrujaaTrSCIcQMZ+AXhSG
	UdpHbZU6Yy85a/tKDEK7Ag0So4RgN1jJz4v03rtEUVhsmyNF0ZEvn7kxtzVig3Ub9HLN
	cWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=7TEbsAADMg3JZlP3dIxkd8bo25NYvZP6qfyoNuXjZjs=;
	b=O5oS/j2DouhJD9/1nvEMFKeiAYzGwkNAmGV2oSoTQIfN8u9P1rN4iP8368AQy+sM3O
	+W//3gBasNAKbHBXiTzRHhgtSAKpXEXKenA0bOR+YH3OatVUEEipmuODWJWjnbu2xSU7
	qFfSPXZoBS9Zw2uizdWAIXeWwjouoTku7yI3AOWEvfI3KCbPQzo5yMxuNgCzIVuV7s48
	yuOAYBQ2KXYT4nOSJmIcCffAlL3b9A1g04fnEoDPZy1y9mFSH/xGfMreGLGuYVkkWcyw
	3NcF6WGODy8Ruqvfs8BhkX6/pfScnUM/LH+6X7dgjEHXp8lmRhnTgR1qV47k7wKspzcQ
	N7vw==
X-Gm-Message-State: AOPr4FVwGIb6LA10vxuOpjY5AC4hUyb95PI9qRvwfbIYnxsYZ7uDCkBMebrM9b50IjhvVw==
X-Received: by 10.194.165.226 with SMTP id zb2mr7446761wjb.172.1462346591331; 
	Wed, 04 May 2016 00:23:11 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	k133sm3279641wmg.7.2016.05.04.00.23.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 00:23:10 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2016 08:23:30 +0100
Message-Id: <1462346612-13017-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH 0/2] Upgrade toybox to 0.7.0
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
X-List-Received-Date: Wed, 04 May 2016 07:23:12 -0000

This is a fresh attempt to upgrade toybox to 0.7.0. I noticed the previously
sent patch after I already had this working.

I've tested this on qemux86 and can login correctly, the hostname is correct and
I can run a few of the toybox tools.

Paul Barker (2):
  toybox: Remove out-of-date patch
  toybox: Upgrade to 0.7.0

 .../toybox/toybox/0001-Fix-segfault-in-login.patch |  33 ++
 .../toybox/0001-Match-paths-with-busybox.patch     | 388 ---------------------
 .../0002-Add-b-and-F-arguments-to-hostname.patch   |  84 +++++
 .../toybox/{toybox_0.6.0.bb => toybox_0.7.0.bb}    |  12 +-
 4 files changed, 125 insertions(+), 392 deletions(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.6.0.bb => toybox_0.7.0.bb} (84%)

-- 
2.1.4

