Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B03C07916D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 22:58:08 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id s12-v6so342899wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 15:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D4VxB8dquKK3VuFenU6uKv170GI5lbO7uypWllvN2J8=;
	b=jOFBg0Wm5QlLsgsZslByeJunZp+P/WCRZ7UOVD6RbRVH90nluaItMwhekunge/BAUF
	xzfAcjklJC0oeUSBoSbns097VrlkQU1he+eithQwJu4Na3KNjBq9obWtZcszloHnl9aY
	b18wabDNpZXdxZ0U+L9D3BL79gMaRza+l1+f0uOeiaAMu123Hn6R/zRM8cJ39+K/QRTT
	62abdXjQeHJCavGc1a6aW+8RlXHlbgVGECZgH7ITD3YH79OhSruhTy2PkpkxOsw7BrhD
	N6/oG0M6/WsgEZTK9pT5Cl3+hX/l+mk0h8cArg9DWpY6w0ACp0cScLKdVGppwYdoexU7
	QfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D4VxB8dquKK3VuFenU6uKv170GI5lbO7uypWllvN2J8=;
	b=VUd/9UcO54Lqk1iAn+rNc9LwF+quRTqWWwyyV11vUT5ZyriGk+oti0aK2ybePmGs9s
	VRgZxSkGkA1ULaG190DZWAijNXwlsSzGVs5DjWQ1LpFjXoJQujXnyKrwP4GHymuZxTtA
	DI5vmpV62r77i6RSfRfsDHg8lYiTRUQ1oynPiou6CvrilsPrj0zx5M9jNptzkyNYdH52
	wyleZn5Wo1NBEfIVnhTc3lUfFlO6+2NIhOz3HFUUKR3VdQaGXcUGs2joEN7esZX/WXDj
	wBUflCrrba74mqIMWDECNdFcfcEWro2wfZ3AZPndVxYIFcXIPt4GXG8kIGX7iWdkDZKL
	+Mqw==
X-Gm-Message-State: APzg51Au6EJeUm9VuV+rTBNS6BXMcfpb4gRXb9Vh9P48N0q7CZ/HwrXW
	Nj5Qum/UxJIxNTYFRM244eJ+PWo4
X-Google-Smtp-Source: ANB0VdagkyFhGrE/JX72gC7PgEgBpABaGcFqTNGKkUJgb8hZmwpToGu9n71yaQOwgXVADWXIFvIWMA==
X-Received: by 2002:a1c:a90:: with SMTP id 138-v6mr771458wmk.98.1534892289163; 
	Tue, 21 Aug 2018 15:58:09 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC993951E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc9:9395:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	e12-v6sm28659wrt.29.2018.08.21.15.58.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 15:58:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2018 00:57:55 +0200
Message-Id: <20180821225755.19796-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180821225755.19796-1-schnitzeltony@gmail.com>
References: <20180821225755.19796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] plymouth: Fix-build with glibc 2.28
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
X-List-Received-Date: Tue, 21 Aug 2018 22:58:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tried to update plymouth to 0.9.3 but that did not work as it used to. So
postpone that.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../files/0002-Fix-build-with-glibc-2.28.patch     | 34 ++++++++++++++++++++++
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch b/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
new file mode 100644
index 000000000..8638f75b3
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
@@ -0,0 +1,34 @@
+From 0c0345303b7971d6cec478fd8b81d64bc1fbe0f6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 21 Aug 2018 23:26:45 +0200
+Subject: [PATCH] Fix build with >= glibc 2.28
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] https://bugs.freedesktop.org/show_bug.cgi?id=102191
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/libply-splash-core/ply-terminal.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libply-splash-core/ply-terminal.c b/src/libply-splash-core/ply-terminal.c
+index a0954f2..f3b32fe 100644
+--- a/src/libply-splash-core/ply-terminal.c
++++ b/src/libply-splash-core/ply-terminal.c
+@@ -32,6 +32,7 @@
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <termios.h>
+ #include <unistd.h>
+ #include <wchar.h>
+-- 
+2.14.4
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 7e8d6e32a..a5b16c979 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -19,6 +19,7 @@ RPROVIDES_${PN} = "virtual-psplash virtual-psplash-support"
 SRC_URI = " \
     http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2 \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
+    file://0002-Fix-build-with-glibc-2.28.patch \
 "
 SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
 SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
-- 
2.14.4


