Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 28D8E774DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:42:53 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id h201so10561297qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 18:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YURFVGcrhKEuzTXhw/y4X+4B2WfelBdp6IRlUby7bBM=;
	b=QpOc68iqOhxcCMKP6CWISCltgvleQcnjzfxSgOSex/88OTdqifJEmgKwJ+6OHjVlPU
	et+BvVw18FmT+ECi7rl8xSD4mDeUhr1yKNHXgaqTv29DTF9RT8UAVaBUg5cefIYV/atA
	V0B/RVUXvJp4WdXawbypIxLUc+ztLVErXNmLh13XmTXvuB6LSaYCEIhm7iHe3gMX24fL
	H27TJxsxjUMdAEb8cuMx3pnA9U/rOsr7afKF502ZiIVKMzwBvbtz7DM3hqlLz6iHKHFS
	SuxNDz+rByIhNBtL1IbuAowmF+Nb2S2zypHozBwinN1bf5+1BjTb+tw4rArX26cVEgM0
	WB3A==
X-Gm-Message-State: AIkVDXJ4ue4SjqJ1mewQXi0yuyIE/wGpcmVVmOX4WpiqeFNhB/HrS/4zXItE57Qtr3o/+A==
X-Received: by 10.55.175.132 with SMTP id y126mr8041454qke.43.1482374575152;
	Wed, 21 Dec 2016 18:42:55 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 53sm17008209qtm.5.2016.12.21.18.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 18:42:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 21:42:41 -0500
Message-Id: <1482374561-3842-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-wrapt: update RDEPENDS to work with minimal python install
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
X-List-Received-Date: Thu, 22 Dec 2016 02:42:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb b/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
index cf92efa..58aa1bd 100644
--- a/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
+++ b/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
@@ -8,3 +8,8 @@ SRC_URI[md5sum] = "7c2a7e6262acc396ef6528b3d66bd047"
 SRC_URI[sha256sum] = "4ea17e814e39883c6cf1bb9b0835d316b2f69f0f0882ffe7dad1ede66ba82c73"
 
 inherit setuptools pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
-- 
2.7.4


