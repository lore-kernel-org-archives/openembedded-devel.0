Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbHbe-00012B-Uj
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 21:36:27 +0200
Received: by pvf24 with SMTP id 24so3242641pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=gRo3FZldii8MX3lcpnoLLJ8Rwo1UlA+DQe4ewORMugI=;
	b=ag/dmXGfzpbSnEVYC+w90d9oWTuNkfB5Q3H4UmOVsNZvfQCchLq2G2IYPdVmmDIQUY
	uQDP40T8DUr8j0vrqbdD8FTRLCjSeZNpcd7zjqYfHzqDuZEOnI0XLXIHx3DVvitg9x/M
	j00UmaYlTtXv65BMkNKBZAZjnYX0zIfwSIlmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Dglm5M4VYWYazHJMw/XGb8fI2UH7vbV+7+HZbRkoWw98MbgbepJj1vhi8rRO6ErfZ0
	Ooge3BuT86qsMKCYrO/lyWwp9/tnzBs65xWmSeUfT90DjBMshUzRPC8Agyw7EI1/lq19
	73J03bO3qducUwIAa7Y0u+bjCc6qJUQOujBME=
Received: by 10.68.50.161 with SMTP id d1mr2974244pbo.439.1309203165814;
	Mon, 27 Jun 2011 12:32:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q5sm1051694pbk.10.2011.06.27.12.32.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:32:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 12:32:41 -0700
Message-Id: <1309203161-25143-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc-common-4.6.inc: Set ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Mon, 27 Jun 2011 19:36:27 -0000

Otherwise it will compile libgcc in thumb mode when thumb
mode is selected and libgcc in thumb mode does not work
well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
index 059f441..e5a1fba 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,3 +1,4 @@
 # this will prepend this layer to FILESPATH
 FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
-PRINC = "0"
+PRINC = "1"
+ARM_INSTRUCTION_SET = "arm"
-- 
1.7.4.1



