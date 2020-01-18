Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C3ED7FC3F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y17so25059677wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TdgHL1uUSO+wi+o29uErIe0h4jGvOqs4diLD9YIOzE4=;
	b=H/Shc7rHKvX0XKWYbFrUCcM/Gg6zCzvdY9qNWgFwB9GLj7H0lqUOQszmXxbrpTMv9Y
	d+KVnl3CfBaSE/eIJdKjmuQtqn2w9nf954vvz2WhPxL0wS+YjW0iufjuzSV2cIdcdozZ
	qTq18X52ENbMpSZA/AKOskjwyGf1z9Xxkj8Jj4/rdezNBO4IkpHn3uCQsnQ5/GqD8xTp
	Xo6ZuF73v6N34C/6MPLNsDEV6nk4/iLKXOA//5C5FrOWP2Z0q+XxEYmLp95zru+elGb7
	FJ8KdnFQOJDX9Z7yUD8iZCaNMBT4z1oGF6EA1y9i4i0z9mGNArYRmJ2CWIeT2r8+MqPf
	7H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TdgHL1uUSO+wi+o29uErIe0h4jGvOqs4diLD9YIOzE4=;
	b=KziW0ULexlPpsBDKtmeX3k3x0Tzp8W6yvu3/LEuoHjSW+riY/Q51MoFVI40N0AZWKR
	oeLedvF/lDZmoI/uBiSbsrjOAFgWnqcN8dlOqqrZrpyp19o+3hVjDDEw0+XmDB6yYqce
	KD3+P4VCvhiQFyEK/JZbfeBXzUEpy0Ny+jss8g+VOxiq1mWNnev62fYU/kxLBCX289xu
	th1BPeWvzIpPhUTgZdUU0BDTYC8eAI9/gJdi23+51RRyGfNj1FZzeUGcMqhkHtxJ2746
	XBNGLMSzEd9y8+f8coE4Qt8knKAgpKcFKyDQLeW0IJu0tjVyxtEH7yBzf0D4kZiPuSar
	KPbw==
X-Gm-Message-State: APjAAAWaOwiZtojkGPJN9lALmjIzd8Ty0K+TgcgDPPc9ueXw6HRONFWm
	kAMoAMKdxN2xQYZ7k5IQRSkpJyU6LN0=
X-Google-Smtp-Source: APXvYqxpwTDpq5YjUMqlajhoJRmwbKbYvgfmA9paK4sAkiFbu+yWn9JZ0g0rIogm9xC6Bqov6WTD5Q==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr7679218wri.47.1579346906680; 
	Sat, 18 Jan 2020 03:28:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:57 +0100
Message-Id: <20200118112757.5287-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/23] fontforge: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index b84806fd6..c12d01e2d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native"
 DEPENDS_append_class-target = " libxi"
 
-inherit autotools pkgconfig python3native features_check gettext gtk-icon-cache mime
+inherit autotools pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
-- 
2.21.0


