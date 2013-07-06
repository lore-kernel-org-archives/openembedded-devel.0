Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id B0D4E6AEA2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 19:33:15 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2112726eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=C2SuvFcXKo7EKG0+WzsVzs3p3iORSYHPTZKe3Ez1aqM=;
	b=Gr9YomSCgT2lVLKkCRJ1vO3lugXR8teEvdzJGVfs1AN4OOsRCcSn99HSZd9eZxgJ3K
	izZ0619sNPolbdK3VSi3zHMcL7S+fDYWSBrUA3/EsIRtsMwBp4+T/YGeZjXasWBKVFru
	5eIemj0f13afGaBZYZJfYyIlR2emXl+bXpwDXCevi7JxC2m5kAuF+Y02mwyoPd8REwAP
	uzpMAyq7NZ/WlmY5ZXx2mUwjYjHA2QxEQRgyBx46YkKe4Ou8+abjn0lsnZU9ZpNMG1wP
	xIqqwLwrPzjG4nGfpbKPBjTpcgPHe7+l/XW+/nlU7Vux55CUIapBdWXASuVCrlENc7L2
	X4nQ==
X-Received: by 10.14.176.68 with SMTP id a44mr17976570eem.31.1373139195739;
	Sat, 06 Jul 2013 12:33:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm26323267eez.6.2013.07.06.12.33.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 12:33:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:33:17 +0200
Message-Id: <cover.1373139082.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH 0/4] llvm cleanup
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
X-List-Received-Date: Sat, 06 Jul 2013 19:33:16 -0000

The following changes since commit 1cd30e7929f3cdfd2d97db2888d1bcb5e165d546:

  busybox: Follow OE-Core update to 1.12.1 version (2013-07-06 00:38:05 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/llvm
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/deps

Martin Jansa (4):
  llvm: Consolidate .inc files
  llvm2: don't install llvm-config to bindir
  llvm: use newer class-native overrides instead of virtclass
  llvm: split packages a bit more

 meta-oe/recipes-core/llvm/llvm-common.bb |   2 +-
 meta-oe/recipes-core/llvm/llvm.inc       | 224 +++++--------------------------
 meta-oe/recipes-core/llvm/llvm2.8_2.8.bb |   9 +-
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb |  30 +----
 meta-oe/recipes-core/llvm/llvm2.inc      | 175 ++++++++++++++++++++++++
 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb | 104 +-------------
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb | 100 +-------------
 meta-oe/recipes-core/llvm/llvm3.inc      |  80 +++++++++++
 8 files changed, 299 insertions(+), 425 deletions(-)
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.inc
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.inc

-- 
1.8.2.1


