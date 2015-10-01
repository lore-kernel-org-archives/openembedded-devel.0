Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 42020770A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:33 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so35417284wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jq3hJr+dwOKKq8Aa/wqTKh0fNY5UJ4xmN+61NEWQSHo=;
	b=lGKR4B3MkpltNWwhoYwNyhFDJwE76bvMVSBjJSFyTDnNyVin+6VZoJkxLol4UURNG8
	ZMvgWIodc+9SmwE04vGy3/UsKL+Ni8l8Yy/fZqE/42NbzHEo/ifHu1KtjXuJ1w1E4Ky/
	sDGtK++qcJKZ++X4XGeWealRNRsDPZbIYRbkiH128R2AJDMp7MIOBKOXcu1AGMh3y7Ue
	D7paew3BDX64B8ToCsc489G97MEkVJOZdDVBTPgHV72RAl/84Q5lX1vbwgs8mNAj5lD0
	28Q4nTPj2+My6KxycfZDJCFOUwJO0pXwegsXqjrkKqsX133ta+nRGUUXiYRnAeDkr1Y3
	OfGA==
X-Received: by 10.180.81.228 with SMTP id d4mr4210420wiy.38.1443713373355;
	Thu, 01 Oct 2015 08:29:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nf15sm3715176wic.22.2015.10.01.08.29.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:20 +0200
Message-Id: <1443713428-8635-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 02/10] packagekit: blacklist, depends on disabled libopkg API
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
index 3d8a6ee..3633f29 100644
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -60,3 +60,6 @@ FILES_${PN} += "${libdir}/packagekit-backend/*.so ${libdir}/pm-utils ${datadir}/
 FILES_${PN}-dbg += "${libdir}/packagekit-backend/.debug/*.so ${libdir}/gtk-2.0/*/.debug"
 FILES_${PN}-dev += "${libdir}/packagekit-backend/*.la ${libdir}/gtk-2.0/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/packagekit-backend/*.a ${libdir}/gtk-2.0/*/*.a"
+
+# PackageKit-0.5.6/backends/opkg/pk-backend-opkg.c:31:26: fatal error: libopkg/opkg.h: No such file or directory
+PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon"
-- 
2.6.0


