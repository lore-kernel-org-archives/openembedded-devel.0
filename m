Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F583731D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:25:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 133so15300702wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lzc973yN+apBewqVlGIscvfJsuW/cGhopq5sR55CWbc=;
	b=Zn51J2W+PLW3tF2+Nogt+Af5CfFpC8cAziEHVhnS7SeuBgqC7KgXvaNYPloSyqVfsR
	4auVJsdY8MsIw7u7l2Yi62nvT8fw25OaQNvjViYRX0Hy+jHRKzgi+U1Y5OcNQaxwsq4P
	NCnTnB8Vh8bHkTJACfs94aRNKJc1dZ/3BsWumqk8f4fG8q7HVhRosP6xyWnrTbiblwyc
	trj0ZtitPewQ5J44sGtRh3m3zYJUd3pVVQzDwwdd07DP2xaj5W96p1E+cZCpIR0fMTXD
	2zhUMmcAli0+gMRm8cFnhqcnrrvdK4yaXJScH2PVqrsqFv6vyhTAXW0D9j1n4wZ63t62
	k2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lzc973yN+apBewqVlGIscvfJsuW/cGhopq5sR55CWbc=;
	b=ahQPQS9ObBxipPViGVQOWng8uAAGW1NiVA3UGb49jbrM+1o+OSoVsYZvMTTKmVrPKv
	ak31BYFeYktdA2eVnZywGN0ECpjaJCmIIbAWMLcP3ADEPEMibaRjSCDQ2YXmvmozxShC
	25dy9vyXaooZ9PH0fEp+F8tD98UDuL2tV1FTwjfcC1CV31kbWGwkzXD+14sHRuHLPgze
	xq6A7fXFiLiSXDrWsVYoSi9FvTwCjBk/tWzNLJy0vGF6MMFOESD2Mli/UC3vgsnixMCS
	Qg7i/kJaBWF2niakKlSuEc53WKyT+V9NtRdMiV44KPebUdfgZl7Wf5rInL0+Ox41xQ7y
	o/cw==
X-Gm-Message-State: AE9vXwOWJ+306p7VEIL1ToXmhxjlbQR+JkSgegKtwU5aZtv4YA3dfsu2eBaNWmfFt2WuSg==
X-Received: by 10.194.59.116 with SMTP id y20mr25965520wjq.181.1474295154839; 
	Mon, 19 Sep 2016 07:25:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id m5sm24722334wmd.1.2016.09.19.07.25.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:25:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:25:46 +0200
Message-Id: <20160919142547.11541-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160919142547.11541-1-Martin.Jansa@gmail.com>
References: <20160919142547.11541-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] mpv: include PACKAGECONFIG_CONFARGS in EXTRA_OECONF
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
X-List-Received-Date: Mon, 19 Sep 2016 14:25:55 -0000

* otherwise jack is autodetected:
  mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency, missing jack in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
index 768c87a..292c701 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -49,6 +49,7 @@ EXTRA_OECONF = " \
     --disable-lcms2 \
     --disable-vapoursynth \
     --disable-vapoursynth-lazy \
+    ${PACKAGECONFIG_CONFARGS} \
 "
 
 do_configure_prepend () {
-- 
2.10.0


