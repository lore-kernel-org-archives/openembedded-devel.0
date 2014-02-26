Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8D44360B9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:15:01 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so958748eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PeLk53PtfzxYIdgCNk8uS44/jMWW42YjwmMSoQH7YZk=;
	b=aNu8WuDQKAQmlBW0nxJetRQhoZqsvm7NNtDRNubAW64otSYhSBE2VxHsbgt9SdWfzU
	JY8M7+coIoA01J2dYGN2hmF4fGf3OosJq+TSGtmtaH6f1bftAzD/xWzFJ3VcYrxZIvIo
	1VSLiPFvqnuM1sHWkqygjxloGlpAukpXrBQyajszxNho49SViW0NZ51BmTDBo+RioDGU
	Mv3n2wjej0OYWP8Po1nkJ2uKVYbbPKvsszx/dRt+iGvn7RdHqMawwuOA6X1EtOvCrNYi
	uLb32KoKNp56pQzBKzvmi4sYaOzUnQ1kSsV65m9ZAhuYQ11FxkYCPVX2GLu4yII/S9Os
	ifzg==
X-Received: by 10.14.215.133 with SMTP id e5mr5874553eep.103.1393456502686;
	Wed, 26 Feb 2014 15:15:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm9392634eeu.0.2014.02.26.15.15.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 15:15:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 00:15:00 +0100
Message-Id: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH 1/2] ode: Explicitly disable double-precision with PACKAGECONFIG
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
X-List-Received-Date: Wed, 26 Feb 2014 23:15:03 -0000

* when it's left for autodetection, configure fails for qemux86* when
   ==  and configure calls AC_TRY_RUN

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ode/ode_0.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-support/ode/ode_0.9.bb
index 1f3a5ca..8b9955e 100644
--- a/meta-oe/recipes-support/ode/ode_0.9.bb
+++ b/meta-oe/recipes-support/ode/ode_0.9.bb
@@ -22,3 +22,7 @@ do_configure_append() {
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 
+PACKAGECONFIG ?= ""
+# if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
+# series of AC_TRY_RUN which won't work for cross-compilation and configure fails
+PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
-- 
1.9.0


