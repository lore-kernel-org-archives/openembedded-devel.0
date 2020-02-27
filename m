Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id D18F66189D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:13:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r7so741840wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EFUw2jA81Ed56k1XFqyg0qxMetvHUCUvPyZMoQz7F3g=;
	b=uJMNdAW9E5fHarSUpTQQXDXUhKGk1q5esPF0UrFjQdPbYjTwPQxScnrE+PWbZxqwIc
	+MPd2Z7FBi5OVgpqPEJFzABZNjrqd/bPn0sYTfEEIGHnrXsAfUBVYd3u+9gfZKi8T7zR
	JAf8LhZPyjDZR5Bv66COHxco77it7A40woPETSbjDPcRrbTBss0mWf3cyMmvGFyGBeqY
	Kt07vij59gjU4xAZA6R32lMWzumQNCYHWIHTPWamAD3Sx3FmYeg4+lRXQ1aEpU+LTkoa
	hTP8TGnSt9RqzGLCYMG6xGO4a0HvW1z9OZXcHKB2GRblCzMJEj41DD2MQYsR/y2WrRz1
	hBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EFUw2jA81Ed56k1XFqyg0qxMetvHUCUvPyZMoQz7F3g=;
	b=rT9qgt04BlzeqLEpCq1DwOqpA1BGSB3LWgtL0UwiiW5WPGTVAdiiBHsvqo0nuJs5xR
	uJo4rHBULg9aH7eVS9yL1zWeVkybX3BNpnLosFJ2ftP9DyrVZ1hf6We28iEtqYBtf68D
	7w+5pXdL6BvxtzFACagNeIR2ud37GrQ9ECLDkfj6LfLIgHRXifUNpQ33RoSEQ077JzNU
	fXWFs5kiRyfMAn3+fFv/xuC3xrsm7op3i8hv+fJRvLIjHrn0tXC1U6/gjXMyxZjRDU2O
	zjcYi11104iL+dUjypVMIA1DNGiFDevQEAZt+FH+b7TJFUW7nxjZ94q4W4TgVbnPyGvD
	udvw==
X-Gm-Message-State: APjAAAVYnopAio/8+x+T1F2R2HP2CzgOJL2MMGtCqR3t2LoZWeQ+2ZN5
	SNzJ6NL7Z+V671Q+Sx2SkXQW7Kys
X-Google-Smtp-Source: APXvYqxPPiF2hymcZCgAgVdI5yuihNmlXU37sQ7acCWqIgwgGTUJ0EKsfeuEHY33XFMLwdTH4RQhDA==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr931120wrp.355.1582841580717; 
	Thu, 27 Feb 2020 14:13:00 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.12.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:13:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:42 +0100
Message-Id: <20200227221245.22944-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] gnome-desktop3: upgrade 3.34.3 -> 3.34.4
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
X-List-Received-Date: Thu, 27 Feb 2020 22:13:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.34.3.bb => gnome-desktop3_3.34.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.3.bb => gnome-desktop3_3.34.4.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.3.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.4.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.3.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.4.bb
index cdd11aa90..f9b053837 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.4.bb
@@ -14,8 +14,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "cdcd3006f55d8c8813315bef6f4f6b71"
-SRC_URI[archive.sha256sum] = "acc2efc847574fd21d8f200679f111c2b1eb5ae2c041e0034e7c18450a7d9c6d"
+SRC_URI[archive.md5sum] = "d682a05eb98bb2dd434042b6ac4f99d5"
+SRC_URI[archive.sha256sum] = "c53e72737cc21535f2fd4b72bc2fb5594741cfc3d3ce90949bc5cc07bade0cbc"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.21.0


