Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 737AA793F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 11:25:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j26-v6so2549361pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=k6reiVXvALPVw5M6vcxm58AMYfJhNDLmmdGozaPwYeU=;
	b=ggLx0JrbfxgvnzKcHII03H5l1fg+O+75uZp+dNs2FCtegWQ0W0nvTf83jaI2DsYCwL
	qTCAGxWQEb4OOoZho1DQ12UDTa2bMJIM+HqBE1cf3Hbofps2OfCW6cWyqXsvn07JKcWH
	i5YYvR7/OyVJUnG6FJAFO50IEkfxY9JHYYFS8uEoNygweThcQCqrrcIySSe6xaEh2wac
	QjFD2/MAfrqbc1U+/xglqygjhVeyijLrEFIoUxNZFYBuf9ARpivPaBn93wzT7avmqBam
	3kCUljy2Yxb6Nf3ocQHUqtSDNZ6DciJZebglseQrKSX7/BVrUO9LVM7lNsbtgEotIyP0
	WLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k6reiVXvALPVw5M6vcxm58AMYfJhNDLmmdGozaPwYeU=;
	b=B7buxGSXxsleSUlcY+kmpW8uVDjJXXKphUU2stpDrdy7z26oXbH4x1DEhUpx80Bb5n
	M9a+QQWcXokuN+XHAifnWPQfY1PN0CEtp6vMFllwlW/LGMzcBiNIOeZX7TeICTWlg3Lh
	DJ+/nY+0yXK82lWMP3Egv3ISBENb+2j3Os4Nusjea2q6x6m0GNLUotdjv58DMYo36JYD
	5Pq/H7uC2k9oH5ONullxRV9ywXYg3CS94XU26GLERUpG7Cd9Wc6hcMEiydlnIu23m6x5
	EoUUNEw16GEj7oOcmqgNXFkhivBIklQXEdhXBr+LIr+yRp6bkMbx8iUjVDGZFr6itZxK
	HJ0Q==
X-Gm-Message-State: AOUpUlECB1+bg1Md9ChviOzYnI8ZuglxYoXHg2ssYWBxuLymuZg7QpxU
	MqKECUlH/bOGu/2gmM7dmrqL96wD9j18OQ==
X-Google-Smtp-Source: AA+uWPztpmaAWhdsK743xJy1/fn03WArYrMobVifULSqCzsIp6ceeogeuMTCWrLwbLfELv9MalFLcA==
X-Received: by 2002:a63:a919:: with SMTP id
	u25-v6mr56517647pge.211.1535023538255; 
	Thu, 23 Aug 2018 04:25:38 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	t9-v6sm5248244pgi.87.2018.08.23.04.25.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 04:25:37 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 16:55:32 +0530
Message-Id: <1535023532-9876-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] lftp: CVE-2018-10916
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
X-List-Received-Date: Thu, 23 Aug 2018 11:25:37 -0000

Affects lftp <= 4.8.3

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../lftp/files/CVE-2018-10916.patch                | 82 ++++++++++++++++++++++
 .../recipes-connectivity/lftp/lftp_4.8.3.bb        |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch

diff --git a/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch b/meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
new file mode 100644
index 0000000..c0e87d9
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
+ 	    args->CombineTo(j->cmdline);
+@@ -1189,10 +1186,7 @@ int   MirrorJob::Do()
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
+@@ -1258,7 +1252,7 @@ int   MirrorJob::Do()
+ 	 if(!script_only)
+ 	 {
+ 	    ArgV *a=new ArgV("chmod");
+-	    a->Append(file->name);
++	    a->Append(dir_file(".",file->name));
+ 	    a->seek(1);
+ 	    ChmodJob *cj=new ChmodJob(target_session->Clone(),
+ 				 file->mode&~mode_mask,a);
+@@ -1380,7 +1374,7 @@ int   MirrorJob::Do()
+ 	 if(!script_only)
+ 	 {
+ 	    ArgV *args=new ArgV("rm");
+-	    args->Append(file->name);
++	    args->Append(dir_file(".",file->name));
+ 	    args->seek(1);
+ 	    rmJob *j=new rmJob(source_session->Clone(),args);
+ 	    args->CombineTo(j->cmdline);
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
index c6e3727..e0b6beb 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
+           file://CVE-2018-10916.patch \
           "
 SRC_URI[md5sum] = "12b1fcbf13f41e9cdb0903fc670fa1f1"
 SRC_URI[sha256sum] = "c4159f056afee41866a6c2d639655bc351e6d3486bbe7758eaedb24f6a4239d5"
-- 
2.7.4


