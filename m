Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1OarqY-0007zS-BD
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 17:01:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 2C5394008BF20;
	Mon, 19 Jul 2010 17:01:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 24C074009FC83;
	Mon, 19 Jul 2010 17:01:21 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS4bxcqaW23k; Mon, 19 Jul 2010 17:01:21 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 066F84008BF20;
	Mon, 19 Jul 2010 17:01:21 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1Oarnh-00054e-6Q; Mon, 19 Jul 2010 16:58:37 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Jul 2010 16:58:34 +0200
Message-Id: <1279551515-19474-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH] arm-atomic-gcc patches for oe-stable
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
X-List-Received-Date: Mon, 19 Jul 2010 15:01:38 -0000

From: Henning Heinold <h.heinold@tarent.de>

Hi,

this is a backport for the arm-atomic-gcc patches.

It is the first step to get openjdk into oe-stable.

Bye,

Henning


Henning Heinold (1):
  gcc: backport 4.3.x atomic-patches series from openembedded-dev

 recipes/gcc/gcc-4.3.1.inc                          |    4 +-
 .../gcc-4.3.1/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
 ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
 recipes/gcc/gcc-4.3.2.inc                          |    4 +-
 .../gcc-4.3.2/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
 ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
 recipes/gcc/gcc-4.3.3.inc                          |    2 +
 .../gcc-4.3.3/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
 ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
 recipes/gcc/gcc-cross-sdk_4.3.1.bb                 |    2 +-
 recipes/gcc/gcc-cross-sdk_4.3.2.bb                 |    2 +-
 recipes/gcc/gcc-cross-sdk_4.3.3.bb                 |    2 +-
 recipes/gcc/gcc-cross_4.3.1.bb                     |    2 +-
 recipes/gcc/gcc-cross_4.3.2.bb                     |    2 +-
 recipes/gcc/gcc-cross_4.3.3.bb                     |    2 +-
 recipes/gcc/gcc_4.3.1.bb                           |    2 +-
 recipes/gcc/gcc_4.3.2.bb                           |    2 +-
 recipes/gcc/gcc_4.3.3.bb                           |    2 +-
 18 files changed, 1223 insertions(+), 11 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
 create mode 100644 recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
 create mode 100644 recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
 create mode 100644 recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
 create mode 100644 recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch



