Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE4BB77E1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:58:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so15351173wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qARfHzdYjnZBZt9RMK6lJB0FhuYrYsEAqVSLO2bglWI=;
	b=cwxka0T3mhxdIYsrmXuEOccgeQJmVfCgTNodzCaEbo2PPXKtGKN+9LG0EA58RB2qS5
	BKWfBPCdIqIAFvj7ZJf2N3C6HQVhWzbNS9ZFlEEz0w48eNRxX0Ylz3x58kwfr0d5mXHa
	hpX+JmV9jDWH/PXTilO6n39cRR//M1Aa+a+Xi7M7X+k3vR41XSmkY0J/4E9hQseirGDz
	UkB4+fxoDnTY8BIxMhx0UUD9OWNJIed9xkiSVMWEjSUN/U/Jf1BSfT8+zxh4Iv0kSeec
	IMTtFZpW8BLXcG/M9WyMWDZ1VW9vBrCTD/mEpeV/xu0m5/48L0xNErNnB1xbMfrFdgwf
	hy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qARfHzdYjnZBZt9RMK6lJB0FhuYrYsEAqVSLO2bglWI=;
	b=V9wFsjdbESBpXOwo/U3B/4wC/VoGvyZ/cSCg67Zw7lOK/YKEGySgzyQuHhxCNYDPF9
	+DjAvp/RJtMClMKrtRigKmspmyq53qIHpzgN5hVrfGKlApDBEP0vfSu2/sFnOyl7bVl7
	D4duJQpksnzVuH5X2N+6Xkj0jS5Sqe2E9WOHzOtYOzCS+c/eTAcWcMws1QRpKQV2zqep
	5kj+2lLyxZCuXgGVot6SkcA5AxXPXwzGD4s0mt0Dif2x6OTE+TaPm2jA1S/A9/IKHAYP
	pYwLELXTMVrbkgzwpjDGnp+oXWN1cO4QF16RsX1IIiu06n8HPIf7xZpJleVGDf2tGLpj
	W3AQ==
X-Gm-Message-State: AN3rC/5gKqxdLpkJaqUjzFK8eq11pOi/+YDgkpZZX42AAvIbrl1/bk75
	bqDSUuxqgi5Pbaw6
X-Received: by 10.28.71.153 with SMTP id m25mr10235216wmi.83.1492124308742;
	Thu, 13 Apr 2017 15:58:28 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	32sm155689wrq.25.2017.04.13.15.58.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 15:58:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:58:14 +0200
Message-Id: <20170413225816.10153-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/3] florence: unblacklist - gstreamer is fine
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
X-List-Received-Date: Thu, 13 Apr 2017 22:58:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-support/florence/florence_0.5.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
index efc5532..8ce85c9 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
@@ -18,5 +18,3 @@ SRC_URI[sha256sum] = "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe5
 inherit gettext autotools gconf pkgconfig
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
-
-PNBLACKLIST[florence] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.9.3


