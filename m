Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5247D141
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id v14so552568wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GjuiWg9drMOZBzQ2Xr2jRHCYtkWsxGQpExIms7WUxiw=;
	b=fB7aE7piJsIkxGqsfnuRdCtxRDWMz4QZ7QCnqkiJrHMPDMfwOR1LTEhRZe6/lAgu+B
	qquHLmBFD075ph74UTKw9X1Bcc6MUjWQF6FVXbX6gcQa0ItFabAON/kMz0NrDPWnNCWu
	y2WLAFOPOYb7Hxh86/q42YVXzUqQqchUHuvv80xwku9sHEdG8qIpxhfXyUR1IUmWlZOl
	NyJKq9lINpak77hvhQ7B8iMPYADImf5IuHW9HkN8J3U9d+3EHkPh2j7uY0o+6rFWsF5E
	W2fMfGGkPE0CuMT0fJEJn9Ha/aTzZ9AW43Wx4GOlvG8a5/hKffhi1DfDAqo75XlSGb2L
	MlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GjuiWg9drMOZBzQ2Xr2jRHCYtkWsxGQpExIms7WUxiw=;
	b=P0aeYPDPy1XW1+rewpSNS1l3V5hlwRusDhbF1F1votfMeLpzsyZK2RB+3sBD/aI9rw
	YrdGMd/YdcgmNJ6CNp4pn1Jqgq4nXxtUkOf97eqcBqc1jLtbpFF/6MNtqkLDduVU/y3G
	Ab+zoBNFXv6oR7/rtvq0bbvh4AvQ7Wn4r5kbphhkMkXejzOr3d9fcN7Mti1StYzdNv0+
	2i9zwqYa8YUyfk7HVh7HKOipYRFF4WgpHXUQCITpB4ZpeNVsuREa0gPLsuA4MfZYgz7c
	4YGAWYV8459FQla1l4vOgTAjlpYMmpqU0FaMh0DaEjIuAAdA9z/3j5FUG88CODsQ4thk
	0pHg==
X-Gm-Message-State: APjAAAXvR/hRUdCLriOEAxzFFANu/LcfKAUhmx2UtFdBI6B5/SJxmEYY
	rhQMGIAJLNsnGDCY882w442FsVoZ
X-Google-Smtp-Source: APXvYqzBiYs+4dN8U9XUWYH97F4z8RO1kOCLEXMBsIzp2gGbfWWeOg+17PvYIEKqosUa3PQimM7+uw==
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr18037032wmr.94.1553700929871; 
	Wed, 27 Mar 2019 08:35:29 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:34:56 +0100
Message-Id: <20190327153509.23928-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/15] gparted: upgrade 0.31.0 -> 0.33.0
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gparted/{gparted_0.31.0.bb => gparted_0.33.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.31.0.bb => gparted_0.33.0.bb} (90%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
similarity index 90%
rename from meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
index 58beaf6c5..a9f6993fb 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "c554cc5734c50459dd551bd3fa10710e"
-SRC_URI[sha256sum] = "3b7b49a434d9e4b397bc41a1f5acab8539b9ff402b472dfd83ad77b2decd07ba"
+SRC_URI[md5sum] = "2f481ad34decb7021ca04ca305e79e7d"
+SRC_URI[sha256sum] = "5023b8c983f88a22e65bf6f09a12ea09369defc008981b52ee8b96a3879f81d6"
 
 DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.20.1


