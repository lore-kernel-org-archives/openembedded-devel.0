Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 966946B582
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:50 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so1963043eak.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0GRdHzP7nh/4I6X1ZsHrH8QK0f2o8AWW8QMF6yBg29g=;
	b=tlSXSUSabVxipCmKMGNtoOysDNY4HL2nMWu/YMvV4IiSIoIPwwkZqpPo4JClsigOpk
	e7AXRsaR4I6/AY/9xSwxgM+b8Vca3xAjkj9XdrQo8WwMeWscBtDcQXXDmn26FcYBXLCo
	HLrnzjMK+AwOBcs5diHg87uJJuI+iAAM6cycvFIzMJvxKzpaMmtn+vpODzS1LI7SjBAZ
	Aax5sHKWZaq3Db+oi9mum/LSfp7edePq1WOIL50wz/IE/5L4MA/xRBifHP/roNc4Ly8t
	zLu1lpIPHBfaQp/e3HJvT8wjnalhgXEu0IT8s27docKVM6n/mTTdQ2/4m/oskEXshmKH
	yu9A==
X-Received: by 10.14.47.200 with SMTP id t48mr12218722eeb.142.1376038431060;
	Fri, 09 Aug 2013 01:53:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm26780181eeb.11.2013.08.09.01.53.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:23 +0200
Message-Id: <1376038471-32202-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/12] mysql-python: add dependency on mysql
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2013 08:53:51 -0000

* fails without mysql_config:
  ERROR: Function failed: do_compile (log file is located at mysql-python/1.2.4-r0/temp/log.do_compile.29833)
  ERROR: Logfile of failure stored in: mysql-python/1.2.4-r0/temp/log.do_compile.29833
  Log data follows:
  | DEBUG: Executing shell function do_compile
  | sh: 1: mysql_config: not found
  | Traceback (most recent call last):
  |   File "setup.py", line 18, in <module>
  |     metadata, options = get_config()
  |   File "mysql-python/1.2.4-r0/MySQL-python-1.2.4/setup_posix.py", line 43, in get_config
  |     libs = mysql_config("libs_r")
  |   File "mysql-python/1.2.4-r0/MySQL-python-1.2.4/setup_posix.py", line 25, in mysql_config
  |     raise EnvironmentError("%s not found" % (mysql_config.path,))
  | EnvironmentError: mysql_config not found
  | ERROR: python setup.py build_ext execution failed.
  | ERROR: Function failed: do_compile (log file is located at mysql-python/1.2.4-r0/temp/log.do_compile.29833)
  NOTE: recipe mysql-python-1.2.4-r0: task do_compile: Failed
  ERROR: Task 6 (meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb, do_compile) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
index 37ad21c..678f17c 100644
--- a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
+++ b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
@@ -4,6 +4,8 @@ SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+DEPENDS = "mysql5"
+
 PR = "r0"
 SRCNAME = "MySQL-python"
 
-- 
1.8.3.2


