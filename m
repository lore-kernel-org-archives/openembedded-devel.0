Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 563 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Sep 2016 09:55:45 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id B6CFC6060F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 09:55:45 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 20C293CFAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 11:46:23 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2016 11:46:15 +0200
Message-Id: <1474364775-21738-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474364775-21738-1-git-send-email-dv@pseudoterminal.org>
References: <1474364775-21738-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH] rtmpdump: fix QA warning for GNU_HASH
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
X-List-Received-Date: Tue, 20 Sep 2016 09:55:48 -0000

The package wasn't actually using the OE CFLAGS and LDFLAGS. These must
be passed as XCFLAGS and XLDFLAGS to make.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index a1e6502..c5513b0 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -17,6 +17,6 @@ S = "${WORKDIR}/git"
 inherit autotools-brokensep
 
 EXTRA_OEMAKE = " \
-    CC='${CC}' LD='${LD} ${STAGING_LIBDIR}' \
+    CC='${CC}' LD='${LD} ${STAGING_LIBDIR}' XCFLAGS='${CFLAGS}' XLDFLAGS='${LDFLAGS}' \
     SYS=posix INC=-I=/usr/include DESTDIR=${D} \
     prefix=${prefix} libdir=${libdir} incdir=${includedir}/librtmp bindir=${bindir} mandir=${mandir}"
-- 
2.7.4


