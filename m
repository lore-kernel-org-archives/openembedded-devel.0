Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA1A1760B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i138so9125861wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gbt9mNtxxMpGByHv1ybrNo8o5970EScmcuMjjQHh1Gk=;
	b=vuPVqXnkzKdMj5aTFlBMitVso7H4OgnwjkGPZfiI3+8U1ZSM5jZjubhuAVbPH69Cdx
	wHCJHJVqStvtcKEWWcmuSP18/lqIxgAl38NNs56gsTpHstSctR9LrBfc2/hMZmafSo5a
	XtOfwJybMVHUOGYvX/HPDJt0+rM1qhxIrPvz02oLhH+myRJNUpHe7wTx3IJp7jiQ1x7k
	yJSrNf5/vMvDKiXKMXUB0pIUSfq9t+IVKtpBz7N2jzQJ/O+KcAySswuTJxW/CvJJ3uS+
	L7Z/AkG9fSitVBKqMKg1odCgFynIr8CsA6Wer8tJvgmnj74i5ssDKBCDEX3KoECyCr6u
	RNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gbt9mNtxxMpGByHv1ybrNo8o5970EScmcuMjjQHh1Gk=;
	b=Wei/xxY+9EP//I48kvoLGvk93fY8qOqnnWCfOSMhrZ7hPT9/wYG5OEOsSxZsw82aUv
	FmReNcrqx9eqkk4rOofl/m16mV7Rnv7/2dmwqug2DOPKz4c9M97Na7bA+uU+Xk/GIdEe
	2RMPD6T28TlsOm95rIpoBG2hJDdsqeIRv6vp7wW2XH8t1fyg58VlVCJZW++/S9czSnNx
	+Hp2SJFF8xviP/UF9R9HBpn5g+VsAsUJQMDWWSeSrATMKEWsvu87mUb0okGrLQwBBoJR
	HvwL6chrSuHpTYsM/MHnXohwiCjp7rqvDQ8UrcvQyzITH9GlrOM8C+GgWFr3glmxCwvE
	Xtqg==
X-Gm-Message-State: AE9vXwNlTlTBxyNrXZJO0Jfgj9oFUwtMeRwwx1t7e2jAzPn1OPfKCDFHdZCZof6+SrGfuw==
X-Received: by 10.194.80.104 with SMTP id q8mr12027936wjx.151.1472672479148;
	Wed, 31 Aug 2016 12:41:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	cw7sm1349109wjb.38.2016.08.31.12.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:00 +0200
Message-Id: <20160831194106.14065-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/11] gnome-menus, gnome-panel3, gnome-control-center: blacklist, gnome-menus fails to build because of python
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb  | 2 ++
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb             | 3 +++
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb             | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 814d829..391d0dd 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -31,3 +31,5 @@ FILES_${PN} += "${datadir}/icon* \
 FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
 FILES_${PN}-dev += "${libdir}/window-manager-settings/*.la"
 FILES_${PN}-staticdev += "${libdir}/window-manager-settings/*.a"
+
+PNBLACKLIST[gnome-control-center] ?= "Depends on broken gnome-menus"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index 1e31b56..4189518 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -25,3 +25,6 @@ FILES_${PN}-python-staticdev = "${PYTHON_SITEPACKAGES_DIR}/gmenu.a ${PYTHON_SITE
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/gmenu.so ${PYTHON_SITEPACKAGES_DIR}/GMenuSimpleEditor "
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
                     ${PYTHON_SITEPACKAGES_DIR}/.debug"
+
+# http://errors.yoctoproject.org/Errors/Details/81001/
+PNBLACKLIST[gnome-menus] ?= "BROKEN: fails to build because of python"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index 1fc1d4f..138d985 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -48,4 +48,4 @@ FILES_${PN} =+ "${datadir}/gnome* \
                 ${libdir}/bonobo \
 "
 
-
+PNBLACKLIST[gnome-panel3] ?= "Depends on broken gnome-menus"
-- 
2.9.2


