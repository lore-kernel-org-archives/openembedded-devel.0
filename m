Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 74C966BA10
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 20:35:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r17so5376948wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2019 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=re+4OorgzoR8CZdg0nNJtLbSaYFalp4t1anzNI954Tc=;
	b=tMrSQUs/8y5tObbIupnKIwiskvGN1HpuYTnTvTzmBpLVXhwi5TZi6KGJcpltOP7PaP
	0XhFAQKIo01+vdWslzkDaju37Dj4qAYSpmfzCMe8ICMeJMW+ZlOKVz2NO59gwTUopbNc
	plJVEPEMP0Qr9Oncayomww3SST3d1FWgAFapXoKwyxh/tGItxS+KAEtqoxmSEB9hnbyU
	SfyDeZdkcIoBpHNI8V43zorfvz7EfCIFj0vgSwzm7bChCArSoZ5Tkrgh8NZwytvLfXYW
	/DqyxK8t3Yr+iXELk35VwiQl5ZAhVW82BwIwjc6rFw/BpR7CXquCRarodcDQgporKW3f
	ptQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=re+4OorgzoR8CZdg0nNJtLbSaYFalp4t1anzNI954Tc=;
	b=MViJVG08I42roHjmB64DJrqIaWQ6MqltaXevPggSgCImRHI74WwDPZ5jTNdest7Cw2
	z9UE68doYrhszh7hXf3AI2zVZgNp8QWgn840Cu0waX9LRsX2EcC2wwRhUQnEwj0EQQvl
	HZ/Xl90OOo508T67HCcO7kQQhb3ouJEKhe4zKWFp8ts4yLz/sShGjAd4pGBdF04qSho5
	9jWTkcEmIgs52l51uGfCvVNOM8dCiwTX8PNVz0jJEN2buLOJG/ttRFkhfYDqSDAlgzyd
	hNvbrupb68k1cTFizGkvqffTuyerYv15ksEwYR2min8EvEDl4l5ermlPrzWyUqdqtnMR
	nHmg==
X-Gm-Message-State: AHQUAuaFvcgJ3YmRiocXvvq1mG+/8Xo0dNw15UzLlcnNCJZ/AUYNJnQq
	YWt9Xcz6tG5v7sQGBWWqVTIXOLmP
X-Google-Smtp-Source: AHgI3Iag+02Lc8+ZYTNpHO5yxrfR0RQTNK6eDJNcmljrWiYNB3ARMjjlFPajvSq3ICavy7pDd9VgwQ==
X-Received: by 2002:a1c:2314:: with SMTP id j20mr257255wmj.142.1549658136332; 
	Fri, 08 Feb 2019 12:35:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F02D8847C49AEC1D0D8828A.dip0.t-ipconnect.de.
	[2003:f0:7f02:d884:7c49:aec1:d0d8:828a])
	by smtp.gmail.com with ESMTPSA id
	c18sm5026978wre.32.2019.02.08.12.35.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Feb 2019 12:35:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2019 21:35:26 +0100
Message-Id: <20190208203528.28261-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] physfs: Fix multilib install
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
X-List-Received-Date: Fri, 08 Feb 2019 20:35:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: physfs-1_3.0.1-r0 do_package: QA Issue: physfs: Files/directories were installed but not shipped in any package:
|   /usr/lib/libphysfs.so
|   /usr/lib/libphysfs.so.1
|   /usr/lib/libphysfs.a
|   /usr/lib/libphysfs.so.3.0.1
|   /usr/lib/pkgconfig
|   /usr/lib/pkgconfig/physfs.pc
| Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb b/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
index cc97dead5..18bedb892 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
@@ -11,3 +11,5 @@ PE = "1"
 SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
 SRC_URI[md5sum] = "359f102bcbd62accf84ef32f4863255d"
 SRC_URI[sha256sum] = "b77b9f853168d9636a44f75fca372b363106f52d789d18a2f776397bf117f2f1"
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.20.1


