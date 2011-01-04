Received: from mail-yx0-f193.google.com ([209.85.213.193])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PaET4-0001lv-90
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 22:30:58 +0100
Received: by yxn35 with SMTP id 35so3740330yxn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 13:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dpRZJu/lFnkjcIDXDHA3r8p9RVOuRpt4MoCenmquaQY=;
	b=t2ej2NpLMO1NalF4zP4mAEwMrGefchlyIfgTc8A1b+ywTzNAArEIvNxWWoPh2B14JO
	k97E9bcta+EtNBsU8jvaKhLuJCuZ+P9U4RtXu10W99MikNgqWzNdhK/flDQDTBYWDPe1
	URQRnsPtnkmIJzfpIbj+u08oeRqrGsnsQegf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hIgj7IpXkmZ3psZMmBoUKGCse5e83ONIMtmUanG+01sHA218OvY0oQ02Yb6ep16NFR
	cOCY6OdhY2/AHahmkq41Fi9PPV2+72Y7W3pg6tAj2WvKoTOMMSIt8bBhAVmCxIc0I+26
	9fsZalyIW3vv25e7brN34Pmav6eknKRu5Gi3o=
Received: by 10.150.58.8 with SMTP id g8mr4742387yba.79.1294176629063;
	Tue, 04 Jan 2011 13:30:29 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v8sm10979255ybe.13.2011.01.04.13.30.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Jan 2011 13:30:28 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 15:29:49 -0600
Message-Id: <1294176589-24301-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 2/2] am-benchmarks: Remove am-benchmarks_svn.bb
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
X-List-Received-Date: Tue, 04 Jan 2011 21:30:58 -0000

  * Remove am-benchmarks_svn.bb now that the recipe name inlucdes the PV.

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/am-benchmarks_svn.bb |   37 -------------------------------------
 1 files changed, 0 insertions(+), 37 deletions(-)
 delete mode 100644 recipes/ti/am-benchmarks_svn.bb

diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_svn.bb
deleted file mode 100644
index 63c122f..0000000
--- a/recipes/ti/am-benchmarks_svn.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-#NOTE: This package is currently only supported for the Angstrom
-#      distribution.  Other distributions and toolchains may or
-#      may not work.
-
-DESCRIPTION = "AM Benchmarks"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
-LICENSE = "BSD"
-SECTION = "system"
-PRIORITY = "optional"
-
-SRCREV = "56"
-PV = "1.1"
-PR = "r1+svnr${SRCPV}"
-
-COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
-
-ARCHITECTURE_dm365 = "arm9"
-ARCHITECTURE_omapl138 = "arm9"
-ARCHITECTURE_omap3 = "cortex-a8"
-ARCHITECTURE_ti816x = "cortex-a8"
-
-INSANE_SKIP_${PN} = "True"
-
-SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
-
-S = "${WORKDIR}/trunk/${ARCHITECTURE}"
-
-do_compile() {
-	# don't build debug version
-	touch debug
-	export CROSS_COMPILE=${TARGET_PREFIX}
-	make release
-}
-
-do_install() {
-	make DESTDIR=${D} install
-}
-- 
1.6.3.3



