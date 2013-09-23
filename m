Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 541A36007B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 07:18:56 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so2746934wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 00:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7Gg+yh3vk8Hm/CLGWmNHy3nucUSTWx0sSKDXOMIvXyI=;
	b=kU6qBvduxQQOBOSc25XG6MVHYZa1RAcA6uG0LCt6nLo7oUomNh/SgeZDxMUopiLGyN
	6HyikQA+RmrWjfK0SRynNab5n6A/08kwlPCeGSMR9Mtl2vaoSv1VAm6jgwKuuzdKmiEI
	kUjzdS0kf7sgfzWtPuFX6j0Dfj3fqc4EKtN5ATMhWfcX+6kMRRjF6aPzJ+P8fYGV6e2a
	Yhm8DTTTcvVpctJOTIJ21qHnoaZAO7CtIwvrWqTwi2MXunCMKmuDfAy6APIZoJaGGsCV
	FmfqTC4DZadvpxxKx1qxdC6/P7rPaIHblPbM/zk9TxYnXA90r1MD9MvOZtayRuqwcaH8
	KRYA==
X-Received: by 10.180.85.65 with SMTP id f1mr12116439wiz.33.1379920737138;
	Mon, 23 Sep 2013 00:18:57 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id dx7sm23443338wib.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 00:18:56 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2013 09:18:39 +0200
Message-Id: <1379920720-7125-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2 2/3] utouch-frame: Add initial recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 07:18:57 -0000

used by utouch-mtview, a visual multitouch test application for X

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/utouch/utouch-frame_git.bb |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-frame_git.bb

diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
new file mode 100644
index 0000000..c160543
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Touch Frame Library"
+DESCRIPTION = "The frame library and tools are used to handle touch frames, i.e., collections of tracked contacts. Bindings for mtdev and XI2.1."
+HOMEPAGE = "http://bitmath.org/code/evemu/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
+
+DEPENDS += "mtdev utouch-evemu"
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


