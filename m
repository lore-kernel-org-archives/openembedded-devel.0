Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17A3674C37
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 18:15:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w85IFAgR005729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 11:15:11 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 11:15:09 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 14:15:06 -0400
Message-ID: <20180905181508.9960-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/3] lftp: update from 4.8.3 to 4.8.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 18:15:10 -0000
Content-Type: text/plain

Drop upstreamed CVE fix:
   a27e07d9 mirror: prepend ./ to rm and chmod arguments to avoid URL recognition (fix #452)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../lftp/files/CVE-2018-10916.patch           | 82 -------------------
 .../lftp/{lftp_4.8.3.bb => lftp_4.8.4.bb}     |  5 +-
 2 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.8.3.bb => lftp_4.8.4.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch b/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
deleted file mode 100644
index c0e87d942..000000000
--- a/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From a27e07d90a4608ceaf928b1babb27d4d803e1992 Mon Sep 17 00:00:00 2001
-From: "Alexander V. Lukyanov" <lavv17f@gmail.com>
-Date: Tue, 31 Jul 2018 10:57:35 +0300
-Subject: [PATCH] mirror: prepend ./ to rm and chmod arguments to avoid URL
- recognition (fix #452)
-
-CVE: CVE-2018-10916
-Upstream-Status: Backport from v4.8.4
-
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- src/MirrorJob.cc | 24 +++++++++---------------
- 1 file changed, 9 insertions(+), 15 deletions(-)
-
-diff --git a/src/MirrorJob.cc b/src/MirrorJob.cc
-index cf106c40..0be45431 100644
---- a/src/MirrorJob.cc
-+++ b/src/MirrorJob.cc
-@@ -1164,24 +1164,21 @@ int   MirrorJob::Do()
- 	    }
- 	    continue;
- 	 }
-+	 bool use_rmdir = (file->TypeIs(file->DIRECTORY)
-+			   && recursion_mode==RECURSION_NEVER);
- 	 if(script)
- 	 {
--	    ArgV args("rm");
--	    if(file->TypeIs(file->DIRECTORY))
--	    {
--	       if(recursion_mode==RECURSION_NEVER)
--		  args.setarg(0,"rmdir");
--	       else
--		  args.Append("-r");
--	    }
-+	    ArgV args(use_rmdir?"rmdir":"rm");
-+	    if(file->TypeIs(file->DIRECTORY) && !use_rmdir)
-+	       args.Append("-r");
- 	    args.Append(target_session->GetFileURL(file->name));
- 	    xstring_ca cmd(args.CombineQuoted());
- 	    fprintf(script,"%s\n",cmd.get());
- 	 }
- 	 if(!script_only)
- 	 {
--	    ArgV *args=new ArgV("rm");
--	    args->Append(file->name);
-+	    ArgV *args=new ArgV(use_rmdir?"rmdir":"rm");
-+	    args->Append(dir_file(".",file->name));
- 	    args->seek(1);
- 	    rmJob *j=new rmJob(target_session->Clone(),args);
- 	    args->CombineTo(j->cmdline);
-@@ -1189,10 +1186,7 @@ int   MirrorJob::Do()
- 	    if(file->TypeIs(file->DIRECTORY))
- 	    {
- 	       if(recursion_mode==RECURSION_NEVER)
--	       {
--		  args->setarg(0,"rmdir");
- 		  j->Rmdir();
--	       }
- 	       else
- 		  j->Recurse();
- 	    }
-@@ -1258,7 +1252,7 @@ int   MirrorJob::Do()
- 	 if(!script_only)
- 	 {
- 	    ArgV *a=new ArgV("chmod");
--	    a->Append(file->name);
-+	    a->Append(dir_file(".",file->name));
- 	    a->seek(1);
- 	    ChmodJob *cj=new ChmodJob(target_session->Clone(),
- 				 file->mode&~mode_mask,a);
-@@ -1380,7 +1374,7 @@ int   MirrorJob::Do()
- 	 if(!script_only)
- 	 {
- 	    ArgV *args=new ArgV("rm");
--	    args->Append(file->name);
-+	    args->Append(dir_file(".",file->name));
- 	    args->seek(1);
- 	    rmJob *j=new rmJob(source_session->Clone(),args);
- 	    args->CombineTo(j->cmdline);
--- 
-2.13.3
-
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
index e0b6bebad..bf793d91d 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
-           file://CVE-2018-10916.patch \
           "
-SRC_URI[md5sum] = "12b1fcbf13f41e9cdb0903fc670fa1f1"
-SRC_URI[sha256sum] = "c4159f056afee41866a6c2d639655bc351e6d3486bbe7758eaedb24f6a4239d5"
+SRC_URI[md5sum] = "a56b5047dbfda052df4c1dfd197aa092"
+SRC_URI[sha256sum] = "a853edbd075b008c315679c7882b6dcc6821ed2365d2ed843a412acd3d40da0e"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.0


