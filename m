Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SkJT8-0003bx-DI
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 20:29:35 +0200
Received: by dalh21 with SMTP id h21so3119439dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=dxE6XcqQpn5q4gAQYHUWFIUgd6TImICfSkHJES5fzCk=;
	b=hp3BHZYDBcnGVC9ol+dLB3dkHY9iUOUH8IxhP+7iTFlkmw9TMjZ/dn/GxOxOcTa2EG
	5EdURYYIe/OuN7Ez6z538iask68f92rcnLAqXgFDEmG7cSai/1WsrqVHbwo5LcKUPgh3
	EQW5EkmFcCiv/bHnyyLkHtLoDpUwGvSvcZaDQdyvULbJy9IvAtRQKcxwstiYyHc/qTzG
	29SJplbg/z5oXhTfBLC4NNn3VOliDyLDMFsiko8KYFMiVkRkCtyf1rnzSBX3SJp38SVJ
	6qMR1pf8iqKV3JxLrzHKPSm4nzGWVjUOjRsSHXFZXQdzhY7DMrgjGaEu5i/vWZJrlu4R
	iRjg==
Received: by 10.68.217.229 with SMTP id pb5mr10501324pbc.19.1340907514937;
	Thu, 28 Jun 2012 11:18:34 -0700 (PDT)
Received: from localhost.localdomain (ip68-109-186-98.ph.ph.cox.net.
	[68.109.186.98])
	by mx.google.com with ESMTPS id ob9sm2795508pbb.28.2012.06.28.11.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 11:18:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 11:18:20 -0700
Message-Id: <1340907500-14243-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <1340907500-14243-1-git-send-email-kergoth@gmail.com>
References: <1340907500-14243-1-git-send-email-kergoth@gmail.com>
Subject: [meta-oe] [PATCH 2/2] nano: rreplaces/rconflicts nano-tiny
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
X-List-Received-Date: Thu, 28 Jun 2012 18:29:35 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta-oe/recipes-support/nano/nano.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 2d52cab..9e9cc62 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
+RREPLACES_${PN} += "nano-tiny"
+RCONFLICTS_${PN} += "nano-tiny"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 PV_MAJOR = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
-- 
1.7.11



