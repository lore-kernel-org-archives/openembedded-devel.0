Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 886F879327
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v1-v6so5769801qtq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=km6Zd4ogNk/L8NJZa8rx/sCIj70yd2B5jjtrqofi48w=;
	b=Yo6l9xnjbvsBnkEViUGPfCrMJURI98qN7hGfwQK9L7/z1fKigxauq9PS32oSP9R+fi
	SJlKTCOqX0cwkJVV2XZtuXbfakwtPeZNIIDsPgEDUB8IYAT+ngkS8JapD8GM4R5JXXyt
	ole7FtsWgxy2k2eOrBkjtJkm1p3cz74uLIeEEEhF6LzyzkLubxiL9QXaZA6MFAmhBUGh
	1RxQpS59sbxHy9Nq2hjYlE/m6czwJtE5IGp4jFYcdP9CdRri61tZn3ipHFyNxcMKBNeO
	zHWDBGt++DwoM88KUdcNoR8EitDIPkgwMRQxINcAQlVIKOkrVIjdPbSSVUX5V4rbkMg1
	8R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=km6Zd4ogNk/L8NJZa8rx/sCIj70yd2B5jjtrqofi48w=;
	b=HzxKKMP4o5mw21RU22EcecxfM+DrMd6TiThp8sjgIa09PuULSoeejLcQTXjw6iJUy+
	ka4UuYmqKbjn+ww2PkrvvDrIrYe3b6sKOsBZwnZRLPo/+CN5ggMPz+Wkc+qqcZMima+2
	qYrwWF1JHUGyzVVwoz/wXZUKivfsboL8PMmjXrqWTaEZvCTmVGQEoeE9+Wuw/HmArSNH
	W5BNXKJ9ugphdmKr8MDERCemoTv+DiKPIHa5Aw3UTibJLuRxIf4BE6Vn7xgqTHaU8tEE
	xjGBI9HzYg60OJJvyCXp3RjrQNr7gh8pWWZJjbrmo2BlwfeCKDgy4z9wzzJSvRaH5+x4
	vdkA==
X-Gm-Message-State: AGRZ1gK6JhM6jJVeBsIOf3MGyHWWrTdvJTX0OGhrLvELP9FgGpWo/epU
	hhNLRhsKic5cNBOkXnicLoh9ultG
X-Google-Smtp-Source: AJdET5cLu78NqsRsUeUZK6eAZKhmmwqnYRJgEQHfh7qTDHH/9vu6+Sn3xgtQMSlLmEbi/XA0/X5LBw==
X-Received: by 2002:ac8:8ea:: with SMTP id y39-v6mr2257910qth.3.1540831309717; 
	Mon, 29 Oct 2018 09:41:49 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:48 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:04 -0400
Message-Id: <eeb685e9cefb4e85e07b1a51f4e562c03dda96b7.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 07/16] geocode-glib: add recipe for geocode-glib library
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:49 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../recipes-gnome/gnome3/geocode-glib_git.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb b/meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
new file mode 100644
index 000000000..73332e374
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Geocode Library for glib"
+LICENSE = "GPLv2"
+DEPENDS = " \
+           glib-2.0 \
+           json-glib \
+           libsoup-2.4 \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/geocode-glib.git;protocol=http;branch=master;tag=3.26.0 \
+           "
+
+EXTRA_OEMESON += " -Denable-installed-tests=false -Denable-gtk-doc=false "
+
+FILES_${PN} += "${datadir}"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson gobject-introspection
+
-- 
2.17.1


