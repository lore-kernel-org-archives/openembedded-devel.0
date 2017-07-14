Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3E00E78170
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so9725722pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bRBTFBXD9j5NxfcEAReytLcguUI+hcAX1onKxrpHkpU=;
	b=njw7sN4yS3A36p1rc5BTaOG9trXK+IQmvRd3LNDwL4UTC2UgQlhub6V3ekuIloVxkG
	j1whPfTYnHqSpw5tD8Q3aTtdTLGNgATROxoag9jDmBMK+uc9uPO3S3MsUZ8/oBKLzGPH
	rp5AyXZiwcXhJFORXTAKaWh93FtXOdALxTw/DdCUQGM1Hk9WXnLyGCA4UXtRe2DEo4bL
	xZZ4V5cTsAMhuzJbHFF/YKoLvDnYM/R+OZSDHO0OC/FJFTnxwTeqUTbEtYBYCJnu8jN7
	2JBz0WSZvZeiFizgSFe/eXnRkGGcku2xeIejJhkt4NCb72vGlxWzI3OLo3W/9Q11JnXa
	hzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bRBTFBXD9j5NxfcEAReytLcguUI+hcAX1onKxrpHkpU=;
	b=uQOaEZWfH7XuNxNgYdFriT2Kucjz0UJfnzgDcLn2HSg3/M6kzVkfoFH4NoxZEc59Ge
	C4G3nJ1kipAxnoqLUhVodni5ls6LMTU0jxbVZEp/8gRaThA9i8I/DBkAnPrZVU8SUx3e
	LutgC5ehg944yb5YxF2Zj1/UulFwVh9X7IQdx6XoP+IXxxpUpk/T6AZsT1LAKhv4YRN1
	7zK/MgawAe71HN30zifo7Ddd81sMNbtgvEAmpGGeFSLsyWeHJEVroK0TOKJRxsSZ03i0
	7Q/eq18Lvc/4QLC+xWPAbetfPDJiYxifMKZ9rz5uzI1HO7M8oFj4S+1fokzv0W1RtIAz
	D8vg==
X-Gm-Message-State: AIVw112eGSz4GFS23ty5vq9kGAljgiW9WQRrB4trOPoKWzldFXT4rHgI
	BiL8es5dmLgTkinZ
X-Received: by 10.101.88.130 with SMTP id d2mr13224998pgu.265.1500010835543;
	Thu, 13 Jul 2017 22:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:03 -0700
Message-Id: <20170714054013.34458-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 08/18] xfce4-netload-plugin: Do not include sys/sysctl.h
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:34 -0000

Its unused, moreover it helps it compile with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-sys-sysctl.h-its-unused-on-linux-port.patch | 25 ++++++++++++++++++++++
 .../netload/xfce4-netload-plugin_1.3.1.bb          |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
new file mode 100644
index 000000000..e35418192
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
@@ -0,0 +1,25 @@
+From 7fcc7352ec11644ac8be4e9ec1584a5be3333684 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 18:18:30 -0700
+Subject: [PATCH] Do not include sys/sysctl.h its unused on linux port
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ panel-plugin/os.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/panel-plugin/os.h b/panel-plugin/os.h
+index 473c2a4..9a5c544 100644
+--- a/panel-plugin/os.h
++++ b/panel-plugin/os.h
+@@ -170,7 +170,6 @@
+ #elif __linux__             /* L I N U X */
+ #  include <stdio.h>
+ #  include <sys/param.h>
+-#  include <sys/sysctl.h>
+ #  include <stdlib.h>
+ #  include <stdarg.h>
+ #  include <unistd.h>
+-- 
+2.13.2
+
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
index 7d7778202..35c8861bc 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
@@ -5,5 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2 \
+           file://0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch \
+           "
 SRC_URI[md5sum] = "f25aa3242e3119b49f259a3e4a1af08b"
 SRC_URI[sha256sum] = "99762781099d1e0ab9aa6a7b30c2bd94d8f658dbe61c760410d5d42d0766391c"
-- 
2.13.2


