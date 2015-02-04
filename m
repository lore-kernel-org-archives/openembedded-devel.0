Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 360986E68C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 20:29:24 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rd18so5011829iec.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 12:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=8ub2/Qc23SfL9qy8dJrpP4PflsWb/KU0mP4Li5iu5EE=;
	b=YT4Zt2xCBjLBwN9dhYlwXEqpzTg/II3Tglcx1AOTQvYoieVPO2+dsJIKFhx50cTAGO
	xmd+oB2mMGVcxPv0XUbuhGD8n9hwJNyq2lt4QGnrGOMOtidk0DikYGvpzhQxnbQLpT0K
	yhecZSLpwyvvT6u1VMBa3ydjL4OCzPOqjB+T8Megs4wLYjuN91Ld1VEvUju9p3fiZFXE
	Enep6f/1xF+Xdy3gWpeAdDmHj/ZtkwDhurXnsoBXKrGoJA+DeAgzMvgqosORJ0orQr+K
	qnF3KOQMevzYHAx/CyjM9BNDmXqFnidtN4hM7ossb3FLOZj0sTPmTjsVzr9badlhq016
	13vg==
X-Received: by 10.107.161.75 with SMTP id k72mr233127ioe.46.1423081765978;
	Wed, 04 Feb 2015 12:29:25 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id 16sm1382580ion.23.2015.02.04.12.29.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 12:29:25 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:29:18 -0600
Message-Id: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH 0/5] Fixes for display managers, emacs, and dracut
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
X-List-Received-Date: Wed, 04 Feb 2015 20:29:30 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Here are a bunch of patches that I've been sitting on for
far too long; it's time to push them up.

Dan McGregor (5):
  xserver-nodm-init: only enable for runlevel 5
  lxdm: RDEPEND on libsvg-gtk
  emacs: Un-blacklist, seems to work fine with new qemu
  gdm: Only start in runlevel 5
  dracut: recipe cleanup

 meta-gnome/recipes-gnome/gdm/gdm/gdm               |  4 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |  2 +-
 .../recipes-devtools/dracut/dracut_git.bb          | 25 ++++--
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |  2 +-
 .../xserver-nodm-init-2.0/xserver-nodm             |  9 +++
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |  4 +-
 meta-oe/recipes-support/emacs/emacs.inc            | 89 +---------------------
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |  2 -
 8 files changed, 36 insertions(+), 101 deletions(-)

-- 
2.1.0


