Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8FE71C42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2017 17:08:57 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id v26so23977544pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2017 09:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZjnJJ6+GXjeAzhoY4qmUFdGk8rdzMJovH2L+aN9BUm4=;
	b=b6iGNJArV3eMFv///XNTbwcDc5xxQwZgd2dbZBcY3xKR49LYXuUrH1aBI+8TSODsoN
	aunlv73JJ4gIrtCMNljT8gupNKTSvtFfSHIyodN8lCWSEn5lCBw5JhunZADjx0CrWaes
	tVNjZpzPo/jVg4OKPpMjStePQdBbZnzJpMtnixqRQWjb7J7ELI5zT3vJUYbLY0EnThi2
	7XXDpjOOalcsfdz4sR4xm/AbOA+DMoah2/gwueoWmxV9FqvLo2RerHnmwEaTPgt/PpVZ
	hLFpE0BrCd/xV5koMN352Fz+4Zup/RXEnf9WLvl89otspAdISsBlURDLI+10zpCIB5wF
	ToMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZjnJJ6+GXjeAzhoY4qmUFdGk8rdzMJovH2L+aN9BUm4=;
	b=DY1EqEx1qL3nczbcl7CL+MukbUOEOnrjzw6FN8/5I44WFn5F9FEm8OjOS1AO1qvFfL
	ODznlTn3jpkpR1udrFFJ6FGsJilUdpwenRTqsZ+tihiemH/dAIFoiNf9Y5b9Azh6sezy
	pCQU2SRk7nE6tHuMgbJI9GCyu9D5Jvnl8QClF9qq5LSvZEAi7d2JkM97gApeVNC6s9pa
	cYEGA2kZTX+1oPByIqWMeyMZxrsX0eAy8tUunVYQO/YNscdL1/yKdQgvkVEIKXRF1gzR
	2Mj0xLqqJYRbSEU7A1EN5jPJl9LBw874qhOOaTQ/xp2QfzOLF66FN5Ajk20se0M3Lb9s
	jGGw==
X-Gm-Message-State: AKGB3mJ5HG8uVg5mX9Ml/gvDNTA3V/ZSPLqIRL7VkvxJ+9LJSsycSKyL
	lS86sAeu66EnkFhnggUmfPaa/A==
X-Google-Smtp-Source: ACJfBotA+oAYcpETe15+YD9pd2r/J1dzvNqG0Jyoc7+qtdUuilCu/Rpn17ZA5zxBHBLxV1AEaYT59A==
X-Received: by 10.101.99.152 with SMTP id h24mr4267153pgv.141.1514740138131;
	Sun, 31 Dec 2017 09:08:58 -0800 (PST)
Received: from neosoft.neocat.org (67-5-153-64.ptld.qwest.net. [67.5.153.64])
	by smtp.gmail.com with ESMTPSA id
	u6sm85849752pfk.126.2017.12.31.09.08.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Dec 2017 09:08:57 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Dec 2017 09:08:23 -0800
Message-Id: <20171231170823.29570-1-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH] smstools3: remove bash dependency on packaged scripts
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
X-List-Received-Date: Sun, 31 Dec 2017 17:08:57 -0000

An earlier patch to update smstools3 to v3.1.21 dropped the RDEPENDS for
bash, which caused qc errors during packaging, since the example scripts
still used /bin/bash as the command executor. This patch updates the scripts
to use /bin/sh instead. No known bash-only syntax is present in the packaged
scripts and they run ok under Busybox.

Upstream-Status: Submitted [http://smstools3.kekekasvi.com/topic.php?post=6188#post6188]
Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../smstools3/smstools3/scripts_no_bash.patch      | 32 ++++++++++++++++++++++
 .../smstools3/smstools3_3.1.21.bb                  |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
new file mode 100644
index 000000000..f7529d8cb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
@@ -0,0 +1,32 @@
+--- smstools3.orig/scripts/sendsms	2006-02-04 11:52:06.000000000 -0800
++++ smstools3/scripts/sendsms	2017-12-30 15:40:28.009169106 -0800
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # This script send a text sms at the command line by creating
+ # a sms file in the outgoing queue.
+ 
+--- smstools3.orig/scripts/sms2html	2006-02-04 11:52:06.000000000 -0800
++++ smstools3/scripts/sms2html	2017-12-30 15:39:17.496694390 -0800
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # This script converts a received sms file into a html file. 
+ 
+--- smstools3.orig/scripts/sms2unicode	2006-02-04 11:52:06.000000000 -0800
++++ smstools3/scripts/sms2unicode	2017-12-30 15:33:14.477250179 -0800
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # This script converts a received sms file into a pure unicode text file.
+ 
+--- smstools3/scripts/unicode2sms	2006-02-04 11:52:06.000000000 -0800
++++ smstools3/scripts/unicode2sms.new	2017-12-30 15:33:56.918536044 -0800
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # This script converts a pure unicode text file into an sms file for sending.
+ 
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
index 86c8ede1d..6e6413b4b 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
 HOMEPAGE = "http://smstools3.kekekasvi.com"
 
 SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
-           file://sms_binpath.patch"
+           file://sms_binpath.patch \
+           file://scripts_no_bash.patch"
 
 SRC_URI[md5sum] = "6a9f038fb38a49cc3a4f8f14a88fb8af"
 SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084"
-- 
2.13.6


