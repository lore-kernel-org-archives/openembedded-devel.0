Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5BFD6FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:28:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p65so4373586wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 06:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=FWsCf710eZQmVK6bxi872RXEqJKnWef+DqYHUmEJn2Q=;
	b=b0WgESkAU8fslWqfMP4K2vuMhE9MRo4YP9NpglSYzVjRSt2jmgkvXZ8InRWxW18BBk
	INcgt9LPy529yMn3Iz7irlgjx7XhoSBAkPpPXreqFFMbmKQIA0TgVB8vt+KDEz4Xy5pE
	kHiwx1vbME8Lesl+vudXNpMgvxjdEUajbwD8anhGsL+36b+lzvciJd6TOg1/5BjUhnuv
	7Vd8XNB+nNgNSGcLTYDG/2S0tUqmeLY1b1C1EvjM9qUVb9Bd4nPbwFSQfAUqtfYL3jsQ
	Lo0tViK87radUxHttQ5NhpjnZJAd3TPfC2eilgZDDw0KRpkiy2yQlwEN3yNvM89UWjPR
	rIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=FWsCf710eZQmVK6bxi872RXEqJKnWef+DqYHUmEJn2Q=;
	b=A8STm87OKkCTCL+gBfZ1XTwQeXEQBdBGHR8lQv0YeTPiWUzsMF+6Ve1Dk8V72KSTUr
	RYKohtbddQz3x/hATlWmi9mkh3RN+7qKNbnMFIs67atEikdW7q4n+2KgpTAy7Lj8iM/e
	bdX2kLslFG1fZfi0f2lQ/CUMyfvAzH4gLJ29G3g11B1f7VLaXaP4oc9qUrAyaoCuTpmV
	y1aF1ReH0MjBHdNauFIhFwRBm/i7dwW53dduSDYXj6XeHKTAwEL6OjCp08JZm41vBkK/
	I8kmmg4Ytwp9P7EfYVVRrD5lkxWaT+OuTmEQyEvH2MFUQPxHtX2PxSEmDb1WK9yW58nk
	BZMg==
X-Gm-Message-State: AD7BkJIJtCFSjokLbI41Pa2Kxg0Y1y8R/3XAw51U1Tvu9l7VX2C8zn0WiECo0Se6UL7jlg==
X-Received: by 10.194.115.8 with SMTP id jk8mr3607815wjb.136.1457015336308;
	Thu, 03 Mar 2016 06:28:56 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	k124sm9177231wmb.11.2016.03.03.06.28.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 06:28:55 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 15:28:47 +0100
Message-Id: <1457015330-16676-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <20160302192515.GG10529@jama>
References: <20160302192515.GG10529@jama>
Subject: [meta-multimedia][PATCH 1/4] vlc: Fix typo introduced in 0f2b3139521570ad494a72399f8a9dae76e69b16
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
X-List-Received-Date: Thu, 03 Mar 2016 14:28:57 -0000

vlc-2.2.1: vlc: invalid PACKAGECONFIG: {@bb.utils.contains('DISTRO_FEATURES', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11 [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: sdl', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: '', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: d)} [invalid-packageconfig]
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


