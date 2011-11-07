Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQRd-0001Uv-Ne
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 15:45:05 +0100
Received: by bkbzs2 with SMTP id zs2so423998bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VUTRQwhSun/Ln2M4nuTUmm0q+GAqILk6joqWxZD8CbE=;
	b=KKFZfEWLDsNzSUGSV67uENZA8cqDbil2yitg5Lsvf/bm/fiKaJov6SnII6q0rIM04s
	1XHUP0iA9S1KKlJ5h0EuuYvrMApwHBlNmU1Oq8wrV2aTv0ykiqG5NEr3wNRHv0/Db0fz
	D3WDyJMOfb/bPydxHKbveHIe9ctFelDFh9dlo=
Received: by 10.152.110.166 with SMTP id ib6mr6524852lab.19.1320676732670;
	Mon, 07 Nov 2011 06:38:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id nw10sm8677992lab.4.2011.11.07.06.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:38:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:38:33 +0100
Message-Id: <1320676714-3099-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <1320676714-3099-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320676714-3099-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] libnl1: remove libnl.inc as it doesn't help much with libnl 2.0 in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 14:45:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libnl/libnl.inc     |    9 ---------
 meta-oe/recipes-support/libnl/libnl1_1.1.bb |    9 ++++++---
 2 files changed, 6 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl.inc

diff --git a/meta-oe/recipes-support/libnl/libnl.inc b/meta-oe/recipes-support/libnl/libnl.inc
deleted file mode 100644
index 6f502b1..0000000
--- a/meta-oe/recipes-support/libnl/libnl.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets"
-SECTION = "libs/network"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-
-INC_PR = "r5"
-
-inherit autotools pkgconfig
-
diff --git a/meta-oe/recipes-support/libnl/libnl1_1.1.bb b/meta-oe/recipes-support/libnl/libnl1_1.1.bb
index cf5396f..72f5995 100644
--- a/meta-oe/recipes-support/libnl/libnl1_1.1.bb
+++ b/meta-oe/recipes-support/libnl/libnl1_1.1.bb
@@ -1,10 +1,13 @@
-require libnl.inc
+DESCRIPTION = "libnl is a library for applications dealing with netlink sockets"
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+SECTION = "libs/network"
+
+inherit autotools pkgconfig
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
 
-
-PR = "${INC_PR}.0"
+PR = "r6"
 
 # move it to extra subdirectory
 includedir = "${prefix}/include/libnl1"
-- 
1.7.7.2



