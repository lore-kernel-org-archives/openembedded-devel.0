Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E08E877E5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:58:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so15351196wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8wZ9Fcmlc+4xJ0CFeEJbQ5cgn4OCT488nzdWxbgf7F4=;
	b=qDddjsrhnI4IGpb0dZA8dFGbQfhRGbdFc6x859WpYBT2k4wACWxJ6iZTLAJd7U5UAS
	8gzlC54DJf4kInKNBQbucbLjdf3Rmx6GssCpm2GVIDWK/U6zkH0Q35bVpu0lXCSPnzXn
	YQuuZnubpGK4m12x82ATKJo8XJE6xjegAgo2FyEWN+niULwRanJbWB0IzbqNqg9o4LrC
	EmqO2xA0xfrhg7nS3s0AYcPLGHBled7aExOcossDZRVYEdnsOcyUxxcrG2+1seil5RM8
	IvhlR1O3Z+RLM1ekVwSEo8I/5Tpjdn2Ep+qxUTn0wHLxtjMTmNPT6C/r5OrrRpSKtZpR
	eleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8wZ9Fcmlc+4xJ0CFeEJbQ5cgn4OCT488nzdWxbgf7F4=;
	b=Bh/u9c7pFeXBj5hVkFRDfuS0PSKsGoC2wC5TYSicF6CK8HxMYK6oX8Kqv9mJQPj0eg
	ngqtcn0B/xToAova9WvLZY4ghF/k35Son6hoWWfJKLuk9yltafyLDEW8RbAOMYSJR1Vg
	EAQQedUBjQhqYlalXFGgwu6j6a0sNtTZ1sfqyQpWKVPRmTZe6ncXM9grzoloxN33N8xv
	tL/5IulKonZCCaebDclHJxGNO5WCXiIBikR1DnnbspJoBmDMIBb8Rfj/ZkWRAlJWtdxo
	hshT3+7kqAkf5SCCdmWNY4bvyL8ioXNK/ZxpxgdtJ0iQnEFsQNgcMaaoTZwtwLpM5Eol
	sHwg==
X-Gm-Message-State: AN3rC/4hMp+s61oAbeDSHitYGTSypO8IS8ULIYYD8ouPVyJyB9CV5ekM
	U1g6sOYgKeowi0OA
X-Received: by 10.28.176.5 with SMTP id z5mr12664189wme.3.1492124309443;
	Thu, 13 Apr 2017 15:58:29 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	32sm155689wrq.25.2017.04.13.15.58.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 15:58:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:58:15 +0200
Message-Id: <20170413225816.10153-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170413225816.10153-1-schnitzeltony@googlemail.com>
References: <20170413225816.10153-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] devilspie2: add gettext to inherit and unblacklist
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
X-List-Received-Date: Thu, 13 Apr 2017 22:58:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
index 48dd489..3c31c1b 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "99c88f702e134d2b2f2f8caad4b1ef03"
 SRC_URI[sha256sum] = "01a2ebcece14065c9a2e47decd81341e2a6f63e3bf43ff446103686718748356"
 
-inherit pkgconfig
+inherit pkgconfig gettext
 
 do_compile() {
     export GTK2=1
@@ -28,5 +28,3 @@ do_install() {
     install -d ${D}/${sysconfdir}/xdg/autostart
     install -m 644 ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart
 }
-
-PNBLACKLIST[devilspie2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130666/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.9.3


