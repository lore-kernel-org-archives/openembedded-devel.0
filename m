Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F30936FF5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 05:57:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6093827"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Apr 2016 13:57:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E27DC408D291
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:57:45 +0800 (CST)
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Apr 2016 13:57:45 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Apr 2016 08:57:39 +0300
Message-ID: <1461909459-1811-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
X-yoursite-MailScanner-ID: E27DC408D291.A031B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][PATCH] qtquick1: fix rootfs creation errors
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
X-List-Received-Date: Fri, 29 Apr 2016 05:57:55 -0000
Content-Type: text/plain

The error is as following:
1) Can't install libqt5declarative-plugins-***: no package
   provides libQt5Declarative.so.5(Qt_5_PRIVATE_API)

2) ERROR: Nothing RPROVIDES 'libqt5declarative-tools'

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qtquick1_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 61b02a1..ec4c18c 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -24,3 +24,14 @@ do_configure_prepend() {
 }
 
 SRCREV = "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
+
+PROVIDES += "qtquick1"
+RPROVIDES_libqt5declarative5 += "qtquick1"
+RREPLACES_libqt5declarative5 += "qtquick1"
+RCONFLICTS_libqt5declarative5 += "qtquick1"
+
+PACKAGES += "libqt5declarative5 \
+             libqt5declarative-tools \
+             libqt5declarative-qmlplugins \
+             libqt5declarative-plugins \
+             "
-- 
1.8.4.2




