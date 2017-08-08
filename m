Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E451371ABB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y206so4715378wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jJQ8+PKpkKZYw4SlnxCyds6CiO6mo/51g0M/q60uVDc=;
	b=Ki+dYADtuR3EH+1Lqb4drHUZjJOFUa9Ncy5RcGndhL5XigoEWl57uQwDanVFdro42h
	zUrad8wBTt4hkisy+ZpgOSsBK2bnPmsZJMha0yKKoTO554cmdGhE80Ng2tTYUY4drTC/
	IryJCsSO1syMxAWUaAeu2kKuFklG+Al06MLIVvvdJpZjqMrXB70wuCaS6EbrThPTjGzN
	wtAiw8D3qiXNA7nsLaBJY7mCUaXvB7MQCnKUowqla9IXECGB7j7unU6USz2c9xxAn5mC
	36yvFirV3JzcVR/IfXbBVuv9q2Tv2SzS5WSucve8hpGS4Zl5rRxlygHOejigMJAsOGEV
	yXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jJQ8+PKpkKZYw4SlnxCyds6CiO6mo/51g0M/q60uVDc=;
	b=Jf6+/Ulz8Z9QidHQGVsbsH147hWqbR2ZjhB3Kx+XHwgXlZcFn/2fAu2/Cgx9fCLQ4x
	3oXsD5P5iL9/yqS/CXmHIEZU+E3xhGBzsfIO/Ch+THdUm2zcIC+x48ZhnPhTFwtcPji8
	vmGyAgi4o9XnMuhv1BntbRiBVdjmeXyw1lY3xgK5ACrUP9ajYHNSiair806bFJeer+dU
	qqaEUg4+36DkderlI3aeJRXOAZn3fEqBnMzKaJxzf9CGbMZr0sx30dop1A2eDJj0SQ2w
	kKUiqZpWljsyUzENhfazimUFy7XCQuXIPZ56kPGny4fFGePIHWTKZH5gNieGIw5Paaag
	u4sQ==
X-Gm-Message-State: AHYfb5hyJwpmoPNcsfCxkHOvEeVYeDWbRsQbmAGJbI6hwIOCcdCAq+e4
	IX4dPyYg6GDtlTr1
X-Received: by 10.28.37.2 with SMTP id l2mr4400664wml.112.1502228316396;
	Tue, 08 Aug 2017 14:38:36 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:15 +0200
Message-Id: <20170808213821.17561-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] xfce4-terminal: update 0.8.4 -> 0.8.6
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.8.4.bb => xfce4-terminal_0.8.6.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.4.bb => xfce4-terminal_0.8.6.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.4.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.6.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.4.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.6.bb
index bc1d216..f42edb6 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.6.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "7d9ea57301d6a770e5db8e7ecd6e4cda"
-SRC_URI[sha256sum] = "c5c1163b30e7a43d56ff92a25193bf9f29ce60e6cf43e5988530df79c84cfdc8"
+SRC_URI[md5sum] = "92f5a3366e30f5f8238d8250f730b6af"
+SRC_URI[sha256sum] = "bc2a560409a0f0b666d1c557e991748b986ec27572a45ae88b0ee5a480d881d7"
-- 
2.9.4


