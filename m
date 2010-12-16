Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PTngI-00036r-6h
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 04:42:02 +0100
Received: by gyh20 with SMTP id 20so522104gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 19:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=+pH7gpKxOQ7GtyUYObYJ0Vde+U8w081ULiStOs6UZDs=;
	b=s6khRIe4yysKIckDZxlrAtd3pB1R5a7M1cqlEWzS4mam9gZxHATGMfg45Q95qSsKBN
	egoA6d3KXA7L83cE5Aylw1GfV0wILYXtxW6zDDLU2zf3PmpE9HW7svvNdVtmnaFBw3FR
	amf7gXOr/iOPVVlKxT8pxquJt1VMmbfKT0j2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CsY4wYKD7m1Jqy52mkZcWeFcE22lgfJliHU5KItMnP9q8CiT6o/2XE1c+3DHenE746
	OqSZMgf9KCMWE7Tj1AoKy21iXzXueukAVR+Y6R/B5I8AZfGRDVLKBrxpkqE5+ZhzHjU4
	oE133Idrt7DGxGvY8pVGEHRiO+AkayzFzBM2o=
Received: by 10.236.109.3 with SMTP id r3mr355038yhg.30.1292540202130;
	Thu, 16 Dec 2010 14:56:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id j28sm377622yha.44.2010.12.16.14.56.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 14:56:38 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 16:56:32 -0600
Message-Id: <1292540192-26920-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCHv2] sourceipk: copy over hidden files and dirs
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
X-List-Received-Date: Sat, 18 Dec 2010 03:42:02 -0000

* Copy hidden files and directories such as eclipse
  project files.  Currently these files are not copied
  for the top-level directory which makes applications with
  eclipse project files not usable with eclipse.
* Only need to copy hidden files for the top-level directory
  since subdirectories do not experience this problem

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
updated in version 2:
    * Only copy hidden files in the top-level directory
    * Handle the case where there are no hidden files
---
 classes/sourceipk.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 97068de..17a7cdd 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -106,6 +106,16 @@ sourceipk_do_create_srcipk() {
         # Copy sources for packaging
         mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
         cp -RLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        # Copy any hidden files in the source directory such as
+        # eclipse project files.  Use a regex to avoid trying to
+        # copy the . and .. directories.  This is only required for
+        # the top-level directory as the hidden files will be copied
+        # for subdiretories.
+        hidden_files=`find ${S} -maxdepth 1 -name ".*"`
+        for f in $hidden_files
+        do
+            cp -rf $f $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        done
 
         if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
         then
-- 
1.7.0.4



