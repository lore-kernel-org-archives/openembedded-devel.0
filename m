Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D45B576A51
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c133so291566wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gi1BFDMMFg4D/IGo5e5SjA7tktz+9wGhhtjDDnm9+Vc=;
	b=eV1IWLwRrRCVzQoSYDv847H6H0eIIJUd3OGMPSsUvARttfvhbsSbZ7au+pMfZVb+c1
	5LpVwvTy908oBaH0HvuVwizxopFgIWLkGYFoA9VsBuXIGAsLNLbBivNqlVbJeu3CpkMs
	7HQUwXs9nGXXx/49anS1yKjVV0NZUaSn1VHE/lRY9hAz80b9hxiprQ/SyOhlB+tWRo1Z
	ycQqOuRDWut2vbPEO3n4JAuqbmyal3HgokJfSn7mzN+D0PVw1ynkcppBg4m9TlxH/2Zr
	BbJroGx/BVo3A1eVvHFoEr9ZxEXIF9rGcE5xmHqfaWG205bjmMDJ56vsfCjA4nr2+WsY
	SRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gi1BFDMMFg4D/IGo5e5SjA7tktz+9wGhhtjDDnm9+Vc=;
	b=HykSPXbtXvrlY667qmyZH1U1gh5nJPAK4UGVGpVU7P42/sn0hhXGSJdYzt0zArj91x
	WhOFYmkpH5PSFOmzx9XmGeG5JzNwg5eSXo+gOVUlbdaPTJmByB5V6B/5bef+ibjZhyIK
	rO/eBe74zae2mfrPioM7TrMbhrQ3yeZqjtTQBOE3bUhlvDFOUMQNzv488vG/khbG8oK8
	zNv6s5SBzxVTlJaWpF4pRwhOtyNvbesnJ6ydIz+vGafYyShh48JE0+afjlufJfFrkqYj
	1oG3MCaPsNI5oGmraZiee2xl2fihsjuJ63dENrNoeJHHGWCIzxcPEaaLKGlITsQFSJ7U
	xD9g==
X-Gm-Message-State: AE9vXwPbBV5wCWX+LFWokte+iVibIBRgfYOApRPUhbwdeIzoU+WfcygjcUwUQ27C8DLi5w==
X-Received: by 10.194.42.202 with SMTP id q10mr10418453wjl.190.1472672490108; 
	Wed, 31 Aug 2016 12:41:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id s6sm1370567wjm.25.2016.08.31.12.41.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:05 +0200
Message-Id: <20160831194106.14065-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/11] geany-plugins: blacklist because of QA issues
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:30 -0000

geany-plugins_1.27.bb: LICENSE_geany-plugins-pairtaghighlighter includes licenses (BSD-2-Clause) that are not listed in LICENSE

geany-plugins-1.27: geany-plugins: Files/directories were installed but not shipped in any package:
  /usr/lib/geany/git-changebar.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
geany-plugins: 1 installed and not shipped files. [installed-vs-shipped]

geany-plugins-1.27: geany-plugins-scope rdepends on libvte9, but it isn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
geany-plugins-1.27: geany-plugins-debugger rdepends on libvte9, but it isn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
geany-plugins-1.27: geany-plugins-multiterm rdepends on libvte9, but it isn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
index b56d8f4..0e333c7 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
@@ -218,3 +218,5 @@ RDEPENDS_${PN}-xmlsnippets = "${PN}"
 PACKAGES =+ "${PLUGINS}"
 RDEPENDS_${PN} = "${PLUGINS}"
 ALLOW_EMPTY_${PN} = "1"
+
+PNBLACKLIST[geany-plugins] ?= "Causes multiple QA errors and LICENSE warnings"
-- 
2.9.2


