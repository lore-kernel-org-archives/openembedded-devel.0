Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 086D87D3C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:46:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q1so1123645wrp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 16:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ls+0OuBFE8oNwRfuBcbI9auK+btakY6wzPnjqoAsVOU=;
	b=olaZFnW2pCFG0mtqAUBgZuydoLEPeGwC8GgWCIjKkScB5TAV/7nph+g5uUxtiGYNSX
	lx7ovgNrReCHJcAmvTIrkc/DGULZuAdiG8QWEoEa/MIoiZ4tlJuplOmeiQcOJc+C9Nr1
	hv6BHUCL/yD7wstkw1jOwTNo6wr5TaPGJG3y4Qd3eMgAb1EWLmej7pWYbc3jQXuOBdbE
	RAdCeFRzkiAsHVnANW2EmTUoXk9nUnLhx6XbBqBXMQ3eMkh8zLkJjO5HXbMW1rwscBAZ
	gvi/DJQKVWhFrENDI+0oVaxf//ZnDboINnh80FiGxktfmSQBC22vEVduNPMMIez01E8s
	v9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ls+0OuBFE8oNwRfuBcbI9auK+btakY6wzPnjqoAsVOU=;
	b=gkn082jEXobpqKehstuz54sjgxpvNcowJoTgS+KC0Q4UF7kkBCdqVirII6SiskkUDb
	0fH6QFQb5+KXW+00dUfWw3ZonnHkrc69ngM3u+/w3D6loGQXELZwRjU1ltmFI9vCfNJB
	8N0rLIHClZQLrvMVBrYXWfFt7bBf2XEx0wSIetgS2O+29vc1VodDByPhtwBuW09Cia04
	gu/akSAAjDkW6XpKCB9fadsWTPFy+bQEHZUqivkHvt8G8YZedu2vcwvcxScxOSGE60tO
	AeMyYGeVcAuK3q9sMtaJuRajxfAh3WpZb3xAWnvJe3xif26YPEwa6yz7960MnOSdZKac
	daog==
X-Gm-Message-State: APjAAAURMgzJbZWIgJ23RsG3PMa/JYJ1KI0n2u/NgpU9K+m1AGF1dmZB
	5V3SyHZhQeQ/RS0FRNbHcER/+1xH
X-Google-Smtp-Source: APXvYqwYPaENSNvfiDgBRYwro5VUyAoIw/Tjdm9oPXWdNb+vRiluyU+KbxcTruq6jV65yj+I+ey7Yw==
X-Received: by 2002:adf:cd90:: with SMTP id q16mr1566893wrj.75.1554335181469; 
	Wed, 03 Apr 2019 16:46:21 -0700 (PDT)
Received: from superandy.speedport.ip (p579734E4.dip0.t-ipconnect.de.
	[87.151.52.228]) by smtp.gmail.com with ESMTPSA id
	u2sm17400158wmc.45.2019.04.03.16.46.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 16:46:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2019 01:46:08 +0200
Message-Id: <20190403234608.20046-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190403234608.20046-1-schnitzeltony@gmail.com>
References: <20190403234608.20046-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnome-desktop3: rework gobject-introspection handling
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
X-List-Received-Date: Wed, 03 Apr 2019 23:46:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gobject-introspection is mandatory for gnome-desktop3 - there is no configure
option to enable or disable it.

To handle properly, this patch does:

* Make 'gobject-introspection-data' a required distro feature
* To avoid trouble once pending patch removing
'UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"'
are in oe-core [1] - set in recipe to avoid
| ERROR: gnome-desktop3-3.32.0-r0 do_configure: QA Issue: gnome-desktop3: configure was passed unrecognised options: introspection [unknown-configure-option]

This does not handle MACHINE_FEATURES / qemu-usermode case but there other
issues of higher priority.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280711.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index c1a67bda9..bba81663d 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -8,7 +8,11 @@ BPN = "gnome-desktop"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnome pkgconfig upstream-version-is-even gobject-introspection
+inherit gnome pkgconfig upstream-version-is-even gobject-introspection distro_features_check
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 SRC_URI[archive.md5sum] = "e423ed6d648c6c4f9798fa9cd9ea8d99"
 SRC_URI[archive.sha256sum] = "a6393dc5fc29fc0652ac84c73b3da205d0b0168128c4cf6d27797a08f3d07b54"
-- 
2.20.1


