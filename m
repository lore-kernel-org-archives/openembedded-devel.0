Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id B30BB61DDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:06:30 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so3471127eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=quH1ziTh8YvVV7T0ygvODqa1cjOBHlumVXm6SLdrtj4=;
	b=QpyxAIkfXVVV/DG9+6Eo1CY4OZEIOWGsEtVcGfPiwk4MVUBOorNmFbAM0sIkBK8gPi
	5ZT2ygks324MZsOEMUiQd7w2MCaG34rtKDa85PTJ3Mj5klJGvcAfgZs9F0EqYHZd/WbX
	u/zFCoWivwo8MXQC1/UjNteaGC5SaTYCQ4XXlmUMBHwLfSQrshpHZd11yaNmKeo/Kdgr
	B9WC4fc0+ZlDHJS5SvnwW8MOGfKxkGOI78AhwHOo8NxCXHfBTbnKDVFeo71zC2JWUUYH
	Sl11I45A1hKYaR9LcHEmeYKOKpJYN6Nk5W1WbY5+lX2WLaojXNGSO4VrtaNL8V1kd2oz
	3/nQ==
X-Received: by 10.14.149.14 with SMTP id w14mr341465eej.107.1379509591733;
	Wed, 18 Sep 2013 06:06:31 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id a43sm2681555eep.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 06:06:31 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2013 15:06:22 +0200
Message-Id: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/3] utouch-evemu: Add initial recipe
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
X-List-Received-Date: Wed, 18 Sep 2013 13:06:31 -0000

used by utouch-mtview, a visual multitouch test application for X

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-evemu_git.bb

diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
new file mode 100644
index 0000000..ec98ae4
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Kernel evdev device emulation"
+DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices. "
+HOMEPAGE = "http://bitmath.org/code/frame/"
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


