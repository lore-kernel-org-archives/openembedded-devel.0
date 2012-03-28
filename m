Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCr8U-0004cF-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 13:33:54 +0200
Received: by wera1 with SMTP id a1so573519wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pM4NrNGInVwzMXPjqPRdIwWh1EibdQXqgR2SDzCbPNY=;
	b=vwB1iO+Wp/X6n17uVhkgSuxdpGV9uzaXJ4PQJalLjhdy+0bO7M9aVnWdXJJzsfkDUs
	RHj59Q+Gtzd90VkK1tdZqngEON9rCsU2cg/N2rQ1d7N8/+Oy2aXoRrT/sXSCgp7NoCk/
	Zu7wa6LWAwCrV34mcwc3807YTsU4+c9NIGfOxVC7NhetcX+sRB7xyY9dcp+1JdNFfczj
	WMRNvVEL23JwH9zAPYxPY8jSbyotQgOsE33lldAyl83VHjurV5I4KUwaHXQPvTmK5mWk
	nIKyCqERWzQot+NpwiQMG5ZJ7oMjAhmUqzviWltwZvJ8UI5PVz9hBvObZfi9laiCHhvr
	SBsA==
Received: by 10.180.98.8 with SMTP id ee8mr6205397wib.14.1332933892607;
	Wed, 28 Mar 2012 04:24:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm20525474wiz.1.2012.03.28.04.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:24:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:24:44 +0200
Message-Id: <cover.1332933826.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH 0/4] Small changes 20120328
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 11:33:54 -0000

The following changes since commit faf10fc6f3651b687ded55b660ae62520e105512:

  xbmc: update from rc2 to final release (2012-03-26 15:05:47 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Martin Jansa (4):
  linux-kexecboot-3.2: upgrade to 3.2.12
  keymaps: import systemd support from meta-shr layer
  kernel.bbclass: touch .scmversion also in ${S}
  xinput-calibrator: add systemd service

 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |    8 ++++----
 meta-oe/classes/kernel.bbclass                     |    2 +-
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |    9 +++++++++
 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend   |    8 ++++++++
 .../xinput-calibrator/xinput-calibrator.service    |   11 +++++++++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   11 ++++++++---
 6 files changed, 41 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
 create mode 100644 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service

-- 
1.7.8.5



