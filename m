Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08A6CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27285.1762704026856083973
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QB2O6/Z7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477770019e4so10376985e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704025; x=1763308825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykR2nVIIE5hTHkKtL7weAC8CDww3+4AjaNSy9SWho6U=;
        b=QB2O6/Z7cBlkIb4vaSB57x4JvMarr8m8mUVuTksryB5OFg92Rjo/kIBHazd/NbhuQp
         Cr3pt9eI9A0hmug2zcvo0JJxXKvtCh2HKQ+uH8bcNHL+5+2CNjV2ofgedZlaX02CO4Hp
         Y3D4ZGy933AAAehS0ubi0mKpuDVRL5KvBpam3uutMkBRWYeyCtMiwj9+AoGItLRKABB2
         1It9KUZHq8nHhdBPYwKj5/cuJRj+EcMuemqYH6Ra27RxuMh0qfRuGg2BlyAg02FQ2Gco
         9+XgXS0LdimMLbPUBmEXjdV+zr+20FC7Lt54y2YLHmfXSGTkv3ph/8EYhtFBqSYWFti1
         GzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704025; x=1763308825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykR2nVIIE5hTHkKtL7weAC8CDww3+4AjaNSy9SWho6U=;
        b=EQ4G1WBMoEFyg6/n7tk50K+ru57HMVgLyeGB5Hf2zGG0ontud410QEq4jUOaWsw8jg
         u690qaPpdN5fWAzaIKkuqhanVMcs2iIHyGyGHBJb4DbwC5hOgjBaF+yLN0XnWlgCPnjR
         AS9P9p+Kc1UNPbcXqwAGXQX45viPySuI9m8MhUVghHdFyt0Wj53KxRZItpMu7b91riLC
         GudWsbSRvcLI3iwiPQm2UEvdKEgjEiGgHofCoO05mhvn8p/5Nd2/770+xUurBYgcrYQg
         fjAqjQZPNH+8LmMerHKJaO5HBMkMB9MYFX/kOUi9m5w4OpVgLm9+nyMekxln/NTPcklU
         OugQ==
X-Gm-Message-State: AOJu0Yx7/36E4d/KNAAIcVy02ZT07DfTqOJkDcI59VjDBFEYO/Vj94x/
	uJAuoI5piKFUQuxHecx4JgUppV80w/cPmAGfPsoqCT13tSaApKIViOHWLoqIBA27
X-Gm-Gg: ASbGncsDin7H7X1H7DhiXZNGD1K++GFx836peRhcxCcUEPLkXUIwMsfvnl4MaAWp+DS
	SBYUiL8AqafIYLOy10B6OTaHGioO6zbrbmCv4mAmG9RQuhuu4dIBikv4+YSyxVV2RNA/VtkRcgL
	OJq3LIYKrHm1vnP84rsDkrRbpkeRtnVHqIYpla3GRYpCrxPwzZJ+no3+9kQA5UjCW7LvRwh+NTb
	hDA051vhBoowOGiXjn+bLb/7g5CPQwh2LsFTWCnBOmOZjXWwin+OEdb0VmXljg8ywrFFBsCv1n9
	WV8jSs6qF07k5p4XMVuWLbTYKBIESP3swx95BWUGDHUDcE6hJLA1ej7XknhGYrxkfARb2XOMEG+
	B7V1NfB3srmyT+JoifMx3bn0x4ZPeijFxwU2JR8T+xLoyhA787oH5LQAVm4fDpHthmLuTg/JDje
	IyAHmXL7rC
X-Google-Smtp-Source: AGHT+IFvZddiHE8Fmg4PYMIwmDUwPzhjC5UpYGV0ndobe67+UeerFUR+h3CvewLC7SOqe/cTVFvoYQ==
X-Received: by 2002:a05:6000:2107:b0:429:b525:6df5 with SMTP id ffacd0b85a97d-42b2dc12defmr4042447f8f.3.1762704025129;
        Sun, 09 Nov 2025 08:00:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 04/27] fsverity-utils: fix SRC_URI
Date: Sun,  9 Nov 2025 16:59:56 +0100
Message-ID: <20251109160020.2522353-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121420

From: Etienne Cordonnier <ecordonnier@snap.com>

This URL does not exist any more, and do_fetch works only because a mirrored
file is available at
http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.ebiggers.fsverity-utils.git.tar.gz

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d54e2671e62b87532e2dd8f80b73d545fc54aeb4)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index 1c2c6e21e0..49f83a67c3 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
 SRCREV = "20e87c13075a8e5660a8d69fd6c93d4f7c5f01a5"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
 

