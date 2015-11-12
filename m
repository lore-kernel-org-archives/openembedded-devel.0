Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D92807719B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 05:12:04 +0000 (UTC)
Received: by wmww144 with SMTP id w144so185389308wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 21:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=5KhIOTwS0dx0dOkGz7x5H51HBS8YtLo6VUvjWOkih/4=;
	b=DO2hq4lIc1OVOnwvJfmftgdTAcJVbr+CZGzqvhY9qhAvJ+1hsMy6TeZmgzrWYHBltR
	JhxIvc/nNTBaDih+zs9wkBdhvwFJWqDqb/cKwBkYb3JHJlDdpdZ05SzR0xmRB1Snfgu7
	lPDc2YUrM4IM6pXsaipHsS1ufxh2PM8CTp4+0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot_bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=5KhIOTwS0dx0dOkGz7x5H51HBS8YtLo6VUvjWOkih/4=;
	b=RbsuEqwjKFkRKn9302rHKMSkajj739MoInxuNqkL7k+o8dzAClDHiVZtejRDB4yfYz
	4oRKEtTh3Ga4g32B1Ek0KdxBkrztjEfzt/84emiForUYm9YORDd81p6k+qNhFWqdSXmd
	eh+qQfRrgeky4B6/IoVCosOfYfnC9rFdTfBV2Wudk88DnD/3yp3EcnKjTIdqgq7sJVMY
	8tvgDVBHzG9M46nD0hmQSk3WPpVp54UGElPIZ4DJGGSHYL7i1tprkp4nSkF3+MGwanqN
	SjzrbBHKLUdqFFnogvAEMlQcD1F9OzJjCvCQBNZJo9FSXDiakiOzK8NBwu20DFc05MEU
	h/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=5KhIOTwS0dx0dOkGz7x5H51HBS8YtLo6VUvjWOkih/4=;
	b=bUHI709N8HmCjD7sMSMk0AHX6Z/sUKU6TeEpaVh59tqM0r1MLlHeHV0Db/YjLD+qrj
	mvHQNVzKTvHVONDXIFzEMpuYRMr8is0dgEf29GC2D/ULdb2idNmoPxB4er7gspR19rkO
	op21EGg+mj80gd8ZSxsPgvqIFaw3P9YtMoX07ShZdJsZnuOotuiwrJpeN2Q1Q37j1Or+
	ciM+GLntK66CW6khAhdCqZxqa9VmDtEufwu08rK6OARj3Ot/zX9RA456G2oAAfOpvFHC
	aDLdWpd+9YLofiY5M/Ftg8jifwf2VoocdRpVU4DoSLGRC2uo4M4xV1HWGsBOBcje7EW0
	YvSQ==
X-Gm-Message-State: ALoCoQm5U6MlMx7/AqFfNC5aAYSPf4V1dgayY0xymwVcf0Kife90AV/F2n4VQKtTPYIQTuOlr+eF
X-Received: by 10.28.5.208 with SMTP id 199mr14787989wmf.40.1447305124407;
	Wed, 11 Nov 2015 21:12:04 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-234-219.w86-214.abo.wanadoo.fr. [86.214.17.219])
	by smtp.gmail.com with ESMTPSA id
	c1sm12378215wjf.19.2015.11.11.21.12.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 21:12:04 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 06:15:45 +0100
Message-Id: <1447305345-4867-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-multimedia][PATCH 4/4] dleyna-renderer: Add recipe
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
X-List-Received-Date: Thu, 12 Nov 2015 05:12:05 -0000

dleyna-renderer is a library for implementing Digital Media
(DLNA) Renderers, and also provides a sample implementation
of such a renderer.

"dleyna-renderer-service" is designed to be started and
consumed using D-Bus.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../dleyna/dleyna-renderer_0.6.0.bb                | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
new file mode 100644
index 0000000..b30aee9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "DLNA renderer libraries"
+DESCRIPTION = "dleyna-renderer is a library for implementing services \
+that allow clients to discover and manipulate Digital Media Renderers. \
+An implementation of such a service for linux is also included."
+HOMEPAGE = "https://01.org/dleyna/"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://libdleyna/renderer/server.c;endline=21;md5=f51acd4757fb6a779a87122c43cf1346"
+
+DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 dleyna-core"
+RDEPENDS_${PN} = "dleyna-connector-dbus"
+
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "50fd1ec9d51328e7dea98874129dc8d6fe3ea1dd"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+CFLAGS += " -I${S}"
+
+FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN}-dev += "${libdir}/${PN}/*.so"
-- 
1.8.3.1


