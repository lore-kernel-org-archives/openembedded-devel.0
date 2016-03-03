Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D6B7F77087
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 15:50:38 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p65so37144928wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UeJy5iUC2DuyWIq7Nh4wSOXSMpk9qRpvRNgK0ttpi+Q=;
	b=O7H0/tB3yIoH0hBKZt7L4CmmfECKeRF+R7r883T5XP2lOo66beO83XShJmPmItdK92
	apc88wco/BSTzb46P49Y5Ms9SQf/b+WIJeGuepTsPzcXOYZhtMGP3r7TZYfMkMkTe3fb
	XkHfpc1vuLA4UNUxiREHozlU0A4u5DkJl7V9vhxZ7Wsw87yxTzPZwZa7v+Ztgzu+tAk8
	2doWn52Ye2+eKX6tr7Ytal1Kh4XeY4G9YMRn81Aybvxpj4c1gCdKkmvWBc9etovr3ZS2
	E2m8i54PftnGlfuEV+xF8NsSxx8LlSjuqMTUiL/ummjcEuFuG/VJ/xHREyabE4bqc16e
	tDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UeJy5iUC2DuyWIq7Nh4wSOXSMpk9qRpvRNgK0ttpi+Q=;
	b=OqeNaqi6JaHWtEGBbciXcsJ3ialwLKEmE9oC71avLV344WPX/5yQyaMDMu31ntvs6j
	ovnVGIu8AJlRDolELdGMk8ODT+1b518kdtjqgNFGbzXsqR6SpQ1rwaUvzpRsafA7wzTN
	p/btwWk1GICHCo/6SZM+rNaZG2q8PZXVTaom7ltFPfk9HksId7h84Dk99jBSFdIlaTnV
	gEpk8iHoUhJYfFsvBZFsEMLVlc2WZROw5DfEdMiaOc1l/tq8+atir1Rxa1GmzofMEgv3
	hR8Ip0m9+VZEwbOEvDe1rIFCDYmvECQUgIFcePWi6Lxu64OBPGtfFNiT/cbseqfQKvFM
	1tcA==
X-Gm-Message-State: AD7BkJI+ZhYs6fePqiyObV0fqOisiMZCDOIzLSbU9f1O6oJ3JB1Erm2R+z80ALKdWdWAPA==
X-Received: by 10.194.2.41 with SMTP id 9mr4129595wjr.10.1457020239225;
	Thu, 03 Mar 2016 07:50:39 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id z65sm3388184wmg.1.2016.03.03.07.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 07:50:37 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 16:50:28 +0100
Message-Id: <1457020231-24024-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <20160302192515.GG10529@jama>
References: <20160302192515.GG10529@jama>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCHv2 1/4] vlc: Fix typo introduced in 0f2b3139521570ad494a72399f8a9dae76e69b16
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
X-List-Received-Date: Thu, 03 Mar 2016 15:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

vlc-2.2.1: vlc: invalid PACKAGECONFIG: {@bb.utils.contains('DISTRO_FEATURES', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11 [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: sdl', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: '', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: d)} [invalid-packageconfig]

Signed-off-by: Rafaël Carré <funman@videolan.org>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 3267dad..c77f2d1 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -38,7 +38,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
-- 
2.5.0


