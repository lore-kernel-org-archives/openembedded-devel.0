Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id EAFBA6C961
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:06:32 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so3475062ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=grVJQcNbqOX8nQ5dVa/b/p38DnAsUID4/b62ycqSGGA=;
	b=lUM89bCzAZWR+ZpPCYOTf/y5XxY0KnonomkRBfDCKijqVxxp20+M1a4SawQ6+8kwpv
	AWT4iCgkkQeQa9PXFkb4oOojEP/aa8EiPYPmSJyRXfocNEzGjLCzwhNpQHUhwfL8WG2Q
	jYPnUVN9vEpBYzA6sTDKkjaCi3YDMfjzN8SrVS9IyizUmJ8hUZg1Zdi9q+iY9auB8hhv
	aeZHVrodceWCIP0tNquoFVwtTG+A7XaN2EzlsxpVyAZoOasNNgc3j/LPX//sVof3wI8k
	Hr3vqXE5KeOsQpik9D6ieE0K04EhfTqKpvrmilePjdpkfshnd0VPUpTiBhNXdW01y+Rl
	dIAA==
X-Received: by 10.14.224.66 with SMTP id w42mr1340672eep.86.1379509594453;
	Wed, 18 Sep 2013 06:06:34 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id a43sm2681555eep.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 06:06:33 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2013 15:06:24 +0200
Message-Id: <1379509584-16503-3-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
References: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [meta-oe][PATCH 3/3] utouch-mtview: Add initial recipe
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
X-List-Received-Date: Wed, 18 Sep 2013 13:06:33 -0000

testing multitouch hardware under X11 will be much easier with this visual tool

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/utouch/utouch-mtview_git.bb    |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-mtview_git.bb

diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
new file mode 100644
index 0000000..0f72479
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Multitouch viewer"
+DESCRIPTION = "mtview is a small X application that shows a graphical view of your MT-enabled hardware. It uses mtdev."
+HOMEPAGE = "http://bitmath.org/code/mtview/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c61b8950dc1aab4d2aa7c2ae6b1cfb3"
+
+inherit autotools
+
+SRC_URI = "git://bitmath.org/git/mtview.git;protocol=http"
+SRCREV = "ad437c38dc111cf3990a03abf14efe1b5d89604b"
+
+DEPENDS += "mtdev utouch-frame utouch-evemu"
+
+PV = "1.1.7+git${SRCPV}"
+
+S = "${WORKDIR}/git/"
-- 
1.7.9.5


