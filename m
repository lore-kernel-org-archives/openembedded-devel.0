Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A0E2460EC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2020 16:15:33 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id z7so1381549pgk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2020 08:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ghdMq4BXo0tLEOH8RMRdfpfE8cAxdVHJWlm1xYVjc7w=;
	b=jJ9tQ90hNG2nVESSd/a7s6OiDf1C5k8YvKWhnWmramzocsq7GKr5IrC9PxZ7hnY2Sc
	CCGyU+e6Js80ZZbKFoz0lpGCgEUt8eviTj+BzuADG6gshGaITxb2KGEwjgeeCBRgCPOn
	RxzDKp2VK8fN0T7YZfs1uJapcB6xYC1jaX2izzOAktzE+IrfDFsL38AQ2K0YQr0Z9QDf
	pgrcAF4vpa3hbUQ3v3y+TJUT38pNwAJLaeTz+hmFhYb7cHS6nWCxCyI4nhWb39fFTlYL
	LkwjJWvc+XVyK9Z0kDa1TH6Q2pCFHAbTmuYI5DG4UkEh6riZv2QXBL0lCt6x0XYtUnny
	s0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ghdMq4BXo0tLEOH8RMRdfpfE8cAxdVHJWlm1xYVjc7w=;
	b=Rn2ZFBTZmJCQaJ3tAQIsCUbwHc68S4ea1TKsa3NQJz4b3hkDQURGFduLjB3b/NDJeu
	DmXpYTU6YqjYGHR5EVnOs5/Pd2NCvdZPVOb5cCUqNcyMm8zgsxub0Dt4VV04UeO8VJKS
	1amLbuUvBqJ4VoR0k5SNBcQuEhkcdAXI971Zc9102lfUti/DELvm+3Bhah77DxY80KVx
	4Aqz15citnvVWV4SAfN1HrDBheRp29F9PJwzWvPjNWFsh7TCy72i/AiWEhJWjoSaaILs
	gc4p1m/8CRgIDhSlWCE72t55VQ8cGA7++HwTQBOWergrU/Y2Z1JtDIiI8M2CRWnoJL9+
	pw7g==
X-Gm-Message-State: APjAAAXM5S62uMqjtV3JG8VZNZ7dvyzeIleQOLmk0JAHcpHbwJRqtSKy
	lVzXKK+qoQUdIy9urwmLLx2W5/ueqfE=
X-Google-Smtp-Source: APXvYqyJiJzO07arpwsispfMtQzb7uRROzXPJ/AtaLVAhtuPlyaQFP0SgaTmg53SsPlUqGzGTo7U2Q==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr9997647pgk.357.1581092134414; 
	Fri, 07 Feb 2020 08:15:34 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6000:9640:5492:77d:7f91:533a])
	by smtp.gmail.com with ESMTPSA id
	q15sm3506331pgm.47.2020.02.07.08.15.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 08:15:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Feb 2020 08:15:00 -0800
Message-Id: <20200207161500.10273-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207161500.10273-1-ticotimo@gmail.com>
References: <20200207161500.10273-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] python-twisted: cosmetic changes to RDEPENDS
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
X-List-Received-Date: Fri, 07 Feb 2020 16:15:33 -0000
Content-Transfer-Encoding: 8bit

Make the RDEPENDS indent consistent and break
long lines into multiline.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-twisted_19.10.0.bb          | 42 ++++++++++++-------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/recipes-devtools/python/python-twisted_19.10.0.bb b/recipes-devtools/python/python-twisted_19.10.0.bb
index 51a495a0..aee6f5ae 100644
--- a/recipes-devtools/python/python-twisted_19.10.0.bb
+++ b/recipes-devtools/python/python-twisted_19.10.0.bb
@@ -63,25 +63,35 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
-                       ${PYTHON_PN}-constantly \
-                       ${PYTHON_PN}-core \
-                       ${PYTHON_PN}-debugger \
-                       ${PYTHON_PN}-hyperlink \
-                       ${PYTHON_PN}-incremental \
-                       ${PYTHON_PN}-misc \
-                       ${PYTHON_PN}-pkg-resources \
-                       ${PYTHON_PN}-pkgutil \
-                       ${PYTHON_PN}-plistlib \
-                       ${PYTHON_PN}-pyhamcrest \
-                       ${PYTHON_PN}-pyserial \
-                       ${PYTHON_PN}-setuptools \
-                       ${PYTHON_PN}-unixadmin \
-                       ${PYTHON_PN}-zopeinterface \
+RDEPENDS_${PN}-core = " \
+    ${PYTHON_PN}-automat \
+    ${PYTHON_PN}-constantly \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-hyperlink \
+    ${PYTHON_PN}-incremental \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-pkg-resources \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-plistlib \
+    ${PYTHON_PN}-pyhamcrest \
+    ${PYTHON_PN}-pyserial \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-zopeinterface \
 "
 
 RDEPENDS_${PN}-test = "${PN}"
-RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
+
+RDEPENDS_${PN}-conch = " \
+    ${PN}-core \
+    ${PN}-protocols \
+    ${PYTHON_PN}-bcrypt \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pyasn1 \
+"
+
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-names = "${PN}-core"
 RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
-- 
2.25.0


