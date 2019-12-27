Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id B669D7C89C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d16so27250568wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Xvrz4bpC6buvMtXwhMk7QA6cg/w/1cxxII4f2q24ZHA=;
	b=r9vRxkN8O5FzqtJUSlq5Cj9vvmEFO6g944x5PAjCct/nX8fQHEON10/buHHvfb8gJ1
	WX00DPL2BJMKYv9J/AtsklaUWoOiwICsrO0+TIET0AZCRAKQQ5Ygnw2JldIGFJe1jIj2
	8HQvWb5s9oSOxo0dPWEi/AuQu82tGWL2YR2GXgKYVO4rsPC0JSICcII/8xegJMnTQKzo
	x/ox2TTXCBMZ6CaHSEUoTNvYAX9c37imavYsZSUcriogz5WjS84xhN/2spJkKmx1WR4o
	TGEODdgPMZD+4hDGoyjXrxwbBFaTwfmOO0yhrliUU+a+jP1SPMhmcxlN2G3vWBNQGG+r
	Q8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xvrz4bpC6buvMtXwhMk7QA6cg/w/1cxxII4f2q24ZHA=;
	b=RlPPH3iTmxTpXXcUFa7s7gdphM14JJpHlY/fwi11Wg4h951uIiLwOvEBMOhBsT9GzL
	xTnpaNbPvNZIi05BSR2TTB+vaXnDm6yShuL8kbdJrsrDJz5yAbqZ0lGNNcQlKhP3R4Yb
	+FzTOnoTLeok7NOqUGR9YHmVbNCVJ3EzO2/glOF7gkmMXrXVnYI8+Hog8wP40Mlvg/Fj
	D58jxZy5vYAj7uf38hA77Lv6GkxyY10M4+YBuPrz/dCK+v9/CVp13ESQWxWPt0Q1Re5G
	DzUYRNvAaLcF2MPgtUU18cyK8upkenQlqYmZYpMlQUrPkMU4mG7rE7K0BLpGu2NJqUzQ
	y2Ig==
X-Gm-Message-State: APjAAAU1ZgPvSInB7Y93aOO2XeEb7HRcAAH2vmmcdJTcOIMSRcs65UQl
	JnypaaqUKB4GaBjzUGiaRV82j/5cD8M=
X-Google-Smtp-Source: APXvYqzjCmB2Om869rZh/wyyDSKzCL0pCH3SuQP0WVnd9xUm8gxjOLyNUwlqK2MyyV3WXrwhGt/sgA==
X-Received: by 2002:adf:df03:: with SMTP id y3mr56600170wrl.260.1577482295187; 
	Fri, 27 Dec 2019 13:31:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:07 +0100
Message-Id: <20191227213120.3930-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/23] gedit: upgrade 3.34.0 -> 3.34.1
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

News in 3.34.1, 2019-11-21
--------------------------
* A few bug fixes.
* Updates to the Snap and Flatpak packages.
* Translation updates.

[1] http://ftp.gnome.org/pub/gnome/sources/gedit/3.34/gedit-3.34.1.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gedit/{gedit_3.34.0.bb => gedit_3.34.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_3.34.0.bb => gedit_3.34.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
index e9cdd8a6e..20806bd59 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
@@ -23,8 +23,8 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "ec6632fa73d9ea6c817e74a98d16eab6"
-SRC_URI[archive.sha256sum] = "3e95e51d3ccb495a9ac95aa3ed7fe8fe37ccde7c678f37fa3cea684bc71d507e"
+SRC_URI[archive.md5sum] = "4bca1d0a13db186cd84619b4bff42238"
+SRC_URI[archive.sha256sum] = "ebf9ef4e19831699d26bb93ce029edfed65416d7c11147835fc370d73428d5c6"
 
 GTKDOC_MESON_OPTION = "documentation"
 
-- 
2.21.0


