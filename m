Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1RDLcG-0000ov-Gb
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 21:34:24 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9AJR8m5028315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:27:10 -0500
Received: from dbde70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9AJR6hD000456
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 00:57:07 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 8.3.106.1;
	Tue, 11 Oct 2011 00:57:07 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9AJR3xE019937;
	Tue, 11 Oct 2011 00:57:05 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Oct 2011 14:27:00 -0500
Message-ID: <1318274820-23565-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] sourceipk: dereference symlinks in sourceipk
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
X-List-Received-Date: Mon, 10 Oct 2011 19:34:24 -0000
Content-Type: text/plain

* Added the -h option to the tar command to make sure that any
  patches that may have been applied by the recipe are actually
  copied instead of made as symlinks to the recipe directory.
* This is so that people can see the actual patches and unapply
  individual patches as desired.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/sourceipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 1b63996..546ec67 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -122,7 +122,7 @@ sourceipk_do_create_srcipk() {
         fi
 
         #Write the data tarball
-        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
+        tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
 
         # Create the debian-binary file
         echo "2.0" > $srcipk_dir/debian-binary
-- 
1.7.0.4



