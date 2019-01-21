Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6B70E79FAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 22:12:55 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id d15so13207314qkj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 14:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VBzi9aaqIRVKe1sXyGcoUZa0KpCsGo/dA9Ubu1lY80M=;
	b=O/arbvrweGgdCTER241OOWaCM1tGJafqzEk8fWZNEOCZ2JdSy4yPKKzFoUaX0tFFWk
	3w78HIVLSwPSIeTsGAXu1b/35tCCaDG+bZBwm0vTKoAyFrbDc+bEHo/KYGuZ+AeNVjzx
	GK+fHWIi0fi5iUiIIeKyEw3yMspJHfp6xrZNu97Y4VHZ+q8whrG7CZJ/VY5HdkTJfc0Y
	zWdUvXGdux4ihrbXoBdRzTs/XrTnUEZ0CXKC0uS8QnVzswnAUfrGcOYVR956Ab0g42AO
	tlMvxeyWkJx+NHflfuWoYwnf+564/YEIov3GMYQeLOpNrFIdVMEQ1nXxVIGUMPV3Ab08
	fxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VBzi9aaqIRVKe1sXyGcoUZa0KpCsGo/dA9Ubu1lY80M=;
	b=TzZzh5dN5/w4Mcmj7ND0IuEwB3rnR57SGOwZ/BVkzPPs6dKpPl81nKJ2WgabMG7E/E
	A2II13x1gjxh7Vx8kJgF3CUasFrnp+Paina5Oawg2Z5fdPnYHapFDSW6XlYr4tQEZKmf
	EAggLMDQP1LdfUNioXZOGww50hODuF88hU2Qae5qE47Jz6UgUGBtRIPEZDEVuC5Y8JZO
	SsB5pU1VPo7ltw16uOsnML/8nYFkGyEGhlh5yzpT+z6hKCr/dPM9NN7fbMc8Lv40Wd7r
	PO187fbR8KTjFccVm7hAwgJG74nyiIoF3zr6RSx0fAukLMe3uueB39AbynbhrGcOrhb+
	tUdw==
X-Gm-Message-State: AJcUukd55k+aNZVE3801/AKF+ZKBLCAfnAaKYwQ7sli24gnd/y4q8V2+
	GB7XR6bFtola9p5kA/IXGfQM8wpv
X-Google-Smtp-Source: ALg8bN6cJks1h6EVlivdpJYpcjSBkwLPiwHoPk9gLyUQhFz4cDrV6rejjIMkTFv7U/tzoEJuGa1OHw==
X-Received: by 2002:a37:9584:: with SMTP id x126mr26184462qkd.36.1548108776153;
	Mon, 21 Jan 2019 14:12:56 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	v50sm64083489qtc.7.2019.01.21.14.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 14:12:55 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2019 17:12:42 -0500
Message-Id: <20190121221243.26254-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libvncserver: Make PACKAGECONFIG easier to read by making the list multiline
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
X-List-Received-Date: Mon, 21 Jan 2019 22:12:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../recipes-graphics/libvncserver/libvncserver_git.bb  | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 25917756fc..d8f51c751d 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -5,7 +5,15 @@ PRIORITY = "optional"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
 
-PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
+PACKAGECONFIG ??= " \
+    gcrypt \
+    gnutls \
+    jpeg \
+    png \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} \
+    sdl \
+    zlib \
+"
 PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
-- 
2.20.1


