Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C6DEC60620
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 13:32:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so3190491wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Hia5VlQZGwmwTrP0378HbwLMy2nFWgCN6tvwK1wW7qU=;
	b=MXbqe6kYARNLOjoC5GGbAsNtpaqTO4vSYPoIskVr266ex952qm+lswLq1VgmcnX7oG
	y+iCKbZ43mDeap2Z3eeJgpHO54ps1n459oDp6zSca9ArSLARtU52DqpSX34/7DjAeqkq
	/wquTPpjIld+cKFSd3FLQmSgZvN6wFvbyUPf6o2zJMajnNzzzWoC1hEIVaJgAFbwBHX3
	WJz1dyw6fCsKngyz2pokeDso7jWm6xUSGlxN0Jd9NrRNiddC9ZCLav0Vw9pHMG09qyT2
	4RVfXfLIQ/UwdEqzJq4vjCI/5elfa8AZZxxp6pVf4HS58kxxEIli7CQ6eJk7cuwQEG1k
	5VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hia5VlQZGwmwTrP0378HbwLMy2nFWgCN6tvwK1wW7qU=;
	b=PnM0yDPKUXj108l9wTXsN8Y5YSvcdqXogK4vHik/3FqWvz9Mebri80f5pZjc/wr7GO
	PPQx0h3XvncHx+pXEOnmrVCOT7+KcKdge6FJLbPFaqmJCEvkeNKMB7rIB8VZ1TZy7Lff
	qeaLTWDtefxg5NQsG+E6HGb1VMuCpsMnte8QIVU3BuFVaCIs1EanFq59JZUmVMmmDFdl
	3TLfC3puispjAUbby/IaeuDYFdhp4mSSu3RPeGcvrpW0bqOUTfq4cGn8Y7Cag+tLvf2N
	L4hlprp95I43mT99YdHASBMN2pccjWFC6T06A/gNSljbb0lmV7w1kSYJ2Q8N4OnuXH5n
	MqKw==
X-Gm-Message-State: AE9vXwNOUTjDxmIoow2c9gn/wiXDVZwsdMXJVhfbI5FwIFikoUHD02n128yPkL8JvC+OiA==
X-Received: by 10.28.15.3 with SMTP id 3mr3040187wmp.31.1472304754908;
	Sat, 27 Aug 2016 06:32:34 -0700 (PDT)
Received: from Saturn.local.all (212-41-122-61.adsl.solnet.ch. [212.41.122.61])
	by smtp.gmail.com with ESMTPSA id z18sm3868546wmz.6.2016.08.27.06.32.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Aug 2016 06:32:34 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Aug 2016 15:32:24 +0200
Message-Id: <1472304744-21421-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-qt5][jethro][PATCH] qtbase: fix regression for missing libqt*.a libs
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
X-List-Received-Date: Sat, 27 Aug 2016 13:32:38 -0000

Deploy the following statically linked libraries:
../build/lib/libqtfreetype.a  ../build/lib/libqtfreetype.prl
../build/lib/libqtpcre.a  ../build/lib/libqtpcre.prl

Fixes build of qtwayland (which is required for meta-toolchain-qt5):
| .../arm-angstrom-linux-gnueabi-ld.gold: error: cannot find -lqtfreetype
regression introduced with d6aeedb7f27b8dd02fa7e6fa193ce9e2e969ecf6 which
reverted the fix by Khem c44912563c4eadc288050f0b5e25981bc432d3f7

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

Note that the qtbase version used in krogoth does deploy libqtfreetype.a
in its regular 'make install'.

 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 62c0ab5..7d1ab5e 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -232,7 +232,7 @@ do_install_append() {
         cp -d ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
         chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
-    cp -d ${B}/lib/libQt* ${D}${libdir}
+    cp -d ${B}/lib/libqt* ${D}${libdir}
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
-- 
2.6.6


