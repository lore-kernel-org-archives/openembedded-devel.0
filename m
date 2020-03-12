Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 766E461C28
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:51 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id ay11so2054356plb.0
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b4m2QTD2X9YZ1KbZd9oy5fXNwSBeNcWRG/H1SU/gAFY=;
	b=AEwXloc1y5z3/n7u0nsiuJVUVOY/N5YmxD1QAKqftVAcuAOKMKzGXYCPjE6p7wTboP
	CLl9hDjCMIOhUMgCsGhWshf+nwK2KqPx2lhPABhjZZq3Asc1tjWI+VZFjcZxsWF0xtLQ
	liPxRDw+rfBtxj5f2OMDXjNjAbo1mTh/SQAF1Z3wjhpywDzEwSLVL6ti2OObuOSaB4OR
	tMnrX2t21lCP2UTFWtL/SkQ8CxGN86tmnlx0k5zhoMObLxyIfIOV5EJ6MaHrQHKqspRv
	3HZdFhaRH5T5wpwjXAjqniQIpz23LeEpB47ZX8ONZB0L9E4oDeROdFoVYClJwR1PP3Ri
	0Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b4m2QTD2X9YZ1KbZd9oy5fXNwSBeNcWRG/H1SU/gAFY=;
	b=SVYgWNWXQgrgzAkcCjRxgLB8LHBOS0RYrLaexAE7cYlFVtF525s/iQi8I6OhYqo00c
	vcKjryqfLAlTMCs2ZCoCwuRUCRMln8DkqJKq7PjzRve+CjVEqH7wDn8tifpEjKP7GR9L
	KNz8AWB5w8YBqBu+v2pJsfed91k9colaFkYTkXaOEgAyFHxM6NkBs9BPHOlO6qt6XbT5
	n4o/ngpWiYzxrYReBZRRSg62ICvQIopcqi7Ken3MUJBT44wy6t9qkZzzBt5O1IMmYV03
	stup/POB5XwddS1Cixa3pPa7CFZwbxX9VRTX2KLEc4eSoPjLboVyE7QN36L2FTH2b8vx
	+qjA==
X-Gm-Message-State: ANhLgQ3itEEN/+/qzUM9bB1r4pHZYzGsb8xAuNhDHPXb2ystoKWsEaAv
	oPCP4frCh6HpowGZ7mdFgjVd5PID
X-Google-Smtp-Source: ADFU+vsyoQt6/QXyj0SWKBClRY7qd2yJDWVYBVtd644/jLRuGJEq5VUVDihdd0F3MCmYfQiKPmzmpQ==
X-Received: by 2002:a17:90a:e2c4:: with SMTP id
	fr4mr1805429pjb.91.1583981872312; 
	Wed, 11 Mar 2020 19:57:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.51
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:32 -0700
Message-Id: <eb58bf9bca2187eb68497d975c314f5e58d7e58b.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 13/13] sanlock: Replace cp -a with cp -R --no-dereference
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:51 -0000

From: Khem Raj <raj.khem@gmail.com>

helps to stop leaking builder's UID into sstate cache

Fixes
Exception: KeyError: 'getpwuid(): uid not found: 6000'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 80d4d7538a85123603eea3d87542c1c0433febb7)
[ak: fixes build issue
Exception: KeyError: 'getpwuid(): uid not found: 1000']
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...cp-a-with-cp-R-no-dereference-preser.patch | 51 +++++++++++++++++++
 .../recipes-extended/sanlock/sanlock_3.8.0.bb |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
new file mode 100644
index 0000000000..a0b721c466
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
@@ -0,0 +1,51 @@
+From 78a9cffb1c760466933bbbcbae7ecb9b30a3e6a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Nov 2019 13:47:42 -0800
+Subject: [PATCH] sanlock: Replace "cp -a" with "cp -R --no-dereference
+ --preserve=mode, links"
+
+Using "cp -a" leaks UID of user running the builds
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile  | 8 ++++----
+ wdmd/Makefile | 4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 533dd79..2fc9ba5 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -127,9 +127,9 @@ install: all
+ 	$(INSTALL) -c -m 755 $(LIBSO_CLIENT_TARGET) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 644 $(LIBPC_ENTIRE_TARGET) $(DESTDIR)/$(LIBDIR)/pkgconfig
+ 	$(INSTALL) -c -m 644 $(LIBPC_CLIENT_TARGET) $(DESTDIR)/$(LIBDIR)/pkgconfig
+-	cp -a $(LIB_ENTIRE_TARGET).so $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_CLIENT_TARGET).so $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_ENTIRE_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_CLIENT_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_ENTIRE_TARGET).so $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_CLIENT_TARGET).so $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_ENTIRE_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_CLIENT_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 644 $(HEADER_TARGET) $(DESTDIR)/$(HEADIR)
+ 	$(INSTALL) -m 644 $(MAN_TARGET) $(DESTDIR)/$(MANDIR)/man8/
+diff --git a/wdmd/Makefile b/wdmd/Makefile
+index 5849efc..4894517 100644
+--- a/wdmd/Makefile
++++ b/wdmd/Makefile
+@@ -68,7 +68,7 @@ install: all
+ 	$(INSTALL) -d $(DESTDIR)/$(MANDIR)/man8
+ 	$(INSTALL) -c -m 755 $(CMD_TARGET) $(DESTDIR)/$(BINDIR)
+ 	$(INSTALL) -c -m 755 $(SHLIB_TARGET) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_TARGET).so $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_TARGET).so $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 644 $(HEADER_TARGET) $(DESTDIR)/$(HEADIR)
+ 	$(INSTALL) -m 644 $(MAN_TARGET) $(DESTDIR)/$(MANDIR)/man8
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
index 9f7ce9c570..850690fe9e 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
@@ -11,7 +11,9 @@ SECTION = "utils"
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
 
-SRC_URI = "git://pagure.io/sanlock.git;protocol=http"
+SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
+           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
+          "
 SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"
 S = "${WORKDIR}/git"
 
-- 
2.17.1


