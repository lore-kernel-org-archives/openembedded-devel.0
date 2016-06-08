Return-Path: <straka.derek@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 250BE6FF23
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 19:14:00 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 62so1149395pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 12:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6LYwuIiDEeOKSoKVzRBcGb4v+dSLeEQmah+LNo2tUIc=;
	b=IRWB1ThYenfNHyKiA02Rds2+ByF9VOxFaGwFyWig5U1AH1EWqWfD4bavM3LMFsovMU
	oLaPMd8xYvQ9LoO4PYh/+5qNEw+2/ZtRyPlGn0QXRgVSRZQTvI8QmYmshHBGihzeeADp
	dNN+vJ1e1tNetb33bpD+1ZB2omHxOe3Ih0+hZ6RdY3UcXao37qqheN2XDX0rqoo+AYt3
	AOgAR/9bWXSd3KgJnWRBkjXXpESFZMxjgIuZ2O8pI5IV+Rd1OEYa2oi+67VTPSnbAOt/
	Sy9LP37s1PcGsbsODxzMRpi6GbnAcQ6cRL08vAA6UnPWUoyiCxku504qPMyq3GS0cMxe
	nQmw==
X-Gm-Message-State: ALyK8tI9Il1cm/Cri+Y9cyFTMcIurYDmSMMbDuhCQyrdMfWqk3euzbCLf/1vLdWuQmxR5w==
X-Received: by 10.98.192.83 with SMTP id x80mr7408441pff.88.1465413241003;
	Wed, 08 Jun 2016 12:14:01 -0700 (PDT)
Received: from localhost.localdomain ([192.55.54.58])
	by smtp.gmail.com with ESMTPSA id m1sm4079815pab.46.2016.06.08.12.13.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 12:14:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 15:13:50 -0400
Message-Id: <1465413230-10555-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-gpe][PATCH] fbreader: fix return code issue on gcc6
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
X-List-Received-Date: Wed, 08 Jun 2016 19:14:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch      | 11 +++++++++++
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb         |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch

diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch
new file mode 100644
index 0000000..97ab4d3
--- /dev/null
+++ b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch
@@ -0,0 +1,11 @@
+--- fbreader-0.12.10/fbreader/src/database/booksdb/BooksDB.cpp.orig	2016-06-08 14:54:04.206196501 -0400
++++ fbreader-0.12.10/fbreader/src/database/booksdb/BooksDB.cpp	2016-06-08 14:54:17.686196322 -0400
+@@ -145,7 +145,7 @@
+ 
+ 	myFindFileId->setFileName(fileName);
+ 	if (!myFindFileId->run()) {
+-		return false;
++		return 0;
+ 	}
+ 	((DBIntValue&)*myLoadBook->parameter("@file_id").value()) = myFindFileId->fileId();
+ 	shared_ptr<DBDataReader> reader = myLoadBook->executeReader();
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index 1487f11..f8ecc93 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -10,7 +10,8 @@ PR = "r1"
 SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
 file://Makefile.patch \
 file://gcc45.patch \
-file://fix-cflags-fribidi.patch"
+file://fix-cflags-fribidi.patch \
+file://fix-return-code-gcc6.patch"
 
 # Set the defaults
 READER_RESOLUTION ?= "1024x600"
-- 
1.9.1


