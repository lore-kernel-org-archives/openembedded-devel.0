Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF19A6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:50:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1624435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Dec 2015 09:50:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BFC9E409256C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 09:50:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 16 Dec 2015 09:53:54 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Dec 2015 04:50:24 +0300
Message-ID: <1450230624-5675-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: BFC9E409256C.AF35D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][dizzy][PATCH] networkmanager: add DEPENDS libgudev to avoid build errors.
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
X-List-Received-Date: Wed, 16 Dec 2015 01:51:00 -0000
Content-Type: text/plain

configure: error: Package requirements (gudev-1.0 >= 165) were not met:
No package 'gudev-1.0' found

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
index 8d37c98..2effeb3 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp"
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp libgudev"
 
 inherit gnome gettext systemd
 
-- 
1.8.4.2




