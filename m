Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B29E877147
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 23:33:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g64so503271wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 16:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h/uMmE4hGAIZfqVvTXf4XJwO5LleiId1apS6P/lbS0U=;
	b=ScZ68Us/iPtkjHUU76YNNhMNumAhuO/jSnkBmZ8i5c7QL9q51QGfwkPJqu0Dk7I+MJ
	BliSfVe+nYM0i8NAwfgNmVpZDfLakIS/TJTxAbmHTsK2dSxUOuPJuMazpVcFzQ+OAvfL
	FKYbczdNdy42V9YZLyPbWNdNkj6//dnEcCYWpALOufE8y87xYk3zKkXF3rlm7nfWxBzi
	C8IJxxC+i7YdOP/+bGc7skC/QuVR0iB6lNT0tFE2vFtaeCCVOho2jRz0PpgyoTe/Qv7P
	kb1eDxCCxYayQGKbgVBzemr3XM6yUkDuz9HvNFwlZYVd3FiJwMHl708RVGt83iGYpsZp
	1bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h/uMmE4hGAIZfqVvTXf4XJwO5LleiId1apS6P/lbS0U=;
	b=LfcN/2zTSQrPzLs7vTTRMveHhRWjYUvHd9t2vJkWfi9zVwX0ir2yJXZJpqDSzd2ZPM
	D+RvhQ4fb22ZGGjU2kT1x2zOG1GsvRANDLlyAuF1J+0uz3bvzUXTAz1zETvcT8dQJDpz
	oFT8FRWw15Wh9aYoYmiwCJQJWb2stSDEVS8pw4T1pAvokWzZ/mIesHJfYYHqZhGqD+PI
	ZyQcbImNjp8237C2/oYVr1kZ3LnIet4hgh4MIiyGluB3eZx0jFy3hgcCPpLvuEPZZvyP
	cXsLm0VwNjp6HfraMXnsrt5Fh97UuVLDY6TAw4OEcY+ZOzGwGYb90ABDbVaErShJLP35
	w92Q==
X-Gm-Message-State: AE9vXwMkKdMfNL2o+HH2ZN6Yr+q/qqLqcXNqEhqGcKo8UB/HVVGfE9X5B7RlOWXx5HOETw==
X-Received: by 10.28.103.133 with SMTP id b127mr472946wmc.82.1473463984441;
	Fri, 09 Sep 2016 16:33:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A1290.dip0.t-ipconnect.de.
	[91.10.18.144]) by smtp.googlemail.com with ESMTPSA id
	4sm5564692wmu.2.2016.09.09.16.33.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Sep 2016 16:33:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Sep 2016 01:32:49 +0200
Message-Id: <1473463969-23268-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] upower: handle and pack systemd unit
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
X-List-Received-Date: Fri, 09 Sep 2016 23:33:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| WARNING: upower-0.99.4-r0 do_package: QA Issue: upower: Files/directories were installed but not shipped in any package:
|   /lib/systemd
|   /lib/systemd/system
|   /lib/systemd/system/upower.service

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/upower/upower_0.99.4.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/recipes-support/upower/upower_0.99.4.bb
index 770f333..5ac06dd 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "78800e1ac7f92b24aabdf433e38f75d2"
 SRC_URI[sha256sum] = "9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b17648037b0"
 
-inherit autotools pkgconfig gettext gobject-introspection
+inherit autotools pkgconfig gettext gobject-introspection systemd
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
@@ -29,5 +29,6 @@ FILES_${PN} += "${datadir}/dbus-1/ \
 
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
 
-
-
+SYSTEMD_SERVICE_${PN} = "upower.service"
+# dbus
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.5.5


