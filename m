Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 652B37FC83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q10so25040108wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=71eVvV+pJp3aGn3n4vKyMtpp1Ua26ZcYR3zFIKyCvg0=;
	b=hQ3xWu/aB7h5pIT2xQzA6r3AyCbrMDRSx4TweJZbVbBj1bF/iYg6Q2y8F4754jRC73
	CPn2Jmih7oDqX052vFip+MNi5XDYYPA3YWu+S5Q1nsKP8Zjs2aq1sHyK2L35+6iAcVOi
	Q8RSgMbIx/hXdj1Dh8rjfPtvTz9Ca4egGLbjRQh5hNxU+dusJjze9skh82mJY34hoqaU
	qZC+9DxKRTBOzp7Rw65nP29fkv04nFikO4Od0wilisfeh59DoEjco5znUW15y2xiR5FJ
	SGnpyuH8DrUKxq3UrAC3PIL4vRw6n7kmqOzyGodlH+JH0IJ0EkjvGOjspwcrgjCjvY88
	5HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=71eVvV+pJp3aGn3n4vKyMtpp1Ua26ZcYR3zFIKyCvg0=;
	b=Yaea+coCh4FslRBgGssvF0W5ETo1+EkNcvILe6c12PYvmlzUgyBD9XhaFz0W1ji8mS
	bWJdYVEP6WOtdXwr4XPYwn6QQ5kLVGk00D3ttKIz0SS74T+wBylJxnXyvCR+K7gg7rk8
	qnPRjdsgIPwFUaoXVbiCPIYRSJTo//ThQQ+tG/x8drjsDlgTOFD+rOnr/rFcC/f7+67g
	EoXGWGHckJI/hrCBex+B7YWDAns1BO/N8jNOi++Kp1pGZhwHJJOLu0C20Vf7tQqbWsrE
	dem8Yky1aU4GtvzgLlwRxWuDrjMGlg7+1zQvb9E0//0KbX62wtEPYyI3PVg3rDmmYTtv
	AfIQ==
X-Gm-Message-State: APjAAAUYV0/SZaVWvTDJ+1r+6rJSyq9XRkemUROiYxxhCpAWOuKNdLDi
	2i2bBLZG0vgiHOiCVnppyZVGZ16NK/g=
X-Google-Smtp-Source: APXvYqxWh4RTe0gqo8T1mWcjIStlpGAd9n5xZj1RYzhwbb/MLmbs+gp6WPAkV0V1Aylx7crCP09kaQ==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr7802784wrs.369.1579346889849; 
	Sat, 18 Jan 2020 03:28:09 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:38 +0100
Message-Id: <20200118112757.5287-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/23] yelp: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
index 348727e44..f0106166f 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
 "
 
-inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features_check
+inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features_check mime-xdg
 
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.0


