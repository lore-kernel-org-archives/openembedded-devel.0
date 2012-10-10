Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TM4Mx-0001p6-AT
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 00:03:11 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9ALmBV6028101
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2012 16:48:12 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9ALmBZn005769
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 03:18:11 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Oct 2012 03:18:10 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9ALm9TF018582;
	Thu, 11 Oct 2012 03:18:10 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Oct 2012 17:18:38 -0500
Message-ID: <1349907519-17119-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 0/1][for-denzil] kernel: cherry-pick header fix
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
X-List-Received-Date: Wed, 10 Oct 2012 22:03:11 -0000
Content-Type: text/plain

All,

This patch is a cherry-pick of the change made in meta-openembedded
master to fix the kernel header staging location.  Without this
change builds of external modules using the denzil branch will fail
to find the staged headers because they will be looking in the
"kernel" directory instead of the "usr/src/kernel" directory.

The STAGING_KERNEL_DIR set in bitbake.conf of oe-core in the
denzil branch of the repository has already been updated to use
${STAGING_DIR_HOST}/usr/src/kernel

I hope I got this patch formatted right since I just did a
cherry-pick into my denzil branch and created the patch.  If this
is not the correct format please let me know.  The commit I
cherry-picked was 8c724c4ab8e946763c813e5174dbfd5ac8a5ddda

Darren Hart (1):
  kernel: Add kernel headers to kernel-dev package

 meta-oe/classes/kernel.bbclass |   27 ++++++++++++---------------
 1 files changed, 12 insertions(+), 15 deletions(-)



