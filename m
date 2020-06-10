Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5345.1591772587530151801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=I+NRYVr+;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hdHD42yJz3p
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 09:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591772584;
	bh=zbHNgo69Ikw8VgNCPuaAH9ukqYjIZ1/EQnAx9rw8PvE=;
	h=From:To:Subject:Date:From;
	b=I+NRYVr+juQcEbV0k7cCaV3vjcXbUAx8kwLxkR1OFoNnGHSCMQivN3kRHRExAaBp3
	 k3TgJrU3njmXwDrCulqSLrgoUxOmRfBht8YUGa4lw1FoVlGv+R96q8n9OCFBoH860F
	 px8Hi466TZzBjePpAsP3P2/8y63j1XWGerjsBRwHmofB/hIWBcLmDZu1fb+/WJim+V
	 TzLGvRfepLXjiX3mb1AfLenYwAnWM57xfnjTBVqwO+vcZsOtYvOaTFdPh8NtrgCK/6
	 ejm4DoGVEtDLwmR2qp1pjQP8zyxhaSZWkxpMbw1cfQl6lTGYecqaJ0PcfhV2pUOiJQ
	 OIh/fTSb6pmeHDXogF42vlKasLeZjv/H3iNjYybNkrUno+Cvn6XaNeMkrFIkNr2jLp
	 5WqL/x7qYiQAyKJp6scbXG208Fv3mOKRiahgDMnP4T3C9LCIbTDE3yrX7wXjeta1KL
	 jXhQoDhrGcdpL5/04Vq5Do75yTX4TRcrCtFgfXZQ/imV478NCSJgqHXkkPQm2pVzu2
	 /jbab/VA3FpSEDGdfoGXEzM6Cb75UfwxjcgVHN7RaTJyHxt527JKwFSgXCCPZ38Sm3
	 UwChfPC7Ehb8vPP+gSnMBdXjtJi4Iu3oFT5FFXQhqSMbCTQmusWEXbBgxkXeete2Lj
	 wuKq075QFKy6H1pFAmHc+7vI=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] gpsd: mark CLEANBROKEN
Date: Wed, 10 Jun 2020 10:02:53 +0300
Message-Id: <20200610070254.9851-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Sean Nyekjaer <sean@geanix.com>

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index f74ebda5f..05fbed622 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -23,6 +23,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+CLEANBROKEN = "1"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
-- 
2.17.1

