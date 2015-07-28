Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B0E9076427
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 22:14:10 +0000 (UTC)
Received: by qgeh16 with SMTP id h16so2126739qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 15:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=B4NlLg4jaf+qJZ7VU71I+gW2JidqQpYzDGGlZYKUOCU=;
	b=WR0oCCu0CviAM5qojefQmqEpwUl056KAdxBrUMqiwLC9RAzqJbR+GhIz2t2C/b079g
	G/L0COs69rFlCA2JqpqUNhiaKE+KfZKlRoX4uuKinQSrYCskbw3BoEPaNIzKauVXlwTz
	cJEkVhOFQC4K8m+/RvmE4CcJx9S+uRmxMQ6ht74xrG3MvyBhaSVRSk9P8jMu1R78u2br
	8ddc9hdPWhTHFZN7U1of1tw25NTBvGzutCabrwUJtrcK5iGAdYivtuKffWTaNGFR1b3f
	qCC325e2Ht/8XRQKG5S4HDIpfVBmYsWNGAZ2kDOFUrKI6obGBmD96IG2lP5kpOH/vLXN
	kmEg==
X-Received: by 10.140.23.102 with SMTP id 93mr52883825qgo.61.1438121650418;
	Tue, 28 Jul 2015 15:14:10 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	u95sm12166713qge.16.2015.07.28.15.14.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 15:14:09 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 28 Jul 2015 19:14:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jul 2015 19:13:55 -0300
Message-Id: <1438121635-29044-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1438121635-29044-1-git-send-email-otavio@ossystems.com.br>
References: <1438121635-29044-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] hostapd: Drop DEFAULT_PREFERRENCE setting
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
X-List-Received-Date: Tue, 28 Jul 2015 22:14:13 -0000

The 2.4 version is the only version available so makes no sense to set
it as lower preference.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
index 36c0cd4..901c7ea 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
@@ -11,8 +11,6 @@ INITSCRIPT_NAME = "hostapd"
 SYSTEMD_SERVICE_${PN} = "hostapd.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = " \
     http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
     file://defconfig \
-- 
2.4.6


