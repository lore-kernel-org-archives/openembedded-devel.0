Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8C17FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:36 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y11so24046337wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=68WX9J99YRFLP1UXRp7QWq7yj0sednWncCfUMSiwDac=;
	b=ZP1iwamg2BruWJDk8kxx1QSAi9eZ4ppSrEFS69a/Q6nI/RR8ewyY62jMuM6bEKaP7e
	Pn2YlRGz3XCtqQVzt1AYGIDFcINdqe1SQBlxo8z0wrKvYRYyDIYRfGanRRvwe6ntF/mX
	oXm7w/oCEucm7wCg1fpuiIeon5+5iC29Bu5h9lJHSM5WP4I4g88r8GeZ8yZPVf3ZOl0p
	2MDtGAG1webLLsP5fKfrnRqxdMNAaZZD6NEVjY+t3gL3loRztjnmQD4QeVlVqMk5XvrD
	FI60c+Mq0mucCsKiSMSHLeIlX62yGJ60QLepmCEMdrDCrqJK6rHoJP1jHDgoL48KY6J7
	O3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=68WX9J99YRFLP1UXRp7QWq7yj0sednWncCfUMSiwDac=;
	b=Znp8cfTAQ8syTQXpVd4zZsMdTj//DLNrg88vPe/N1GTwZQB/WrGw7Jl70NE8D+Slvq
	UHzFUa33ldt3uQTbzpSXdzw6Zu9e0lRU+MIycrc+200gbQS5/6IrwcI5QBz7c3PLgz6j
	tg2WXA1eqypC+zCp573nGCYZTBkXVWDmLxsm72TPUT8TlJsLuzGwe7LcN+VVRR7c7ziN
	4Kcy2rs9vXbVi19OeayxUAJVSn3k86nEc5JsKkofWyfbguxB5+0hdKEIOA0EtfWD2/yr
	u2ObOuG7AFE73oJ0UxyS72ncm9EAIF8cNJURB2L24a2+HEm2U02ycWD+2UYa0TNP8NPE
	wg/Q==
X-Gm-Message-State: APjAAAUsxZ8MemTJqb29s3ff/H7CHZJtDHa7clwrdXKlSZFz0NOyIV0O
	5dhTdZjQ5T/GozBYJBnGRoI=
X-Google-Smtp-Source: APXvYqzGTuUTqOTl5Od3iZgpgAHukH2I/XqafgJSvlYn5udz2/GL2LmJXp3AgpXPK7055uM3s2rFCQ==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr5072784wrn.384.1579296397031; 
	Fri, 17 Jan 2020 13:26:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:12 +0100
Message-Id: <20200117212615.32526-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212615.32526-1-schnitzeltony@gmail.com>
References: <20200117212615.32526-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] xfce4-panel: upgrade 4.14.2 -> 4.14.3
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.3
========================
Please note: This release replaces 4.14.2 (bad release tarball)
- Fix build: Always provide files for vala binding in dist tarball

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.14.1.bb => xfce4-panel_4.14.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.14.1.bb => xfce4-panel_4.14.3.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
index 88ce7f46c..76abef054 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "3323588f1c18f04891e013243da1e355"
-SRC_URI[sha256sum] = "9c3c78b49ddfac7d42a804e6a6ad9d22ad64ec60bbe17d8724bc52d3e3f6d114"
+SRC_URI[md5sum] = "177818d4a84633c1d489f703fffe905d"
+SRC_URI[sha256sum] = "ef22324d26e5af735134bb10f85b6e16525ac9f48be8d2f6b634142fbfcabbc9"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.21.0


