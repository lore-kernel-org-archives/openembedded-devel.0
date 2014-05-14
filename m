Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f169.google.com (unknown [209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBF3660A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:44 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id jx11so2023024veb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZQS1ViKe1Nm1O//nLbvO+GqTEMqnrV14Dd1ScxwkOLk=;
	b=cxeACzxEU2vwLon6lSPxL+cJ+o9k616AszqtCof+44qX9SiPqwLvELlTmuWzGqS49k
	ERxSItR8EsgYqewh56L3m3A7bnpdw3UJSQ3FguSU7OGKmLCMeHxPnzIp4+j+8nMe/y2v
	NgmdzIf3IgbiwnKAYXfPSwvEx39cu+hEWWQlyoB66xPwcZXaq6r2VBdIVZXifJuxLbi2
	YWyp77yhOarNp03LdMTMltjdtXR88OJzaamW/1SeGNwGaJoeofR6DNI/dzrKvdQ5MYRI
	mv+5xbkDXa35eQnHw5jcFuaLmQXgW7mUEhs12Ba+QGlPAZl2QMyzawed8F9NmzmW9X7+
	2s5Q==
X-Received: by 10.58.30.1 with SMTP id o1mr99500veh.37.1400058225269;
	Wed, 14 May 2014 02:03:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am5sm2222647vdc.15.2014.05.14.02.03.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:44 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:49 +0200
Message-Id: <1400058231-23201-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 6/8] ephoto, libeflvala: use autotools-brokensep
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
X-List-Received-Date: Wed, 14 May 2014 09:03:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/ephoto_svn.bb     | 3 +++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index def68af..cea6f39 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -12,3 +12,6 @@ inherit gettext
 DEPENDS += "elementary ethumb ecore eio"
 
 SRCNAME = "${PN}"
+
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index b27590f..4922b1b 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -10,7 +10,7 @@ PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
 
-inherit e-base autotools pkgconfig vala
+inherit e-base autotools-brokensep pkgconfig vala
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};protocol=http \
     file://disable.eina.test.patch \
-- 
1.9.3


