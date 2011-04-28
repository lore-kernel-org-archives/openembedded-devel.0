Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFain-00050p-KQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 01:34:09 +0200
Received: by pvc30 with SMTP id 30so2130293pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 16:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=pjZOr8xsPFAGfI40poVM3gZ9RB1rjq5Fjf/V220vqjg=;
	b=wVVClbcJWwwP68SAPeTklRA82eTneKIUpYI7wgdUFogWV4YNJLj+DsWu/Ma9b3RRQn
	PMWiJa70P0WSxmfPBcsATRU+mh62ParjRTgziDOZNALIxnocZYLqmCRvej0df9vTHyY0
	OaeHwJemcg3jKSNRECV6lHs9sJ6HI4yUD+K64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mSdxITOmUUqPu2TXvpQjFDQaF4GW8FyS5eBOeH7a8ANWsUFXeFxzGeAkanXLLuAOvu
	CLr5vTLjkEYkcIzNIlZoqNnGcP0Etvhm+lMoGM+2zgFIUK9MXquaEkE+WWc5WjIt3d/F
	TQE2Z5GPsuq00IDDWGNY+ei2TUD2YEobUD/CE=
Received: by 10.68.63.132 with SMTP id g4mr2224145pbs.482.1304033496154;
	Thu, 28 Apr 2011 16:31:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y7sm1508046pbk.30.2011.04.28.16.31.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 16:31:35 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2011 16:31:16 -0700
Message-Id: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH 1/3] proxy-libintl_20100902.bb: Specify -fPIC in CFLAGS
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
X-List-Received-Date: Thu, 28 Apr 2011 23:34:09 -0000

From: Khem Raj <raj.khem@gmail.com>

Some architectures like mips become upset if you
try to link non-pic libraries to shared objects
some generate pic by default so it does not matter
Specifying -fPIC on commandline should make all happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../proxy-libintl/proxy-libintl_20100902.bb        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 7c433bd..548e656 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356
 S = "${WORKDIR}"
 FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
 
-CFLAGS_append = " -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
+CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
-- 
1.7.4.1



