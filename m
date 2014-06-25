Return-Path: <philip.balister@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0819565E83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 18:50:06 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id uo5so2058356pbc.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+0/XeexMQ1loLr4DUnQJHAeXDtYS+qBZ+iz/NX4Hh64=;
	b=OX3tiqA6YfE4DHu7gSUu5VD1n9dwAfYR+FKZBHnHL9PPeIMhaYUsjGjpz7lJ4qK3Rp
	IaL+2++P4zy80cUiDskzBCkkt3myQr3Z2kRXX8Av2029nLXyc5lWRd90rMfW3YU7jErI
	gfhIMwlSOMDAhmUmBdbLyqWm9Xy5pRMgx+s4jNvN7+CoLLGEgXRmTUqJKhrMaj5Eb/T+
	TF7P38adXZojD7qFIhUWLhT+IyJOziGrcBXB1DHwETXC0MMuQQ6p30Vhv2C97s5UCssE
	UD2VRoJRz59jhwcI2R+whcQuF09iom6SWrM13fXITD5ycPyFNV6EeXksw9+V89t3Gtoy
	bRMw==
X-Received: by 10.68.139.36 with SMTP id qv4mr14434879pbb.82.1403722207601;
	Wed, 25 Jun 2014 11:50:07 -0700 (PDT)
Received: from mattsbaby.amer.corp.natinst.com
	(64-186-172-226.static-ip.telepacific.net. [64.186.172.226])
	by mx.google.com with ESMTPSA id tg9sm6395712pbc.29.2014.06.25.11.50.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 11:50:06 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 11:49:51 -0700
Message-Id: <1403722191-2291-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1403722191-2291-1-git-send-email-philip@balister.org>
References: <1403722191-2291-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] cppzmq : Adds C++ API for zeromq.
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
X-List-Received-Date: Wed, 25 Jun 2014 18:50:07 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
new file mode 100644
index 0000000..3409976
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "C++ bindings for ZeroMQ"
+HOMEPAGE = "http://www.zeromq.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
+DEPENDS = "zeromq"
+SRCREV = "ee47ae4cddc304741526c9bb2035f98c3274e0ec"
+
+SRC_URI = "git://github.com/zeromq/cppzmq.git"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+        install -d ${D}/usr/include
+        install -m 0755 ${S}/zmq.hpp ${D}/usr/include/
+}
+
+PACKAGES = "${PN}-dev"
+
+RDEPENDS_${PN}-dev = "zeromq-dev"
-- 
1.9.0


