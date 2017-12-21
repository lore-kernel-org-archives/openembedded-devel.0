Return-Path: <romain.forlot@iot.bzh>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5912278624
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:21:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b76so16575723wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 07:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kFPjSpm4alRN0z84ZlhGcWcgc+r7ZTEg1igEljGfDbU=;
	b=SgL4Xm7PZ0RBBZjUNSDyMhcH4Rkrkr7/fjoxLaRU8yNaFQS/TIgsSaAU7ztifDwicW
	D7zWcc4uGg1GTGzmzyaCaN4e2Bdtw1/p6/XAiz2b0HYSklcE1E5K33W1z+iKJ/IDRw+y
	1N/h5QKirYwwoW9+gduW28skZPBtuCS+EXGCYNfogwOSJT0HdyYuY6l1IytLT7pCG2bW
	kPCcA+oxnyhckz0SvF/kxI/pp6XMgayfLHtscbb4YxrR2xveK6KPbP8l4citvC+T8v2m
	YwXR2SkbCDvwNuYv3xiy2vDvGCDDCm6UntF9gEROLEm33/SMh5SXSxdH7BfEAdMith5N
	MlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kFPjSpm4alRN0z84ZlhGcWcgc+r7ZTEg1igEljGfDbU=;
	b=Iw55gmwLfv/LtvEWmNNgxWDjT+/YH96333TbBvAro17m/jQFnOA68mZOklu5ptVzA1
	VvlhcFd5mCMn5yb7zI2vbzBljyG0mmbHHpC2Hfjk8oYC7amRqc8UbOIqUE5WHBCw+7Aj
	Fd63YjGbczHVgPHN1Mzq6AyiPYkg6KCiVAGBrfDwEw2AbOP6/k8KS6V1+jYOAu/xXPbC
	0pMTHSlarnejfNbKK1YiraStBVQrLU4O/CtWwMwdUp7siYHu9kgl0CHdxU/yiMfgU7Ub
	eIhNtoxramME8lCzjTRYNREkpCPAVdJJCatkvD1r4pn33vBepIuC6jXafTXV9CG/6U9u
	2UCA==
X-Gm-Message-State: AKGB3mIvm05zxvHITjy0qB7OXIhKw0i+Bqr9YWAXfVp2DkPYaCM0V1pT
	Mz+ROykJy2IDJyCtG1thVe8VHbyu
X-Google-Smtp-Source: ACJfBosqORoKene2OkTRnmQH+QrchT/niH2zgdRYIrNhmbkzYnA+tIuSrzgvoQBeGUBP/uOs44RgRw==
X-Received: by 10.28.7.200 with SMTP id 191mr9198017wmh.4.1513869693549;
	Thu, 21 Dec 2017 07:21:33 -0800 (PST)
Received: from shamash.uruk.home (ARennes-659-1-221-72.w2-14.abo.wanadoo.fr.
	[2.14.72.72]) by smtp.gmail.com with ESMTPSA id
	y124sm5543554wmb.42.2017.12.21.07.21.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Dec 2017 07:21:32 -0800 (PST)
From: Romain Forlot <romain.forlot@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Dec 2017 16:21:22 +0100
Message-Id: <20171221152122.18800-1-romain.forlot@iot.bzh>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH] Adding LUA to SDK
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
X-List-Received-Date: Thu, 21 Dec 2017 15:21:33 -0000

A project could need to have LUA in SDK, an example is
to compile LUA scripts which checks its syntax before embedded
them into a project compiled by Yocto.

Change-Id: I3c36acd58d45121c3344b5322244bdc0b12061b9
Signed-off-by: Romain Forlot <romain.forlot@iot.bzh>
---
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
index 28d71faef..8f4e8fe68 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
@@ -56,4 +56,4 @@ do_install_ptest () {
         cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.13.6


