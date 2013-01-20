Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx3M4-0003y3-1m
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 23:27:32 +0100
Received: by mail-ea0-f182.google.com with SMTP id a12so2270137eaa.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=L+89hltCYEL53HbAAaMklSYHUkVW4VrwwhM2PN6/8EY=;
	b=jdBbt4keHi5056xo3ewRZK2YQ/hclaX7wXUS5gmufVYnWQC6B1ggjHUTPl/82991Ob
	4WZTeSfR76VQO08bYE0XB2Rdb9zbe8x9N10Z8I3I9r5arWTnuoeK1WIsSPCVvZbfmBSj
	2gOgPpSp9pQwvwk1nLPORXde7HDCan+7LoASyLefuld8GrFSC5iu0mhDd0z3iroKpHzC
	yCW/wIlRacuiqTNzxTlcGCX7BFFrZa8oKkbIh0dxlYXPeeq31MxpXECe+wQErzKdjE5n
	AQ+DzJ+hsc9q1sgptXW8JmVCOzVr/ikFTRoBLeh+qU7YWcS6CF/F9TVH8ujvc/LZpHZH
	qpIw==
X-Received: by 10.14.176.66 with SMTP id a42mr53144353eem.34.1358719900342;
	Sun, 20 Jan 2013 14:11:40 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id w44sm19450405eep.6.2013.01.20.14.11.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:11:39 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 23:11:26 +0100
Message-Id: <cover.1358719629.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH 0/5] linux-yocto* recipes refinements
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
X-List-Received-Date: Sun, 20 Jan 2013 22:27:43 -0000

Apply some minor fixes as seen in oe-core an
fix some wrong splitting for mtd fragments.

Andrea Adami (5):
  linux-yocto-3.2: remove yaffs2 references from poodle.cfg
  linux-yocto_3.2: convert ktype/standard to explicit
    ktypes/standard/standard.scc
  linux-yocto_3.4: convert ktype/standard to explicit
    ktypes/standard/standard.scc
  linux-kexecboot_3.2: convert ktype/tiny to explicit
    ktypes/tiny/tiny.scc
  linux-yocto_3.4: minor config cleanings towards 3.8

 .../linux/linux-yocto-3.2/akita/akita-standard.scc    |  2 +-
 .../linux/linux-yocto-3.2/c7x0/c7x0-standard.scc      |  2 +-
 .../linux/linux-yocto-3.2/collie/collie-standard.scc  |  2 +-
 .../linux/linux-yocto-3.2/poodle/poodle-standard.scc  |  2 +-
 .../linux/linux-yocto-3.2/poodle/poodle.cfg           |  1 -
 .../linux/linux-yocto-3.2/spitz/spitz-standard.scc    |  2 +-
 .../linux/linux-yocto-3.2/tosa/tosa-standard.scc      |  2 +-
 .../linux/linux-yocto-3.4/akita/akita-standard.scc    |  2 +-
 .../linux/linux-yocto-3.4/c7x0/c7x0-standard.scc      |  2 +-
 .../linux/linux-yocto-3.4/collie/collie-standard.scc  |  2 +-
 .../linux/linux-yocto-3.4/collie/collie.cfg           | 19 ++++++++++++++-----
 .../linux/linux-yocto-3.4/poodle/poodle-standard.scc  |  2 +-
 .../linux/linux-yocto-3.4/spitz/spitz-standard.scc    |  2 +-
 .../linux/linux-yocto-3.4/tosa/tosa-standard.scc      |  2 +-
 .../linux/linux-yocto-3.4/zaurus-hardware.cfg         |  9 ++++++---
 .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg     |  9 ++++++++-
 .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg       | 10 ----------
 .../akita/akita-tiny.scc                              |  2 +-
 .../linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc |  2 +-
 .../collie/collie-tiny.scc                            |  2 +-
 .../poodle/poodle-tiny.scc                            |  2 +-
 .../spitz/spitz-tiny.scc                              |  2 +-
 .../linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc |  2 +-
 23 files changed, 46 insertions(+), 38 deletions(-)

-- 
1.7.12.4



