Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5FC71DDD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 23:54:10 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so430792wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 15:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YMQELozVdjs3zP/wwFMLoBh/NWsV2VGeELaNIA5H2Y8=;
	b=hAu3PfJw5Bholvd51xBiDazJYuameyokYf5wVKPHcI5i5K1x6CMRdSxsUu41adZajD
	SLcF3hUnL52ug5Dz0hm1Ed6KN5WI+dY917LdGvtV1ypJsz3YrT6jfR+Wb4Pdejv5BwWd
	kIAxhM81ib7S/cH19qT10D2sWEWFQwvFI6GPR1uswiVXKvWbdRgbDcSM/4BdNsP7lgYr
	Zupf99iuIklYJt9y2sljCZ9+0/7bTICLgHUsbWXJgYSa/51KgGIfXUe9K/snWKom74Si
	5C6IcgpIp9EBBpfWSwQtmio+Am1PkRxmWKLQd5HCmUEkTeDupalOZrDEWk1G6vxGFVDe
	ULkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YMQELozVdjs3zP/wwFMLoBh/NWsV2VGeELaNIA5H2Y8=;
	b=bViT/JXz1sQvWa2OpQ9n23C74hQWudKPEWstiV8yBCB3RM4j+g6kEIhCJ3UNS7ARCR
	GwYbeckJD+Fr403KNPC52uLWcRpLE/DrYwtjNTavTpPnUdEHFr/ocduU8g12Z94ht+hw
	mDGEBXHHjaXq1QoV3Cu6Jgh8whkeK82Pxf22aorbhXnJYXJsqVWAE+xCCDjfwgk+TAOt
	3oqGlUWC6/b9/X5Uzm936iKvyRvRVkPVNUJMQOAL0i7F6XmGSMhxJVcoYXD2l1VDZT32
	GnObvocNNxJzb/Ut3Bb+j5nuSmteIsu+52Czk1KIoxKYZVskQqCL0GrKSe6VG5ZHFuXm
	W3qg==
X-Gm-Message-State: AIkVDXLxTCpkqvan/Ac/EfTst++qsKd4E5FXRCaN0dD+J49fEUO2jQ65XC6P8BUx2qMwkQ==
X-Received: by 10.223.177.18 with SMTP id l18mr9671154wra.96.1486079650478;
	Thu, 02 Feb 2017 15:54:10 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e74sm180700wmd.2.2017.02.02.15.54.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 15:54:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 00:54:01 +0100
Message-Id: <20170202235401.10297-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170202235401.10297-1-Martin.Jansa@gmail.com>
References: <20170202235401.10297-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 4/4] qtwebengine: disable generate_character_data
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
X-List-Received-Date: Thu, 02 Feb 2017 23:54:10 -0000

* qtwebengine 5.8 fails to build it, because it mixes binaries for x86_64 host and x86 target when building for qemux86 on 64bit host
  https://bugreports.qt.io/browse/QTBUG-57705

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 4ab30ea..3d139d0 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -24,7 +24,7 @@ DEPENDS += " \
 "
 
 DEPENDS += "yasm-native"
-EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm"
+EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm GYP_CONFIG+=generate_character_data=0"
 
 # To use system ffmpeg you need to enable also libwebp, opus, vpx											    
 # Only depenedencies available in oe-core are enabled by default
-- 
2.10.2


