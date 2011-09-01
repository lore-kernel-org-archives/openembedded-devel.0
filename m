Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9cb-00081O-KO
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:56:05 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so879969fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2oeZ4WXDle5Z/pL7NGH514avBs+XQGd7tsTA7sljqvg=;
	b=jwayHrUNU6NIoi9Q2LMHNMwajmYlwiYjbI3j0Jo3Xu7xKLIcOtyywG5CXZ5lHCTv/q
	675i9EYT8nTTOQ/ddr3xJ24aGHeDKPKecCFEB9KH8/Be9duhsKw0glFVdIbUCT5cn4Pk
	Bh5xorc1lilE+4JD9SsUxUVkHjp38DOZha1Xc=
Received: by 10.223.99.91 with SMTP id t27mr532542fan.56.1314892271603;
	Thu, 01 Sep 2011 08:51:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm137618fay.7.2011.09.01.08.51.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:51:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:50:54 +0200
Message-Id: <25bdffeb944824ff5de9f43aeda33a531d9bd071.1314892207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
References: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314892207.git.Martin.Jansa@gmail.com>
References: <cover.1314892207.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] klibc: move comment outside multiline variable
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
X-List-Received-Date: Thu, 01 Sep 2011 15:56:06 -0000

* new bitbake doesn't like it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb b/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
index 8abaf30..124a416 100644
--- a/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
+++ b/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
@@ -31,10 +31,10 @@ FILES_libklibc = "${base_libdir}/klibc-*.so"
 FILES_libklibc-dev = "${base_libdir}/klibc.so \
                       ${base_libdir}/klibc/lib/* \
                       ${base_libdir}/klibc/include/* \
+                      "
 # see above
 # do not package it in -dev
 #                      ${base_bindir}/klcc \
-                      "
 require klibc-utils.inc
 require klibc.inc
 require klibc-checksums_${PV}.inc
-- 
1.7.6.1



