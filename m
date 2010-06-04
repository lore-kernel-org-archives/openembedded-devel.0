Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>)
	id 1OKawi-0005NW-3E; Fri, 04 Jun 2010 19:45:11 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o54HdtWQ016246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Jun 2010 19:39:56 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OKas7-0004Ln-43; Fri, 04 Jun 2010 19:39:55 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jun 2010 19:39:46 +0200
Message-Id: <1275673186-16695-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Koen Kooi <koen@openembedded.org>
Subject: [PATCH] libvpx: disabled explicitly the generation of docs
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
X-List-Received-Date: Fri, 04 Jun 2010 17:45:14 -0000

When buildsystem has 'doxygen' and 'php' the documentation will be
created and the path in do_install (vpx-vp8-nopost-nodocs) won't be
found anymore:

| make[2]: Leaving directory `.../libvpx-0.9.0-r2/libvpx-0.9.0'
| + cp -r '.../libvpx-0.9.0/vpx-vp8-nopost-nodocs*0.9.0/*' .../image/usr/
| cp: cannot stat `.../libvpx-0.9.0/vpx-vp8-nopost-nodocs*0.9.0/*': No such file or directory
| ERROR: Function do_install failed NOTE: package libvpx-0.9.0-r2: task do_install: Failed

This patch makes the build more deterministic.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Koen Kooi <koen@openembedded.org>
---
 recipes/webm/libvpx_0.9.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/webm/libvpx_0.9.0.bb b/recipes/webm/libvpx_0.9.0.bb
index a59d94d..b55604b 100644
--- a/recipes/webm/libvpx_0.9.0.bb
+++ b/recipes/webm/libvpx_0.9.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "VP8"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://webm.googlecode.com/files/libvpx-${PV}.tar.bz2"
 
@@ -20,6 +20,7 @@ VPXTARGET ?= "generic-gnu"
 
 CONFIGUREOPTS = " \
           --target=${VPXTARGET} \
+          --disable-install_docs \
           --enable-vp8 \
           --enable-libs \
 "
-- 
1.7.0.1



