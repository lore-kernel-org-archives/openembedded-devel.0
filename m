Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 111C97ED5F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:41 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x15so6083089pgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xVu7bnjmzoEZkAdVunhkJMKVOF7+WmsmLUtASo2P3QM=;
	b=aY0L/EVVy2PCsnA+O+G+aDXxeMf66swDfIui4TmuBrN8fwC/N0GjFabc/bppYdlTuX
	N0khP33NJCW7MJjNqdhIaN41f0xFSCytkcFxWZGqkiAjEXP+pz5syzl5MbPuMfNPP3U+
	gx/eX6XbeKOOYrI2MA7S1iR+v4rmqnNZd7rSLGcwfESli6Xz9pFcGDPVx/7ZCIF4GC85
	nIm7bjT7L0zq8C5nt8fypdHQuWcfbdcM7VAX3rSQmoKLsxSs/GKe7oiX9G5AiJch3O9Z
	PGYiO028mQY7fxDhRgb7FFY7Bm+wKsbfcsJ4Y9Zh9FqYxNZi+K7orbGSCxMrPEShto+r
	b6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xVu7bnjmzoEZkAdVunhkJMKVOF7+WmsmLUtASo2P3QM=;
	b=MSBHDCDYh2HgABXsvZT8ZtBOByubQdzcEYk6pO5XzNW/h5crg0YynjGGVcr0wG4pLS
	rY7UwNC4pq29w+VVgdN4wrCQC/K42jTVqNlzHQt1dPQyyBqohbQYgGRZ3PwdY7I5aW58
	vH8o3GxdcG/SkkzruXoYBjt3htymD96TtIalPgf4lLsuyU3PK1siN35tF4GaNftZzRu3
	0lNOPsdMKMYxha91XNeWgqKukH6TAyAe4axZ20Z8mBdhZWc9QBU9qbuai/eX5y1SVX81
	XhwCtaZ5U6Vzs1HcoX0rk1ZQKNObItz0ekphgCJs+fevYACLJ7gU/V1WdY3T9A3YBGN8
	X6Vg==
X-Gm-Message-State: APjAAAV4oPBHyYj7C31IJsxp2lAwjKd1Zu3GctsDWq8sGEKaJBsKaFAd
	QWxefM0qt3tCIrkAh7YXy6p9rE6f
X-Google-Smtp-Source: APXvYqwukRScVqcouoX/Wi8VdcZNyAoWF+sigWWccC/kgsdyR0b+f5vTecqMvcs2AwT6pUqNMKnS1w==
X-Received: by 2002:a17:90a:eb08:: with SMTP id
	j8mr35367855pjz.72.1563720103005; 
	Sun, 21 Jul 2019 07:41:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:29 -0700
Message-Id: <b58af98c6cd8e45ba4839844151ae7508b81460c.1563719996.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior] 1/8] gnome-desktop3: set correct meson gtk doc option
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Fixes:
| ERROR: gnome-desktop3-3.32.0-r0 do_configure: QA Issue: gnome-desktop3: configure was passed unrecognised options: docs [unknown-configure-option]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index ffd7dce..0acbb21 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -27,6 +27,7 @@ DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startu
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
+GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
 
 PACKAGES =+ "libgnome-desktop3"
-- 
2.7.4


