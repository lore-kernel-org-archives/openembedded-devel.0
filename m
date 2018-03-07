Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D33078A4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:50 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id f23-v6so624577plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ca05l8QCZNmjaYNka1fu2ZyRyKNfroEOXCLwLKNzKYQ=;
	b=H6oeNQYpWbVIaoda7S5A71RQxkSU+Z5kixlIXBGoj88q3Q8h52sOYqUhIE3ELemBUj
	kZ26/PFUrnrWSBRMW+kdktfh4jdld4EwHc6Avbecn0DC8FxFRq638+EspVz+4bq8Ah4S
	jw+tmc7auAoCtw43g8LVWCPEnJmsxxbP9MzV8L6TFrhL7dkrsXs2UCHv7MkRHKxMm2kr
	Bxup6hA9ZDXUa+i5mteXUkyOmo7rRjqMeOBGfYt/kCerNAsjl07jR5lWQNBfkzTwVsvf
	bCq8RBP5K/o9n2+yaK1vpiRYrdW9azBa1qSNZGYeOBuVUDTGCQJIaULX9yDGwG7ZSDpa
	8Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ca05l8QCZNmjaYNka1fu2ZyRyKNfroEOXCLwLKNzKYQ=;
	b=nWH/qG1G9AihyjsGlBtNzxUIAyPcfqj5J7lGGc1C0LVyv77vlNDKtIkdaM3l2b4IsB
	ov+x2cubASHKSb9s8ZgmLHEQ+o+fo/RkfaRqWZocXTQhtBB5T3FoT5+QmcIhvCZ2zv41
	WCP5fUiL2HTuVkCXNAB/8qhdY7reIwbD3OkYtixTR1NT1DwBgiO5irfZAhJeaBDjYlsN
	9HtVwZM8ci4O9+zQxf3hxRuscCJomYGQt530ZZDcB0BLME/tICVMeKW7ghmw/4Kl4jLR
	jRWQ2f38yoSiozhil3M28qtvz0Og9KYSprKTD6NBWp1wEwJLfwBnp5gb6bK9Gyqz86M6
	Vf2Q==
X-Gm-Message-State: APf1xPDYJLtJPyrhGyfjyFW0xtZwIi8PO8OoO/12ZS74oPQCwCfL9ZVw
	kp+qmXV7h6eyeq+gLcFAd8BUqg==
X-Google-Smtp-Source: AG47ELvH3tbsVv9K2P/wilvU9YYmAo3LuLwhBrIIRzDuTGY691UHuAO18XTUaqxWs0I8TX1J1EccpA==
X-Received: by 2002:a17:902:8c93:: with SMTP id
	t19-v6mr18861899plo.304.1520395432132; 
	Tue, 06 Mar 2018 20:03:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:27 -0800
Message-Id: <1520395408-19266-24-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 24/25] glade: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:50 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade_3.20.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.20.2.bb b/meta-oe/recipes-devtools/glade/glade_3.20.2.bb
index ad91ca3..95e1737 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.20.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.20.2.bb
@@ -9,7 +9,9 @@ DEPENDS = "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
 "
 
 
-inherit autotools pkgconfig gnomebase gobject-introspection
+inherit distro_features_check autotools pkgconfig gnomebase gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.20/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
-- 
2.7.4


