Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PTmg5-0001UK-BN
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:37:45 +0100
Received: by gxk21 with SMTP id 21so781466gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 18:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bE/F6rD9v3nGVROV8yz3hkGf3u2D8sr05qu3PaX3Bkc=;
	b=PE+FjgQ4460OcVA2RJlPBbFmCzZIZHY1dSeVb4shRbnk4QEeaqJHnww9h3AicyNjt5
	u8hnzSVK3shqlfc5deoejD4dQnw53ecYQ8wLwcjdW/KxdHSoavGo35cG0h/KEjrJZb94
	BVk78kO+J3AzuKETBkoDbvnIS/POsvyY2/wBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Ips1tiYFnsA1bDyBS40INCYS6V22Wa3uxK+jIqoJOZKBCHpZ2CO08+EsKry40Y8eye
	nQkSx6GFgIByHJTSJ/eoTbpyjFGUdPw7uUqyN9EjFQGPm4q4GSpS4OKzTI2kNjnqGxIp
	8BD1WlnpxOWUM1AsKossCRDxbguGheD57IFmg=
Received: by 10.236.103.145 with SMTP id f17mr267726yhg.61.1292535787539;
	Thu, 16 Dec 2010 13:43:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i75sm336474yhd.6.2010.12.16.13.43.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 13:43:05 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 15:43:02 -0600
Message-Id: <1292535782-19714-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] sourceipk: copy over hidden files and dirs
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
X-List-Received-Date: Sat, 18 Dec 2010 02:37:45 -0000

* Copy hidden files and directories such as eclipse
  project files.  Currently these files are not copied
  (particularly for the top-level directory) which makes
  applications with eclipse project files not usable with eclipse.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/sourceipk.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 97068de..213bff9 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -106,6 +106,12 @@ sourceipk_do_create_srcipk() {
         # Copy sources for packaging
         mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
         cp -RLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        # Copy any hidden files in the source directory such as
+        # eclipse project files.  Use a regex to avoid trying to
+        # copy the . and .. directories.  This is only required for
+        # the top-level directory as the hidden files will be copied
+        # for subdiretories.
+        cp -r ${S}/.[a-zA-Z0-9]* $tmp_dir/${SRCIPK_INSTALL_DIR}/
 
         if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
         then
-- 
1.7.0.4



