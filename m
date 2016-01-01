Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 53E366FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 19:45:27 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q19so55833013qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 11:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=T97yekZ/eZ2dp2VYiYUAtCAuWZ+f1XjBbBlPLUAs5U4=;
	b=tXjXPI/b2xbgWuCaI4YT0vlP08xH0nMEcu+RbgOLEzeVXkv6nrQGFAR3F78q9P6/li
	f+/xsu6ygoqhackpQBe2O98+veTVwlP1sh3SZvNIoes1WxK1g28yT82MfsEaTEil47UB
	wclsutrN+9D7YZLVQ1c43MPMM5zq38k5qEAjY3jjRmIIEqQ9DozDNJy1QrtB/mbzHIea
	zzT5U3rDd97h+1BQ2m7ruF8QERoB1M505JiZXR50u+ut7UTyNJ7qIVfhBfF+3qGGKcae
	oCFkrdY4t9CdU4oOO3abBVLLgwlRp3HHbFQp7qF2crWnIOaQvm0beQAjJN3IM6GqYQWm
	uBBQ==
X-Received: by 10.55.73.74 with SMTP id w71mr101882739qka.60.1451677528061;
	Fri, 01 Jan 2016 11:45:28 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	m127sm25483037qhm.43.2016.01.01.11.45.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jan 2016 11:45:27 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jan 2016 14:45:07 -0500
Message-Id: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [meta-browser][RFC PATCH v1 0/4] chromium: update from 40.0.2214.91 to 49.0.2607.0
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
X-List-Received-Date: Fri, 01 Jan 2016 19:45:30 -0000

Here is my first submission of a patch series to upgrade the chromium recipe
from 40.0.2214.91 to 49.0.2607.0.

The first couple patches perform a bit of cleanup on the existing metadata
(fix typos, improve recipe comments). The last patch performs that actual
update.

I also took this opportunity to examine the existing patches and remove the
ones that are no longer necessary.

The LICENSE file changed because the copyright year was updated. Diff as
follows:

	--- 40.0.2214.91-r0/chromium-40.0.2214.91/LICENSE	2015-01-21 15:05:37.000000000 -0500
	+++ 49.0.2607.0-r0/chromium-49.0.2607.0/LICENSE	2015-11-13 06:04:13.000000000 -0500
	@@ -1,4 +1,4 @@
	-// Copyright 2014 The Chromium Authors. All rights reserved.
	+// Copyright 2015 The Chromium Authors. All rights reserved.
	 //
	 // Redistribution and use in source and binary forms, with or without
	 // modification, are permitted provided that the following conditions are

I compile-tested this series with a MACHINE of intel-corei7-64 and no
PACKAGECONFIG options in effect.

I run-tested the resulting browser in an image on the ADI Engineering Turbot
board (a successor to the MinnowBoard).

This patch series is marked RFC so others can take a look and give it a whirl
with their particular configurations. I will continue testing myself but would
appreciate any and all feedback. Things to test include:

DISTRO_FEATURES:
	- x11
	- wayland

CHROMIUM_BUILD_TYPE:
	- Release
	- Debug

PACKAGECONFIG options:
	- use-egl (on by default)
	- disable-api-keys-info-bar
	- component-build
	- ignore-lost-context
	- impl-side-painting

Trevor Woerner (4):
  chromium.inc: fix typos
  chromium_40.0.2214.91.bb: improve PACKAGECONFIG info
  chromium_40.0.2214.91: API keys update
  chromium: upgrade 40.0.2214.91 to 49.0.2607.0

 recipes-browser/chromium/chromium.inc              |   4 +-
 ...4-Remove-hard-coded-values-for-CC-and-CXX.patch |   0
 ...4-Remove-hard-coded-values-for-CC-and-CXX.patch |  43 ++++++++
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch |  39 -------
 ...-image_util.cc-disable-warning-from-gcc-5.patch |  40 -------
 .../chromium-40/add_missing_stat_h_include.patch   |  39 -------
 .../fix-build-error-with-GCC-in-Debug-mode.patch   |  32 ------
 ...accelerated-Canvas-support-from-blacklist.patch |   0
 ...Add-Linux-to-impl-side-painting-whitelist.patch |   0
 .../0003-Disable-API-keys-info-bar.patch           |   0
 .../0005-Remove-X-libraries-from-GYP-files.patch   |   0
 .../0010-systemd-218.patch                         |   0
 .../chromium-49/create-file-for-configure.patch    |   3 +
 .../chromium-49/fix-compile-warnings.patch         |  45 ++++++++
 .../chromium-49/v8-internal-startup-data.patch     |  13 +++
 recipes-browser/chromium/chromium/unistd-2.patch   |  27 -----
 ...ium_40.0.2214.91.bb => chromium_49.0.2607.0.bb} | 115 +++++++++++----------
 17 files changed, 169 insertions(+), 231 deletions(-)
 rename recipes-browser/chromium/chromium/{chromium-40 => armv6}/0004-Remove-hard-coded-values-for-CC-and-CXX.patch (100%)
 create mode 100644 recipes-browser/chromium/chromium/armv7a/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0001-Remove-accelerated-Canvas-support-from-blacklist.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0002-Add-Linux-to-impl-side-painting-whitelist.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0003-Disable-API-keys-info-bar.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0005-Remove-X-libraries-from-GYP-files.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0010-systemd-218.patch (100%)
 create mode 100644 recipes-browser/chromium/chromium/chromium-49/create-file-for-configure.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-49/fix-compile-warnings.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-49/v8-internal-startup-data.patch
 delete mode 100644 recipes-browser/chromium/chromium/unistd-2.patch
 rename recipes-browser/chromium/{chromium_40.0.2214.91.bb => chromium_49.0.2607.0.bb} (71%)

-- 
2.7.0.rc3


