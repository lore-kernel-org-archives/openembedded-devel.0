Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 791FC7FC37
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id b11so14446012wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a3sD9MLyrQgCFNPnxiX0hWItEF/Xaexw0jZb3NPedcw=;
	b=GUj87R2Aj5l0CsDArmDRR/Vqi9oiiNP061slUv97kPkD2uBFb7plhn/Bk1NS3VtlZG
	tPTUog1Vmvne3YWovoJbzlglsBDcxekB2RM68j8R8Ugghm1cLO130nzxXqS6WUKU84fH
	lKhTjvvE52RTS3upJMB56KKU1d/ECg10drI9bv7Z7r43PFg1KSpX2c1cAy2VBAVob0zi
	Xw6htmPb6IhfnidEflMA6Eazz8f52ex/muZXI6/CnK3FPucLo8dny/EFLXstBVjnx42k
	ElSiwSP/ip6914vT25y0idWUBLZoyHeEpUmZLF4UM5i7A0BXjSbrHPJxgf2TrwgaGnuM
	7TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a3sD9MLyrQgCFNPnxiX0hWItEF/Xaexw0jZb3NPedcw=;
	b=a6VF2yIEmUb8M3FRSMnMSNYriv+kJmkda52lxvrtayxDC8DYwx0Pv2Gl2yteLoFXGq
	EyKdYp2Wy1n21uPiaKzR6k+G3euYe8PaVyTW4tB7QYkbciPV8dp9P7GmBfAkAkRGpf3p
	tyksWjglE0bLIrf53VxhX99k6U3/Dlsdr+QyPFjBdy+lfMmKvptWPJeAn0tQexDAikk3
	N5NKKkW3/cYquB9QoGGnuf8CTqzCzJs+oCq1kSSGTrp8B9Q1cipmTTS+VVcT1qr6nwCa
	ELiIYFuBAnbKIap0wl+R4QPBm2Hw1TE4lEBeIxlBJ/04CmTiYV6CbyQGPA8XgRAZs8i2
	UaNg==
X-Gm-Message-State: APjAAAVzLCDZgMsssXdV8HtzMaHmSnRgYKttwt5skwcQyUSzlJZY4Ufz
	WOlra2m5DB1r6G7v6rSIhpXxpohX
X-Google-Smtp-Source: APXvYqwILZSEfoSHL2s+uM/2Kbtjs6eHMmoi/XkxZCbMfN4LbLONAYLx0QEbHZEKAgZ4rs0kiGoQNw==
X-Received: by 2002:a1c:ba89:: with SMTP id
	k131mr23735990wmf.108.1575880599062; 
	Mon, 09 Dec 2019 00:36:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:08 +0100
Message-Id: <20191209083612.23922-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 16/20] colord-gtk: add polkit to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
index 8f6cd0431..7845509ba 100644
--- a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
@@ -18,4 +18,8 @@ EXTRA_OEMESON = "-Dman=false"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+
+# colord
+REQUIRED_DISTRO_FEATURES += "polkit"
+
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
-- 
2.21.0


