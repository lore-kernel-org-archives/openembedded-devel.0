Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD9AD71D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n11so4238850pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/aF3w37xYYBxNEpzdTDKTM5Ug7onv3Z93Rc1vNgG+uA=;
	b=ajgNKbiYNYVBhD1fli3ibSpY38IGkcOdtMwlMyDut5yJrFZau7sdGSx2t2JbTz/CH7
	3SAIpdZYHqf5I4lqyb+t2GO0OVt/xd+jDtkI6je+hohwK8wC1d9SKp13wRFcqwq1xRr7
	wtcXUnhb8UOP1zIqdYTdhIs1K8p8lGS9oQYNviyPNPOrbtLapGa6QFkr2I2a72XuddFm
	xCo86oOu6pqyGj1sLkSH6xwRl+ohmG8gf2T8TVHjApexZrfnRz4RmF6T+QOpFzjCgbPm
	CcTSokrh7XxPbggmW0ObIY04XgBdC6PeE/xYH2nbvr0eOryFksNUJYfxPpIARJuYiu3L
	dHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/aF3w37xYYBxNEpzdTDKTM5Ug7onv3Z93Rc1vNgG+uA=;
	b=G9FDJyfX/PCry2+1q16v7fBUlY+3FR1AxGE1iRdyt7ME6ywCZB9K1uHzFTV7hIzKB4
	Eo6osYWbDfAepFWcSnIdp4xKOFGexcNITc6udrGxu8KVar/8DznJgj4uKTtN01+fRnWs
	f9U1Mpg0wvPz5M3yFn7lQ9HG7fZLUUY0Xhk/FrBKXwwJ6m6asb5DoQCAtRJA6auBYKJ4
	YLXX7lIVNSto+C8I2+zJihlpy1P+wvCQhzhubwbYAaDUhzZWEidxrWWxCbTcp5wz4zfc
	GXD/mKNf/MI7LNUHdGpCY7A6AXx1uirAS13K2cfgD5Dg9YLFRJaNqRVUKpOeN2cusgkh
	Qbow==
X-Gm-Message-State: AFeK/H0P5qE2rRKVM3/L7np0L2lDMUlNtNKYtqTyLZquDMU6ttoc+ECM2v5pS7fFT1u7jg==
X-Received: by 10.99.232.5 with SMTP id s5mr29746216pgh.66.1489987933467;
	Sun, 19 Mar 2017 22:32:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:42 -0700
Message-Id: <20170320053152.29352-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 06/16] libmatroska: Fix missing GNU_HASH errors
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Makefile-Use-LINKFLAGS-during-link-step.patch | 28 ++++++++++++++++++++++
 .../recipes-mkv/libmatroska/libmatroska_1.4.1.bb   |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
new file mode 100644
index 000000000..90e997561
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
@@ -0,0 +1,28 @@
+From f0c879097c331d1dabe6ee92b583a8badb62ea6d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 08:26:35 -0700
+Subject: [PATCH] Makefile: Use LINKFLAGS during link step
+
+Adds much needed GNU_HASH section into the .so
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ make/linux/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/make/linux/Makefile b/make/linux/Makefile
+index 3ca7b0f..b5c9645 100644
+--- a/make/linux/Makefile
++++ b/make/linux/Makefile
+@@ -104,7 +104,7 @@ $(LIBRARY): $(objects)
+ 	$(RANLIB) $@
+ 
+ $(LIBRARY_SO): $(objects_so)
+-	$(CXX) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so) -lebml
++	$(CXX) $(LINKFLAGS) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so) -lebml
+ 	rm -f $(LIBRARY_SO)
+ 	ln -s $(LIBRARY_SO_VER) $(LIBRARY_SO)
+ 
+-- 
+2.12.0
+
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
index 1ad87cba7..fdffa41ec 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
 
-SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-Makefile-Use-LINKFLAGS-during-link-step.patch \
+           "
 SRC_URI[md5sum] = "f61b2e5086f4bb9d24a43cc8af43a719"
 SRC_URI[sha256sum] = "086f21873e925679babdabf793c3bb85c353d0cd79423543a3355e08e8a4efb7"
 
-- 
2.12.0


