Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D17846E614
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 12:47:49 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so40713146wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 04:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=loEpM0oY3O8mjHrwO3zxRqKetHAfjN+tbCDMN7Pdg6c=;
	b=PJidr27H9w8Lf6fdIaxnL/7It97427o7Rji/ROadGe8iK6Iv86qBtLZaP1CzdmTajx
	LjCIZxnUINDuLfZusf07PT44Pz6VlaEkfgjKYZIbkIswB861n+kBNBdkCvNzY4wsWjyp
	qWNG/QGoe0VpM4WAFnVbDSO43S9FTaHeOzzyzwsjKIBAIEhL5eOz3TJIwls/97kaNaey
	6UAaaogs1O2F3B45TzY7X3Kt7RC8XiH0zy+Hlbka3t/NKAwKJmdelxOjrYVb3Uy2BPmu
	YrTe9yWjNC3i6rXflfu6AMc2Ob7pacDu6IItBDIDkcc2M1tHJWQ8cbXrU93ZOazURVK8
	hfmQ==
X-Received: by 10.194.122.38 with SMTP id lp6mr74252339wjb.24.1424263670154;
	Wed, 18 Feb 2015 04:47:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hd5sm29316483wib.21.2015.02.18.04.47.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 04:47:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 13:47:49 +0100
Message-Id: <1424263669-17774-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424263669-17774-1-git-send-email-Martin.Jansa@gmail.com>
References: <1424263669-17774-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/2] fltk: blacklist, still uses /usr/bin/freetype-config
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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index fa01455..4fd3645 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -8,6 +8,8 @@ DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
 PR = "r1"
 
+PNBLACKLIST[fltk] ?= "broken: still uses /usr/bin/freetype-config"
+
 SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2 \
            file://disable_test.patch \
            file://dso-fix.patch \
-- 
2.3.0


