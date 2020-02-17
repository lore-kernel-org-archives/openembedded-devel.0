Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C361160859
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:42:57 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p11so6091342plq.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xXC0CnefiujDY6iQri+6lGsDLlp6m0hxWSp25nDSqJo=;
	b=Gf/C5ISf9lPU6bMp8o7S+BZDL9rOX5ClYcZZBF7YiFlvBNZlyjQTaVItBNVvoirvYT
	iFtFmQJlpeQtDzPSa+yfDF9aLw+l6pxpUVvYGzmoXzbJxF02Qz5kwb49NbQ/N/xgEduV
	NGb+Twc1VBOcubUyxHunPsob8uBP42RvlRijgB1vtEJzZUtKN2ZQbSZfJk0trXkJ3PNK
	WrTvoN5M5HznfFriBD0JeS+2BVTwEaegdRT2I14RytfpSxNTaFt3gfBmCCJvRUIWEcNV
	ARUG+WTYjc4QzkuDjl5OzKpZUh0jn51u5KDGBt9sGnKEy/VJiFCIlTvXF/KFtan6auYz
	wvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xXC0CnefiujDY6iQri+6lGsDLlp6m0hxWSp25nDSqJo=;
	b=ZVoXhJD+rKt0KC1LRMo1gPbHzNqgIJHnSx5K29O3CVCtdb/QVr4R91iowEThTHmlGd
	AHSAlf3q6uUwSVQ9MeASbs4y/2a1MVlUX8TyadCQcm0+hpSIaJHMTaKKlcI+ObILiIqt
	baIwn+asmRFauKKJJ52tLrLkBPCsFQ5i2+ZHmQOku5jax4BErWYCTyFVK++qG+PQHAkU
	u9yS4riKMbPrymU9j3Yi9Wce3mT1KobdUqqaWFjURglA+w9MhtYL0s2SlVwvqXzf23Ss
	0sqWF3AU8NyhkHL3PhfNmVqW18iUQ8XHTI/JngkavRHdUViabs4G3eE7UwOnZpGoTM78
	Q8bg==
X-Gm-Message-State: APjAAAUlHLqW5Ad7+N0VnnnilnP7VrAyvivbbfQ6nFBKR08EWXxp5a/9
	bzS4Ih69JOKi88RdxofdVO2aebF7JB4=
X-Google-Smtp-Source: APXvYqykuidjnvLe+0vsJjvysKYJq4SVal89/e2FSg7eHPXyoYPC0gzYFa23q/4qdkAsHs3OjN+woA==
X-Received: by 2002:a17:902:7b92:: with SMTP id
	w18mr13985807pll.72.1581907378387; 
	Sun, 16 Feb 2020 18:42:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.42.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:42:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:42:58 -0800
Message-Id: <20200217024304.1131392-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/7] sigrok-cli: Inherit mime-xdg
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
X-List-Received-Date: Mon, 17 Feb 2020 02:42:57 -0000
Content-Transfer-Encoding: 8bit

Fixes
WARNING: sigrok-cli-0.7.1-r0 do_package_qa: QA Issue: package contains desktop file with key 'MimeType' but does not inhert mime-xdg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
index 2293f142b3..369e2f6f4a 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
@@ -10,7 +10,7 @@ PACKAGECONFIG[decode] = "--with-libsigrokdecode,--without-libsigrokdecode,libsig
 
 PACKAGECONFIG ??= "decode"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig mime-xdg
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
 SRC_URI[md5sum] = "3f45ce664bad529d8b3f78a61b017d75"
-- 
2.25.0


