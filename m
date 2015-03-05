Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C5AEA65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:48:44 +0000 (UTC)
Received: by wghb13 with SMTP id b13so54282679wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aXIkIKTGMJrG6tEXDVam98Yp6Q974DezVXSP4IuUZ2k=;
	b=wd189tSUlxmsZwNbBbkhLrzdQ27fdX2mHskkpnIGXGGDKlX5GJAtkyJT5o5qSoyjsK
	1NuP6co3Vf2XlDt52cwTFbWfWD8ay1rKFJdRyVLED4+/SMLX7uvknYsrD2TUuETqRVZD
	Vat0NqqMthEgpY43W/NTPtj8CvxWsolU/fgPO/PLDKO0vcEl4oUrMjrqOc+1PoeLOHfb
	NAx9s/xiMA5gGTeicQOyOidbU6YInY9zkARQOpOQ43Lc86EIIy8PfIBDhfcl/5zUk+PK
	zFzCQNa9b1UztjixhfwMO/XqcClqFBiE0/ud6VVCekbg/ouqVZp2IVGB85mpw7EeyXBT
	YNhg==
X-Received: by 10.180.87.106 with SMTP id w10mr66268077wiz.62.1425570525002;
	Thu, 05 Mar 2015 07:48:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dx11sm11045344wjb.23.2015.03.05.07.48.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:48:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:48:48 +0100
Message-Id: <1425570528-20047-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <20150305141706.GS2337@jama>
References: <20150305141706.GS2337@jama>
Subject: [meta-oe][PATCHv2] cloud9, nodejs4: blacklist
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
X-List-Received-Date: Thu, 05 Mar 2015 15:48:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb     | 1 +
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index b5dbaa8..87e524d 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -8,6 +8,7 @@ PR = "r5"
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
 
+PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
 inherit systemd
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
index 7e67bcb..268a10a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
 
 DEPENDS = "openssl"
 
+PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
+
 SRC_URI = " \
     http://nodejs.org/dist/node-v${PV}.tar.gz \
     file://libev-cross-cc_${PV}.patch \
-- 
2.3.1


