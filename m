Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f45.google.com (unknown [209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD48B65D70
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 17:43:21 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so7863165pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oJdKR+mnI822EHPC5WM/y1NSiLV5prh4Tet+TuGbJRY=;
	b=xJPqHfmcPzLMq5UzLoC9b3xUAEGoNnkLHwvdfUJDOc826q3V5KPkW5Rv3olgNbua1b
	zz4wuAArCInH+0oQxMYh6sSBeE88uWWR+IXfSv92QPSiC2kxMH6zQz+gG1OA0yhqDCgO
	KZt1576TYGLw7SsgzZB3E+a7EthAx8Upe1zDiRlWicusoso8W/kQv8WwcfZ7Dw+O7uPA
	ri2oy5/xZyxDVZM5DQ94w+LRNpfKkk0nMs3TBJ7EPLVQPqXW5Lt3HAp5QqvOzpvMDqwG
	YyZ03QGbxifFKYUPYL/2msS/8tdtyC94Axqx8QpJxm/9j7J66sMXYw3vLv8A4N2Lg9HW
	tSig==
X-Received: by 10.66.251.136 with SMTP id zk8mr29687989pac.137.1401126203202; 
	Mon, 26 May 2014 10:43:23 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	wq10sm61097477pac.24.2014.05.26.10.43.22 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 10:43:22 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 10:43:15 -0700
Message-Id: <1401126195-17846-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-xfce][PATCH] xfce4-screenshooter: Ensure lib directory exists.
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
X-List-Received-Date: Mon, 26 May 2014 17:43:25 -0000

Screenshooter autogenerates screenshooter-marshal.[ch] in lib/ during
compilation.  The source directory contains a lib/ but this directory
doesn't exist in a build directory by default so we add one manually.
Really, this should be corrected in the upstream package.

Upstream-Status: pending

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 .../recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
index 4cda352..271f9c0 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
@@ -11,5 +11,9 @@ SRC_URI += "file://0001-Fix-panel-plugin-build.patch"
 SRC_URI[md5sum] = "d0ffea2052a8e70154cf13789070711f"
 SRC_URI[sha256sum] = "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481eab9492"
 
+do_compile_prepend() {
+	mkdir lib
+}
+
 FILES_${PN} += "${datadir}/xfce4/panel/plugins \
         ${libdir}/xfce4/panel/plugins"
-- 
1.8.3.2


