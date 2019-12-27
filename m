Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4427C377
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y11so27259418wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pmNXQ8I+VsAbu1siGsncxdANDjG7wGWw86RI/ogu/DU=;
	b=cQ2P3AEEmnWpDWtgSvAnA0yyVPMZrixEj5ijyO1B7UZSzsyQrgyFa7Fn5IorSmjUhP
	2dsTLj0fCkr7Wlj1Z1ptUAfxbqApsrgIeJaXqGjsTBOMs7ggZRqc9yENVayyXRfxEmeP
	dFEALAoDFVJ+Ab/vK+HOesD8W3JY1amQtq7R+bDC7+nyje9cXyC+epcJb98I262a3ftQ
	Rn2K6oA/z3uJSjeKm0topwJJ2SsKFlRNypXLtZSyFDwzV8jTX2oo5eQ/k6gfTq4k1fS3
	/SDDci1Sbll0aixKrVjA8PgXT2J94hyTf/pzm8BtxWbJxuc9TDdLck7atEXrlDnf3fbh
	GJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pmNXQ8I+VsAbu1siGsncxdANDjG7wGWw86RI/ogu/DU=;
	b=qszs9BRs/rwoHwWQ9RENATCcnHdMt8dtYZQIPap+Z7TwrOi6VO1gpRMAPwhsv9BISU
	mb+0rAXAPzMDcY9yDXr3OlVjtjONToQpNGpYYZb3fiJMwIaQHsHCD1pfHwR5x0DFTRhG
	zb3diMiQu4idarglZ3mjhRc/1TrrP1RbzfcIVuOsrxaqwtH45jbHHEMZ+Bbm8IZHvosi
	mBl+td+qP4aHqTjNFJsSeyZp0Gh037E14iOF3WXw0M955+jMXgR5epGle7epR2WsrsTW
	w1zqUiAnrsTmbxws9kF0JpEQle45Fqq/Y87xuP6XJ3ya7fgFmj6p7eo9FUrfoHAVgOAQ
	7r7g==
X-Gm-Message-State: APjAAAWuHWBV2wUU0tbBKdkxz0oiHy8XAnXydgT8kLZmuJsJSrlSeGJv
	Q/JAOoebo/JGDXuzpVGaneMRnaxerIQ=
X-Google-Smtp-Source: APXvYqwvvBuY9hNR3GyDyI8fSoyzu9yMsGAzs9V5YTg//+fBoRUGn34pPuc/fJCWdmre1MK35eSAPQ==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr12806786wru.170.1577482300942;
	Fri, 27 Dec 2019 13:31:40 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:14 +0100
Message-Id: <20191227213120.3930-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/23] gnome-shell-extensions: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

3.34.2
======
* window-list, workspace-indicator: Exclude DESKTOP windows from previews [Florian; !93]
* screenshot-window-sizer: Fix cycling through all valid sizes [Willy; !97]

Contributors:
  Florian MÃ¼llner, Willy Stadnick

Translators:
  Stas Solovey [ru], Umarzuki Bin Mochlis Moktar [ms]

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-shell-extensions/3.34/gnome-shell-extensions-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-extensions_3.34.1.bb => gnome-shell-extensions_3.34.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_3.34.1.bb => gnome-shell-extensions_3.34.2.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.2.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.2.bb
index 8625a7b32..52e50705e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.2.bb
@@ -8,8 +8,8 @@ inherit gnomebase gettext gsettings features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
 
-SRC_URI[archive.md5sum] = "09e64640bbf0e978171d581e2086a0c6"
-SRC_URI[archive.sha256sum] = "b0ad51143b1bf40def4a10f8fd0ab0ffb47218304800794e62cadd29d0acc75b"
+SRC_URI[archive.md5sum] = "d3a69cde0c3e3dc0b0c243af026c4b7a"
+SRC_URI[archive.sha256sum] = "a1e16e75a06ea511435a6f7478de92aff21d02d4e1d59ec8ce7fb6396819b4b8"
 
 DEPENDS += " \
     sassc-native \
-- 
2.21.0


