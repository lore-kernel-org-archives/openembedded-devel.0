Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 34ED67D01D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:51 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z6so3969240wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sAWittRzxlEaXlD/f0mfeLyESh1p7C01BU9oUgzIWNY=;
	b=RZmO+QKjDkEDrzBvKf4qzylse5ysB9uX0m4B/df51futQznzLbPsDhKyfsINAmoui3
	KGo8BdDF3UEDh5oi5hjGG8+ajNzk9nLM39DHX/vKd08sxxWnkdv0oIEwVVTUZNNHl93G
	4N4p78MbOtQiUhvfAHUtURlBLwi8BYEx/lBEVdxHj7U2iulx6pHTQrX+2u7VPGZt4+A7
	7cpXJf785yw5DmdH2GRShXEiltlhI3VFvFIbE0HE9/HGgPt4cX31GguvCSIvpUA5nd1T
	X5o0AF9EsHxk455oWU7oGGFHggPIUUQ/8h8rEo7sI5XJQqxhnJclB7XuPbZjT9rE6VRZ
	Wwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sAWittRzxlEaXlD/f0mfeLyESh1p7C01BU9oUgzIWNY=;
	b=MrVfziCAkARsY4FLWoyHtezllUdCHsT+gWBCy28MYp+ULSMzY+lfGK5OnN9x2dJDho
	YsLtkRl1B11tREbF6D7G9i+fi3ofnG5eQB3x+Kwocm3PoxUctDXfmIcp2iWVKqeRrNCn
	OX7V4KGM8OMMCv+p6YsgAXI2wmOpoFD+987JHZr66RDQBx8t9L+RqnjVfaY4Wkv2sLn/
	jhz7kK1ijvUlMwhP36dXu37KiCO+wkhfbz2E1VxLjRDbMj1kvSZycOtkAq3kbj57mQl9
	PVlL+LPlgLvHNwLY4mQuJu2udcVbgYx3ekDwUb6t2eZ/MKstL2ld5fSFvNj3mBE7Ndn0
	gIwg==
X-Gm-Message-State: APjAAAXtz9x//BZzGqL2nqLfeYAMSF9KmWclphpgwXmGkq/nQTw6jPXQ
	YazpIDsmT04cT4f9HIIgWbp6H8Dw
X-Google-Smtp-Source: APXvYqyJjB8aJMKbmfVSOlGZqTnOu3ftdB/yKGM+uRGjHBRZqsH1WNNaP3dSqQzCBNHGmEuLe7vdMA==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr2400394wmb.110.1553250111810; 
	Fri, 22 Mar 2019 03:21:51 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:28 +0100
Message-Id: <20190322102129.5067-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] network-manager-applet: upgrade 1.8.18 -> 1.8.20
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ager-applet_1.8.18.bb => network-manager-applet_1.8.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.18.bb => network-manager-applet_1.8.20.bb} (90%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
similarity index 90%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
index 01840009e..7181f5ecf 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
@@ -12,8 +12,8 @@ inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introsp
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "34923579b39360db64649342ee6735d8"
-SRC_URI[archive.sha256sum] = "23dc1404f1e0622b7c4718b6d978b101d5e4d9be0b92133b3863a4dc29786178"
+SRC_URI[archive.md5sum] = "06aafa851762146034351aa72ebb23d4"
+SRC_URI[archive.sha256sum] = "050dbb155566c715239dc0378844d8beed10954e64e71014ecef8ca912df34ec"
 
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG[mobile-provider-info] = "--enable-mobile-broadband-provider-info,--disable-mobile-broadband-provider-info,mobile-broadband-provider-info,mobile-broadband-provider-info"
-- 
2.20.1


