Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9E079567
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:39:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y139-v6so5263050wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MJdfPKMXml1m7U8huvQI9n1ztq2308W/SXZmJatGR9E=;
	b=TVRm4K2huLDpJ/kz1CgBBi+9ktqv8cKRjRudyA3xKMH4qy79dKrigtadKFdHktLJO/
	QJ3EgCClYoiS1rZRoHytNiUwk9jj6XCr2Q+GBMIowfhRtyA5Ag5cuGaR99NCQ1KGf9EX
	VpX5yocXuBtgTmhSApNM0qcTD5zMuTlqyYMdhkgNLEaUiPoFRaT4sYF6YMkbrmCoMuEg
	ZZr8vt6tg79cZKALdunrVV4/ieUlh48Oi52e6I8nNvKKhhKInJGdEDWu+p2VmI5qJVX0
	MXIHqTou3dLpE8AusoU1uqU30Zyld+zBd+zQratRaAM+yDegEr+0p1ceV5rYtz7BHta8
	4Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MJdfPKMXml1m7U8huvQI9n1ztq2308W/SXZmJatGR9E=;
	b=sAplCMahkCfTN800V7y4Cq3aMc6WqNcmPyDeQ7fCxSfAAjjyLqqO01kShQ5ickqJXY
	TJkzUpjbRO5tTycY05gxVurLP80IWWpnKYPXLlw/XU18jvg85GpBhgEz2JjDN92PLzdW
	3Lq30JBvrkbwZerp6bZne1f7KIjloJ4QScjoeWmxe8dRb5tacSFQdhsqiwcfjyRoRr2Z
	fb1jio94HjwpdgOpcrwF0vMimvjL2l5xhjN6zijxBEU/m6jhSWEFAlRt6ev6OpufByZN
	bmZOFL9BVw44WJ2DTxkP664If+8hGpbbNVfAHywrnIVnAu3ZGjRQ3zlkAgE4qOnM30IE
	AmNw==
X-Gm-Message-State: APzg51CU+Onri/6+sYMI3BCK3NJBPMFiU5xuda0kbeNGRzINGl9Aqisl
	NdBKnX5AFdXLv37NPG7GGFJ/Ak5tfJ0=
X-Google-Smtp-Source: ANB0VdaaJzyIlkeqHGXMkKi0XtFZO+ZeHI4iYMOM05w+4XOEBwEgkGu3P4UGvfIcY355s/v89KFT5Q==
X-Received: by 2002:a1c:8682:: with SMTP id
	i124-v6mr5104394wmd.77.1535722744837; 
	Fri, 31 Aug 2018 06:39:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q200-v6sm7718945wmd.2.2018.08.31.06.39.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:39:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 14:39:00 +0100
Message-Id: <20180831133901.18202-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] abiword: use fribidi not libfribidi
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
X-List-Received-Date: Fri, 31 Aug 2018 13:39:05 -0000

The recipe is called fribidi, so use that instead of the PROVIDE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
index 0f3f507f3d..36b056fdd5 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
@@ -8,7 +8,7 @@ DEPENDS  = " \
     gtk+ \
     gtkmathview \
     wv \
-    libfribidi \
+    fribidi \
     jpeg \
     libpng \
     librsvg \
-- 
2.11.0


