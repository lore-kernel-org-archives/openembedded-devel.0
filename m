Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 577777728E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:06:33 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a4so28863349wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SIfcEEWlFE740c30I2d1MAvDOFH29GivVP0ENIZ4Lao=;
	b=l/v/w93b4bc42diw0BGyb7TTnboaSEewTb8EgrSAJhgLnlGAtoK9qGDhTCXD+oPAhW
	F5uYjlZ6qLFOcG06ITfgxa0vaoyOVWVHmRmxXHVjqPPe2b0+4FYm3duP8r2yJrloMILe
	CS5sCkcHgYEceR+oSIFFzswWDuvw9Y33S8As+oLcA7R7GmeR+8y35QQLoXYksqyEgRtx
	iOW2Cz1QqVOyvH+E9+28wjLn7y3GNao1Q7nVr3SG8yQDmUokdIr3g3HD7qHv8KvxhT/J
	UiI7XY4Tlg1KIACUJlKDSsT73BCdSWNFV0c92GifyfVMg3WMxMSsuAgCxwvuthcvUaj2
	VHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SIfcEEWlFE740c30I2d1MAvDOFH29GivVP0ENIZ4Lao=;
	b=Un2OqBMbW4T38pnZohvlXGHiYy0yFpUhDSzZr4Yvk1N6P57ErONfRO4TG/ut/bP07d
	1MQGaRFwJeEbDAEQfoU0vc0mb8ev2Rn/Ed7PYaiKYPtRnEKAfVCW2RVxxhBaCjCqBiT/
	pHSiti0+cHxt4ZwZW1ujVsD15LoCmwvj6E70J16pct7TiZ9WOUZXTX7e00vWGJGMM5Nb
	Pup1ORslX7JrNulFyfNrUaySVtx3BL3gavY0E/yz4MNd0V1PW5azl3F5YZ/w8YPdcr4l
	fDrfZ85hpqRI+8kYS5LBfdtytw6Nf/sQTRAuSxGkXeDf00AN7yWsc/wUQozsYkjjLDKi
	5c7g==
X-Gm-Message-State: AG10YOSkpAiPhD/elbQRp2hAEuPOf6nUHs9u7JDjqrH66cf4DylwUw4o0r/mMEVL3E8qgA==
X-Received: by 10.28.45.71 with SMTP id t68mr25703122wmt.46.1456319194396;
	Wed, 24 Feb 2016 05:06:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w136sm30952283wmw.0.2016.02.24.05.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:06:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:07:38 +0100
Message-Id: <1456319258-20502-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-gnome] tracker: Blacklist because of packaging issues
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
X-List-Received-Date: Wed, 24 Feb 2016 13:06:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 840db4e..251ebdd 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -80,3 +80,6 @@ FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
 
 SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
 SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
+
+# writeback-modules and extract-modules are packaged in ${PN}-dev
+PNBLACKLIST[tracker] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so: tracker-dev"
-- 
2.7.1


