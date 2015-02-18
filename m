Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 458306E614
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 12:47:48 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id n12so968252wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 04:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=74yFjid7ZtFUwYWRw6CbQVmwQaj1pHsbCxb1LftF/FE=;
	b=yWFubIDNuweN0btLZIeO/t6DgQkQrqkeMNAGfIAnHTsH0WK2QE7tnTp59HZWL6SJBc
	dMX6eNKES75d2/dXIXNTLEBR9iGH2SPI1EQeavdzu3xrG29ihaaVFQkEu5Dpz09uo3QE
	0rwNX/HUJLpHGIK0Cxj473HFdk9ibhncoQSFzM0euwYOI7S5Ynzf65OBLHhTb0jlGJkY
	Wr/lAsICZsBd/FgxHnAO5g9bu2FDAGLG7W39t1JqxFu+B/sjrFHBGNWuuIH+XGLTQhgs
	XnysDji/OERmufLaG7y9frJJk3qD8sIbCfFcSUV1oiYyW95uEJqCXuYlVEOsTkn0lZZu
	M/kA==
X-Received: by 10.194.81.161 with SMTP id b1mr71785600wjy.2.1424263668847;
	Wed, 18 Feb 2015 04:47:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bd8sm32512281wjc.21.2015.02.18.04.47.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 04:47:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 13:47:48 +0100
Message-Id: <1424263669-17774-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [meta-oe][meta-efl][PATCH 1/2] entrance, diskio: blacklist
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
X-List-Received-Date: Wed, 18 Feb 2015 12:47:52 -0000

* they are old and now incompatible with edje_cc from 1.13.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/diskio_svn.bb   | 2 ++
 meta-efl/recipes-efl/efl/entrance_svn.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/diskio_svn.bb b/meta-efl/recipes-efl/e17/diskio_svn.bb
index 01a6576..a26186e 100644
--- a/meta-efl/recipes-efl/e17/diskio_svn.bb
+++ b/meta-efl/recipes-efl/e17/diskio_svn.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
 PV = "0.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
+PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
+
 require e-module.inc
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 198fe03..3374737 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -11,6 +11,8 @@ SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
+PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[consolekit] = "--enable-consolekit,--disable-consolekit,consolekit"
 
-- 
2.3.0


