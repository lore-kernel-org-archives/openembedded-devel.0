Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id E54E97FC7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:49:09 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id h13so8619659plr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 11:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u8hN8OugfamKtFktGLpDziEPFv710F1KqIXYMG/3S0M=;
	b=ZMxlKCkTg9kg5W6zZqwv6JivwEk+i6slHAOKboFaGUxHYylhK+PAVNEtjVGlu4Zgfk
	JYhTfccr+MJt2aMpv6yzfz+P6HIaLNrcwwaizYWhFFEfLIXhXmXHKEf2xAgeLUtwXm6r
	g+cpz7q/oNCAliWCl8UI/EZtR1xTS0ws+IHRxO4hvE+NLSxGC4xrQ1xw/KOdb1eK/KM1
	+n4Q+csCT22Ccm14Jvyh0a85QUphrb7aNl9vb/nvkHEOdHFCj1PpJfWn6uIRQX12gvhf
	hpzan3Ehxo8qEdEH7DNLy3OX+MQ/huJWBKW3xeTyBh3xgPPhf2Rgw1gkQZMCHSfM2F0j
	dyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u8hN8OugfamKtFktGLpDziEPFv710F1KqIXYMG/3S0M=;
	b=RGUoyHS8Mh5A17PRjgqjlB5lD0l/6rj92PKobZ8Yib7/wCadOQNusSsq381gSYgrgB
	pww2UZVUxFuOsAZQ/5S0kY1eVTolGHea19vB88mGn6C/xXpKaivK2EJuPRN6u85vsxUf
	TYxlrpNMMMYPtKdV4Fp9ZJwZ4jwcREewFiFwlMd93y7n5N5Z63TwBZSTRpOAwz2NQ3Je
	R6OUk1luL1oMPvsncZ9z/w87eIywBTT2NJmkOZyCI1ez5Wsg94b4M9gKzR2Z8IOhJIDB
	LIct/bIlCRtMGRPrksc5rFjPchMcLWBFrKmpDrB3y6kNgz+4hiLdAr5V//B15iG8Kymb
	U9uA==
X-Gm-Message-State: APjAAAX5nxF+7lYR5wLygQ3qk1+1KngoO6UNoZfN2v7MVlL8g6Gym6yk
	XOBFP9eH+w3josqBzl0Jna/wPH0nMP8=
X-Google-Smtp-Source: APXvYqzIQ1ja3ElnZX+uhgnv9rcDZkNRlawgncR+6CyAahmCn/EtERqO1P1dco1qxgvauMX0aMoUBw==
X-Received: by 2002:a17:90a:3663:: with SMTP id
	s90mr1058170pjb.1.1574797750380; 
	Tue, 26 Nov 2019 11:49:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	b17sm13971474pfr.17.2019.11.26.11.49.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 11:49:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 11:48:56 -0800
Message-Id: <20191126194858.2002923-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] htop: Use python3
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
X-List-Received-Date: Tue, 26 Nov 2019 19:49:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes
| ../htop-2.2.0/scripts/MakeHeader.py ../htop-2.2.0/CategoriesPanel.c
| ../htop-2.2.0/scripts/MakeHeader.py ../htop-2.2.0/MainPanel.c
| /usr/bin/env: ‘python’: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Ask-for-python3-specifically.patch   | 26 +++++++++++++++++++
 meta-oe/recipes-support/htop/htop_2.2.0.bb    |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch

diff --git a/meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch b/meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..6153bdedbe
--- /dev/null
+++ b/meta-oe/recipes-support/htop/files/0001-Ask-for-python3-specifically.patch
@@ -0,0 +1,26 @@
+From 08aca4816cc798fce58b6235c26585a0063fa8af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 26 Nov 2019 10:43:49 -0800
+Subject: [PATCH] Ask for python3 specifically
+
+python2 is on its way out
+
+Upstream-Status: Submitted [https://github.com/hishamhm/htop/pull/968]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/MakeHeader.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/MakeHeader.py b/scripts/MakeHeader.py
+index 7c48fdd..7a7586d 100755
+--- a/scripts/MakeHeader.py
++++ b/scripts/MakeHeader.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ import os, sys, string, io
+ try:
+    from StringIO import StringIO
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-support/htop/htop_2.2.0.bb b/meta-oe/recipes-support/htop/htop_2.2.0.bb
index 01c856d123..64eb0c571f 100644
--- a/meta-oe/recipes-support/htop/htop_2.2.0.bb
+++ b/meta-oe/recipes-support/htop/htop_2.2.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
 DEPENDS = "ncurses"
 
 SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
-           file://0001-Use-pkg-config.patch"
+           file://0001-Use-pkg-config.patch \
+           file://0001-Ask-for-python3-specifically.patch \
+           "
 SRC_URI[md5sum] = "0d816b6beed31edc75babcfbf863ffa8"
 SRC_URI[sha256sum] = "d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57"
 
-- 
2.24.0


