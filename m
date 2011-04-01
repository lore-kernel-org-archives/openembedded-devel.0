Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5mT3-00037p-6v
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 00:05:21 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so4361066iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=b1ZpJPNBTPnazfQ8LMmyORNsLEI/+ThnS7e5g0Cxr7A=;
	b=u6M9vaPNzRzOXJSC/RRn7+ANL2Dk9tF6DQpo40bJJDrrpCjiuQTxQ0D4qn8/8JWLiE
	DhBL5bwjs0JCUtBKDpOecQZ5iSdL4RhZoVcCSi/jLcRCEvu5mNb+hRzmOa/N0ThNQ7cH
	D7relCxm9sQ8rlixfRflReU+cFLKMb7wsoH/I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ESvZV2MnY14rIF/O6WoWNLKq1R/jWIPzuE5bziw0JUTbJjVGZTK1Jf2T3SHG28jXiO
	wYF/EBxuEi5R4OriPCqjW0Db/ItElNd89WdJ3ixCyDvaOaOKTiCcD6bDq16WGuH3ga0C
	453C/121odflegcf2b75fpSmJi6wrl42ubC3o=
Received: by 10.43.60.14 with SMTP id wq14mr525337icb.118.1301695400329;
	Fri, 01 Apr 2011 15:03:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wu1sm1544350icb.22.2011.04.01.15.03.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 15:03:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 15:03:09 -0700
Message-Id: <740a50cb308f186123a9f916330bf10daa22faa5.1301695158.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301695158.git.raj.khem@gmail.com>
References: <cover.1301695158.git.raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] gcc-runtime_4.5.bb: Remove construct to filter -feliminate-dwarf2-dups
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
X-List-Received-Date: Fri, 01 Apr 2011 22:05:21 -0000

This option is no longer default in bitbake.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
index 1571601..aaa48b5 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
+++ b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
@@ -9,8 +9,3 @@ SRC_URI_append = "file://fortran-cross-compile-hack.patch"
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
-
-# gcc 4.5 ends up in ICE when using -feliminate-dwarf2-dups in libstdc++
-# compiling pre compiled headers so we remove this option when compiling 
-# to workaround it
-CXXFLAGS := "${@oe_filter_out('-feliminate-dwarf2-dups', '${CXXFLAGS}', d)}"
-- 
1.7.4.1



