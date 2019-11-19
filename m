Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id D3BB27F838
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id t26so2177129wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Xi/Ilh/LVVs3aOC/bAJFsfWuEQt6eV1R3rFuvFVGBI8=;
	b=LN4YuYiWOx8P4qVDcDTkcmoDJ2mNi8Hpp7x+kUiXoLDdfEm1Pnd+NxSryNLkqy/1m6
	XeQ2E9uxvvKDOshNb7m84D1GgLEEGewBP3AwNgoHVdJRblBiRGKyp3PBorKjW89Md9an
	BsZ8YfEmnwa/U7Ia6uzidwQdI0/atYr52Qgg+pfDvIMf6GbUGUklqDi7ne0A+bDOYf+p
	AtKN0MIIFFV/LNIGVItZJvHrpIO6LR/yYUyyeXDQ0LsnJdxREqkXNAOTiUjFnzinpNvZ
	8lqbLe3ceRcQMsa7mj95MAIU+MtMrwwLq7/eCQHC5BMt/6AgB+yiFVB/s5ORDl+UByKH
	1pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xi/Ilh/LVVs3aOC/bAJFsfWuEQt6eV1R3rFuvFVGBI8=;
	b=qdYSyRMbWglIn+liNrVUg2y0J8hgV2zXH0ripUEdkt8sUyg5Rh6PtHtEiLGlgXtzo+
	szQlSplciQ2GR6lv/PxGMbluR8Kk6hsFeE6KzpnoqrtxEXnQ1AaTo1J29T0jNu3gqfGy
	hVqzU9HWHililgMUaxb6Yypohl0c1iIzuAZkitWuO8dNqM4C85zRRCbXKzic7mnx+abR
	P8ZynvuR8c95m9KKFJ8YeAMBuXfCRquN890rL1STxKI9Z4fqXN4Ku6i+8WhCPMCUHf+7
	3lw3vn+fIW/QlHWDTVvKDIluwEro1c1P9eds82er1bbsvKr7c/lGX6TJeUWea8ap/Oek
	0pFA==
X-Gm-Message-State: APjAAAWdcOVrwmtGyW3ZfLwLBKob+uTLfdNa+aBktitIaChdbS6M77iY
	hw9lPJiRWLqqluNM1HVrpnbHduzd
X-Google-Smtp-Source: APXvYqwpLbNHuD0b4djy38SPeM986+QnjewV/DYyaDLbQVV3MdYO6yXktlJkXUGGMmi66DDrW+v9hQ==
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr3559441wmj.22.1574147864165; 
	Mon, 18 Nov 2019 23:17:44 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:25 +0100
Message-Id: <20191119071730.2682-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] nautilus: add gsettings to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
index 342c59d6d..11193b591 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
@@ -15,7 +15,7 @@ DEPENDS = " \
     tracker \
 "
 
-inherit gnomebase gobject-introspection gtk-doc gettext distro_features_check
+inherit gnomebase gsettings gobject-introspection gtk-doc gettext distro_features_check upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "19e4f1d89fb9d0ff135d5b1974ce43b5"
 SRC_URI[archive.sha256sum] = "37ce2c16a610c589dcc7660f9092446465568e38e29bce6ed8c24f2e8e0077f3"
-- 
2.21.0


