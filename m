Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC2E6160A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:58:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a9so3251807wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2j62q7mXI07w6gjVc7L9bpGr6OTG4SYruKD6iFWsGYM=;
	b=XEdvj9fEenKDWBFFhm7OEZVLu6Pab+w4J5fPFeINGgStshk56uYOhdfgoD9ZBHKe89
	QQzmBqjA8upvUrH182AtcrbDVfuixXyseE4YTPfCHAWBHZR0NExbQKmwWiJhWFS30+lZ
	xV0bldRkvkcB3bTW46cFDD9pBvzUY3bLATw1UfSsLAXr00eJWSfNVsDT/WTOc1nGwjx2
	z03HG40knjVNzxGz1m1qFubA+NYmI2erFkIBKLUAzYp5veMJCYJESH9X+kn3LF1i6XnG
	nh8U5ZVmGebXSHr1ZS+n4QF3nPY8UaBdFjgg1ss0vHqMXoxQwUXkxsPXixXZA/KeKUXd
	F8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2j62q7mXI07w6gjVc7L9bpGr6OTG4SYruKD6iFWsGYM=;
	b=WzivIOq8g0UF4/OQAXBPOoJPGhOlswvJAuZRuivfTwc+OWZl7NuJXCZ9GWTcCWWQUx
	wZwLMmRiGDto2TJ2jdxmvwArE0ZZUGvynzYTZOrxkz5huCW7U3Q0Ws5633+o2o8g/vwA
	zEFv/CIpAA46j+2ewLUDhuEyHuzJgZS7rNPPD7bkZPZQ9asWMdPL/3bDS+TLIc/piyIq
	OZCkYa2KbR3fJPX2OpKuh9Hqw6rMobfx6mecj6vxJ6+eRwV1rgTQz8mFm+K5KXfjaqT6
	4dIvmgnIJeS6UI5/MUrlIA2sL5DPsr54wo79rwUuIY27pYUCcLtm1D7uicg7G+kHH3ie
	NZDw==
X-Gm-Message-State: APjAAAU9J+D4HQYxE4jFLf3AspJ0ZaWxWkZAfiBuofAIryxiinUxMn7A
	xI58iwXw16XXDzGo9iKonrBhdYSY
X-Google-Smtp-Source: APXvYqxs77JxzcxcChkfIrDljU+SACZZEUIcZXQmZgAp+3KFigzU9y56XUtuEBDfbx6vz6QEM4f6FA==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
	q6mr5750957wmg.154.1582639080865; 
	Tue, 25 Feb 2020 05:58:00 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	s23sm24584075wra.15.2020.02.25.05.58.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 05:58:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 14:57:57 +0100
Message-Id: <20200225135757.13589-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][warrior][PATCH] drbd: update SRC_URI to use archive subdirectory
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
X-List-Received-Date: Tue, 25 Feb 2020 13:58:00 -0000
Content-Transfer-Encoding: 8bit

* 9.0.17-1 version was moved to archive:
  http://www.linbit.com/downloads/drbd/9.0/archive/drbd-9.0.17-1.tar.gz
* 9.0.19-1 used by zeus and newer wasn't moved yet:
  http://www.linbit.com/downloads/drbd/9.0/drbd-9.0.19-1.tar.gz
  that's why this change is only for warrior

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
index 1eada269cb..6192e03f99 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 DEPENDS = "virtual/kernel"
 
-SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
+SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/archive/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
            file://0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch \
            "
-- 
2.20.1


