Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9F57677042
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:43 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id w7-v6so17787900wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+kPXFCIGlix+9L+AV58axdLNi+0w1VrvUDikdPxzXOc=;
	b=r0rWjrVldaCQCuWwcWbzJyXSDcjeZNEU0gJkUE+MBrIiwWx/XXmDPvXSaaMg5CeU+k
	4zoObkAGg9XUX/CXRdDdAnsg5cUY3ZbE5/Yl1YXlQ20pf2mEQWNg938/tX7ARf5Dj9T3
	wRMIPslzmCDhJQF4fy8dgrl/9upL3V5cbdA/nVuST54eV9YckyCaGFMPiVRa870Z1sBZ
	76UuwDY4dVUkqVBXmHRgI9MST+vkju9Bm8hBdgCtBof1m9ev4QS3Ygp004oLny00trO5
	YS/eIcQk8EVVY3aCA3+/XTU5I92ICS99fyieeMHIY3GsdHvsQlW+mz4/OVmjHdwTYpI6
	lvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+kPXFCIGlix+9L+AV58axdLNi+0w1VrvUDikdPxzXOc=;
	b=hJkM6t7boDDeWiDfhYvrnf9KYPOJtgGYOh/IvFUbXZgWu1KxRnl2EuEbnq3aH6cCZP
	gtPc3h9pGEMWuM2E9wqP3bUBb0qEUfwPr78FumGH5gECPqkaZpqJ23UzJjM5qlzTrwtc
	Sc6WyUorFhuYLV8BPHFLGrLw/9KKAsxarLmid/l7flnlTvgVBt+etG0gCjJGZN6IcZm2
	mRUzxFLf/KWQuoKTu2tGgIjqhzN6nfIBUn5iHrsPfxDCzxrAXq0ICsuivHhO4rldfCie
	b8pSwGVTuW4ms98Ak3kn30VbCKyk0fJbEKiGfwfszWtN0cXb5g9reIcDxQML7P6g1oPL
	PHFA==
X-Gm-Message-State: APt69E2fSBv5jQ/f5YPah3KHnzvNPm+oTbxWiL6z37ufloX74Kdge01F
	cWF34hiIzc4slR1ReXcDiOUeng==
X-Google-Smtp-Source: ADUXVKJiHXD59a937jBVTW8oTpv0zSfLIuWxQGHOg/iPupdtbsRRry3KvAHB6FfHVBhmGqYKhAT55A==
X-Received: by 2002:adf:a0aa:: with SMTP id
	m39-v6mr9954891wrm.125.1528643323974; 
	Sun, 10 Jun 2018 08:08:43 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:04 +0200
Message-Id: <20180610150821.9536-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 02/19] libxfce4util: upgrade 4.12.1 -> 4.13.1
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a development release but stoppers could not be found.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libxfce4util/{libxfce4util_4.12.1.bb => libxfce4util_4.13.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.12.1.bb => libxfce4util_4.13.1.bb} (54%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.12.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.1.bb
similarity index 54%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.12.1.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.1.bb
index d985a0024..d18e83823 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
-inherit xfce gtk-doc
+inherit xfce gtk-doc gobject-introspection
 
-SRC_URI[md5sum] = "4eb012b6c1292ceedb3a83ebfc1ff08d"
-SRC_URI[sha256sum] = "876bdefa2e13cbf68b626b2158892fb93e824e1ef59cf951123a96cefbc8881d"
+SRC_URI[md5sum] = "d1d81519accfd09b5bbdc6ec0f531366"
+SRC_URI[sha256sum] = "278013dca14bfd50c9efd3898a28e3f3c5053b506de257267947fbb852d2ed2c"
-- 
2.14.3


