Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wj0-f177.google.com (mail-wj0-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id F2D2071A6C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:55:18 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id v7so55617631wjy.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 02:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=MaJg36M40dguy3LPGBERPSQnxI5hEEMj5kyPDJdHeAU=;
	b=GV+UunZ5ESv/sRpp0bb/6GUpeE9cVzqCyC4Ct6VCW+uqXd1+59GuPfN3mV81vv1a6F
	fp6HoH+6TtFacLyjfqrGfF/CWTN7rrMFrH1uABXHZG9SMDgVOmmMMLwa2WtnMPxD+/3j
	qD3bgpTGcZGlPK4OgPri6g5yN91lyP7cWJqdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MaJg36M40dguy3LPGBERPSQnxI5hEEMj5kyPDJdHeAU=;
	b=e8E+GZHzHBWM0cyESPkBGf42uP2WP7a7gkjRqEmWxjRdhPivKM28hE4RAmC8Up7GNm
	TmgarJcQhV04n/DF8ng+/XM8+lxIgeJovMNmCRiIsimy62jVrXnRjEBv/roZYMoI5Qdf
	mrC25jZVEn5MPDT0mZCIYIJMY/ojuGRfdXvDQGBhm6ryd2e09AaT/pV8/eA93iztSp57
	MjsYNCNzjbOsdmZSckaouByWZ/KWvDTzs7wCOfqazxBjyf34u8nm5GRyGKH+8Le5WCL2
	spO1w0oBb/bIflAuUkWL9oxT34jSd2SRkhsPzGHSw82L0VI/Uxi5wMFZ0jAlYGfftouf
	2PHQ==
X-Gm-Message-State: AKaTC00kv+vLFSBy8okazhY/a71LCZHAhGI2TVAZiKaYjdvCyU/tcT0Hf7IY16pWwx0ojaVI
X-Received: by 10.195.14.7 with SMTP id fc7mr7307113wjd.198.1480071319559;
	Fri, 25 Nov 2016 02:55:19 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	ua15sm46421090wjb.1.2016.11.25.02.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Nov 2016 02:55:19 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 10:54:58 +0000
Message-Id: <1480071298-11232-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] gpsd: fix multilib build
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
X-List-Received-Date: Fri, 25 Nov 2016 10:55:19 -0000

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
2.7.0


