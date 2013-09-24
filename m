Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 87ABE610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:55:22 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so2452771eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dW2KL9MZLz/b662RJ1BVKorc867NQyBUorU0M6OKhOs=;
	b=ga8+m55/ax0eUDcXrY3rarny9zGatm4nYY3jE5Hq+yt0jZjsIGXVfldyrYQr/5PbEp
	UuIfTWqqrMOGP/r23NwObyIZfP7M6JWoh11jytHn68na+m59pjlRBsZ+C2IDBUFvlUom
	pVpvpquiJPID5becSZVyrDarZYHYbpcRiHB6czHL/Z/qPOq8+2Y2dPaIbVFf/Cs/DL+E
	kLz4vWOka0SqgZKrABL7d9gKwfZvg/tdOEHA9sQqhdSckQ8KEJsPYIDNNVk6hX6TRPGt
	YHny81thgB0FLCdfGD8NbwW6MwSa6HkJdGWAcGzmBSgel/MCLr0482W6+Mw6XdtabuT0
	SQXA==
X-Received: by 10.14.109.201 with SMTP id s49mr4146482eeg.54.1380027323433;
	Tue, 24 Sep 2013 05:55:23 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id v8sm2902433eeo.12.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 05:55:22 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 14:55:08 +0200
Message-Id: <1380027310-24350-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v3 1/3] utouch-evemu: Add initial recipe
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
X-List-Received-Date: Tue, 24 Sep 2013 12:55:22 -0000

used by utouch-mtview, a visual multitouch test application for X

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-evemu_git.bb

diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
new file mode 100644
index 0000000..0efe79e
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Kernel evdev device emulation"
+DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices. "
+HOMEPAGE = "http://bitmath.org/code/evemu/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+inherit autotools
+
+SRC_URI = "git://bitmath.org/git/evemu.git;protocol=http"
+SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
+
+PV = "1.0.5+git${SRCPV}"
+
+S = "${WORKDIR}/git/"
-- 
1.7.9.5


