Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BC3C97E40C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y3so4526860wmm.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PZDmn1MlwqpRWa8x5w2F/gabonaRSScw1mwbVbsTljg=;
	b=K8j87ORROE5SJKcYufeTXG2C5jawEHF1/iLA5RXLWQTMfiqHLTYJXYT4vU5xGBKoUp
	Cmac++RbEB2k5ngGuqioE4Uan4SvwepHuzSWE5K1UGuIawUdbAYKm1r1S6aeiZPcw9lJ
	emF8AFhqiONai8y4Zc24nV5c5SFgviSgOEPyn4DAk3lTYOikV4ieCGsQ2aj+TitgflwQ
	qCH8CHd1AAsQ/eEmtsciUDFRZeQ84/iEUO+Fc3P8n8xeVpnLwda/mXGSFtGksFABQba3
	rVLHoew1arAtNyNBiDfPgWWcYL8UVIFgdEw/qV5AOtCW86LTRsek9r1XdusvgaQ/Ccpd
	IaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PZDmn1MlwqpRWa8x5w2F/gabonaRSScw1mwbVbsTljg=;
	b=hm4noyB9ARsHDhuz2ncJXs/ytYwY8io/ovLpM2hSYokIXzkTwUWKXV0YHyxdtT2Dsz
	/3/Xd9LLcD1eVRLLk2HeZYyqv0jWK/xFu+ElkZbAoznzqE714TgPxml5p0Kjj8UhZkDi
	ayUI8hJhdebHsHwN+qAIXGU6OSbV1wr9uElRfBdyOr9Cl/looI2mV1EW4E9fbx0sAZ8O
	Z0biKZLq/Snfc/LDu0B5Nq8IV9crmp9WGpixtHnwAk8zs3tqAGD75766EYjKvlWmK/Ih
	GG3ZMpd8mOBCPbfxPik1tbxG/uIFRazUXGSLeduL7GPuQXQLHi6wu0dJPbAlj99t36W3
	yiZQ==
X-Gm-Message-State: APjAAAU4vYPUIK43vif4UYhkjzgQQc2aTyWaPderd5uRoFFKmjuiF43l
	MgezeRFvDxvduUSqD+QwsdRo4J7V3gU=
X-Google-Smtp-Source: APXvYqznahuvVETd8faDZD1EjNQwIDXZUb6aNMQQ2gjGa9Kxtuljs1ofUbhRuC4IH2L8UrUhQ9OTgg==
X-Received: by 2002:a1c:20d2:: with SMTP id
	g201mr10461167wmg.148.1558594160443; 
	Wed, 22 May 2019 23:49:20 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:32 +0200
Message-Id: <20190523064859.24336-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/41] gtksourceview3: upgrade 3.24.10 -> 3.24.11
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
X-List-Received-Date: Thu, 23 May 2019 06:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this an improvement and bugfix release [1]
* add upstream-version-is-even

[1] http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.11.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index d91e479d8..f7884930c 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -10,12 +10,12 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection
+inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e43337d17c40eae440a76630db76c54e"
-SRC_URI[sha256sum] = "ab5406cdd0bdcf66afcd52b1e048a2f43c0f3ab391644ee30d9ac419b93cd59b"
+SRC_URI[md5sum] = "b748da426a7d64e1304f0c532b0f2a67"
+SRC_URI[sha256sum] = "691b074a37b2a307f7f48edc5b8c7afa7301709be56378ccf9cc9735909077fd"
 
 FILES_${PN} += " ${datadir}/gtksourceview-3.0"
-- 
2.20.1


