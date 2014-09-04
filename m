Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 83F9F713EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:28:58 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id rd3so19439013pab.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jC5fhfRFGVqA9wiqSQas/D8lA1jchiQ83CrHGefsXds=;
	b=HNe11I/tDag4SB+9lGkmV5F3d67qN9BD7GsA/gFpMRINm5dRkFIuUyLo9nArt/SNRH
	kpw26i/bmYzH739v+/l+4PlN3Lz1fyKxcIf9HhVB6bgzUx1MKDkgPeUsf4Q/VH4ElJiN
	VBmDkhEFqMx+tEByAOwGOR+LzlRfrWSU+ya0bBtMzzlmFpVzLI/2S1rn7DfizgOEABD2
	Z36DUbKZjNtLU9MWznkS1qpT9cJOR87we5k1DPVtS3VrDyUSHhDKUWgnc2macrhM+EMy
	ub5WAYdCRQzCTBfRLZiqLAPXsKzc+GaL1Eow+2/oOek/Kh+0Jn95eHXjiPFBHsvUWxvc
	jSkg==
X-Received: by 10.67.5.40 with SMTP id cj8mr5251672pad.137.1409815737900;
	Thu, 04 Sep 2014 00:28:57 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id pn13sm845213pdb.53.2014.09.04.00.28.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:28:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:32:37 -0700
Message-Id: <1409815958-24314-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/6] lowpan-tools: Move to 0.3.1 release
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
X-List-Received-Date: Thu, 04 Sep 2014 07:29:00 -0000

Also fix the git SRC_URI location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index d8e1ddb..ca10262 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libnl python"
 
-PV = "0.3+git${SRCPV}"
-SRC_URI = "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee \
+PV = "0.3.1+git${SRCPV}"
+SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
            file://no-help2man.patch"
-SRCREV = "a1d9615adde6d1a568813c24a128273ed755af04"
+SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.0


