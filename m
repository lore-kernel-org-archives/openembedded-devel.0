Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id DB02D7F2E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y8so3491959wrn.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Jnu/M0AzXNAF8ahI3c08bVU5HuhQeMo1j/DeucwvfoU=;
	b=A61lOe1Yl9UkO85rjOvVEnaZxXjFZ2oxrFL2UCwnyKxgLrzsXmXGgwOHcSieM4lFhG
	6JC+abaQqYGlZo3O9LE7gr8miRKbufzsMHfo9l8Yz/SqoUFpSbF+pCu7IduTMtemWvJK
	Kfas4F32ve+SEEQ7DP5mkSAz1XCHaQ5CtVNyYgN4sZ/qmevX66IlxyI3QewkBO6W1Unw
	hB2nucv3DrWB6NyQzeDPwEtF8/aPyN3vDvEYZGxQEfhBussS6siIAuyU0df37PONdBvp
	Ws/jLsHpiPe7Ndn62UrD6I2ObQSrn4fV11M5FCS+N5q1EKoaN72UGmVLAv1rBw5uDejO
	BcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jnu/M0AzXNAF8ahI3c08bVU5HuhQeMo1j/DeucwvfoU=;
	b=NVLu2KnwKw1PaLVUvgvSsooMcxXVjARD0tF9NXdfYo2aNZWg4ekim976c4h2mvhCis
	cVP5GyzKsW+JXDZO9/1lqvu168hxB2I3pOiyZa+dOuUXYXWMe7/eg9VSyAgupupSBQ+P
	iMy65SNUVXeR0L6y+pigP1a8bDXel9VXZc+utcts29T+0i/lVlnOgFx1jGW9sTp0Fwtl
	yKXkXHtoPfv4mLe+PNNayf0E/8NqSL4tBr8pnwbWwqdAQir16I0KfGvS8rMF9YN1aipH
	zY3R5PmqOICVTWBwATMhgIW3qeX45WJ4AkNiDY+wtu4xr9nOrHqXTqd/n/loK2dBDq6t
	y4Xg==
X-Gm-Message-State: APjAAAWj8BcwuM+hs7f1qXiklCc+7J0sGc3wdbWWp8rnx0b/MNLjn3yt
	o+tnDVQbHc0enSpP8Jv927l0ly/B
X-Google-Smtp-Source: APXvYqxqaU6BaYLVbhE84bN5+Vw95YIybPFcItGhAbjmZRpg0i+EVQ0E+/deajcSn//cpmEIpm+biw==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr3332805wrj.16.1565906176129;
	Thu, 15 Aug 2019 14:56:16 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:54 +0200
Message-Id: <20190815215605.19600-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] xfmpc: upgrade 0.2.3 -> 0.3.0
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the first stable GTK3 release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfmpc/{xfmpc_0.2.3.bb => xfmpc_0.3.0.bb}              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-multimedia/xfmpc/{xfmpc_0.2.3.bb => xfmpc_0.3.0.bb} (55%)

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
similarity index 55%
rename from meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
rename to meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
index 869435d68..0f5ed8957 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Music Player Daemon (MPD) client written in GTK+"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfmpc"
+HOMEPAGE = "https://goodies.xfce.org/projects/applications/xfmpc"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ libxfce4util libxfce4ui libmpd vala-native"
+DEPENDS = "libxfce4util libxfce4ui libmpd vala-native"
 
 # While this item does not require it, it depends on mpd which does
 LICENSE_FLAGS = "commercial"
@@ -12,5 +12,5 @@ RRECOMMENDS_${PN} = "mpd"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "e2d2faeb7a6f62813e287f3d12522b71"
-SRC_URI[sha256sum] = "4189c0c82b66b758a6d5bc651493b675d3d46329e5f1a76ff26c448125f4fcb0"
+SRC_URI[md5sum] = "e6ff8563f159d1e727d656fb88964998"
+SRC_URI[sha256sum] = "c76e2a88dc3e1d345da7a5c68fa39981494c2b40033748efcac54411c9e65689"
-- 
2.21.0


