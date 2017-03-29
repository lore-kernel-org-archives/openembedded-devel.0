Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 681DA71A30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:45 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id l43so6479113wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mq9a3PmvGwIQHTn6yMqzDSDN+fT+IVk1RGBNcE6Oyjw=;
	b=t1D0HFgyJmXCjcOyozKJuQB6nmhhVZBSUVjxhLlASe8znX+PvgiwACcvp3D/Qr+zDf
	oXMoMyIgK5pSCl/4c+/qaSInsuQmyeMdylNu8q2vA9L63uoqVaVt129qxuE38GBpEmWW
	I4PSiWEOZojLeN4ubDS9XO59LWaDGd73xwmOnKr1gsWWUlBepmVWjmErxP4oLU4f3Let
	eciW0WNsUsKgq+8tXDh91xAw8Z4kTP/tIJ6k7XFT1ceQTcwPoEo0jyVi99ViDP+bt93z
	DvEEqxQpaIdLgKlvJ64D8li35UmZqUJTM/s34khlyI3OStZIA4xO9xAJ7jSuEC+z8/KK
	RQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mq9a3PmvGwIQHTn6yMqzDSDN+fT+IVk1RGBNcE6Oyjw=;
	b=ftLpITL3KOVInIF+ESZwOR0M5Fdvl9H4D/hQjHydvtr9OnbSeeWgH3MWW0fgyOtoKo
	V9UtwAPp6cXGwnDAU5DhaIliaJo/8qZXQUJYvgMtWoNJyyhFHoJTZdEDGfG+njYVmXEN
	m5KdwkMKDmXxeTLIAYTj/1eyUFR5e/8LQ2y9TdHqipVXwfYOP0H7gMbajAwzlrTvjhui
	qj/GXTzEf+7UdNzh0WcXRVmjMec3baR7P1MOT7ezebsxw+K4ABuJ1LN7WfpbO1ZEvr0q
	FPGGGwSUFX5qe91/s4BYRdjkhdJONEw/UcRUBIC4VBI1pmFNhuf+tPE6Gp6YJtLpyNxu
	xUvg==
X-Gm-Message-State: AFeK/H1Mc3sMKMKnff8ELJRTUphmdXsdFUUHlndWqw7r9tIQv1g1czltPpIiLIuWBU0uOQ==
X-Received: by 10.223.172.21 with SMTP id v21mr32015712wrc.100.1490779006438; 
	Wed, 29 Mar 2017 02:16:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k128sm7294948wmf.16.2017.03.29.02.16.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:35 +0200
Message-Id: <20170329091643.32180-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH][meta-oe 1/9] hwdata: use github instead of fedorahosted.org
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:46 -0000

* fedorahosted is retired
  https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb}  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb} (57%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.291.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
similarity index 57%
rename from meta-oe/recipes-support/hwdata/hwdata_0.291.bb
rename to meta-oe/recipes-support/hwdata/hwdata_git.bb
index f00f73b91..50d35c682 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.291.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -1,13 +1,15 @@
 DESCRIPTION = "Hardware identification and configuration data"
-HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
+HOMEPAGE = "https://github.com/vcrhonek/hwdata"
 SECTION = "System/Base"
 
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "90ffce584bbcb1a5e77eac8503949f71"
-SRC_URI[sha256sum] = "e1007a96645cb3390aa9c0ed3f090a69d2302ce4d801914b6af1ab4ec85ede4e"
+PV = "0.291+git${SRCPV}"
+SRCREV = "4bfbdcf5913d6dd53336d31b8035708075e6fdfa"
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
+
+S = "${WORKDIR}/git"
 
 do_configure() {
     ${S}/configure --datadir=${datadir} --libdir=${libdir}
-- 
2.12.2


