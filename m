Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id D305E7F28F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:48:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id p184so40950676pfp.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d7TVd6riT5cPr3kCAZ+AaIOY2eOdNcds6Zh+SEqxGsM=;
	b=ichxxZ5WmnFx1vfghpB+9ZrFxx/jzHVxI8MpN21ECU1gixoCyEIhNOw9IWuOGvKxxS
	OtCvYByfCj83A3jLu0DrTwGC6QdPJZ9V3kh/VO6AIPA+YqJRRdRi5abEzUQaa6MSCrII
	ZdZyAs+0F2vLXRBsJnfcjHsXJ1XM1zyCLPQCDqRs/bGP1sCf9RCw8J07LVXSOx5GpanD
	MXGId8Ae5GFLegeP1UPQrlzb77iO17szx/f/b3isXKJHkonhfbRkueYI4kIpaXJyUkuB
	rAaUV0s3zJFJ9lwOLcGJMqQyf1dUy2eHo/NZmPUorC4y6Z1rsoJWhBzPWtZ8jcstXUw9
	Dc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d7TVd6riT5cPr3kCAZ+AaIOY2eOdNcds6Zh+SEqxGsM=;
	b=ZiISsWSOSITNJ9rAcaL6N2qVcFtgyn7XgDTPlRTpHngMnF39OskaZFgxJNgR/XLxeL
	ECH+iS/LridE+9MJIeR9+THRzzQEJODkGrgvrPOtpWmWzQOFd7sudbXOcpbFg8DDT69D
	khrXct0XS0986vbDQpfsFyUQZMDDE402PncKMXoj2Mf7RKA0TmQmzX31n8qgtjbxDFwA
	tbXgo+hzWTcfNqKDYoU4SAQC2oR5Vgv5bu8xOGQ4ba8yvREDrz6Xckmln7bOj5nWE4gG
	kFoNie6qD+i5Ud294oxzQnSQwJPdoT4frJC88EoMvtb8ekge/qPbZ5fT4weS4cY/b1sb
	Zk1w==
X-Gm-Message-State: APjAAAUIcUZqjSl7smDwZzP1m3wtJGLj6myz9isovJiOL73sKoD8WhNt
	Q+X5oxtoWWXMmjSF84bZc7v3CQaM4yM=
X-Google-Smtp-Source: APXvYqyVkeub13luGKgEFz/Lo/WayP1fBnpAShCSIzeYNjszp4gFu0jnhWIZIhRFRv5ifPnWdGlCRA==
X-Received: by 2002:a62:2c8e:: with SMTP id s136mr2113570pfs.3.1565074127526; 
	Mon, 05 Aug 2019 23:48:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u23sm89377775pfn.140.2019.08.05.23.48.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:48:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:48:32 -0700
Message-Id: <20190806064835.33856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] sjf2410-linux-native: Do not include sys/io.h
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
X-List-Received-Date: Tue, 06 Aug 2019 06:48:46 -0000
Content-Transfer-Encoding: quoted-printable

This file is non-existent on non-x86 build hosts
Fixes
ppt.c:8:10: fatal error: sys/io.h: No such file or directory
 #include <sys/io.h>
          ^~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ppt.c-Do-not-include-sys-io.h.patch  | 28 +++++++++++++++++++
 .../sjf2410-linux-native_svn.bb               |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/samsung-soc-utils/files/0001-pp=
t.c-Do-not-include-sys-io.h.patch

diff --git a/meta-oe/recipes-support/samsung-soc-utils/files/0001-ppt.c-Do-=
not-include-sys-io.h.patch b/meta-oe/recipes-support/samsung-soc-utils/file=
s/0001-ppt.c-Do-not-include-sys-io.h.patch
new file mode 100644
index 0000000000..4e6c250415
--- /dev/null
+++ b/meta-oe/recipes-support/samsung-soc-utils/files/0001-ppt.c-Do-not-inc=
lude-sys-io.h.patch
@@ -0,0 +1,28 @@
+From fd244ae648789591f0fb79e74d2b8f6c5b15d6e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Aug 2019 00:47:14 +0000
+Subject: [PATCH] ppt.c: Do not include sys/io.h
+
+newer versions of glibc has removed it
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ppt.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ppt.c b/ppt.c
+index 0bae2d0..0ef279f 100644
+--- a/ppt.c
++++ b/ppt.c
+@@ -5,7 +5,6 @@
+ #else=0D
+ #include <unistd.h>=0D
+ #include <stdlib.h>=0D
+-#include <sys/io.h>=0D
+ #include <linux/parport.h>=0D
+ #include <linux/ppdev.h>=0D
+ #include <sys/ioctl.h>=0D
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native=
_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_sv=
n.bb
index 2d5935dd3c..c56c8b9dd8 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
@@ -7,7 +7,9 @@ SRCREV =3D "4268"
 PV =3D "0.1+svnr${SRCPV}"
 PR =3D "r1"
=20
-SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dsjf2410-linux=
;protocol=3Dhttp"
+SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dsjf2410-linux=
;protocol=3Dhttp \
+           file://0001-ppt.c-Do-not-include-sys-io.h.patch \
+          "
 S =3D "${WORKDIR}/sjf2410-linux"
=20
 inherit native deploy
--=20
2.22.0


