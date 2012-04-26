Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOIx-0005LL-LJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:15 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so777913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y4Z6ieEDKUA9pJN3laPlK4qEjuLxkEMrW+3TjfvoKSM=;
	b=mfxsrfZB317+pkdgv5rfAOHg4r4prbt0CcrI5IxEFj/ax32MauITw/ZBEKPDldn1Bm
	hMY2CUGk2g7QAg9Mpmre92w92VgFDrnQbqpbEJCv76T5jVQi7bV51mPnvtmtzNx5SkF0
	kH7mprRMGhquBr6wgzssP1KTSWgZP+SFw/TKbTljlsg45B7nFpSICyQ6N9vrAgYJAXm5
	ie4f+/8PxFzKfbqvWFXgpXwJpBSqRlKQEfieTCBzyPAlKEb/UzLEOcNOlf7c4KwKJIpn
	BcLSaky1+iqg+l0HYfqQ3i6+Nurd4hYwsLyXJ6399hDqjS7lfX5U3d4/N5cyuwfVyAbo
	s94A==
Received: by 10.180.85.70 with SMTP id f6mr3956745wiz.5.1335444640920;
	Thu, 26 Apr 2012 05:50:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm10781351wib.6.2012.04.26.05.50.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:50:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:07 +0200
Message-Id: <c557b72f6c82bd65cff8085571eb14659c90e46d.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 02/15] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:15 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* depmod already gets executed by pkg_postinst_kernel-image.

* If you build a module using module.bbclass, pkg_postinst returns 1 in
  do_rootfs, causing pkg_postinst to run again on first boot. To improve
  this situation, I copied pkg_postinst from kernel.bbclass to module.bbclass.
  This was rejected by Koen, because he doesn't like the code from
  kernel.bblcass, which uses ${STAGING_DIR_KERNEL}. Richard then suggested
  that calling depmod during do_rootfs wasn't necessary at all, because
  it already gets done by kernel-image.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 4d394c7..4b61c0c 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -281,9 +281,7 @@ fi
 }
 
 pkg_postinst_modules () {
-if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
-else
+if [ -z "$D" ]; then
 	depmod -a
 	update-modules || true
 fi
-- 
1.7.8.5



