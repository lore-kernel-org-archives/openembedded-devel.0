Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA886C44B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:42:20 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v5so13471935lfe.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 17:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=imK9/2tELKdFkwC6DCX0qMe9TXnjcDBHApNy5Mxxjnk=;
	b=KaBxDY89e+kpd7K1v/9eCQC4MhzYJbdjSUdkFr/rdsJdPeZlw9caXhrviFcMQcYVbM
	/854q3eg5q9DvE8eHH1lbMeO3GNHlbSqIlgBlS7N0/K7hWY4KKzQw8/8pYpcmi7JvTbb
	53WegsInjyXz1NSd6zgtf33Uf4Kiarcs2UbGRedk6+TU3P9ax8YUT3K4D50WE/SaqoSZ
	qEeIphierxg9pkuP/FR8rQbBaauzW1h9tU2JGR9yQOxIledc9PYCS5gAAfoN7AY/jSKV
	IaO5LBidhKRzqZGywhRDyrQYG7QupdfijBRf57pPvHg5cCuYcWhj7yNbHqrZMMB3HgjG
	mT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=imK9/2tELKdFkwC6DCX0qMe9TXnjcDBHApNy5Mxxjnk=;
	b=Ihnjx5BDsmS8PlrNfLhxNdNCJmRCYgBvuLlbvNn2M+NQF4hsh7dueIkNaQ6TESxka8
	SGa2WyV18WpuEZtqEzX1L4ujHBrLdvqu3oXM3QNnwAY2MYV6SWCAzxTpsEOmMmmmDi9a
	wLEHErlB3DhfKKLXeOhemx+VJ7tGa6o0FvL6oXTn77VRuXU6se546kpH7UiwdzHLngAT
	gTmk7AKwiKZiSGq3aMi/SGIoBFji5jKPGTWeAfJYG1mY2sYHWzLBKoylrb7UqbTODDBX
	VJmGmNXww7Yvf1OrwQJ/I6bul0UfHIDAtUGcrrIcR0dL3wIWS2emfiVPXHP63ypyqMe3
	Y2xg==
X-Gm-Message-State: AA+aEWY3cOxTr8dJOtW23wKJ1UMNeQjE97QgyOIQPhimUDt8Xr8Lcaqz
	ADE9F1jyE7wEaMKM/Y6Z3lNRx/zwAX4=
X-Google-Smtp-Source: AFSGD/UE+hl9qst2NXN28agYK64NpbTt1rEOeCpLqFRShqj6l6E3JQBLQSH898c4K2GtEYmN+Fb7wQ==
X-Received: by 2002:a19:ee08:: with SMTP id g8mr13507162lfb.72.1543974140066; 
	Tue, 04 Dec 2018 17:42:20 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r27-v6sm3533476lja.65.2018.12.04.17.42.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 17:42:19 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 02:42:15 +0100
Message-Id: <20181205014215.27690-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [PATCH] jansson: update to 2.12
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
X-List-Received-Date: Wed, 05 Dec 2018 01:42:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License MD5 hash has been changed due to modified copyright year in the
LICENSE file.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../0002-Fix-build-with-glibc-2.28.patch      | 34 -------------------
 .../{plymouth_0.9.2.bb => plymouth_0.9.4.bb}  |  7 ++--
 .../recipes-extended/jansson/jansson_2.11.bb  | 12 -------
 .../recipes-extended/jansson/jansson_2.12.bb  | 12 +++++++
 4 files changed, 15 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
 rename meta-oe/recipes-core/plymouth/{plymouth_0.9.2.bb => plymouth_0.9.4.bb} (91%)
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson_2.11.bb
 create mode 100644 meta-oe/recipes-extended/jansson/jansson_2.12.bb

diff --git a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch b/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
deleted file mode 100644
index 8638f75b3..000000000
--- a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0c0345303b7971d6cec478fd8b81d64bc1fbe0f6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Tue, 21 Aug 2018 23:26:45 +0200
-Subject: [PATCH] Fix build with >= glibc 2.28
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Stolen from [1]
-
-[1] https://bugs.freedesktop.org/show_bug.cgi?id=102191
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- src/libply-splash-core/ply-terminal.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libply-splash-core/ply-terminal.c b/src/libply-splash-core/ply-terminal.c
-index a0954f2..f3b32fe 100644
---- a/src/libply-splash-core/ply-terminal.c
-+++ b/src/libply-splash-core/ply-terminal.c
-@@ -32,6 +32,7 @@
- #include <sys/socket.h>
- #include <sys/stat.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <termios.h>
- #include <unistd.h>
- #include <wchar.h>
--- 
-2.14.4
-
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
similarity index 91%
rename from meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
rename to meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
index a5b16c979..b3b60cec6 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
@@ -17,12 +17,11 @@ PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash virtual-psplash-support"
 
 SRC_URI = " \
-    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2 \
+    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
-    file://0002-Fix-build-with-glibc-2.28.patch \
 "
-SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
-SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
+SRC_URI[md5sum] = "4efa5551d230165981b105e7c6a50aa7"
+SRC_URI[sha256sum] = "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6791351"
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
     --with-logo=${LOGO} \
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.11.bb b/meta-oe/recipes-extended/jansson/jansson_2.11.bb
deleted file mode 100644
index 370fa2248..000000000
--- a/meta-oe/recipes-extended/jansson/jansson_2.11.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
-HOMEPAGE = "http://www.digip.org/jansson/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b70213ec164c7bd876ec2120ba52f61"
-
-SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "7af071db9970441e1eaaf25662310e33"
-SRC_URI[sha256sum] = "6e85f42dabe49a7831dbdd6d30dca8a966956b51a9a50ed534b82afc3fa5b2f4"
-
-inherit autotools pkgconfig
-
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
new file mode 100644
index 000000000..5e7a1b8b2
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
+HOMEPAGE = "http://www.digip.org/jansson/"
+BUGTRACKER = "https://github.com/akheron/jansson/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc2548c0eb83800f29330040e18b5a05"
+
+SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0ed1f3a924604aae68067c214b0010ef"
+SRC_URI[sha256sum] = "5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9"
+
+inherit autotools pkgconfig
-- 
2.17.1


