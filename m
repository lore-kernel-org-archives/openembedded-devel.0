Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ind-0004rJ-BM
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:21 +0200
Received: by eyb7 with SMTP id 7so5250943eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NNA6/4tMePLpHiNM9FKGTlOw1k/U7HMElDqQZLn5XS4=;
	b=R9uscwgkmcPKq1DKJE1zClZ8o4iqpVZ0YVdQBe7ekjd3LJb/z8jbkEcp2E6FcosB7w
	WCiCnKsVtH7kvDLZGsAD2p4SW6aC5b+J3vwG6AAIkdrKKQd8zjL+mlb7VOWqzgEHzkjp
	RWP4KaQy1SBUULsOvueeGjeps95B6VT75qLg4=
Received: by 10.204.149.2 with SMTP id r2mr3758771bkv.379.1315404198063;
	Wed, 07 Sep 2011 07:03:18 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:17 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:02:57 +0400
Message-Id: <1315404187-18176-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 02/12] linux.inc: drop a hack for kernels <= 2.6.29
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:21 -0000

linux.inc isn't used with such old kernels anymore, drop the hack.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index a30ea70..09dee86 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -73,18 +73,6 @@ python __anonymous () {
 }
 
 do_configure_prepend() {
-
-        # Rename getline in ./scripts/unifdef.c
-        # Kernels up to 2.6.29 are currently failing to build unifdef.c,
-        # clashing with exposed getline() from <stdio.h>
-        # see https://patchwork.kernel.org/patch/11166/
-        # committed in 2.6.29 (commit d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7)
-
-        if [ -e ${S}/scripts/unifdef.c ]; then
-                sed -i -e 's/getline/parseline/g' ${S}/scripts/unifdef.c
-        fi
-
-
         echo "" > ${S}/.config
 
         #
-- 
1.7.2.5



