Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1ScGFx-0004IF-Oz
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 15:26:38 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q56DG9SV009900
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jun 2012 08:16:09 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q56DG9DE016152
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jun 2012 08:16:09 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Wed, 6 Jun 2012
	08:16:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q56DG569031481;
	Wed, 6 Jun 2012 08:16:07 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jun 2012 08:29:01 -0500
Message-ID: <1338989341-6344-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] sourceipk: modify excludes to include directory names
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
X-List-Received-Date: Wed, 06 Jun 2012 13:26:38 -0000
Content-Type: text/plain

* When the S variable is set to WORKDIR in the sourceipk class
  a list of excludes is generated to prevent packaging the
  sourceipk data along with the actual source files.  This
  excludes list is a regular expression that currently does not
  also cover the directory names.  For example:
    * temp/* is excluded but the directory temp is not
* This leads to the sourceipk still including the contents of
  the directories to be excluded.  By removing the wildcard the
  directory is excluded as well and the contents are not copied
  into the sourcipk.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/sourceipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 546ec67..09d6eb8 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -110,7 +110,7 @@ sourceipk_do_create_srcipk() {
         mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
         if [ -e ${S} ]; then
 	    if [ "${S}" = "${WORKDIR}" ]; then
-		excludes='--exclude ./temp/\* --exclude ./sourceipk-tmp/\* --exclude ./sourceipk-data/\*'
+		excludes='--exclude ./temp --exclude ./sourceipk-tmp --exclude ./sourceipk-data'
 	    fi
             tar -C ${S} -cO $excludes . | tar -C $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
         fi
-- 
1.7.0.4



