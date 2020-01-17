Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3A24E7FC16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:38 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y17so24064553wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DT5abPC8SAeudnT53iVyJYconvP4G/B+ZLxFMHTbAew=;
	b=tI77R+nlXuso2pq0zMQDZQPxxd4NHaK0LzqwEkVyi9Cp1SVj2O40pJnkoIsrrw3byC
	oZZBfnLE/XTdmm0mGy6EVaTG0t9E3soFLAZnG+JbDwUsF9S6z6B7iGG7uYs9/L6tNfjD
	e+UvStEQmDWXqZR2aQ7/wCj3Hor1StZggBLzN9UOlDkCPg1psCgCLkR1gkiIDMiICm22
	OmHgmSTRDRZe4LRS1+bOxB+ovy/iVS7/cynUYeMH+cij6bnoNzM66huGPNApsq0YVzVD
	tPfyz3sJ5+JafFQMydkFyLnItB6U/hN//MbJ0PsUR88QFiJs6tM1WJ1OWdjHndutDds+
	gZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DT5abPC8SAeudnT53iVyJYconvP4G/B+ZLxFMHTbAew=;
	b=owHQQRB+toJsRkUx/gXhEIjlopRAhGSzFs3+5Bqhq8OatY6dMT1KT8RGGNOsJurLVY
	oMFWNqU7wEfK31Wpi4ibCw9Wv/3Sz09mJf+8QqXQH6AnDbSTd8qBVej6uUZE8ZI9jVPt
	naSJh9vWNR/GgukkEQiohInDPify6zWvOHAUEfBKaWarDpI07T9Rp1eKlGWJ5VU2u4Xe
	pgGAZbTfeMQw8hqWNgAf8K+sSe0ydYTnCkFCS1SnqUE0y6nBgvPJlUdop4Ffi8ZPUu0B
	E5MNYQsQ+n9cz1nB6JAF8QqJ5I9w+gsWGyuh0wt+WZItnIU4744OSO4XSunDUM+0PCSF
	VruA==
X-Gm-Message-State: APjAAAUZ/EDGtMJTNyQjhOxs0dMcjALfxZ0B2uqM3rX5TV32tG69TUQT
	oAGhR+TE7jJ9W0c0g/LaxRx7kBq7HX4=
X-Google-Smtp-Source: APXvYqw0g9FSlWn1pFQ9aaFv3Uw9HB0HAay1v/uJGfD2rdnbXvrFcwku5wuRBGmX/xuj0JarbR+gcw==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr5295268wrc.203.1579296398985; 
	Fri, 17 Jan 2020 13:26:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:14 +0100
Message-Id: <20200117212615.32526-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212615.32526-1-schnitzeltony@gmail.com>
References: <20200117212615.32526-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] xfce4-settings: upgrade 4.14.1 -> 4.14.2
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.2
========================
- display: Fix icon name for primary indicator
- display: Initialize crtc->scalex/y (Bug #15971)
- appearance: Only show themes that support Gtk3 (Bug #15849)
- color: Fix crash in add-profiles dialog (Bug #15876)
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, English (Australia),
  English (Canada), English (United Kingdom), Finnish, French,
  Galician, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kazakh, Korean, Lithuanian, Malay,
  Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Thai, Turkish, Uighur,
  Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-settings_4.14.1.bb => xfce4-settings_4.14.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.1.bb => xfce4-settings_4.14.2.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.2.bb
index d326f9209..8013b929f 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.2.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRC_URI[md5sum] = "2f4171c21db905d9ba0ca9bee3fc7a5b"
-SRC_URI[sha256sum] = "e873e9f6b8e801fd9304ee100c4c76ed9987446c38429d02477c086431c0bf7a"
+SRC_URI[md5sum] = "c4816eeb518414255ead805fe220acf1"
+SRC_URI[sha256sum] = "ebf70ff83e4fd0cb33fa0c3e871ca4df5127a505b30b83a6f780cf3f181b0af5"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.21.0


