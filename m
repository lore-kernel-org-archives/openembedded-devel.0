Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3C65165DF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 18:18:30 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so975746pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P758suIQWzmRY+K+c+pu2jR3gtZa2XpJ4QpZH65RVbA=;
	b=L0JpRpVmcCRyQepTuHETCOxvKRfFsA93S1D/t6lBtLVA0Uj8vgM981fVmPdrMhdVKn
	vfuhGDVl0e1vUHygIt15x71befSWNW1HUihtrMH5SuRut5os7APrOJphtzNnfp3sD+uZ
	sLRij5vv9hHX6NCAlKDQPJwn5JFVlc6xHRTBMdC9Aqa/31QWZY4gnJfXRt/deyLITLTP
	ILnkX5SglHpLGfLedoa0KJ5z/uieL/CMoJ6w9vPHbsnpojXiC4tYtESuEpNKdti/FaBX
	8p4JkssIQLHctH8pnHFdQiF1er/+1R4lv9j1LA8oupt7dELdxObKB/Ps/Hy39Mg+XOva
	l17g==
X-Received: by 10.68.196.137 with SMTP id im9mr13453198pbc.105.1402424310939; 
	Tue, 10 Jun 2014 11:18:30 -0700 (PDT)
Received: from gumstux.ashstix.com
	(adsl-172-15-162-30.dsl.pltn13.sbcglobal.net. [172.15.162.30])
	by mx.google.com with ESMTPSA id f2sm16546576pat.11.2014.06.10.11.18.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Jun 2014 11:18:30 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jun 2014 11:18:02 -0700
Message-Id: <1402424282-324-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <20140610112604.GF2433@jama>
References: <20140610112604.GF2433@jama>
Subject: [Patch v3] eject: copy po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 10 Jun 2014 18:18:38 -0000

The po subdirectory found on the VPATH for an out-of-tree build so we
copy it over. See [1] for discussion.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/096052.html

v3: only create and populate po/ if it doesn't already exist

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index c47c653..a71d83f 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -16,6 +16,12 @@ S = "${WORKDIR}/${BPN}"
 
 PR = "r1"
 
+do_compile_prepend() {
+    # PO subdir must be in build directory
+    mkdir -p ${B}/po
+    cp -r ${S}/po/* ${B}/po/
+}
+
 ALTERNATIVE_${PN} = "volname eject"
 ALTERNATIVE_LINK_NAME[volname] = "${bindir}/volname"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-- 
1.8.3.2


