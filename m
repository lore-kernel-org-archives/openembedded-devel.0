Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 44AEF6212F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:51:37 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id u25so32232988qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=EIVLFDlEx39NBx72cPYCwUJvQDw9uZRnrqdOXIr+Fnw=;
	b=zWQAURpnvthWcRRpDFXIpPkEfhHaXgb8hhbkuo180xyA9cg0NRth2lslTerUa9XNDB
	/sCDoiHX0T2z6iduA0t8nq29Nq9cegkWA26gYidl0xiNphobBeTgF4LI15bPxsjQPBma
	CvznG9GystpsmKHCOmdnkG7a/yxLZAFaFGK6llt547JqxUKLy1cvGE3gsQAyfrfKX5N+
	tYsDlnDtXtk8yQc8l93G4NM9Zuqvfx/fjV4LIAeVDYC7eruliT+dsifqjKT42jJIjVLx
	dX/sekR7hKMVbpW+4NTfxen14gV9gVEHYBFd+wmbJTarH0O3ODJD7mPhzrRjsAWmAGwy
	/aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EIVLFDlEx39NBx72cPYCwUJvQDw9uZRnrqdOXIr+Fnw=;
	b=k4onjrN3V3DZTpLtuyvh3b2nIqsv6vfiaNPe5Hkw3Tizukz02m18KZRdIsFAgYygam
	licmnJNyaVov2JWr7ZQnBvKg0S0FLvk15e7Eh0rjHeFK0fpL/rSUQObCUpmlwigfu/mo
	oWfgR1XNsYZzCgBOsC+qODi5lJvYq8hlWvOG4fPUg2Ilq0HDkuyM4UoQ1US1Fb+npZEL
	UJITBwbj08fNIeQUcroMOwOVuLrCfEKXRA0C0E4jVm2B0DWRLHUTXWNLmokE43v70w/9
	I9g2Gx2oNUdpsbBuVBAi2AB/HYNLz/Ks4yurMZrxhTlK4T2ykO+g2vC+0vtGI9w5NBFq
	WFIg==
X-Gm-Message-State: ALyK8tKirM3MWm8Wgeebv9CxfwRh9lxUHuWMAyjhTIKVHt2dMimfDItZgVaNA6vok6eQiQ==
X-Received: by 10.200.34.221 with SMTP id g29mr50188428qta.2.1469044298204;
	Wed, 20 Jul 2016 12:51:38 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l1sm2258049qtd.49.2016.07.20.12.51.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 12:51:37 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 15:51:57 -0400
Message-Id: <20160720195201.22250-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-browser][PATCH 0/4] chromium updates
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
X-List-Received-Date: Wed, 20 Jul 2016 19:51:38 -0000

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
- splits the chromium recipe into wayland and x11 parts so each can move
  independently and, therefore, lower the maintenance effort while keeping
  up-to-date,
- updates the chromium-x11 recipe to 52.0.2743.76 which is considered the
  latest stable (as per https://www.chromium.org/developers/calendar)

Trevor Woerner (4):
  chromium: remove unused patch
  chromium: gcc-6 support
  chromium: split into -wayland and -x11
  chromium-x11: update 48.0.2548.0 -> 52.0.2743.76

 recipes-browser/chromium/chromium-browser.inc      |  33 ++--
 .../chromium/chromium-wayland_48.0.2548.0.bb       |  32 ++++
 .../chromium/chromium-x11_52.0.2743.76.bb          |  18 ++
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
 .../chromium-x11/add_missing_stat_h_include.patch  |  39 +++++
 .../chromium/chromium-x11/remove-Werror.patch      |  74 ++++++++
 recipes-browser/chromium/chromium/unistd-2.patch   |  27 ---
 recipes-browser/chromium/chromium_48.0.2548.0.bb   |  50 ------
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
 create mode 100644 recipes-browser/chromium/chromium-x11_52.0.2743.76.bb
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
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
 delete mode 100644 recipes-browser/chromium/chromium/unistd-2.patch
 delete mode 100644 recipes-browser/chromium/chromium_48.0.2548.0.bb
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


