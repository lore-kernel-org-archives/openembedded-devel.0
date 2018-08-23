Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E144A79547
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 15:59:24 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z4-v6so2813304pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=U04QuFB44k60+5PE0ZbCE9FQdJ6xDYQpxw5hYBPr8kk=;
	b=qdsjvyveyqsgRmOcQY1TRW/I/Ito7dm/WK/HsNlTJyF4p9udj2pa+PmiGrmYuRTpPl
	vUphe2V9mq5ZgOaoN3SoNQnBmEynf8u7FyAI+AHV6xtWeg0JR2PhLkT7/Upz4Ws8YAdj
	Wt6fgsyBd8Jr+Sy6TCJaPNYBYS/PtmsSbynJu7fRlsjchagrCJnEb0DeOHFhidpoJTUU
	Lj/9skpSbcJjfGhB6n2DvcMd69KynfoH5pa1243pU1VbgV6ha4Hml0Uk0q/UUBlN4zk5
	0h1TtwXfOdlEE1Vnjic8fj5rm+oONqSAIth/nx2ZZ5N5RE240ghldiRHtTIwELWzAFFY
	z3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U04QuFB44k60+5PE0ZbCE9FQdJ6xDYQpxw5hYBPr8kk=;
	b=R1S4jdOmH1ASgtE2/x0rbL6fse5Z+KNK2TKlk5D2mMbt8A/dUoKqN7buqrb3UCKL/S
	5BigzfgA80uWJZdmYf95BxTPgcOudZFGeiLRG2hi8kLMXXQL5TOae8YMLpMysfDu/wBe
	QGFeHZTHsSJd0FurbRGwc/jmxIwWRUkeJZ+W2+rsQiUBrk+7fNqChsZlA0BDjnw/7IoA
	7F53VZRoORlWRjRSSHQJXkIPHR6iTG7yE1JCKEP8S6v4YZ3Oe0elvmC8r9Izx9S2VztB
	PJ+ugIIkOuxOWx3EQAWvWzzd83+d4qKmcGvVKlxux4BDOUx2BxiMuWyddB03cXnLDlCt
	qaEw==
X-Gm-Message-State: AOUpUlHwS7YmF2KeemultuTsoJ+8ZpAT9XDAEYukmSrLUz6FIs9nvqcg
	0xp21+7ZFBLvMprTnN0H3Gx+AoaRRO+Umw==
X-Google-Smtp-Source: AA+uWPxvc3jgg8T6XardZD+JZFRqXF1NepsKrmRxWbqS23OsO03HCVS9shbydKTZMZMAMHWXksi2eQ==
X-Received: by 2002:aa7:88d3:: with SMTP id
	p19-v6mr56985489pfo.160.1535039965691; 
	Thu, 23 Aug 2018 08:59:25 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	u83-v6sm17223129pfj.37.2018.08.23.08.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 08:59:24 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 21:29:19 +0530
Message-Id: <1535039959-20687-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][SUMO][resend PATCH] lftp: CVE-2018-10916
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
X-List-Received-Date: Thu, 23 Aug 2018 15:59:25 -0000

Affects lftp <= 4.8.3

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../lftp/files/CVE-2018-10916.patch                | 82 ++++++++++++++++++++++
 .../recipes-connectivity/lftp/lftp_4.7.7.bb        |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch

diff --git a/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch b/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
new file mode 100644
index 0000000..213403e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
@@ -0,0 +1,82 @@
+From a27e07d90a4608ceaf928b1babb27d4d803e1992 Mon Sep 17 00:00:00 2001
+From: "Alexander V. Lukyanov" <lavv17f@gmail.com>
+Date: Tue, 31 Jul 2018 10:57:35 +0300
+Subject: [PATCH] mirror: prepend ./ to rm and chmod arguments to avoid URL
+ recognition (fix #452)
+
+CVE: CVE-2018-10916
+Upstream-Status: Backport from v4.8.4
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/MirrorJob.cc | 24 +++++++++---------------
+ 1 file changed, 9 insertions(+), 15 deletions(-)
+
+diff --git a/src/MirrorJob.cc b/src/MirrorJob.cc
+index cf106c40..0be45431 100644
+--- a/src/MirrorJob.cc
++++ b/src/MirrorJob.cc
+@@ -1164,24 +1164,21 @@ int   MirrorJob::Do()
+ 	    }
+ 	    continue;
+ 	 }
++	 bool use_rmdir = (file->TypeIs(file->DIRECTORY)
++			   && recursion_mode==RECURSION_NEVER);
+ 	 if(script)
+ 	 {
+-	    ArgV args("rm");
+-	    if(file->TypeIs(file->DIRECTORY))
+-	    {
+-	       if(recursion_mode==RECURSION_NEVER)
+-		  args.setarg(0,"rmdir");
+-	       else
+-		  args.Append("-r");
+-	    }
++	    ArgV args(use_rmdir?"rmdir":"rm");
++	    if(file->TypeIs(file->DIRECTORY) && !use_rmdir)
++	       args.Append("-r");
+ 	    args.Append(target_session->GetFileURL(file->name));
+ 	    xstring_ca cmd(args.CombineQuoted());
+ 	    fprintf(script,"%s\n",cmd.get());
+ 	 }
+ 	 if(!script_only)
+ 	 {
+-	    ArgV *args=new ArgV("rm");
+-	    args->Append(file->name);
++	    ArgV *args=new ArgV(use_rmdir?"rmdir":"rm");
++	    args->Append(dir_file(".",file->name));
+ 	    args->seek(1);
+ 	    rmJob *j=new rmJob(target_session->Clone(),args);
+ 	    j->cmdline.set_allocated(args->Combine());
+@@ -1185,10 +1182,7 @@ int   MirrorJob::Do()
+ 	    if(file->TypeIs(file->DIRECTORY))
+ 	    {
+ 	       if(recursion_mode==RECURSION_NEVER)
+-	       {
+-		  args->setarg(0,"rmdir");
+ 		  j->Rmdir();
+-	       }
+ 	       else
+ 		  j->Recurse();
+ 	    }
+@@ -1252,7 +1246,7 @@ int   MirrorJob::Do()
+ 	 if(!script_only)
+ 	 {
+ 	    ArgV *a=new ArgV("chmod");
+-	    a->Append(file->name);
++	    a->Append(dir_file(".",file->name));
+ 	    a->seek(1);
+ 	    ChmodJob *cj=new ChmodJob(target_session->Clone(),
+ 				 file->mode&~mode_mask,a);
+@@ -1372,7 +1366,7 @@ int   MirrorJob::Do()
+ 	 if(!script_only)
+ 	 {
+ 	    ArgV *args=new ArgV("rm");
+-	    args->Append(file->name);
++	    args->Append(dir_file(".",file->name));
+ 	    args->seek(1);
+ 	    rmJob *j=new rmJob(source_session->Clone(),args);
+ 	    j->cmdline.set_allocated(args->Combine());
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
index b6b65da..042b0aa 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
+           file://CVE-2018-10916.patch \
           "
 SRC_URI[md5sum] = "3701e7675baa5619c92622eb141c8301"
 SRC_URI[sha256sum] = "fe441f20a9a317cfb99a8b8e628ba0457df472b6d93964d17374d5b5ebdf9280"
-- 
2.7.4


