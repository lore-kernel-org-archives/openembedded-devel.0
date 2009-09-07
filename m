Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MlBwW-0002L8-RP
	for openembedded-devel@openembedded.org; Wed, 09 Sep 2009 03:25:55 +0200
Received: by fxm22 with SMTP id 22so435543fxm.12
	for <openembedded-devel@openembedded.org>;
	Tue, 08 Sep 2009 18:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vr8DNDmHqaJlndxflx+HgI2vCp8rvC3NBU9SY2VRM8Q=;
	b=uNftUAz1R1O0KFlyffUgdp8sj0NvIyMUfPxRBNAgkwKzl8bbiLLiGD0u6XiAYZVYa+
	gGILHOxvzaZ+NlfMxQg0WI0L0UMcxoems4fonVLEX6GfLqRYRMbvVOZLAZcJwE4P+9do
	1eNmrNAOmxDi+K5tq6Ak3AUpNoRHxf8fqzkxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=jNlHcQiT4R0/UL6GCZ0o6Azs8pNOwao23/qf+RkVMpDLI0530oG+MMZBOPzCvXh/JC
	ajITNFzatDvng9Zqj8hlNF7FoUzeOt3wL9S+yCHk87M5EZFh1kSrWaJSZErZ5RmvekhH
	H2WG41stNXGyEOXcNJ/umOLuSwgipgpSeiGw8=
Received: by 10.103.48.19 with SMTP id a19mr6159003muk.136.1252329014142;
	Mon, 07 Sep 2009 06:10:14 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id n7sm11509271mue.6.2009.09.07.06.10.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Sep 2009 06:10:12 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@openembedded.org
Date: Mon,  7 Sep 2009 16:10:13 +0300
Message-Id: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fixed concurrency problem for ZIP packed recipes.
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
X-List-Received-Date: Wed, 09 Sep 2009 01:25:56 -0000

The problem occured when unzip-native is not yet staged, and ZIP
archive unpacking already started resulting in failed do_unpack task.
Added NEED_UNZIP_FOR_UNPACK variable to use in recipes which do_unpack
with unzip utility but doesn't have '.zip' in SRC_URI (f.e. .EXE
windows self-extraction binaries).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 classes/base.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index d29ba4b..bdee5b2 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1187,6 +1187,15 @@ def base_after_parse(d):
         depends = depends + " git-native:do_populate_staging"
         bb.data.setVarFlag('do_fetch', 'depends', depends, d)
 
+    # unzip-native should already be staged before unpacking ZIP recipes
+    need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
+    src_uri = bb.data.getVar('SRC_URI', d, 1)
+
+    if ".zip" in src_uri or need_unzip == "1":
+        depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
+        depends = depends + " unzip-native:do_populate_staging"
+        bb.data.setVarFlag('do_unpack', 'depends', depends, d)
+
     # 'multimachine' handling
     mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
     pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
-- 
1.5.6.5



