Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1A06B76F8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 15:32:24 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id w12so39671118wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vwI7Xf3RWyN1O3JapogvIlwsYwv1FzWYcn2ySXTd9hg=;
	b=MdS5t4FwbizfcrC13GRcQYzF047osfwtYi2bmzFbpV+R6sVABhoFcm1aecgwf4/eer
	rHDVjaPe8U+40Df/iWIf69mhxPBJM0p70K4FynFinc4gJy27t0oLL1AeRyO32AaOFwwo
	o/s3eQMus/G7H1ADv08it52h9vbKAgwe4d7BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vwI7Xf3RWyN1O3JapogvIlwsYwv1FzWYcn2ySXTd9hg=;
	b=EvNirGhUxUjiklFf90+woUT+N3U6nHZQc+2YOl70ZjbzPFtTlVqQQZ4fRL4VaASPVz
	xpVO2RCgV1c/V5GanhOZGAlDd2vOjKYM+sslU+A2MQwY6seona/pBDg7le3xq3SPbGT4
	Cf3JJbRAU1S+2rv9GFVG+8XAuemmVSjjMsHsIUcsQ85EmPJS3WVW2Ufnui3qxSTzcEj/
	mSjFWDrxrykPqVE7NeH6p0vCBwWnsLi2PNXylTGmh7EuDVDLmFRhydvc2RykNWsO8Vwn
	MnoZdQAh2Guc8xVNRJt9uRjhZgIs40xjRyFYyplb8TnSvSS9xWzEIAvhL34e/tq0iKHf
	NzYg==
X-Gm-Message-State: AE9vXwOlpnzkVO6xTGLyOFQWvEVLIURwr+peddwi18KEH28Zxb7uMB2y/wMGpIiYTA0hn27O
X-Received: by 10.28.209.71 with SMTP id i68mr4306238wmg.97.1473262345219;
	Wed, 07 Sep 2016 08:32:25 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	s184sm4841955wmb.11.2016.09.07.08.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 08:32:24 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 16:32:02 +0100
Message-Id: <1473262322-2821-3-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1473262322-2821-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1473262322-2821-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 2/2] Revert "gpsd, foxtrotgps: blacklist, fails to build with new binutils-2.27"
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
X-List-Received-Date: Wed, 07 Sep 2016 15:32:27 -0000

This reverts commit 8c29023f1fe5881f3e001704eb9e5d398777d4a6.
---
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb | 3 +--
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb              | 3 ---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 32b20c3..d91cbcb 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -6,8 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4 intltool-native"
 
-PNBLACKLIST[foxtrotgps] ?= "Depends on broken gpsd"
-#PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 537facc..6158e97 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -139,6 +139,3 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.socket"
-
-# http://errors.yoctoproject.org/Errors/Details/81000/
-PNBLACKLIST[gpsd] ?= "BROKEN: fails to build with new binutils 2.27"
-- 
2.7.0


