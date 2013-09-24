Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id BCF686CA5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:55:27 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2414895eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TBPryT+GyXp1OOPbr8VEsrmKv4uaSka7112VP0wXt5I=;
	b=auYKZTA7K1we80T3dU9fdoIK658zv6b+wdZD31RtkJgQen8G5ueIl27JW5PrqWdm1+
	jbFgIxV+BXxDxHqjJpOFY7z8s84U6l/uVnPnLYiiK2ALI6K9TvkrYwhlNuvH7QU3VyoU
	bttor+2bfowGC9ROUzUZ6ZHId49lCbshABIG8+JR7e6KWhTCNhr09UEhMQIeUXex5OSn
	7RaFc6qykdxH9kx+5RqrqSCANpQblAuTco3GB5JWFzFZIdJR1IyIGrtYEEVWgnVEmtxW
	MSdjave0Yd/W7RlAFtoEzfrkzM7u3P3na+D3bv5Fzw/8Rf/QGzlt5Kd5VPIhdhe+jIif
	YNTw==
X-Received: by 10.15.67.131 with SMTP id u3mr45810420eex.34.1380027329283;
	Tue, 24 Sep 2013 05:55:29 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id v8sm2902433eeo.12.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 05:55:28 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 14:55:09 +0200
Message-Id: <1380027310-24350-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1380027310-24350-1-git-send-email-s.stirtzel@googlemail.com>
References: <1380027310-24350-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [meta-oe][PATCH v3 2/3] utouch-frame: Add initial recipe
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
X-List-Received-Date: Tue, 24 Sep 2013 12:55:28 -0000

used by utouch-mtview, a visual multitouch test application for X

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/utouch/utouch-frame_git.bb |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-frame_git.bb

diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
new file mode 100644
index 0000000..00b7cf3
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Touch Frame Library"
+DESCRIPTION = "The frame library and tools are used to handle touch frames, i.e., collections of tracked contacts. Bindings for mtdev and XI2.1."
+HOMEPAGE = "http://bitmath.org/code/frame/"
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


