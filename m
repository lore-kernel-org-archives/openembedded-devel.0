Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id C60C261DDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:06:31 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so3471471ead.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rCY/ojZNZ6femvd2W++ESUQm4cdmudSPT4r+fATYYgg=;
	b=eTrQ3w/A8fBRSsDAOpvxco4TsynxvA4ynac/wIfZGhr0VPjFS+m0QMXxQrYY/QXkt8
	zACxh5o7X1jXbQFKqqV70dToMGg/W7PZbvD5+gm6xqapO48kop6KEZyTLc/kK3GHLlpP
	j0yui8cj0rEG3vJf5vI4Wtznjsz8N4flZ/RsccDO8BJKNRv9GgiaAL/nOetkQD+wScjB
	pzFrQxCbk2fF7anxWZGE1YGFvywP0Mri0xaQrijgSo50uT2rxCyjuSBJfOzxtILlxND8
	8e7FYpznAZcTW8mho/JHiNDLnafTmTSwa+Kr+gQOssUmIzIH/aDotx1hBTKutVFCS6sW
	xEgg==
X-Received: by 10.15.110.12 with SMTP id cg12mr674229eeb.103.1379509593040;
	Wed, 18 Sep 2013 06:06:33 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id a43sm2681555eep.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 06:06:32 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2013 15:06:23 +0200
Message-Id: <1379509584-16503-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
References: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [meta-oe][PATCH 2/3] utouch-frame: Add initial recipe
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
X-List-Received-Date: Wed, 18 Sep 2013 13:06:32 -0000

used by utouch-mtview, a visual multitouch test application for X

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/utouch/utouch-frame_git.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-frame_git.bb

diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
new file mode 100644
index 0000000..83a4e25
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Touch Frame Library"
+DESCRIPTION = "The frame library and tools are used to handle touch frames, i.e., collections of tracked contacts. Bindings for mtdev and XI2.1."
+HOMEPAGE = "http://bitmath.org/code/evemu/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
+
+inherit autotools
+
+SRC_URI = "git://bitmath.org/git/frame.git;protocol=http"
+SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
+
+PV = "1.1.2+git${SRCPV}"
+
+S = "${WORKDIR}/git/"
-- 
1.7.9.5


