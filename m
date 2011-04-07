Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7xjA-00013v-9i
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 00:31:00 +0200
Received: by pxi1 with SMTP id 1so1561952pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 15:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=03XfZreXbe2fJdIxz73BSi4GwyE65tamaEmgLDQpctI=;
	b=QZXPL0YgKUG3REviZO5BVKXsIfebJSnzgr0+DRzglnXzyz0NLqg1jCmu2KDD7sO2AJ
	OSoNa2b/uf+K4ZC8REZCmL4eQr3ebtDmhOeHu8Lkq2o7BK7VlfHj7nSXqqaSzieuvkTJ
	WT2vKJOukkZkhxUQ5CIIeLoub9lJ6O6RZVYsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=r34OS9EMIJwB1rvTXTXQvqLa7+W8hH2kHnO0J4jZW24doi3WH2nupxPqTmewpg3xqC
	4mdtAzQnvJI6aeIripnPLHu0Ihw+8gZQkjY9+HZm1vh2u/2hRp39ZvPUNcfh23gPnc4c
	9t36InfxeEPguY85oNqiXDzEFKP0U73NFaOxs=
Received: by 10.142.7.10 with SMTP id 10mr1063934wfg.390.1302215331082;
	Thu, 07 Apr 2011 15:28:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x11sm2753140wfd.13.2011.04.07.15.28.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 15:28:49 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 15:28:44 -0700
Message-Id: <1302215324-29971-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc-4.5.inc: Compile gcc runtime stuff always in ARM mode for arm
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
X-List-Received-Date: Thu, 07 Apr 2011 22:31:00 -0000

From: Khem Raj <raj.khem@gmail.com>

Some distros e.g. SHR uses thumb1 for armv4t and armv5t
so we need to make sure that in such cases libgcc is compiled
in ARM mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index b510650..519a1e7 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -1,4 +1,5 @@
 require recipes-devtools/gcc/gcc-common.inc
+ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
@@ -14,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRCREV = "170880"
 PV = "4.5"
-INC_PR = "r34"
+INC_PR = "r35"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
-- 
1.7.4.1



