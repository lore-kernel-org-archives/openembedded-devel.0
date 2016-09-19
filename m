Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED3265D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:25:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so15315759wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MxZGC2SKl8ppDWzSMGiClNsQ2mm3nO2uwJNF4s2IlhI=;
	b=0jouxVXTC1V0xKbt+eU4Nh+aMHMAsnqpBTDytotbd7G9FOEebvhPiXimYJAyiwC+KU
	kVvvyOmlC6j7JMVcjyZAVg79K98LoWsNBNxBa2Tk/OSKsr4YcwCCUpy30QAaXqXuz3IW
	DY6Av0xjf0fwKsXhcb6VsmqBO3hkIs8/2pYzNez3OKhBHASfkimB3+D2ahBdIQhMYy+6
	QmXS3yVLFjEA2CS+YZmyHdXwDkhlLhDPdqEL74Xbbyjsnb5n4ePLug42OqAE/oPOB3fl
	Z0TA22GC5nlpiJt190jFFPUoYuJFSUmF5jufT3Ctd5iRUtcbk6/Bpxu54RK6LnlM2Vyc
	dKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MxZGC2SKl8ppDWzSMGiClNsQ2mm3nO2uwJNF4s2IlhI=;
	b=SHWzkCTWa0tm1ftuyZyuRpJyORTbOsF+DzRJgwvfzrOEAiH4Ssizaam0hCCfFpBLwJ
	bSMsI0lKyziuWhnGiqrDmhwtaAQB6UzSKigUngYgvKLb698TfnGHi+el5/jYIApa5txp
	eNKetgPIa1QJpWLxGsGYAdIAqMXyLCy0yVmDED2XvOU99uUy8Rh0BUSTVOXS4lbLPWJ3
	ngN0GFT04yftE0zFsmsbMEnHeeiOA+cMyzvTDHzzOgzaYkZuYwD/nD319LywwJ4Anj3w
	m5dM46olnGP901MB5Jj/w/oh2UCm8IFy7xyGp3MoanXYQfSSAQpsRt49v+5meqSlqjzY
	THrQ==
X-Gm-Message-State: AE9vXwO5zE7Yhb2OLQVBJweWAZ1lXc96YssVcC0piPGZpWInYxsUQ2xT+6clX+tFYAYwLA==
X-Received: by 10.194.162.162 with SMTP id yb2mr23661724wjb.38.1474295151170; 
	Mon, 19 Sep 2016 07:25:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	jn7sm23416543wjb.5.2016.09.19.07.25.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:25:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:25:44 +0200
Message-Id: <20160919142547.11541-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160919142547.11541-1-Martin.Jansa@gmail.com>
References: <20160919142547.11541-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] gammu: add dependency on unixodbc
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
X-List-Received-Date: Mon, 19 Sep 2016 14:25:51 -0000

* autodetected for smsd as reported in bitbake world status e-mails:
  gammu-1.32.0: libgsmsd rdepends on unixodbc, but it isn't a build dependency, missing unixodbc in DEPENDS or PACKAGECONFIG? [build-deps]

* log.do_package:
  DEBUG: libgsmsd: Dependency libodbc.so.2 requires package unixodbc (used by files: /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/gammu/1.32.0-r0/packages-split/libgsmsd/usr/lib/libgsmsd.so.7.1.32.0)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index f33b435..4441175 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNU All Mobile Managment Utilities"
 SECTION = "console/network"
-DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev libgudev"
+DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev libgudev unixodbc"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 HOMEPAGE = "http://www.gammu.org/"
-- 
2.10.0


