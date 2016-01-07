Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id EED056FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:02:55 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f206so103522188wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gkQ7BQEXWaey4Q/HWPzMxvjfobsmNp3pycPgDkL1vys=;
	b=SAzPtXrAWfQWXPIN0kMhUL7zP4jwHSFtHqXKtm2fQqsluUSRSq8NmyUY2AdnVBLXn4
	/lEM7PN4y1frVuyuu5XZoOswD70zlShe63VoD6d8zcES6V17NINcvcEg/33pyMvcY3Tz
	u5ksFLSM6v+Ei31tSkeBkusWrWdWK7CTmgUDN/t7HzOa7aHtFr+PcMv4AxutZEkSGCev
	z9CFdEv6TYX8ejMg/URPjrwJYX+BMVqBegyAcJFc5dybPZezhDb8CHBxZZpN8zWx+UAq
	ZVJ8nrnaISZfjpHTjIPU/Wy6m/zgFoF+xwQWNbAmFauAwL7f8KVB1Nrg+ObBcOavwmCl
	ffmw==
X-Received: by 10.28.216.211 with SMTP id p202mr18204192wmg.84.1452182575640; 
	Thu, 07 Jan 2016 08:02:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w80sm14229909wme.17.2016.01.07.08.02.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 08:02:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 17:03:17 +0100
Message-Id: <1452182598-17070-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-oe 1/2] gspd: disable qt4 support by default
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
X-List-Received-Date: Thu, 07 Jan 2016 16:02:56 -0000

* now with qt4 moved to separate meta-qt4 we shouldn't enable it by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 6ae2f30..f444ffc 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -34,7 +34,7 @@ SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
 PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
 EXTRA_OESCONS = " \
-- 
2.7.0


