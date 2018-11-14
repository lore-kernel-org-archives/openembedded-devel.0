Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D65126C3F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 07:48:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE7m4Xj012150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2018 23:48:14 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 13 Nov 2018 23:47:53 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Wed, 14 Nov 2018 15:47:47 +0800
Message-ID: <1542181667-210743-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542181667-210743-1-git-send-email-mingli.yu@windriver.com>
References: <1542181667-210743-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] tk: export TK_LIBRARY='${libdir}/tk${VER}'
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
X-List-Received-Date: Wed, 14 Nov 2018 07:48:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

As there is below logic in configure.in
[snip]
test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
[snip]

It can make TK_LIBRARY to be $(prefix)/lib/tk$(VERSION)
and then result in some files installed to
/usr/lib/tk8.6 even when ${libdir} actually
extract as /usr/lib64 and there is also a commit
as below adding hack to workaround this.
1ca29d1cd tk: make multilib build compatible and fix library install

Export TK_LIBRARY='${libdir}/tk${VER}' to guarantee
the files installed to the expected places and
also remove the workaround in the previous commit
1ca29d1cd.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
index d0f6fe0..4e38525 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
@@ -45,19 +45,11 @@ EXTRA_OECONF = "\
     --with-tcl=${STAGING_BINDIR}/crossscripts \
     --libdir=${libdir} \
 "
-
+export TK_LIBRARY='${libdir}/tk${VER}'
 do_install_append() {
     ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
     oe_libinstall -so libtk${VER} ${D}${libdir}
     ln -sf wish${VER} ${D}${bindir}/wish
-
-    # Even after passing libdir=${libdir} at config, some incorrect dirs are still generated for the multilib build
-    if [ "$libdir" != "/usr/lib" ]; then
-        # Move files to correct library directory
-        mv ${D}/usr/lib/tk${VER}/* ${D}/${libdir}/tk${VER}/
-        # Remove unneeded/incorrect dir ('usr/lib/')
-        rm -rf ${D}/usr/lib
-    fi
 }
 
 PACKAGECONFIG ??= "xft"
-- 
2.7.4


