Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id BDCC779C92
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y11so15127839wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ep2U3VPO1y+UqOP8yvh5HjWFkiEUdEhHLe+X14OiuRM=;
	b=UT3CKP3EufWvvJvisyRZHPGQh8BwnfuNQOvRFXt4fB6J7CzIARqKKMcQU/L3ibqxkG
	nfTBxz+jcnVqTQpYXsLYh8pwHcFRQWD92heuwTnIbm7BTy/1M4YZ+IERoGkQDmQQZP5t
	6RZly/eXwHg6j0cWUtYR8bIBm1oOcSE5nsUcrloU4BJp2D0ZpsaWBY7RWhvkjZxhhZ3c
	GSIs1hD32VaTgOnSXkcdYss0QC9rd1z3rO39HaeETL55JY74uGGvwrlRSqBF5RmacR3i
	fxW4ATu5an3WeLRYJiPpo8ghX12PpqTvOwE7S2LWirS48grRvw9RKPBmMauy5AI0b4xa
	g9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ep2U3VPO1y+UqOP8yvh5HjWFkiEUdEhHLe+X14OiuRM=;
	b=S2L1/QkJC5C3Rjk/ULMHAwn7lxsPdlWwyCMoA55z8pPVo3Cs6nU6icIIfmxSRuDDar
	0AKuWPx46+NJ2XDp9cWG3sy7kcYdLHOITedfCrwpi2c5uDFKDbRAbZsPBpCL5yarxPSl
	NByRUn9vzM3CvUjyQP5Wj7TTTWhV1E/XwFf1k7sJgYLvtsPHNoky3y1fElbx6sg5lIh2
	HX5DVIiGHQFmmCNdV/k8mRJ/gjxKMsSNSH3O7teC8VH6WevFjtTCyMeEQhASKbMb3egl
	6EJSCDklJh5KEsA9aisfU8wqV3lN4t6FN7mbnUjd8CgxH9JVwhuZlag8J8YLIZGtX2fI
	BvDA==
X-Gm-Message-State: APjAAAUH/gzPO51BA03p5XWFLFawcH3InGGcFMayGCvE+LViqQdMDA5H
	y2YtwyikaqVBTVDnr7GNL5C5cEwf
X-Google-Smtp-Source: APXvYqz7N5dcLh3PITdu1ehj5FhhrjADQE2LUVr7W525wWo22RBSLzq8ri7Ub8VhNHEmLnjxkI5FlA==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr768286wrv.0.1575880582215;
	Mon, 09 Dec 2019 00:36:22 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:52 +0100
Message-Id: <20191209083612.23922-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][v3 00/20] Gnome cleanups & desktop patches
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2 -> v3: rebased -> master-next

Andreas Müller (20):
  gjs: initial add 1.58.3
  gdm: re-add 3.34.1
  gnome-shell: initial add 3.34.1
  gnome-shell-extensions: initial add 3.34.1
  accountsservice: initial add 0.6.55
  rest: initial add 0.8.1
  gnome-online-accounts: initial add 3.34.1
  gnome-control-center: re-add 3.34.1
  gnome-session: inital add 3.34.1
  gnome-panel: (re)add 3.34.1
  gnome-flashback: initial add 3.34.1
  Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
  glfw: add features_check to inherit
  stalonetray: Add x11 to required distro feature
  projucer: add x11 to required distro features
  colord-gtk: add polkit to required distro features
  yelp: add x11 to required distro features
  file-roller: remove nautilus from DEPENDS
  libgdata: add x11 to required distro features
  accountsservice: Hack musl build fix

 .../file-roller/file-roller_3.32.2.bb         |  1 -
 .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
 .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++
 ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
 .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
 .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
 .../gnome-online-accounts_3.34.1.bb           | 35 ++++++++++
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
 .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
 .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
 .../gnome-shell-extensions_3.34.1.bb          | 29 +++++++++
 .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
 .../libgdata/libgdata_0.17.10.bb              |  5 +-
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 33 ++++++++++
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |  5 +-
 .../0001-musl-Hack-to-fix-build.patch         | 36 +++++++++++
 .../0002-musl-add-missing-fgetspent_r.patch   | 46 +++++++++++++
 .../accountsservice/accountsservice_0.6.55.bb | 33 ++++++++++
 .../colord-gtk/colord-gtk_0.2.0.bb            |  4 ++
 .../packagegroups/packagegroup-gnome-apps.bb  | 19 ++++++
 .../packagegroup-gnome-desktop.bb             | 26 ++++++++
 .../recipes-multimedia/juce/projucer.inc      |  4 +-
 meta-oe/recipes-core/glfw/glfw_3.3.bb         |  2 +-
 .../stalonetray/stalonetray_0.8.3.bb          |  4 +-
 26 files changed, 752 insertions(+), 6 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb

-- 
2.21.0


