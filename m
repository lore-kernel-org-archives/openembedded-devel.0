Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 80C6B7E457
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:38 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id m3so4884770wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=T05j4G4KgpmMlSQDx3/1Y5QY4r8upULw6DDXgiafI6E=;
	b=JrgWaNK3ofEqB7HXRC3m8bnEkWWbMoA2huUnqGqShd1D9BGB0wkIAXQG3jTTYIposZ
	/3gO6UOjHZ6FzXkb1BbKnnABDJZg4JSoB3O4cPDLepCYO881L7iAPAg1uFFv/fkKIjve
	DB4XTO4+gvAPZTDUggRrNVNBvDzQpoLYTDpnS89YNgY3qmrEz9ebxmcRuWGd9jC7jann
	JLDNxQlfoWwRJIg6amA0BvXbbF08eKW4Q+9KMOuuHZ/bzdCYLl7vMrl+zfX+XZt+Ixgq
	LTEUiYeZvwcgF4/oFOUpf0ePr5BFheHZR7wX0JbI7Cs1Irfg7OCmEZCyWlzdoMH805Ux
	Y0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T05j4G4KgpmMlSQDx3/1Y5QY4r8upULw6DDXgiafI6E=;
	b=IjAHr97agNQDFoUD1Zfqu3LsN+8d2pwKL9wTMNp5aLOMwkCRrG1nUyuVSiA8bAoGxb
	oWpRvooJaP2MWHpYBITksNY1TgpvDVKmd9QjdDhnB5znr9wTaiyvRg5/N/RLOdUpg4x/
	BDUZeeYYwnBKHoKrYUdAykUCD45dV7knS8ynf1TW5YXCgyolaOLkjvDmQEV/Sqwo0ztL
	UtoXk3m4S/x68jmUaZzmsX2nERBOusKnYJJKp92qTOI3A2sieqBOpjCUpKHGS8fWGXlN
	Qs4gH76yaYF/EndetFBkwpeRJ/7Ok/NUIIr2B+QmgDZlErAtmEKnZ1YU+CdeuPQ6tgli
	1mXA==
X-Gm-Message-State: APjAAAXlVfrhu6sl855WsC3Pc+2T0M3RCeG/uieKyIQFkhHgbr0vQaHw
	DefodwJdi6r/ozgeU+Ia2oqS5DDywWY=
X-Google-Smtp-Source: APXvYqwrANHcPgAWIjk5bh7PXBOQczoE/CK8aNRjUrCvA33tdmdddtUsI4i//xfl2Ggz+OOZM3UFnw==
X-Received: by 2002:adf:de82:: with SMTP id w2mr6537522wrl.53.1558594179208;
	Wed, 22 May 2019 23:49:39 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:54 +0200
Message-Id: <20190523064859.24336-37-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 36/41] libwnck: GNOME_COMPRESS_TYPE = "xz"
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
X-List-Received-Date: Thu, 23 May 2019 06:49:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index ea4c8df53..f50b9ceb9 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -11,7 +11,6 @@ PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-s
 inherit gnomebase gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
 SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
 
-- 
2.20.1


