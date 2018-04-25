Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC74272EED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:13:35 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o76so10631001pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3aZiS0L1/mLoCxBfSibDNR3z+UwvYkv7hC4R1zp+S5w=;
	b=TfDFan8t+FBIU2HVSUAMP/RudoxDCe4NueN02KmEdoa02rZQpwMeP4tqejQja6JPII
	8Ji/QsqCT+pkRhPBuZ/7k8FIvOx0SXevD0YtsTA19AALjz5j9TmLtyhzPuGKDZQwhYAR
	uUAOnqjesoat1/JoS4yWqNAdwvmC8AFnLqLs0WQwmkkYYMFdgz980VyakC8P/SujlGiR
	I78RIY//IksMGrMUpws5h45PqCfxC9dk5Jk12/8T/QJ8l0nP/GcXVr3YqSA8aSnrZrD4
	cf8UdE1GpoHMs4NDlzbmOmNA3mzOX8LpVr6I/evDkSSHnQrqYcOKpiE0S6f+B5fnIOqS
	Pt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3aZiS0L1/mLoCxBfSibDNR3z+UwvYkv7hC4R1zp+S5w=;
	b=qMhFdIi4pfTG/1jpOFvmu2ojCL1TA+q3HrqwBStGN9J9rq1JkofiwGCLscvu0V4TaF
	7gDhgu6yTEfc4JANg6omZD1DOTu17ovL2sFVhdMREuLoBvokwn3FPjFEIOgxCMWrvt+A
	yffkNKwfy5dzNwt8i2aARSG/NHBvKp6fhi0yIhZOVY7bBdqxmW/3X6Hz4OvUW5PaRgFU
	4rl3fg65KcrpturgJmTPpByFU1k7bGeiys1ko4aQHKRZyDL2t+aUer6TzI/QOwRmTPaK
	a8Wafit7xpWQrnx5uVOWuPA5n3gAdAO/KVJKjEe3D39JSnCGOH/wrST17IZxrTOUkfCk
	zSJg==
X-Gm-Message-State: ALQs6tD9DfyBRSng2bdGU6muNHcyLHu6ni2VS4gokFq71cjARawTj+ia
	Or4D7UXSp2tgLEJYoJ7Q2KcpHw==
X-Google-Smtp-Source: AB8JxZpt38xP81wOPi6TRtsD5gwoZTn3MdVMxdolfYC0HCKSbOWfXF3gK/P5oPSwiWDd3vZqVTGr7A==
X-Received: by 2002:a17:902:164:: with SMTP id
	91-v6mr8359346plb.134.1524665617258; 
	Wed, 25 Apr 2018 07:13:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	e4sm35563566pfa.128.2018.04.25.07.13.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 07:13:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 07:13:28 -0700
Message-Id: <1524665609-7709-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 5/6] android-tools: refresh patch
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
X-List-Received-Date: Wed, 25 Apr 2018 14:13:36 -0000

Applying patch preserve-ownership.patch
patching file system/extras/ext4_utils/make_ext4fs_main.c
Hunk #1 succeeded at 47 with fuzz 2 (offset -2 lines).
Hunk #2 succeeded at 81 (offset -2 lines).
Hunk #3 succeeded at 144 (offset -2 lines).
patching file system/extras/ext4_utils/make_ext4fs.c

Now at patch preserve-ownership.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../android-tools/preserve-ownership.patch           | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
index 85af81f..fc350fb 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
@@ -9,11 +9,13 @@ Upstream-Status: Inappropriate
  system/extras/ext4_utils/make_ext4fs_main.c |   10 ++++++++--
  2 files changed, 14 insertions(+), 2 deletions(-)
 
---- a/system/extras/ext4_utils/make_ext4fs_main.c
-+++ b/system/extras/ext4_utils/make_ext4fs_main.c
-@@ -49,13 +49,15 @@ extern struct fs_info info;
+Index: git/system/extras/ext4_utils/make_ext4fs_main.c
+===================================================================
+--- git.orig/system/extras/ext4_utils/make_ext4fs_main.c
++++ git/system/extras/ext4_utils/make_ext4fs_main.c
+@@ -47,13 +47,15 @@ struct selabel_handle;
+ extern struct fs_info info;
  
- extern struct selabel_handle* selinux_android_file_context_handle(void);
  
 +extern int preserve_owner;
 +
@@ -28,7 +30,7 @@ Upstream-Status: Inappropriate
  	fprintf(stderr, "    <filename> [<directory>]\n");
  }
  
-@@ -81,7 +83,7 @@ int main(int argc, char **argv)
+@@ -79,7 +81,7 @@ int main(int argc, char **argv)
  	struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
  #endif
  
@@ -37,7 +39,7 @@ Upstream-Status: Inappropriate
  		switch (opt) {
  		case 'l':
  			info.len = parse_num(optarg);
-@@ -144,6 +146,10 @@ int main(int argc, char **argv)
+@@ -142,6 +144,10 @@ int main(int argc, char **argv)
  			}
  #endif
  			break;
@@ -48,8 +50,10 @@ Upstream-Status: Inappropriate
  		case 'v':
  			verbose = 1;
  			break;
---- a/system/extras/ext4_utils/make_ext4fs.c
-+++ b/system/extras/ext4_utils/make_ext4fs.c
+Index: git/system/extras/ext4_utils/make_ext4fs.c
+===================================================================
+--- git.orig/system/extras/ext4_utils/make_ext4fs.c
++++ git/system/extras/ext4_utils/make_ext4fs.c
 @@ -67,6 +67,8 @@
  
  #endif
-- 
2.7.4


