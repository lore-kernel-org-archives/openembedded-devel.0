Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD6767D676
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id e11so3029822wrs.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3/xEprhz1nCFgxHyJr57fAg99FUxaQzg50X/DK1rsto=;
	b=kBNcdCKmPUM7PCcNLC8FuGfz43iHgFJVB3GuXG5vI3Y7LH8c7PYCtJM28znP+2y4bV
	lO6BbK2mkZs2E6eGOOcbnUWD5WeuOMwMARRZvwTK5VORGopELsYxf06JLPrIutenSKY4
	qK9N6030IBpGkp6Z3tjP8OzEFsTg5B75SB+xuXK0sVOkKXTcgck7Pns/4IMrGy0rV2EB
	5pcYtKJoU5/kZ0raK9DHiQFwYBF0mrpTFmr+58KSAqlVI++J42mkPw9gCPZTmzgdPcMl
	3YulYwB0DjlDyjXUrMf73k3Df7uhcefKaMKH+cClj1KPZG1MhhILrkRl1Bd7r+sYJSxz
	rRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3/xEprhz1nCFgxHyJr57fAg99FUxaQzg50X/DK1rsto=;
	b=d9zn4mW+B9Kyd0vkZjuaaIjPO2UpKlH2OVDirAPIXUKqk6CdOr9EZpxDlu6U9sb95+
	McklnH4Vovuz71Zo9B1lUPz+h+Dw95Qzlr57g4BzdWMsoW/Ef1fI5Ns4mr8244AfLISo
	61GBOwTPYlng+UyPscQwA1+PGs5/MwLYBoqHPxD/am2KnLAsfyw4sN+TzPXTBFQ9HMIw
	cfLe7Q3TIp962jO3d85jFW595MieYw5rdRy9NDW5J8nAMRyLuWoTn08KZy5WbdR34vrq
	wG8gMyAQwsKctugYO+vBJSU4EbByFJZKE/BL47y4KxCNLV5m+59RTWuOdl67YA3vynKx
	bZ1w==
X-Gm-Message-State: APjAAAUK80mpTPkpylJL44FUM7ral8oIH2gLh2RPe0XpTc6Fmd+RENly
	WdjSHgb2AhRs7ZYeYrQW6HjWHIUS
X-Google-Smtp-Source: APXvYqwDAXYjZEUvb1GyRIyvMiz63nCpSifzbbYSgG7KApeKPEI7piIyA0GjO5QtwwVxGA+Ngo+Hpg==
X-Received: by 2002:adf:eb0c:: with SMTP id s12mr16211552wrn.229.1557131410231;
	Mon, 06 May 2019 01:30:10 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:48 +0200
Message-Id: <20190506082948.22276-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] xfce4-notifyd: upgrade 0.4.3 -> 0.4.4
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
X-List-Received-Date: Mon, 06 May 2019 08:30:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* A bugfix release [1]
* Dependency on dbus-glib-native (dbus-binding-tool) is no more required  [2]

[1] https://mail.xfce.org/pipermail/xfce/2019-April/036382.html
[2] https://git.xfce.org/apps/xfce4-notifyd/commit?id=841b4e4ddc2f757180e1c76fb32d85db2e88cbc4

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-notifyd_0.4.3.bb => xfce4-notifyd_0.4.4.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.3.bb => xfce4-notifyd_0.4.4.bb} (82%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.3.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.4.bb
similarity index 82%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.3.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.4.bb
index d7719051b..06ab0dfeb 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = " \
     dbus \
     dbus-glib \
-    dbus-glib-native \
     libnotify \
     libxfce4util \
     libxfce4ui \
@@ -15,8 +14,8 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "4887c62dfcb4c3e4f45c9acfb3def515"
-SRC_URI[sha256sum] = "293dda084cfca4887ae740e2725fdfc64412bc10eac7a55a924eb14482dceac0"
+SRC_URI[md5sum] = "9614d4f7c0790e8ab24e55896a44a8ac"
+SRC_URI[sha256sum] = "090571acf94c423003426cb779fb23e8545c68bab6485563b589c7def8a21b55"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.20.1


