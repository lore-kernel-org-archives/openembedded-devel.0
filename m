Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC1B96078E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:54 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s29so694563lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=24QGl+o48uCdNgJkhp9/FDjbVpOxtCYPxNjs+7WNECE=;
	b=oNtc4C4Flk45XDt9GVZYh6loGwtdAz/20r4+a4SqDTWSRw63UDZGYZ+SPdAgdaRa7K
	/2nh8+z2OJ5ChDeKltlHmGvd3d1XSFXCEBMsV2D5y1NQjVPuhxJFnKr5iHqsm9nD7CPU
	srcsXfFpGap1Ypqx9nln/FNnVuG8112+nmIOEiBpo8IiwZokvzmIRIGFYctwreQlx0XA
	dRXP9CbsgkPhZRngeATJLYX/r7VxkdCSkbD3BUQBirvKUQoyEy9BpDYVeP2badNA5rWK
	CcGy0J1TxtjSBN7YbISYKfv02gEQsmuQQRosty6Genv/14Fg0wKk9I+ev5sjSMDq/MmI
	R3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=24QGl+o48uCdNgJkhp9/FDjbVpOxtCYPxNjs+7WNECE=;
	b=VOp3zu2+rl97t5X/msCze9BgKC+0BLHLsnViltqFBv6h7FsZ6qxzzua15SpxdhETz9
	0ZO0408wSszWT2Q1DCfA8Ipgxczigq9Y7GglzpLBL9HU0zvWNkUZyZN34zSrlTYrQ2am
	D+UH6tPhASgpHtkmHH+Y030A+z0Z0OMC2Awo7q0jUd/z3BqsvuAFhH7BJL9pZT6ce8oD
	6KJYsSBda2BWx7W6j4QchJ9mFg21yK9ilVTazIuOGg//v81v9xEm39Rrkca92YIKR5Ic
	PAimSBC45Lu5A4hY/1/nHpbc2qoLP+gZ950TGReyxyRd8loMSxHYT+MNkld1TeypWkDu
	6mwQ==
X-Gm-Message-State: AA6/9Rnop5FJ9KL1d55j2yNeDj8W5CFpR7dyH0shm5r0ZGJyivr76arPYd81Pe3xwh/3Iw==
X-Received: by 10.194.242.200 with SMTP id ws8mr20323434wjc.205.1474955755571; 
	Mon, 26 Sep 2016 22:55:55 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:31 +0200
Message-Id: <1474955733-30185-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] xfce4-clipman-plugin: update to 1.4.0
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

optional usage of libunique was removed in [1]

[1] https://git.xfce.org/panel-plugins/xfce4-clipman-plugin/commit/configure.ac.in?id=75071c2c4c6090dc8b7a06ceca958dcca4d2283b

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-clipman-plugin_1.2.6.bb => xfce4-clipman-plugin_1.4.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.6.bb => xfce4-clipman-plugin_1.4.0.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.0.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.0.bb
index a07f3cc..988fbb0 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.0.bb
@@ -8,11 +8,10 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xproto libxtst"
 
-SRC_URI[md5sum] = "f7f2440647493243cbd7787eaee92fcb"
-SRC_URI[sha256sum] = "23043f99c3e5257d1f3d68b5ee5125e3469c15620d098e22c6250386197f48a5"
+SRC_URI[md5sum] = "cd9c05e54e0fcc3f8d774cacdf18f42c"
+SRC_URI[sha256sum] = "a97671540663df1d90503f73695ac36e16fa2c832be8845ad9402529b8148294"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[unique] = "--enable-unique,--disable-unique,libunique"
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.5.5


