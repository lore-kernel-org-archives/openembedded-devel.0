Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B9E807869C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g75so2864997wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tmq18Wl4Y6tqrlWxEsnLHWNTMxJm3201McBevn4bsMM=;
	b=TTy7PUyRI2i5UTya+LQTQsDclSSYIJSaA3ZIfXbx+cusRX2oYTJf6o+B2QwuFQV9rr
	aletj0KWf0BEEPV8zUUaVNKxG6fdK598Wr58oXtvpoVRxFcWyksB7+7171jJsMwWTECx
	4Nl0CPgLPN0W66FiKYKP2hWB7UIE2EUHeE7mksMnoErKaFgTOgTfPdB9VL3YjZ7vWHZI
	E6fMZ6xlaiJAfrButXcoGxKRK+FGEoHaegvKkp2TwbbmBZxcvGsHJHfPC6erpntyW804
	JlEzNEgoYRkVbZxh0ZgAA8m17zK/OYX1pRjHBBF39tjrWK0SM6UTRygJjduEsR/tq/v9
	qhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tmq18Wl4Y6tqrlWxEsnLHWNTMxJm3201McBevn4bsMM=;
	b=mXuxsZOEZjU0t3UDCxxWvfPG2B+Z9KwGZ8xMXQT/up2G15JOslEcQpYDqlXAdJKvgR
	Hyl6mpQoWl1COabtYzXSmwb1foS5CJ7sSFQt97JtLLzldB8TxpzQhkxSkZMwPaZoVnur
	Pst9hsVHYh1AgxTUc/MP8U6erPVhDxDUjNE2H7Fk/rVFFMFebcbNqE+Hp0sIMr6qvW10
	LpvxgEnc02DTaSC512K4/KdBHFmfTFDiwFD1LVO7xU/mWCSBy5OAq5ri5T1E1/BVZQSC
	bQBub7aOV8h9PX41z+bCPVeA8FT8DSaV7AtIetdrwhDzULRPCOYBaGwv7UlTIfwWaiIU
	6Yeg==
X-Gm-Message-State: AKGB3mKzpwGuqDNJ38yjCfWaXNB0Vwu8zEHeAqwxBNIv7io57heI7YO3
	rgCCTS2nehSj2+CKA5ZJIpbSmg==
X-Google-Smtp-Source: AGs4zMb45nj8TzT72vVcUn/mnewn7SudskHZgu3u2Y5pjKFtxknxT0HC0bq3/Nuf0tN2uhTO/fds+g==
X-Received: by 10.28.133.142 with SMTP id h136mr832676wmd.122.1512126511997;
	Fri, 01 Dec 2017 03:08:31 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:12 +0100
Message-Id: <20171201110816.13519-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] thunar: update 1.6.12 -> thunar_1.6.13
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.12.bb => thunar_1.6.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.12.bb => thunar_1.6.13.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.12.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.13.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.12.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.13.bb
index 8f1b23e..df7c46c 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.12.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.13.bb
@@ -9,8 +9,8 @@ inherit xfce distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "1bdf3c4a57ff886c512341f24b5e0e88"
-SRC_URI[sha256sum] = "fb22091f07ec6de2c9d9d89c61289d2bc3436b36c8c53ccbc9c32ca8a99f2086"
+SRC_URI[md5sum] = "3e51987757d718ee7f27d0a0447b07fa"
+SRC_URI[sha256sum] = "a2900acfa92f965aff86cd7728d88a3836b3d21fb85d3355a8c5119c9975f93f"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.9.5


