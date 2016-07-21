Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id E9E9E6FF93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 04:21:12 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p74so64001339qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 21:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=b4K9vWfcMyxL9AaLi87qJSmbXlx8PcoqcqH+a3lcFUE=;
	b=xW/8Z8Kru8NUIqlE9OWh3ilnmtImoEN+KQIFN2mqJhEKovqbYFzwV7mnnBd7NWWFkl
	s3GUuMgZ99Ikq9Uwp+Qyyvtg9j0JV70L4Njg3LWtol1/MYmjanM7S2BsFMS6RyCUs0pJ
	/AGoUJE9wy//DKybfSNMhCKgdGljyM8fzrmV0BaI4Q9jbSh//ZUCnXyA95tliFA4oNYS
	T4Tuxym23Z9V4uoxDb7wnX5g0cqI1HP0EkBj4doJljIJhYYUfCZijDYfPCaWgKD/56kM
	HO2Ljj7uMuo0TmhWNrQOHAT9i+SEcVO2YRdkU6IPuej0wB4WS0g3wqN7txxc4fa4WCb8
	dSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=b4K9vWfcMyxL9AaLi87qJSmbXlx8PcoqcqH+a3lcFUE=;
	b=OIUQUatur5wsLl92pxieMiqKYkapN/Dgn2DZ2bsNoPxBefqTExiZLdcFy5pB6u7onk
	P1t+QCRgQF1G3mzfyjWbZm8jEMqqUi0WFNbB3KBJWMQtG8W9z6l3sssyrA22+sqUgtLh
	ysbldo9Ve5hbrk5fONaw4+wYXJeAIeXj6w/La6vITCTNVSj2Q6wDoc3g6tq4UhSnFG60
	EtTtz+NhRBWhVgZ6QXdNWO2NR3glBHlnFmPHGT6n8IX9qXtxeEo2euVfAExUX3isoiAP
	nEkA2VXk27JKCXRiZfGc/OZDdUxV85zJqar+1q2dodCHnYuI82cvjdZWj8d2KxQUowhO
	EabA==
X-Gm-Message-State: ALyK8tJYJMaJRM2ZqYF5zGTHTQ8kkCvpbKowP/FwcD5pqk7X6YUn8Jsvr2qqJlDIe2M9Dw==
X-Received: by 10.55.160.211 with SMTP id j202mr64372198qke.108.1469074872811; 
	Wed, 20 Jul 2016 21:21:12 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	b132sm3342006qkg.8.2016.07.20.21.21.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 21:21:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 00:21:30 -0400
Message-Id: <20160721042134.14806-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-browser][PATCH v2 0/4] chromium updates
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
X-List-Received-Date: Thu, 21 Jul 2016 04:21:13 -0000

Building chromium for wayland is a significantly more difficult action than
building it for x11. In order for chromium to run on top of wayland, a shim
is required. This shim is added by checking out a separate repository which
provides patches that are applied to the chromium sources. These patches
are only generated a couple times per year, meaning only a small number of
chromium releases are capable of being run on wayland. This artificially holds
back the versions of chromium which this recipe can provide.

This patch set:
- starts off with a little cleanup (removing an unused patch),
- adds gcc-6 support (making it possible to build successfully with gcc-6),
- splits out a chromium-wayland recipe from chromiumso each can move
  independently and, therefore, lower the maintenance effort while keeping
  up-to-date, and
