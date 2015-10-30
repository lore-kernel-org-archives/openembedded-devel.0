Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0C576FD0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:17 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10340941wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=xMiTAqp72SBD2d3QS3rWZ1E6E1j8780neS2BbAfNQSc=;
	b=G9Xsiek+oNYC0BUsAvWGiruL9jZtUYqNV8M504fJgH0E/jE3Df/qgPgFVY75Hz4Ocq
	xgE65wjfv1fIBXoLiI1FWzYOeK2bg1wb7+XRMDzjLRDi1QVN4LFRfUHA+E/S/o7daFiD
	ZgO0HOE55Z6PSYJI6YZsM1HG+8gcYvDbroJr++6Yxzr7XmlZ+XVvKVwHpgYfFeeT8h7T
	QMS6zPYQC3RRS8DwSYXeDtKsoqn4yD4xMYwJuu4LMTydFuYsbEjPPGQ7uffe47HKAtGL
	yruMhP/uN4Hiv0HbfbEuGAUu3fcLjf2WubbFvrq78XtAKheFIoMt23IWVEJu8Yjx+Rs/
	dZFQ==
X-Received: by 10.28.215.203 with SMTP id o194mr3273937wmg.54.1446207258036;
	Fri, 30 Oct 2015 05:14:18 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:34 +0100
Message-Id: <1446207225-15386-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] xfce-polkit: initial add 0.2
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb

diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
new file mode 100644
index 0000000..ab720f8
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A simple PolicyKit authentication agent for XFCE"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=758b03f872a88c99fc36d50c5932091c"
+
+DEPENDS = "libxfce4ui polkit"
+
+inherit xfce-app
+
+SRC_URI = "git://github.com/ncopa/${BPN}.git"
+SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
+S = "${WORKDIR}/git"
-- 
2.1.0


