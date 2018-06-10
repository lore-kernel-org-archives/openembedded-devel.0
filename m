Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 304837608A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:42 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r15-v6so10492626wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=m1/V5t9g0bvMGRRVbNd4Wgr69WsMSMND4O4fejTeoMI=;
	b=Fn5QdDCm/BydD7E5WdMJasNg2bChrMV/UQy8RKVZzkhFwDatCG73+WpBxYslGMRMk3
	+4F1+3arq61u7Ju5jnUiM3fPHJHL9++C/1o6d00gIW7NLyPEmPd7VdgBzUSRlEDjR2Zg
	FhDmHfKqqFUN5j54PF+v/LJohukQyQrlWoQJAM5DJhCpa3KpQ4HFjfa1yvO4EcKaKhFu
	L7RtJVXiCNFq6fQ0Yf2WnlKpNSL4cm/RAlg66Tkn3JPkiEkqgS90AXnJ54xyKzuXO6na
	RVgejhsVtElvEZ9w75/K4sLD/UAbv6NL5T8dA9O6ShUYCqlFg6H9pFUqRenZm/9BSLjy
	plIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m1/V5t9g0bvMGRRVbNd4Wgr69WsMSMND4O4fejTeoMI=;
	b=tEZdiAE4xgfbznTqb4FsgH7jrlHf1QFZG3NaSTHaFHG4uo1AmU9JObtTygONAoFbG0
	Vn6Yrj7ab3X13lmHkcBT51nHuB598b7FgzI3VfDOg4hlKmB0EMbn7HwgNh5ow+grkR21
	mD5D9kY8twWcbbsoOjnVT1gLR4BZq0NZxyBbjOwA17dfooLCAKLaENI+S6q+DgRyK2WR
	2JdeFXdvz279mHeF+FlzljhDexR00MP7ezv2VBichENuEPFAPn6yJW0HewDHo8m8oWco
	FfE4zRc0btHEmmhI/Jq8bCIebwqznowSKFPy1WY4h9huEGIHbLQskMG/bnL4ohfbpcDk
	a6xw==
X-Gm-Message-State: APt69E3shMTkleGoCYKIOirL9uKNiNPEVgugu6WO8/IFb8rBE2MZL7Ug
	m9kFrF09eS9tykx1wp/YCMN4tQ==
X-Google-Smtp-Source: ADUXVKKzma519NhXzxqTWKyBQQLztVZDhC1Qc+l33QbUEUcVZuk5BWXqzzMgKz42P6k8kW/JEktUEw==
X-Received: by 2002:a1c:d905:: with SMTP id q5-v6mr6504885wmg.78.1528643322607;
	Sun, 10 Jun 2018 08:08:42 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:03 +0200
Message-Id: <20180610150821.9536-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 01/19] libxfce4ui: upgrade 4.12.1-> 4.13.4
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a development release but stoppers could not be found.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libxfce4ui/{libxfce4ui_4.12.1.bb => libxfce4ui_4.13.4.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.12.1.bb => libxfce4ui_4.13.4.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
index 4843e0ee8..298f8a109 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
@@ -4,15 +4,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "perl-native glib-2.0 gtk+ gtk+3 intltool-native libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit xfce autotools gettext gtk-doc distro_features_check
+inherit xfce autotools gettext gtk-doc gobject-introspection distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
 "
-SRC_URI[md5sum] = "ea9fad7d059fe8f531fe8db42dabb5a9"
-SRC_URI[sha256sum] = "3d619811bfbe7478bb984c16543d980cadd08586365a7bc25e59e3ca6384ff43"
+SRC_URI[md5sum] = "b407cdab73ebd5c33c90db6bdb3ec5ff"
+SRC_URI[sha256sum] = "d63fcdb8e5acb6f0d26075ea17d320dbfbec2058567cd67cb99824c7402a1f79"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
-- 
2.14.3


