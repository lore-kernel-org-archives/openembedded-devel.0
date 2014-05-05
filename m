Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8837465F59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 22:02:24 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id q8so3208078lbi.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 15:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=//kOmlFa0gN6n0aGWnPkB0GqTatyI/+XTK+MxjjrmeQ=;
	b=Wtz4G99vvRDFHVrWvLYqDmoaxCtOKgxqGDg0o3yBF3CFE0lz6bG+vkk3pa+pHbhn/6
	XsYx4WzN7Psq7VN8NyPQlkR8i9FVI9uKX1lt9Eb/jN3QW3xZzqC4RYlfw9rwOEXs81YQ
	g3GFxtZFPJsee7DyJIOD/VYhVD9Nn5lr/ZvFrKB+nxT7N0785AxH+Uc4F9ffNIRCa91q
	AK8NA+oWZE/VxLUiIuxjjIgmGIhRCn9NFkaVsM45j6pzJKDxq/fKkNT4XgCTZx/aXJ0G
	Hxos3evHdQdH4VvGHI9R/PxrfnrRh6wWGq+ftK8j/rk8P2/oTomXoraO/DWvWzWMnN2W
	z1tw==
X-Received: by 10.112.171.67 with SMTP id as3mr27523610lbc.10.1399327344974;
	Mon, 05 May 2014 15:02:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q2sm9444377laj.9.2014.05.05.15.02.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 15:02:24 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 00:02:42 +0200
Message-Id: <1399327362-17766-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][WIP][PATCH] daq: explicitly disable nfq and ipq modules
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
X-List-Received-Date: Mon, 05 May 2014 22:02:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index 0a25cd7..afed8cd 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -5,11 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
-DEPENDS = "libpcap libpcre "
+DEPENDS = "libpcap libpcre"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
             file://disable-run-test-program-while-cross-compiling.patch "
 
+# these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
+# this error from test-dependencies script:
+# daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
+EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
+
 SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
 SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
 
-- 
1.9.2


