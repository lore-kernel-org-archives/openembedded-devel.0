Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9013F7F29D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c3so3512947wrd.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NHPl/YueGeU8mCcH4jZOLHCrkwQBfHj9GxhOxyoS4jc=;
	b=EhosMRsTxoP4i3kD6WtjVfzwYtzU1eSpuRUCBZRYkTDxQD+6EoooaG6khhd4bl6aos
	0o9SnrlqDEVFKQ5SSYb1SjkJznCZPBVLkDzZ8vKooF7R1bUbwP7Ecy0ZBd5Fmx4AHus5
	7W3uGQQcbDfC9f4OKwMtCO+13Tj7a/BQ/G1C2dGmpaPVCRd1HaUcK4MUzfuEEDUpqUG3
	d3CaMUXuu9FH1CRgC96Cm+QWFoILr3p8EW3M40oCU/lAAfXSC6UjjENT9Rt2J8u7WBMH
	VnPSjKFn3bRuPQZU836OXxiKK/O+QLxC8VeCtpJkt4B+lW6rsS5KpgyNtgbSKq4lw2zJ
	e/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NHPl/YueGeU8mCcH4jZOLHCrkwQBfHj9GxhOxyoS4jc=;
	b=UIwSzwcZ6wVO0/E1g5Grt9p6B1Q9pD/M+Xqlhs+lLee6HO0Q/+Y4ZdTtc113r7MKX+
	DJ86pdUcPNkc+bRHYkMiJNGIBShp+LnQlGvMK9WDZkjjAgWQJnc6yVf+CCIA+GiyLI14
	LvM+KX8jCKzAzw/I/D2uefB8EIZIdtQtxMgTMVhZQzU1JkZ3j44l8HUjHta4U/zoMlBA
	m8Or5O+oheEyU/ZqAZNcPihQhVgjAD8jWre/aSXt7blbxSHWFXUQGsXlRx6ofS7JEEqn
	aPOBqgoqtfK0bWkHrkRb55GxfOXQc9uixJFEssbIQ6W+z+z0ebjdNXFTVlHM2zOQLg08
	m/sg==
X-Gm-Message-State: APjAAAUMrYNJAPLcAZ8AsiU8464S9ahJE0wotTMQrPZ8qZbP/y0aZfm9
	GjpAKovOzJwCg479DcnHj/GLkMOY
X-Google-Smtp-Source: APXvYqw9/kGpK2Ly1Lz+b5fYdTSUTd+KtLwuRCqbTKxBCAQ/cFWoiGmdy2g4C0nHi2o38xgucs6ufw==
X-Received: by 2002:adf:f30e:: with SMTP id i14mr7474913wro.288.1565906178021; 
	Thu, 15 Aug 2019 14:56:18 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:56 +0200
Message-Id: <20190815215605.19600-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/13] xfce4-terminal: upgrase 0.8.7.4 -> 0.8.8
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.7.4.bb => xfce4-terminal_0.8.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.4.bb => xfce4-terminal_0.8.8.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.8.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.8.bb
index 426282e14..ebc046b78 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.8.bb
@@ -8,7 +8,7 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "c861540dd1dd05f56e62382b3851cf66"
-SRC_URI[sha256sum] = "a88f98af4da72394f2cfbd7f14b0f053ec0a3b58a4f6a577836357c60a6c42ab"
+SRC_URI[md5sum] = "4295d4d783f6d6dfe92f5bb15d96f6c6"
+SRC_URI[sha256sum] = "8fba6a60d3a0fee07417ad7c36bf78cc45be1b27f0759e125051aa73f08487fd"
 
 RRECOMMENDS_${PN} += "vte-prompt"
-- 
2.21.0


