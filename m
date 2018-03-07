Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CAFD78A37
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:36 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 61-v6so636229plf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UbSbswxyWZvC2CG5lx+ESIXGWCWA9sATfcodQqbUXDw=;
	b=XcMYUCs86seIupfgKCuuRrME6Y/FtXDlxRhdUOZ5qDk+DDXEGcmcn6V0aL6+GQBs4C
	ci53gxh1Tjy/IBXpgRF7A9z436vD42sYYabXrBa8rloixV3VjoBxsmkADFAmiDWY4C2r
	GbZQmCTzdoikI6j+uRE9AKr4GgS1MlQrBFuNHpr7PQI1byOJ/ZnMVaECko9wCL1PcBPY
	wvjlsf5FXl5gauV6/wd2sHKdHIawd9Mc76GJVU3KgHm0BSurLGN50f++l6325TfamPJu
	umJA2iu/iAJyZZ/SIMCpyM1MYdXmbCJ9f6j007CcRvIXyzsL9xJedF/FizzgW7s9Cw9q
	Di/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UbSbswxyWZvC2CG5lx+ESIXGWCWA9sATfcodQqbUXDw=;
	b=fdbM0FwgUPsQIyYY6132pmK08/FJgGjInMdOZmjmoibkHv5rKxJQdyF4+CCVWz0ct/
	bzfn+k/uLd/fPYKv7nCj/JwAz6jVYR4QRRH1RwK+vd+R5lC2/JZ7ad6MyT7yARrtG1pN
	g1wPNWMdpEGJbGC12jli+qhzx+kh6ouWJ5OkM1JDq5hwEueoRlc+ODnjHGkmG9BvGDWx
	ADvciuG/m7TDEIHifKe8K/VH7UyhWASZaCofDAGvf89MuoNGwnBaGimEvZIlvwPJsxt8
	VYOxUUIjdMj2HmYtJ5yJgdkrTGEUSVNBEYPvF6JPixJpgb3SWgTvVEG/4XcdDuJ1retj
	k5qw==
X-Gm-Message-State: APf1xPAri5l6jklHe34rF8buW7qSfFdDQBnzr7+hesbaNBZls9/yuBD9
	7pLVSQ0B/QLbLloAU88gY+iB8g==
X-Google-Smtp-Source: AG47ELv/2Ske8d5tV2ZJETQlxRm3PVs4YpYs6pWsxzq8Xc80qOYiBBBeio0cYLMUA60/XZ05+nwzKQ==
X-Received: by 2002:a17:902:3303:: with SMTP id
	a3-v6mr18827797plc.399.1520395417804; 
	Tue, 06 Mar 2018 20:03:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:12 -0800
Message-Id: <1520395408-19266-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 09/25] pangomm: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:36 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
index 02bb1cc..e0f72cd 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${
 SRC_URI[md5sum] = "874eadd9434613dbacf0272c82c3ac23"
 SRC_URI[sha256sum] = "9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = " --disable-documentation "
 
-- 
2.7.4


