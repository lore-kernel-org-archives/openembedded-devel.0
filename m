Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 116FD77042
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:47 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id d8-v6so17799315wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RuEMKT5YkSwcbOY+s1s94gz165KH5hR7M6tM/nGBlIA=;
	b=ixahDaUqBDRovRwW0EUOBMGl81jC/y+h/9GnXHePXDdzHQ6u4hZ1ofhVLsW15gkf+p
	v/ZSY0NV7mqBN1iyO4d9HUXv6gXyEGm5im2SIxg9SkfiIALYVIWaAptj/UVHK36wzUcJ
	YLba3yy/1zaNN89Flx9keO44RhDb5ZBhxdtoQHJO+jJzpgvl86V23QM8n3ySrr+uxUa/
	ps9G9nOj8OPtoX7IYNRWXWz+t7uxfoWxaV/Il7NsYuhrpwuFYf4eFN8jCqXM9y7yQxtt
	pJxF0nC6C7ERhSpLmjWjugfe53IsT27xgIKC9eHDG+f5GFnjw9EQbAKPMo7tbtX8HO6f
	MmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RuEMKT5YkSwcbOY+s1s94gz165KH5hR7M6tM/nGBlIA=;
	b=qL7psIslnEeUNK3PXuYSQVyT/bJ3iJ6CEK7em5P9fhzu9ewBm05OZHvPOkSZ+trydR
	JJlKU4IDX0Hyh5u9W01rUeQfJ+A++J+xMTvUWf5nc1JsmS0T9MGZsG5FAkYEi0cCXZvD
	U3OcF6/JumTpC4ytSHRcvAGKORovRv6OZVXKLneQJ9T4PVkq+GsTQl4dzENP6T06K5gE
	duNerT0GSb1VKv8TCkZzKzVsEv7/Wz/dJSfp415II2ZT+AFGfvTbDw3KSHer0ezsi+6V
	wrKvUm7wqyBIBOkGa+NMSqfl8R4dzGlpPDLm7JS6BYyJobEYatiiNNWCQ4G1eJg+7Vr6
	JYoQ==
X-Gm-Message-State: APt69E3bU4L+GKx0I7yqg3RlE3kVu0Jdog/0RieCeQUHD7zXvJBRtwh5
	oiwmrMuTSJpbqxkPaPojbZhgUw==
X-Google-Smtp-Source: ADUXVKJIDTWXcxzA8TQb20iHinGI5P2b5RaYU8ALaMRfnR+zX1kMCK3mB32/EfxYc40rvWlAfNpdKw==
X-Received: by 2002:adf:91e5:: with SMTP id
	92-v6mr10438037wri.124.1528643327600; 
	Sun, 10 Jun 2018 08:08:47 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:07 +0200
Message-Id: <20180610150821.9536-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 05/19] ristretto: fix build after update of xfconf
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Fix-build-after-update-of-xfconf.patch    | 40 ++++++++++++++++++++++
 .../recipes-apps/ristretto/ristretto_0.8.2.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch

diff --git a/meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch b/meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
new file mode 100644
index 000000000..5cdc8c728
--- /dev/null
+++ b/meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
@@ -0,0 +1,40 @@
+From 2b6bdb860ef53975c7e866f393b61d253c00754d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 22 Jan 2018 15:52:09 +0100
+Subject: [PATCH] Fix build after update of xfconf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+xfconf stopped using dbus-glib so required flags must be included here
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 36a31dc..3dd56bc 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -30,6 +30,7 @@ ristretto_CFLAGS = \
+ 	$(GIO_UNIX_CFLAGS) \
+ 	$(LIBEXIF_CFLAGS) \
+ 	$(XFCONF_CFLAGS) \
++	$(DBUS_GLIB_CFLAGS) \
+ 	$(EXO_CFLAGS) \
+ 	$(CAIRO_CFLAGS) \
+ 	$(LIBXFCE4UTIL_CFLAGS) \
+@@ -48,6 +49,7 @@ ristretto_LDADD = \
+ 	$(GIO_UNIX_LIBS) \
+ 	$(LIBEXIF_LIBS) \
+ 	$(XFCONF_LIBS) \
++	$(DBUS_GLIB_LIBS) \
+ 	$(EXO_LIBS) \
+ 	$(CAIRO_LIBS) \
+ 	$(LIBXFCE4UTIL_LIBS) \
+-- 
+2.14.3
+
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
index c4baa727e..06dd1021d 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
@@ -11,5 +11,6 @@ RRECOMMENDS_${PN} += "tumbler"
 
 SRC_URI[md5sum] = "a8d8bb6b8fa7f868cfa3ae778630946e"
 SRC_URI[sha256sum] = "f8f3b77ca6fc77ddf8cff1bb52e5c5802c462663f72f324393b3a0360f6901b8"
+SRC_URI += "file://0001-Fix-build-after-update-of-xfconf.patch"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.14.3


