Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDF1177236
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:08:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so1300536wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2LZOaNSx6vIPswJgCDOMKdh3KxtXTiJwC+UFLHhEkeE=;
	b=aenn330MQaRYdcIA8UhgF+BP2S/dN1RH/kLs1HSzXgRHQgyMBKiVmHpQLuHhf84LSv
	Ka03oOK6Yx0vAVIua/lgQrAVHLbIXZn8ayUhixkcad9GynRPNCYiYdWllXg/aiL3FdXV
	76h0ye8CTIDtrzjylkB++rMAkdwscDc/OW43N7eoR6HvzSXr1Ct64hSf9T/79PnbA6+C
	qnwajzOpLHGMa4PqgzeAWxCuvUMBLTR2emOgWY5riNCtVr2Egwi4koTk+Ee1/1HsyTI3
	x8GfS6oACFPQEQS4zxNNDeiGP0DVyFpldqhjJCsfJ6YAw6KQGSli6P+6NuwjvOJNH4QS
	N0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2LZOaNSx6vIPswJgCDOMKdh3KxtXTiJwC+UFLHhEkeE=;
	b=mJdl5dmUwlu850U7iRJC0bX7W7JnfDangmC7dxCEjYLkoE56OLgERa6ZxJePB/EJr+
	kMNEY0wLY9Y331p4btOjSNWqwFWBz0FY7fOhSMNKqmG1H8EAJAxaV9vOujYpI8QJeNo8
	Hy2nC94L9/7mf1a6FeWVHKDVQsBJXYJfn6cV/ckwpMFejZ33r2gR9v93CXJbDyzRfDcW
	EJ6p9cLB4iqkecCyyXwBLfE6AeKakBpH8ZIG8jaW6hg3PxcPYZDgbnRQkml8kI9dM0qH
	Iog/0aLO7UtA0jVdrlih7fCS3lHFPLHH3pxfIP4BVyxUIe7uYwMY5uVjeXIEf/ZL+S4U
	pn+Q==
X-Gm-Message-State: AEkooutV32RFCSz3F+KF41vX0N6Guf1JjzHXPmChCMjS0bgYY8i3jQTS1ZBopUA/NdweJw==
X-Received: by 10.46.0.5 with SMTP id 5mr1605519lja.59.1470920885630;
	Thu, 11 Aug 2016 06:08:05 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id f64sm106493lfi.36.2016.08.11.06.08.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 06:08:03 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:07:55 +0200
Message-Id: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH v3 1/2] gflags: New recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2016 13:08:06 -0000

C++ library that implements commandline flags processing. It includes
built-in support for standard types such as string and the ability to
define flags in the source file in which they are used.

Used optionally by glog

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/gflags/gflags_2.1.2.bb

diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
new file mode 100644
index 000000000000..30fd5f85e253
--- /dev/null
+++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "The gflags package contains a C++ library that implements commandline flags processing. It includes built-in support for standard types such as string and the ability to define flags in the source file in which they are used"
+HOMEPAGE = "https://github.com/gflags/gflags"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
+
+SRCREV = "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
+SRC_URI = "git://github.com/gflags/gflags.git;branch=release"
+
+S = "${WORKDIR}/git/"
+
+inherit cmake
+
+EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON"
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+PACKAGES =+ "${PN}-bash-completion"
+FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
+RDEPENDS_${PN}-bash-completion = "bash-completion"
-- 
2.8.1


