Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1F27D52B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:27:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r7so850255wrr.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 04:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3qzXNjuQgcFBx/7IFc7O/1+P4GU/ZyTLX8wlJwDP3ac=;
	b=YUjMyTnjr/DFblZYkd26J+rGQxosgVnwjFWFiCQsIIp4rM1YS2QK2YxQPhMMktaVSa
	uADe3OvAZd9UgD7XvSc8E9BvoFbaqPEIorVDp9JoQIbMfQf2SWbUmVZgdJY3PGnvmVeX
	mJaCN7Cq8yd25F1RbiuWcnlQYV6OcOa9mLiBFDHAYu2JhslIthiicIFgUVFpD2hNOYXB
	587maMRhOdvwWNoICwMm24I/mDqAQT+bfF049lHfrSrd9e7+/Z6XoPuY0anjchaKgKzv
	uc+UaNMoa3mo+DPEPbMz4aS6FsFfMMwHPd49ohkihfRczTGtMysnjp+gOjEfdmeFRb0N
	XAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3qzXNjuQgcFBx/7IFc7O/1+P4GU/ZyTLX8wlJwDP3ac=;
	b=lP+mwlP7+J1ZOTVE4XPu4EU76vFnMXjRroZKAb63GJ6gZrhLSRxLccaXDIcYyjQgZg
	lrum8LAB/OrnYThLyJKKIDlbc03CpyCNZqXrBhqDmYaucagq5IlSP0hILSEdorkdalzx
	8JXP1fTy/II89/XXY55OHIOkUang1fs5OijtxkST2Xzh25DI9mhgTYQMY5sRcNo12mB2
	cGFDkhpGAXcn8HEXN0tbJ4WJZ4lWTT+AIgKAurVBBRcIwM4CWqSVgzM52tD1nu3qKu3I
	LHwLrzd04GcNVGYlU/oafYtEytz2SnPRyrZstYvUQJqjlNU4zaPH0+gQ4ahTdWHKxSYa
	+mfg==
X-Gm-Message-State: APjAAAVSN42G6bXjjudp+IpfLJAqM3HN0hcxJ8+jJOrxRowOgEKtkBsF
	6sKcr3aSmOAw+F/RltjZxztpEkKn
X-Google-Smtp-Source: APXvYqwctEjA1RtLe2IX6kBwi2vCtwsNQui/EiCDivQ5YMBuD1DIDoWEzewdFu9EenfbT1OiBOIDqg==
X-Received: by 2002:a05:6000:10cc:: with SMTP id
	b12mr20096240wrx.182.1556623669788; 
	Tue, 30 Apr 2019 04:27:49 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id x14sm1835132wmj.3.2019.04.30.04.27.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 04:27:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 13:27:36 +0200
Message-Id: <20190430112736.1418-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gnome-desktop3: set correct meson gtk doc option
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
X-List-Received-Date: Tue, 30 Apr 2019 11:27:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes:
| ERROR: gnome-desktop3-3.32.0-r0 do_configure: QA Issue: gnome-desktop3: configure was passed unrecognised options: docs [unknown-configure-option]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index ffd7dcea4..0acbb2117 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -27,6 +27,7 @@ DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startu
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
+GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
 
 PACKAGES =+ "libgnome-desktop3"
-- 
2.20.1