- updates the chromium recipe to 52.0.2743.76 which is considered the
  latest stable (as per https://www.chromium.org/developers/calendar)

Changes in v2:

In the first version of this patch set, I split the "chromium" recipe into
"chromium-wayland" and "chromium-x11" (thus removing the existing/expected
"chromium" recipe. In this patch set I leave the "chromium" recipe to continue
building for x11 and define a new recipe specifically for "chromium-wayland".

Trevor Woerner (4):
  chromium: remove unused patch
  chromium: gcc-6 support
  chromium: split -wayland out
  chromium: update 48.0.2548.0 -> 52.0.2743.76

 recipes-browser/chromium/chromium-browser.inc      |  33 ++--
 .../chromium/chromium-wayland_48.0.2548.0.bb       |  32 ++++
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch |  60 -------
 .../0002-Disable-API-keys-info-bar.patch           |  33 ----
 ...-image_util.cc-disable-warning-from-gcc-5.patch |  39 -----
 .../0008-Fix-GCC-uninitialized-warning.patch       |  26 ---
 ...9-Fix-build-errors-with-GCC-in-Debug-mode.patch |  46 -----
 ...be-used-uninitialized-in-this-function-wa.patch |  25 ---
 ...for-unused-variable-error-in-ui-gfx-color.patch |  86 ----------
 .../0006-Remove-GBM-support-from-wayland.gyp.patch |   0
 ...for-glib-related-build-error-with-ozone-w.patch |   0
 .../0011-Replace-readdir_r-with-readdir.patch      |   0
 .../add_missing_stat_h_include.patch               |   0
 .../chromium/chromium-wayland/remove-Werror.patch  |  73 ++++++++
 .../0011-Replace-readdir_r-with-readdir.patch      | 186 +++++++++++++++++++++
 .../chromium/add_missing_stat_h_include.patch      |  39 +++++
 .../chromium/chromium/chromium/remove-Werror.patch |  74 ++++++++
 recipes-browser/chromium/chromium/unistd-2.patch   |  27 ---
 recipes-browser/chromium/chromium_48.0.2548.0.bb   |  50 ------
 recipes-browser/chromium/chromium_52.0.2743.76.bb  |  18 ++
 ...accelerated-Canvas-support-from-blacklist.patch |   0
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch |   0
 ...y-i18n_process_css_test.html-file-to-avoi.patch |   0
 ...erride-root-filesystem-access-restriction.patch |   0
 recipes-browser/chromium/files/api-keys.patch      |  13 ++
 .../{chromium => files}/armv6/include.gypi         |   0
 .../{chromium => files}/armv6/oe-defaults.gypi     |   0
 .../{chromium => files}/armv7a/include.gypi        |   0
 .../{chromium => files}/armv7a/oe-defaults.gypi    |   0
 .../{chromium => files}/component-build.gypi       |   0
 .../chromium/{chromium => files}/google-chrome     |   0
 .../{chromium => files}/google-chrome.desktop      |   0
 .../{chromium => files}/x86-64/include.gypi        |   0
 .../{chromium => files}/x86-64/oe-defaults.gypi    |   0
 .../chromium/{chromium => files}/x86/include.gypi  |   0
 .../{chromium => files}/x86/oe-defaults.gypi       |   0
 36 files changed, 447 insertions(+), 413 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0002-Disable-API-keys-info-bar.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-uninitialized-warning.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0006-Remove-GBM-support-from-wayland.gyp.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0011-Replace-readdir_r-with-readdir.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/add_missing_stat_h_include.patch (100%)
 create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium/0011-Replace-readdir_r-with-readdir.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium/add_missing_stat_h_include.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium/remove-Werror.patch
 delete mode 100644 recipes-browser/chromium/chromium/unistd-2.patch
 delete mode 100644 recipes-browser/chromium/chromium_48.0.2548.0.bb
 create mode 100644 recipes-browser/chromium/chromium_52.0.2743.76.bb
 rename recipes-browser/chromium/{chromium/chromium-48 => files}/0001-Remove-accelerated-Canvas-support-from-blacklist.patch (100%)
 rename recipes-browser/chromium/{chromium/chromium-48 => files}/0003-Remove-hard-coded-values-for-CC-and-CXX.patch (100%)
 rename recipes-browser/chromium/{chromium/chromium-48 => files}/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch (100%)
 rename recipes-browser/chromium/{chromium/chromium-48 => files}/0005-Override-root-filesystem-access-restriction.patch (100%)
 create mode 100644 recipes-browser/chromium/files/api-keys.patch
 rename recipes-browser/chromium/{chromium => files}/armv6/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/armv6/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/armv7a/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/armv7a/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/component-build.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/google-chrome (100%)
 rename recipes-browser/chromium/{chromium => files}/google-chrome.desktop (100%)
 rename recipes-browser/chromium/{chromium => files}/x86-64/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/x86-64/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/x86/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/x86/oe-defaults.gypi (100%)

-- 
2.9.0


