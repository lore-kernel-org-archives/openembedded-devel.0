Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D455C78A1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l4so1228791pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LihhtaBGlJId9xRUscTg2eu5IOLdT5qWvcVV6L8ci68=;
	b=tphlH0ZFisVbXG4EkNV1NkDv1gn/p0b+0swqhGBJrvxnYh0Yq0Ov6GOIQmmEA2QVTE
	VFyoYZLG2xP6y2Bh2B0IfI5w+/sT8YYv1QJIPHAJBDrLyl62069usB0YfVdsR6vA0j9l
	ixwLOMGOJcfDeY2HRGN0pi0bu190k5toesHSgq5DgshGKPsBdMU7tUWLGe6IHDx3S1a6
	zRUMpcyTgSF3pjwFvYsH1D0aj6QThIKFExFJqPoUtkLzXMCU0gG2snrU4PbntVh6W5DQ
	0DjZ+QBgNwpKJK/xeCECG0XLxTc66XmAmi3zzQlarl7EpS1oQtqGURdFT2qlEBicVM8q
	2iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LihhtaBGlJId9xRUscTg2eu5IOLdT5qWvcVV6L8ci68=;
	b=pNpIt2kS115eHXf0j1uN0u87R4yaODAueTPXNfPQgC91ISdf3WabN6soL8pPxPChuk
	WP7ejmEBZI0JIlyTDw84NzBSgWbxp/OrlBFh5uJ59pA+AJCfTNaAisez38Y1aTQTZlWJ
	HWhasxV2wS5GDdl4ErD3buwcPcawAvo+gwHiEFKVBouYE9ZOquPX+hwmh9EyBecIRO+V
	/HaDKlHKmkfJ71vKeroMbJWgyGiuhUVR5FkIkfnxbtkpZMzctRb6cA8JWzO6grbU//20
	3wtx1L+ci5aLUnvE/6mgsRlU0JE2z/X1E990bo45MvTWIRvWRcQp6MXYDC9MmpUxCpec
	C+BQ==
X-Gm-Message-State: APf1xPCuq3bHZq61raBb/TT4xX+57VoNFPQdH9bdKc/fug1uuxqlijO/
	kBJbGRrWdanmHLf3G7YE52hoXQ==
X-Google-Smtp-Source: AG47ELvEumvgNECsG88N4nRJKsifgbzN9HHcLuttSf4q0uB1OrsilxKY5ioXatC2JYsKADnftMyW7A==
X-Received: by 10.98.25.10 with SMTP id 10mr23291028pfz.136.1520449283944;
	Wed, 07 Mar 2018 11:01:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:55 -0800
Message-Id: <1520449275-29492-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 03/23] florence: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:22 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/florence/florence_0.6.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/florence/florence_0.6.3.bb b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
index b9b7d0c..bb55721 100644
--- a/meta-gnome/recipes-support/florence/florence_0.6.3.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
@@ -12,7 +12,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "8775051d7352f75dec5a86dc9964e8e0"
 SRC_URI[sha256sum] = "422992fd07d285be73cce721a203e22cee21320d69b0fda1579ce62944c5091e"
 
-inherit gettext autotools gconf pkgconfig
+inherit distro_features_check gettext autotools gconf pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
 
-- 
2.7.4


