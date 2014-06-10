Return-Path: <ashcharles@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3A96FA5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 16:37:46 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rp16so997263pbb.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3y1AhLRlJIKjiivPl8mmpfoTmzQCdtOg/W2L04GI+Yc=;
	b=AeXAuEQ9Nyl6HpwoBL2J1ZQ/6vurWI2xdWCUFSCH+IhMbkHkUU5Gfq3t9nQS3I17Se
	ZH0ygSvhRpcE+kjeuXUSsdtLdLWxSgADp3aQ4hGhK92TFb9SgpCpYospHnf42N7cxRai
	Jvho1tztRbr3uTSTdzAY5jyREcmziHORScKecVdbEBEvEKKX4KCvQH6T5a+Ci2Ijvv3O
	hQOaxWAG/oSBzCxoYjj12y7lGI8wZd2hHG/+TJ/wViBRxeVKgAQjK10KMkdwiPvWs/6N
	B8YhNp+wZT3tconz5yBMiNCJ59IpctJMFoFPEcBV5EfKCpVAzyYPKhI+rWMSKOGjBBfD
	xXzg==
X-Received: by 10.66.222.100 with SMTP id ql4mr6591537pac.109.1402418267411;
	Tue, 10 Jun 2014 09:37:47 -0700 (PDT)
Received: from gumstux.ashstix.com
	(adsl-172-15-162-30.dsl.pltn13.sbcglobal.net. [172.15.162.30])
	by mx.google.com with ESMTPSA id
	qf10sm70389265pbc.23.2014.06.10.09.37.46 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Jun 2014 09:37:46 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jun 2014 09:36:41 -0700
Message-Id: <1402418201-4389-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <20140610112139.GD2433@jama>
References: <20140610112139.GD2433@jama>
Subject: [Patch v2] xfce4-screenshooter: Ensure lib directory exists.
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
X-List-Received-Date: Tue, 10 Jun 2014 16:37:47 -0000

Screenshooter autogenerates screenshooter-marshal.[ch] in lib/ during
compilation.  The source directory contains a lib/ but this directory
doesn't exist in a build directory by default so we add one manually.
Really, this should be corrected in the upstream package.

v2: only make lib/ if it doesn't exist

Upstream-Status: pending

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
index 4cda352..0e2e327 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
@@ -11,5 +11,9 @@ SRC_URI += "file://0001-Fix-panel-plugin-build.patch"
 SRC_URI[md5sum] = "d0ffea2052a8e70154cf13789070711f"
 SRC_URI[sha256sum] = "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481eab9492"
 
+do_compile_prepend() {
+	mkdir -p lib
+}
+
 FILES_${PN} += "${datadir}/xfce4/panel/plugins \
         ${libdir}/xfce4/panel/plugins"
-- 
1.8.3.2


