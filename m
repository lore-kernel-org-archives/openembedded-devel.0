Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1D830719A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 14:21:13 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f82so17106181wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 06:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=AwoIeH0DIJHDkx8m3HN8D9U+mRK5AnoEX4IB2Q6VTMI=;
	b=OC3FVm3Swj7GoyN5xXeuX6FTGN5/Eo0tKuaado/TT+jEiL+33YrsiknnsvwefbMvHM
	yBLeFW8LUS5IwGny70V63w/oFgTpR3fClljni7ogiCrWydb9oeDi5YfQDXVLduTobtRt
	O2Ym1SogLFPmeQuvdg7dcwfbVoH5aIBVsOCtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AwoIeH0DIJHDkx8m3HN8D9U+mRK5AnoEX4IB2Q6VTMI=;
	b=Lkl/hHKbsMRJWULEinj8GWA1njh/1/OsfKrlMbFQINkFr43Of+6t7W8GXkzYDEHKAc
	A0Cn82A7KX8BDcrCp/i+DuqX51o43aTjIKfkpKi/XVi90l6jUNXuQpsrN1Tevnnj0dvJ
	YRm8Kn5riATneGnZgwc8risPwy/IK8+d3h24dp4xycRlxpa9VftM1ZrdXA4JhOiTio4M
	upwl3e6mh6Nw+qh34/tzTDz9dEy59BDkrHpdpRYU5rgYGQ70wZYMUAGfpbUcynjju3Ec
	yY5krskGs0kYLJGurQ812S2MnRpVkIzCVRvtWnJkPjoCLFb7Ewd1w56KK5iYjWVgpcUu
	u7/w==
X-Gm-Message-State: AKaTC03kT4x8Bm/k2qpbMmarQ7GEswwC+rhjqIuCTeKtZP6xB2CvowuNzGH1eBU67WUeSdPV
X-Received: by 10.28.66.194 with SMTP id k63mr3403686wmi.140.1480688474812;
	Fri, 02 Dec 2016 06:21:14 -0800 (PST)
Received: from localhost.localdomain
	(ANice-651-1-42-202.w86-203.abo.wanadoo.fr. [86.203.97.202])
	by smtp.gmail.com with ESMTPSA id w79sm3469915wmw.0.2016.12.02.06.21.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 06:21:14 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 15:21:02 +0100
Message-Id: <20161202142102.31673-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.10.2
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][morty][PATCH] gpsd: fix multilib build
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
X-List-Received-Date: Fri, 02 Dec 2016 14:21:14 -0000

While testing arm 64/32 multi, the following issue was observed:

WARNING: gpsd-3.14-r0 do_package: QA Issue: gpsd: Files/directories were
installed but not shipped in any package:
  /usr/lib/libgpsd.so.22.0
  /usr/lib/libgps.so.22
  /usr/lib/libgpsd.so.22.0.0
  /usr/lib/libgpsd.so.22
  /usr/lib/libgps.so.22.0.0
  /usr/lib/libgps.so
  /usr/lib/libgps.so.22.0
  /usr/lib/libgpsd.so
  /usr/lib/pkgconfig
  /usr/lib/pkgconfig/libgpsd.pc
  /usr/lib/pkgconfig/libgps.pc
Please set FILES such that these items are packaged. Alternatively if they are
unneeded, avoid installing them or delete them within do_install.
gpsd: 11 installed and not shipped files. [installed-vs-shipped]
WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: /usr/bin/cgps contained in
package gps-utils requires libgps.so.22()(64bit), but no providers found in
RDEPENDS_gps-utils? [file-rdeps]
WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: /usr/sbin/gpsdctl contained in
package gpsd requires libgps.so.22()(64bit), but no providers found in
RDEPENDS_gpsd? [file-rdeps]
WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: /usr/bin/gpsctl contained in
package gpsd-gpsctl requires libgps.so.22()(64bit), but no providers found in
RDEPENDS_gpsd-gpsctl? [file-rdeps]
WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: gpsd-dbg: found library in wrong
location: /usr/lib/.debug/libgpsd.so.22.0.0
gpsd-dbg: found library in wrong location: /usr/lib/.debug/libgps.so.22.0.0 [libdir]

gpsd SConstruct file defaults to using '/lib' suffix, which needs to be
overriden in the recipe.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 45837e6c567b1b9ff9d152a7e2a752488d313455)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index b7b8968..4d00fea 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -46,6 +46,7 @@ EXTRA_OESCONS = " \
     strip='false' \
     chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
+    libdir='${libdir}' \
     ${PACKAGECONFIG_CONFARGS} \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
-- 
2.10.2


