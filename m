Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E78F79567
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 11:21:53 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h79-v6so1672076pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U04QuFB44k60+5PE0ZbCE9FQdJ6xDYQpxw5hYBPr8kk=;
	b=JmN+p4ywRLysfe3aLxIitSm5hLZn1yDQC4sSbYQE6tcIdQurmnRv0CafJBX2qZkeDv
	bm12fjn40D0pKzFHjkbe3tlYTv2l7gncPUaZTd7v0SZyemFuWT9t3bZQZ4cwO1GCT4uG
	UpFsz4xGtNZlGJuTEkqup1gMsb8fd8Mf3q54QQjY01TsD88GmruvFAmj4K/56A9PB+Bq
	cc4QKRjd+UR2F+FHhJIAuldLL6e0+mkOk9f6h2UuUcE/LAI3V2aINvTDIlcU1QAifFLh
	DPCpxsQ3ND1hhM9nVTFQ2Z1RNwgK7frwCJTxwN+hypxfkUgFfRfnnoR1lfwXxk2dPyXy
	a4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U04QuFB44k60+5PE0ZbCE9FQdJ6xDYQpxw5hYBPr8kk=;
	b=riJWwyYInmlZJVFFF/LCl93rX1qySYmD9cwanVlOyXTooEyeqRWUSMpZpvXA/9JcoJ
	SXJyFZAydmvMcT+YcrNm5XgGQGbNH524s5siPqbG0yxQOtYlWBryCUQ/D4z33R2HUUO4
	DthTlIinJNuHn017VwT+p/vC7mq7f6FT/mRTnn70J2RlqxT3LHqaMrkqVpOXIUl7Cyrk
	W8s5RjVg7dp2rOGwwJbI7BLute4ItVuRufs9AU4tkZ63gtrmWACPGpTCqq3tmZsxKyZx
	SzeRKOJmQU/YeXdzBd0iBdj/8UZ5TsRR6+tkBdv8baK+3w8AOy080bIJgPCsbLB8ogig
	cv6w==
X-Gm-Message-State: APzg51DXhFp+R52df+5P8IoA+B/5XL54gonjbWF64Kayz0zgiPu2bqLZ
	pGeP/0ZOcpmi1qejZHUPfCpwySKmsvQPkA==
X-Google-Smtp-Source: ANB0VdYPNCdPpZ+G1FutC4mQQltyoynfPzUoGSKevRmPRXilextSBSnxA5lfTkAImL4LjXz9i8jBSw==
X-Received: by 2002:a63:d20e:: with SMTP id
	a14-v6mr5407593pgg.226.1535023314286; 
	Thu, 23 Aug 2018 04:21:54 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	z5-v6sm5856811pfh.83.2018.08.23.04.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 04:21:53 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 16:51:24 +0530
Message-Id: <1535023284-8126-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535023284-8126-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1535023284-8126-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-networking][ROCKO][PATCH] lftp: CVE-2018-10916
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
X-List-Received-Date: Thu, 23 Aug 2018 11:21:53 -0000

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


