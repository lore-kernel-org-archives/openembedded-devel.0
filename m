Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nT-0007Tb-HN
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:16 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so1672976eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=c74GF4k2EI+HxB7vXvsUVHFdOrHinKBAVXpHSqIoTrU=;
	b=XeURJx2LT8PNACqAxlSdjUDMuiyTwHI45sphmcJNsYWBFUUavXvnQU6Qb6qp8Xz3Sj
	oCncB1SjPArCjjhdi8saba3wU+rJuSq52EYEITAACxrwP03M7ppDdAwOryO8QzyPicYK
	obUrGnDm5+YGEUQxh62Nt5Chw8CP2T68ls68cRym8TFIaG2i7t7j17+dgjXr8c5lSdHA
	jd8fZLK9qEgwmG4Fpjur4iJy/ZChY3EWF9FLNJqnkPa6JzAV7jP6mhZIcBFF3x0awhyx
	OEmL1CUO0ycP0g1XYJ/Q2oFWKSeYUlW5VqGpEuxZCFUx8VvtUCOfuPaPVZBT1Y98ZyaP
	FdvQ==
X-Received: by 10.14.183.198 with SMTP id q46mr39983089eem.1.1365859789878;
	Sat, 13 Apr 2013 06:29:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q5sm16354370eeo.17.2013.04.13.06.29.48
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:18 +0200
Message-Id: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH 01/33] keymaps: move bbappend to oe-core subdirectory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 13:47:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps/keymaps.service      | 0
 .../{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps_1.0.bbappend         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps/keymaps.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps_1.0.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps/keymaps.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
rename to meta-systemd/oe-core/recipes-bsp/keymaps/keymaps/keymaps.service
diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
rename to meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
-- 
1.8.1.5



