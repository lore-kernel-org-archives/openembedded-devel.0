Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5DD6B88D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2013 15:03:20 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so428120lab.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2013 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IxQUdyPRCVu2vla4ku8ontGcH4Hm3MEfYxUPe2ACV8A=;
	b=I4S11PoYDjlU/aeKILJEodI7IwLD/4TWqI/mJizm314I91QjvxDcHYZfJJH+QRPY7B
	GDRPtdDoym23XhT3bVO56/8stL1HUyB/kH0fn6/RKadT3pJzMJywHFfvFdlvoKy7nplO
	OSu5qZb2nTEa/axkucuWLSOmEKDGrkNQNuxBd0bmHwcfpQkureifUh5HCdMO+MKrzG5/
	vj4MOd76U1Fgu9b3wD9IVCWzJRp4VhAxYBcetOlx6FdGdOjilNJR/Ds5Fd5KqvZPhrqr
	VIou0UXSAwTzsBsb3MBLIbFcoT9ta31KmFwASd7SrG/Jy5pmsVP5wE2iC0Tyrn/PlWCL
	rCUw==
X-Received: by 10.152.22.35 with SMTP id a3mr608514laf.45.1377097400331;
	Wed, 21 Aug 2013 08:03:20 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id b6sm3075837lae.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 08:03:19 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VC9wL-0006W9-D9; Wed, 21 Aug 2013 18:03:17 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 18:03:16 +0300
Message-Id: <1377097396-25020-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] libungif: update to upstream version 4.1.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2013 15:03:20 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libungif/{libungif_4.1.3.bb => libungif_4.1.4.bb}            |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libungif/{libungif_4.1.3.bb => libungif_4.1.4.bb} (53%)

diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
similarity index 53%
rename from meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
rename to meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
index 3e4b78b..9c9d2ed 100644
--- a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
+++ b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
@@ -3,9 +3,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
-SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-4.x/libungif-${PV}/libungif-${PV}.tar.bz2"
+SRC_URI[md5sum] = "76865bc1bed90ecb5992a1edcc4d6c15"
+SRC_URI[sha256sum] = "708a7eac218d3fd8e8dfb13f1089d4e1e98246985180a17d6ecfca5a6bd4d332"
 
 inherit autotools lib_package
 
-- 
1.7.10.4


