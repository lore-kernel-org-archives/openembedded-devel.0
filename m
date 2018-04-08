Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD38B75500
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:52 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s10-v6so3208694plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DdCvpyUiXHKI7QJT9U5nHKTuydLtSpNR6zyGqMJr1vE=;
	b=G6uqkinE/21h3UF0zHgSUSk5rjltc5KIsQHCxuUIDDJ4XfcMUHXExsjEINDLfu36aJ
	2l/TD6+ewYN9C5xlYQNovEzRDBpXOoBkLZ9KuxQZw2fX+zhN380sHOdqybv6JCtcwW0F
	GDe05tVnZ95Oi0LJZhZ2pqI2/1aaI6sZJPW+84Saq+LW3xjZaGy6IfFV70puEZmMTQqv
	RHRzwldY1B4htSP1Oi8YQRDgBGf1hJtKipp8gFyAY3aBG+PBT1qbzsnHYwK6cvxaE3C8
	8HOgrv6uWP3Kpt3fWWluif3bp0cbI8Y6StiD5tHp2CPqlDczH7NbMZv4TeJPoahqlbAg
	QDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DdCvpyUiXHKI7QJT9U5nHKTuydLtSpNR6zyGqMJr1vE=;
	b=iQhxqjd5avWcoyvgAwlZGCGSbp1/l+SkpUAzpHA5J5bKDeglC1LlCnSs/DbDexBzmg
	/5qKd/MYGdA4y4txPqImd0iHc8pSojiYx/9ttlftOcQT9ipDKFD6xC4aJBIhyG1z0SSq
	6wFSKI2aDhaTo3tXNH7+LToYHioT+JqUZj18Iv+sIpdvy3rLvifJP/qTYCLgYDz2jKac
	egJDE4ZVQ99bPTlrnE4kmZgwq4jBHq96jZP140bw66IDxf/ahdte20miDosxcLKSbwEt
	ld+fPTs8lySiBWbH3YEHyBbJmhCAyaKEX5104CDc1VvTWzZowOGpqloOsGq6DL6a8d/1
	W2xw==
X-Gm-Message-State: ALQs6tBo7z1iW4lxqhcZ3AFYyQDPhQN/l7yf0edNdV4ivqoFNDLC2s9J
	tMxTuueJfJ3kLYYrD5KvS3A=
X-Google-Smtp-Source: AIpwx4+0m2DSuYpWFLv80W3V/U7l/bYzcJqymswRwLqp/CNWabSrQ89o9P+nLio2vAMQ3HYFVi73JQ==
X-Received: by 2002:a17:902:7e08:: with SMTP id
	b8-v6mr3859927plm.386.1523170733592; 
	Sat, 07 Apr 2018 23:58:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:14 -0700
Message-Id: <1523170729-26321-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 02/37] smstools3: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:52 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file scripts/sms3
Hunk #1 succeeded at 24 with fuzz 2.

plus more

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../smstools3/smstools3/scripts_no_bash.patch      | 35 +++++++++++++++++-----
 .../smstools3/smstools3/sms_binpath.patch          | 18 +++++++----
 2 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
index f7529d8..49b4d1d 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
@@ -1,29 +1,48 @@
---- smstools3.orig/scripts/sendsms	2006-02-04 11:52:06.000000000 -0800
-+++ smstools3/scripts/sendsms	2017-12-30 15:40:28.009169106 -0800
+From 85602c3e531d39e89dc8cee0c4a592f85006a064 Mon Sep 17 00:00:00 2001
+From: Bill Randle <bill.randle@gmail.com>
+Date: Sun, 31 Dec 2017 09:08:23 -0800
+
+---
+ scripts/sendsms     | 2 +-
+ scripts/sms2html    | 2 +-
+ scripts/sms2unicode | 2 +-
+ scripts/unicode2sms | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/scripts/sendsms b/scripts/sendsms
+index 512026d..bb56856 100755
+--- a/scripts/sendsms
++++ b/scripts/sendsms
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  # This script send a text sms at the command line by creating
  # a sms file in the outgoing queue.
  
---- smstools3.orig/scripts/sms2html	2006-02-04 11:52:06.000000000 -0800
-+++ smstools3/scripts/sms2html	2017-12-30 15:39:17.496694390 -0800
+diff --git a/scripts/sms2html b/scripts/sms2html
+index ff253e3..946185e 100755
+--- a/scripts/sms2html
++++ b/scripts/sms2html
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
  # This script converts a received sms file into a html file. 
  
---- smstools3.orig/scripts/sms2unicode	2006-02-04 11:52:06.000000000 -0800
-+++ smstools3/scripts/sms2unicode	2017-12-30 15:33:14.477250179 -0800
+diff --git a/scripts/sms2unicode b/scripts/sms2unicode
+index 46e2756..2826dc1 100755
+--- a/scripts/sms2unicode
++++ b/scripts/sms2unicode
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
  # This script converts a received sms file into a pure unicode text file.
  
---- smstools3/scripts/unicode2sms	2006-02-04 11:52:06.000000000 -0800
-+++ smstools3/scripts/unicode2sms.new	2017-12-30 15:33:56.918536044 -0800
+diff --git a/scripts/unicode2sms b/scripts/unicode2sms
+index 2ae86dc..3fccf0d 100755
+--- a/scripts/unicode2sms
++++ b/scripts/unicode2sms
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
index 6220446..e1d79d3 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
@@ -1,8 +1,16 @@
-Index: smstools3/scripts/sms3
-===================================================================
---- smstools3.orig/scripts/sms3	2010-05-04 11:21:44.000000000 +0200
-+++ smstools3/scripts/sms3	2015-02-22 20:05:51.615074469 +0100
-@@ -24,11 +24,11 @@
+From 9a4a872dca78ca9cb6bdc228be61f5a4c2d68b1f Mon Sep 17 00:00:00 2001
+From: Kai Ulrich <kaiu@gmx.de>
+Date: Wed, 18 Mar 2015 11:20:53 +0100
+
+---
+ scripts/sms3 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/sms3 b/scripts/sms3
+index 6b990bf..09c063b 100755
+--- a/scripts/sms3
++++ b/scripts/sms3
+@@ -24,9 +24,9 @@ INFOFILE="/var/run/smsd.working"
  # Logfile can also be defined in here:
  LOGFILE="/var/log/smsd.log"
  
-- 
2.7.4


