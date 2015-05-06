Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 891E573EED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:23 +0000 (UTC)
Received: by wiun10 with SMTP id n10so28425390wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2SA3uTsrLvaIbYhkWSyI35Z1SVxdbvt7ThBCHsLXdKo=;
	b=hbO0GL9cT266v79afKhGSM7Qk8JX6QDyh8RghkTutqc1eekKDWLKUXF3E4teT2h8AB
	scayk9zyM3i/EPa3Dk18i8qAh6YbwyOk5N3pzUOk44g6538wbChzq1fBmB/+e1tZhaUs
	mA63JGaGg/O7eOyM1gOodWzM+WBcn1RoDs+vbbBy//Q5vLPZ0Ipo9ZSgIOYljc9Wd2z4
	Ul4Oxn0h6S3le0V1ep2uNzVoVoeLs3C1rTW0J/CmmUB5SJW0KFtAskS1KNHMZ/qQWrNU
	wHVFIKZkZss7c39hRGOZxQ2dxY6eMlxJGhbsDazVAY6/SmL/PJfFmSn2cxsWxMkbbKFR
	Lftg==
X-Received: by 10.180.84.201 with SMTP id b9mr6208099wiz.49.1430928684231;
	Wed, 06 May 2015 09:11:24 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:42 +0200
Message-Id: <1430928646-2007-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] xfce4-time-out-plugin: update to 1.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 May 2015 16:11:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-time-out-plugin_1.0.1.bb => xfce4-time-out-plugin_1.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.0.1.bb => xfce4-time-out-plugin_1.0.2.bb} (67%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb
similarity index 67%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb
index 1f6ea04..facbb0d 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "b6e4a3145d31c341e2506fb17b014587"
-SRC_URI[sha256sum] = "e342f73315fa8176ac4fc321680a3959aa2e06fafed1ac78031fae64713a3db8"
+SRC_URI[md5sum] = "d7d743794a766ba1b00647828a099053"
+SRC_URI[sha256sum] = "c69fb7218c685e516454810291c5245c49a80d774a6bded59c645a1af427c4e5"
-- 
1.9.3


