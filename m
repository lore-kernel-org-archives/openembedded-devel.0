Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA9A6BCE7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2019 16:21:16 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id z26so5674253lja.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2019 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wtqtTC8jGac/Crc7d0YkF6xsFSrabOc8l0G90n7Pys4=;
	b=dI3Gv/aiR97F15U6wXgB3PwAlBPsrpKzpkcz3a9cabnWa6iV0g8X7HhcE7WntdTT/+
	E8Ep3F6DKgvSODxEp85L/k/DAIURcH1gp8KP/PY5qqIEqtWrqtPz4wl6purOKw6Ovt/S
	wi7NYMhNWEMDfdVcBUaOGGU2n9hSVW4ExsZ7o72XI4k1s6NQh02K2Dt12cL1GSHGKcgl
	p8OAnGZYan7Ae5naSifz3ytuUHlcd+tDRlEQaJRN5yDEE2N6FgqrVadF3cQNXhWVb08M
	aGd54LkZ5jLDAFWwQunwdlUBicnFotX4XvWW0q2mA4FwEEwKB4Z5fbFnaBeJAkG0Xlr+
	eC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wtqtTC8jGac/Crc7d0YkF6xsFSrabOc8l0G90n7Pys4=;
	b=tWdcN7ACucAB/yedRhNu82vbhNUJCCt4lQMnS9KsyHg1fZkVpac1eduDrRPRT/osJD
	8My+ewT9ZSYSaNK4UMxJklFcnCiJVsFstaHGgFWqMhc18ozoKTGEI7I2vNQXKcbCFSgG
	0qHmZt3W6hx6Qq6QkXGD1VMN67lua/PL73w7R527Wdhp+MJVs7hVJJQeWMCdjwTpfGDh
	uozZ/5I3khKOdbuXvk3iUbNaNJG0sHdFzetp+Mjx6sMHageoTQmIEBWyXi7O7X+bfGTr
	iwMznqVeaFW2SmdlWLu25m3PSLldl91iT4EdP8wj65zr57LT6WpisIMCp9Gurz+cZWrn
	PMNQ==
X-Gm-Message-State: APjAAAVqW6vypTfwLadIjGwkvhFg6zXlo5UHr6qS87n33GzTC5fJyNId
	DDh17dQ4KUoYrOtPLqNvD/elmNb70WY=
X-Google-Smtp-Source: APXvYqxXgDPe78K/Rd95TaNNBz9XrzEwqvDFyOAq7lGYWdxZfgiRoWUFy/whGfCWp+r+rKDiUGxt5A==
X-Received: by 2002:a2e:7f13:: with SMTP id a19mr7638058ljd.35.1553444476939; 
	Sun, 24 Mar 2019 09:21:16 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z15sm1024865ljz.55.2019.03.24.09.21.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 09:21:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Mar 2019 17:21:05 +0100
Message-Id: <20190324162105.11993-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] nano: update to 4.0
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
X-List-Received-Date: Sun, 24 Mar 2019 16:21:17 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_3.2.bb => nano_4.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_3.2.bb => nano_4.0.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_3.2.bb b/meta-oe/recipes-support/nano/nano_4.0.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_3.2.bb
rename to meta-oe/recipes-support/nano/nano_4.0.bb
index dbc548793..3d7921a37 100644
--- a/meta-oe/recipes-support/nano/nano_3.2.bb
+++ b/meta-oe/recipes-support/nano/nano_4.0.bb
@@ -12,9 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "2606dc0dc31a088f16c7d603b42d23d0"
-SRC_URI[sha256sum] = "d12773af3589994b2e4982c5792b07c6240da5b86c5aef2103ab13b401fe6349"
+SRC_URI[md5sum] = "2de3e8a60ecf09649e316e89be2aac65"
+SRC_URI[sha256sum] = "1e2fcfea35784624a7d86785768b772d58bb3995d1aec9176a27a113b1e9bac3"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


