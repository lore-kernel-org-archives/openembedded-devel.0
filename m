Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ozdzq-00084S-PX
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:17:35 +0200
Received: by pvg6 with SMTP id 6so977469pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=gX2Lgze51QjUaXIgCvwhACAc1OnMBBWtBbt0vvJhWLc=;
	b=JpP8RIrEY4SeGCrTT2W9BpfHrZhOR8+hC0UylE3vPPZ/2FT5scfQdAra1nda1JiTXt
	QGjo62BRaQjByP779oxPEZnsayk++U+vmFQorBvcRAp9MaSG0unrDvwvMIgwk42YotyP
	7OajpOZAD8917t5YSu1PEZJhOISQrOCCc+FLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EnkRBI7VDwtfw1PNt9rA7J9TBYnIjDx5ajGHBIZGOqu9pjDapXU8OUb7vXnEO172/q
	C4xUe6i67OU9ie9fhiuw8TetmsxRu+qngdD1XSCQAKrRWPnH8C7k1v0Ss4BatbwPRMKb
	SJU3nN0V7u5fqzmhiMJrfOGeR3rZEMd+uceP8=
Received: by 10.114.148.15 with SMTP id v15mr5933086wad.127.1285456642177;
	Sat, 25 Sep 2010 16:17:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c24sm6797364wam.19.2010.09.25.16.17.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:17:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:17:10 -0700
Message-Id: <1285456630-27680-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain.inc: Make gcc 4.5 & eglibc 2.12 as default sane versions
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
X-List-Received-Date: Sat, 25 Sep 2010 23:17:35 -0000

GCC 4.5 has been tested quite a bit and so is eglibc 2.12 in SHR
and developers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index de73922..6d460a2 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -5,14 +5,14 @@
 #############################################################################
 
 # Base line versions, good for most things
-PREFERRED_GCC_VERSION                ?= "4.4.4"
+PREFERRED_GCC_VERSION                ?= "4.5"
 PREFERRED_BINUTILS                   ?= "2.20.1"
 
 # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
-PREFERRED_VERSION_eglibc             ?= "2.11"
-PREFERRED_VERSION_eglibc-initial     ?= "2.11"
+PREFERRED_VERSION_eglibc             ?= "2.12"
+PREFERRED_VERSION_eglibc-initial     ?= "2.12"
 PREFERRED_UCLIBC_VERSION            ?= "0.9.31"
 
 # Some systems need a special gcc version
-- 
1.7.0.4



