Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F22C61878
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 08:00:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g134so6733181wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 00:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZXF0rUOm2q8Y4dzF1953vHIveJDad98kwsw11kJCQTM=;
	b=dQFKM6VjQdOG/7cvflTiHSplc8b00sLDZ2ciIdRZFu4h5ahUeJ/KYY9j9CiKR1l/1d
	ZvLW/VXSJT/9HYOcCRIEEBluur1uZbHlzGzqOelT8+KKnoiIv810PpIKniWYE1nIbcZ6
	br+6enbg4Mv3aejYwLRUavuj7ZRh+RrVij/fBiyllj/dhiOvf2wWbRy8QsVzUjrBXIrh
	lnTJi5qET4vF573jYTnh9M4oejWJFdVwRFd5gFBT1AVNzg3/ezp0JAiLT6hOvIn/mXmA
	A5mnuE8lGSiJ9/pPnh3D1G+LISNNCVvsy34n2c7T8JDKANW39/kqq/8DVmk/+ertm/5r
	lMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZXF0rUOm2q8Y4dzF1953vHIveJDad98kwsw11kJCQTM=;
	b=C5fJYzNh3LwvA64DsYy1YpPSSNjYdGjk6Zxz/isKBYUmWWk3sLFsVp+zm+fp7rvb6g
	XFQupc9QUoSUrjNstueEAQmwg0sXOYxzSTGaGAM+OkzRoxgKtgot4OCceclSf/BT9zbn
	w9x3HVAwry+MxjCbq/yrkamBPiWTaKOzxayKskmy5SK9QwZ1FGK5m/J4arlcJvX/VuIu
	2tjDnd38/fIh6eYp4CQv+5n9mUzqH58PDCURlKpGnuKVzWS045xED/DhriSgCjh+/d/2
	0v5hV2GuB7mVbpGyEs0B79W4zHa0/bnd8amxcdJ8/JHzybSEXpaSbzF/dxwMP9/KyJfn
	MtxA==
X-Gm-Message-State: ANhLgQ1qGnJVUjb/g33VknWbXCweJfxaHao+yg1hkuYPN2iPi5RL7/hZ
	FyOz48Djn2NeFZFLKRTMFW3qqwU8
X-Google-Smtp-Source: ADFU+vvNbV65r/ggCjFg0tnxnVOviiADqogOgcNIRoDy02DhKnZLI7e0T/9ZhPXQq8fsMs9q7Xa8kA==
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr13835586wme.130.1583654414541;
	Sun, 08 Mar 2020 00:00:14 -0800 (PST)
Received: from localhost.localdomain ([5.171.136.142])
	by smtp.gmail.com with ESMTPSA id
	i10sm50367072wrn.53.2020.03.08.00.00.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 00:00:13 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 09:00:07 +0100
Message-Id: <20200308080007.21944-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200308080007.21944-1-costamagnagianfranco@yahoo.it>
References: <20200308080007.21944-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] mosquitto: do not enable srv by default
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
X-List-Received-Date: Sun, 08 Mar 2020 08:00:15 -0000

Rationale can be found in the Debian packaging (debian/changelog):
Revert change enabling SRV functionality, it is disabled by default
upstream and of little benefit to any end user, but adds reasonable
complexity to the code.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.6.9.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
index a0321a36f..de43aae73 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "412979b2db0a0020bd02fa64f0a0de9e7000b84462586e32b67f29bb1f
 
 inherit systemd update-rc.d useradd cmake
 
-PACKAGECONFIG ??= "ssl dlt websockets dns-srv\
+PACKAGECONFIG ??= "ssl dlt websockets \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
-- 
2.17.1


