Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 91FCE7F3B7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2019 00:06:09 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id n4so2585651pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2019 17:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P6cOqzbDQvSUj/TTaIXN4T1/H/DxPdFmtztRVrwvj2k=;
	b=o9a6tx4QB3v6rUh7bUMOQ9fYN4gc0hePNmpIPr++YhHo/+HpVZ+uB47xnwPTxAISUG
	uO1Hr4hJpmcV4Sgooh+JSYs2D4XRCPhUGOaF6relKlLhxV1jc63rCbDZn/nW46aUc2oe
	/gyd2fbBxIGRTuR3H1O9/P/X/wZOr5CbLBeS0NRPBU6mfX6GgbbkY3RhhCYvs0QFl9Fg
	qMmlVyBUxTbN+y0N81nTXXrpCek3qBKuThql5J4PZTD6c6kPiaq9VhWPt5/r8iwGPYFX
	Lz2VCzE3Tu5Ugdn1oaedXUoTnzd+X8u3oa7JZL9LlwwB6HxO2dqMKK9bdTRLlLz0JB8R
	15nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P6cOqzbDQvSUj/TTaIXN4T1/H/DxPdFmtztRVrwvj2k=;
	b=gsKYNCisZzxNd5kBfslN3KIi+so9S2P7/qVcihksF8b1c5fAk6mFs9akm9EfgO8M6G
	OB/IgPS5NJFZKWrEjqS5Q3M3iKzCTfULNjbRyUaTwOTqzme01lxXBlQnuQKoDpC2sK5F
	BMOLFjFHofWeY2dUKBSNQ0UbZmw2ntddl8b2WsbtT8i6p5BvwaXz2fOGYHQG/6FQ5LgJ
	dEt7Nw8GmGskrgn6vz+IVdOmEkFWKLXileVP/FZQqcWRMv710AGodzaDFxOA6OnWZ691
	uFPaFXpT77kIv0PwyaN/jxrvsnWsrcUJ92XQo6Nl+OhYz7RTjeFG5NRXvJmbKZIDADZj
	OqvA==
X-Gm-Message-State: APjAAAXWqBpfIsDqNwgf+phntqxzD7MLgI0XAyD/ZCpEqKN4d6/NRGCI
	b/hPNKBxFTmPmcGp3CgbuH8LnVjXWdw=
X-Google-Smtp-Source: APXvYqyr9C7CAdZ7Jc79fyA6jcWT9M6IRO6Sc3PbDNX7FyG3S6RywzHH4ttFiScNb5ajJo3ZEXaAGA==
X-Received: by 2002:a63:e5a:: with SMTP id 26mr125786183pgo.3.1564877170089;
	Sat, 03 Aug 2019 17:06:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	n5sm84139190pfn.38.2019.08.03.17.06.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 17:06:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2019 17:06:01 -0700
Message-Id: <20190804000601.35371-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libedit: Delete
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
X-List-Received-Date: Sun, 04 Aug 2019 00:06:09 -0000
Content-Transfer-Encoding: 8bit

Its in oe-core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libedit/libedit/stdc-predef.patch         | 17 --------------
 .../libedit/libedit_20190324-3.1.bb           | 23 -------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch
 delete mode 100644 meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb

diff --git a/meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch
deleted file mode 100644
index c95cdc9d2d..0000000000
--- a/meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-__STDC_ISO_10646__ is defined in stdc-predef.h
-therefore include it to see if its there on a platform
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libedit-20160903-3.1/src/chartype.h
-===================================================================
---- libedit-20160903-3.1.orig/src/chartype.h
-+++ libedit-20160903-3.1/src/chartype.h
-@@ -29,6 +29,7 @@
- #ifndef _h_chartype_f
- #define _h_chartype_f
- 
-+#include <stdc-predef.h>
- /* Ideally we should also test the value of the define to see if it
-  * supports non-BMP code points without requiring UTF-16, but nothing
-  * seems to actually advertise this properly, despite Unicode 3.1 having
diff --git a/meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb
deleted file mode 100644
index 9d333e7aa1..0000000000
--- a/meta-oe/recipes-devtools/libedit/libedit_20190324-3.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "BSD replacement for libreadline"
-DESCRIPTION = "Command line editor library providing generic line editing, \
-history, and tokenization functions"
-HOMEPAGE = "http://www.thrysoee.dk/editline/"
-SECTION = "libs"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1e4228d0c5a9093b01aeaaeae6641533"
-
-DEPENDS = "ncurses"
-
-inherit autotools
-
-# upstream site does not allow wget's User-Agent
-FETCHCMD_wget += "-U bitbake"
-SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz \
-           file://stdc-predef.patch \
-          "
-SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
-SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.22.0


