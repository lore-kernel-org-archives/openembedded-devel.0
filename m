Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC907C377
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a5so9143142wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5wKUR/SBVGQ7TIGDMtqE5JMrguo7c2pjvwsC3a81CcA=;
	b=nj5Ugtt+noJZSm41O51s4VEdP0TnL/dTay3rjEwUrqilOs7KhhUJA2O+tp0Ruiw6sK
	2M4AZtmihAWbtFcdcH8CHGHtCDX3RtNpK9DNRWucNywi0PeF3lkbLoMDjzEPOubAVxRz
	fGMp1Yrv5piimnTtFBigM3gwo1tsu5GnDqLwAQML07WfUlQFB592mrR3+sqyrvqayN8A
	hEjThkBxqi9fdCsErkhTpoWI/wxZAj2hTRhPn+fHolNdXKpOhSybZUj5cglboR5ja8uE
	uLkIu8mGuDxXb9h1Nn9l1/UAdwVqFPu1sam7l+GHbSMSdNxPALHbWvuAdcLJog/oZAVX
	BkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5wKUR/SBVGQ7TIGDMtqE5JMrguo7c2pjvwsC3a81CcA=;
	b=N4SdTatJAmk9kTXUgo/YVzmf+xCkR0boSPYE6YrpQT/AdBb+BuYmdyuSkIkppS+wfp
	dwIDlBI3rzy8M3ovT8bfHZWgn6ZvDz+5YgsHdQrLo53ydYN+YL/9wGdvwGBqOrXMI0Iz
	11Y+BrldJ2I1pz/PW0QiTT9UjyO0qhPI5XU5AhdqCCTPzZOCXwjIs2kSk392/Rp9vGq/
	G17XJQeAZYOL5ezY0wmRGQSYYFq6EU1O+Ep4luMK3bzubcBfL5CE9FtzKlwgBHTNHWDf
	c1rRBMT/B8brZvh0bbuSiussqbgZ0mm8T4I5g/X/P5qTLCx4bEC/NqGG1mYXL8SJUmq/
	K4wQ==
X-Gm-Message-State: APjAAAWOIeTQif1krSeFz3RCcT26Ojlko7seGgBjglG0aFWeyUNCSmhd
	TsGJ18t02G+rWoHJzzaJE/h5xb2MEng=
X-Google-Smtp-Source: APXvYqxPiRaBIwOy+uZXqkO+3NfZ15iEuhROxzovoZ9j8JFHabbmT9bF7mcj3Ucmz81XVykrC074QA==
X-Received: by 2002:a1c:960c:: with SMTP id y12mr20644480wmd.9.1577482296807; 
	Fri, 27 Dec 2019 13:31:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:09 +0100
Message-Id: <20191227213120.3930-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/23] gnome-control-center: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

2007-04-10  Rodrigo Moya <rodrigo@gnome-db.org>

	* NEWS:
	* configure.in: updated for 2.18.1.

2007-04-09  Rodrigo Moya <rodrigo@gnome-db.org>

	* configure.in: build libslab statically, to avoid conflicts with
	gnome-main-menu, which installs its .so and header files.

[1] http://ftp.gnome.org/pub/gnome/sources/control-center/2.18/control-center-2.18.1.changes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ontrol-center_3.34.1.bb => gnome-control-center_3.34.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.34.1.bb => gnome-control-center_3.34.2.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.2.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.2.bb
index 5d58879c5..9e6e92aec 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.2.bb
@@ -30,8 +30,8 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.md5sum] = "8b0f0baea34fbe937efd0ad1be4b451b"
-SRC_URI[archive.sha256sum] = "5f82ecd5554136c462248ec5363b82d95358b39dfd6787006d8307b4504e515e"
+SRC_URI[archive.md5sum] = "a960a7d3e9f1c4f341bae42da7fbf23a"
+SRC_URI[archive.sha256sum] = "a85ffaf5885a8c70c019013d73792bf4cc75f643e97f6e8b52f7fbba9f7a9114"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-- 
2.21.0


