Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 830A07FC7C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t14so10077507wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lfW3k51yoEi+SNyYNOhyNrhRVdb5VUpqCDp3zFtdsx0=;
	b=h4VW3hq9fsVn13fhtHAuK3XpPTt4NiNPKBUZYVVSxeRb4KVHIshvMYWSbAII18puOD
	hZdYv4vH9SGCTip5ivphwkabYLpyT7dVoGLFlIxzttpXP3csFxBE41LCd58yokD3AeUq
	GNfvquhb0bzDN5XspoVKDTGhiSrhTL+p0KVT380FCtjWJy/f/foQal39BLYzJfmISZ5T
	+KjZpm22JRt3GPKcl8jSjcz5BURMbdKT0xGn0vZK2YRLkrWK4pFQwK7KxEBpWaqofzJS
	xIygIV9GqWCE1n6e0XvK7g/7TCy5XVJY3rma4HZ6ndjZVNgdj6IIE3XA4faBal0VcpkG
	zDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lfW3k51yoEi+SNyYNOhyNrhRVdb5VUpqCDp3zFtdsx0=;
	b=SdtxkshqRxKklKG4Gu4MZTJN1/PW/p6xAaL6h42nqx40xltvVKT1fned9eJJCnsK5I
	qlID4QRLU1SYKaa2cZa0MpV9MC0Qd1ndR941BULam7v3C7pjqDflxxb++SmpuBfYVPs3
	0i89bHzZ6ausQDdCgLxXAV2mo+c/Yi00XFVJp5PjikdIAknjc89U80PVn/lUzUUs1EN0
	hCNokSnBwDJ2/34tIuWtWHMdSEjT5BitmWN14GKl+t1gVOZDw0Y3RfXq+uYJMFOLDjrd
	sr6SzsEraEVanFCLglGD/1DhMTTsNw03UdDos3+VMhPtZLoxqg7nUb1f6E8BRkvG8CA8
	5VEA==
X-Gm-Message-State: APjAAAW5FCDdMJzfPRz3IPps+QeHsUVTjdLwf0Ddgd3sLQ+vz6djcMsn
	lyYz0db/KiESmH4ey56j2nTKRvcjOPk=
X-Google-Smtp-Source: APXvYqzvbePYBG4VveCKIm6TfK062hRURM1xC5zRyvH14thRfiqKjQLpaY4HkFvHIszRsGlZOYOgjw==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr9679802wml.49.1579346887038; 
	Sat, 18 Jan 2020 03:28:07 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:35 +0100
Message-Id: <20200118112757.5287-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/23] gnome-font-viewer: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
index d8f7e301e..cf202256b 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-icon-cache gettext features_check upstream-version-is-even
+inherit gnomebase gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


