Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E40F87FCAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t2so25052958wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=s6M/+kT+hCPcKRs1CmPB2x+pryAMvmFT2PN8nON8aXQ=;
	b=JZp8DRxayJcJPoHlooPkuKPNgxx3hQWPKT6lGEK0Ds46X1TlEVuIkkwZuhJAuD5uHE
	OG1VU2/iXrV2fpW6HwWcw7HgX18V6gcbUVHsBn06V2lhgVndV0tyVfQP+zH4ZLuoCQUJ
	FylNtIbp5AZgsQDkXCkrEkrVb9fEQK0yugQG82iDc7F+7G3AsL08PWExaMI1SMDhRsRb
	s6kRANeK4Ldj3Ty6I78zZ249WvjAvlS42Ex5lIuQLC/RLVXZMZCukidQyva5cmV/b6B9
	U1tujxB+9mVM07l4xhS/p5FKKVqoHPdx1Sw4dwAwH0go6qYMkLu3gsA5sQ1/mJ8oiD8i
	xmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s6M/+kT+hCPcKRs1CmPB2x+pryAMvmFT2PN8nON8aXQ=;
	b=ZfFSLqh2da5wgzL1Pda9IGbsYgOOek07uXqu1Lmozh06PKewr9EwLe1sWIBF/WFw1D
	6VZ0WuysMYEgMDElGPrLwQ9ylBKUFwPVzGK67mGkoNYIXTANuIx2CZsX3h9g0a+PBvex
	9ehvthv8bBkiYIIa6zgeSvjXtGUIwG++BZMhn5wrTRnv0MiikYv6+8burgpJ1GULUJ8W
	y/Xz/9YMCWam6W4LI34jIEwtXZGa/If8WKSS8FvbdjAZ78JnWzWTlfYvcgDuu/0jULBR
	IWcVZ3BDmqcdhD9zZkRbbZq8WMlNKN0p1QGKNxNCQXdLnquBYjYdcJwk0M64IQJakEtM
	msjw==
X-Gm-Message-State: APjAAAXT6+M6YiZfAG7yEPwkpsFr29LCog84jWE7y3guU4h8BmeKTs8s
	7LqsARgst2B7oRms5yRDCdHLfOYBdBo=
X-Google-Smtp-Source: APXvYqykH7/cxBJUaDmwLHrXUxLB/sSAVZneZXXdKL4hNE4TnyH04bs0v9FxxGDsKuEJOqeUedWLgg==
X-Received: by 2002:adf:b193:: with SMTP id q19mr7973467wra.78.1579346898489; 
	Sat, 18 Jan 2020 03:28:18 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:48 +0100
Message-Id: <20200118112757.5287-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/23] gedit: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
index 20806bd59..850ba4df9 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     gtksourceview4 \
 "
 
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


