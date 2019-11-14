Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 03B3D7F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b17so7462458wmj.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BQXoy7Sgkiok7C0suTJ+UxB3q/dbtiz01aiqQccROR8=;
	b=ao0cY+rICxtH0Ut/Bem3tPNWbVnxEjosdr4t5gc3cAGaziZh+N2/EUJedSy/ta6VrK
	aqUU3CeXbZtWbGj+rnN2IGz2aVlBZK5PQ8VxusYV7SPUAgmcE2oDoy8pS31/DokxzV6A
	dwMztioLTb7cd+6vqm0MoWus4PhTCiGoDkBD4TqFh8HuUk/PUHcf4Jxd7H81jDVDxzrw
	IrSzGp1WReyglx9M9R5T0FM+dQMn7q1IhTpkei9jDcw6/C/qi7gkV0KaKe/sFnlm3Uv8
	ZvpTFxHCYvJWci1ZaO61ExCKtJWznxrVfKXgri7wtCUlmF7D6qeoR9UzhDY0zvfvoGPt
	D3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BQXoy7Sgkiok7C0suTJ+UxB3q/dbtiz01aiqQccROR8=;
	b=mkYEuG3Mzcj/OJcpBl+cVGrtKUhc3iHt2cpSSZuZ57WgpWzNq7A+T+GhRB59ibSxPC
	NNGRBiUpiVy7/sGlXIkJ0dN5353K6zVwxA+FyHq3kyu3HpHGbaSBIYRHTpheZPyAoOqJ
	f6Ojieq6AWW2Xt4a/4mzD3WirhjyTcjZ6fgBX8m/1IHENTNBfmEMzQqp63l1sAgsSvkb
	OmQ/79G9xlNJIZ963cLT1dDgW8PWDVWOAd4d1OVtqeKmn5Kj+Ef1tJCNv6SSPLZVK9r3
	OGwRA5B5RnoEHm3d2poXaUqBD1mff7/Zq9EUdoap1TC6EUO/MutTCSX0L7tSZuLay6Lt
	iOSg==
X-Gm-Message-State: APjAAAXlWFonTRZ3qvHK5PPKg4bb83NWHe2g+5fm+9uYxancx/hFhNkr
	TaACT49VrzS59UwgEuxDRvDrVl85
X-Google-Smtp-Source: APXvYqzKlZ3fXP1TdtpKBfy9bvpD/4N1I7GBGqr4IsUjnY4K0SpGrgZ7EvrjZUqHRKJbQZif6xA59A==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr9141867wmj.36.1573760979136;
	Thu, 14 Nov 2019 11:49:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:14 +0100
Message-Id: <20191114194930.2786-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/16] Next gnome batch
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Waiting for review / autobuilder :)

Andreas Müller (16):
  gedit: upgrade 2.30.4  -> 3.34.0
  gtksourceview2: remove
  evolution-data-server: give up fine grained -dev/-dbg packages
  evolution-data-server: upgrade 3.26.6 -> 3.34.1 and rework
  gnome-terminal: re-add 3.34.2
  gnome-font-viewer: initial add 3.34.0
  evince: upgrade 3.28.2 -> 3.34.1
  file-roller: inital add 3.32.2
  gexiv2: initial add 0.12.0
  gnome-autoar: inital add 0.2.3
  tracker: initial add 2.3.1
  nautilus: upgrade 3.18.5 -> 3.34.1
  geocode-glib: initial add 3.26.1
  libgweather: initial add 3.34.0
  libwacom: initial add 0.33
  gnome-settings-daemon: initial add 3.34.1

 ...for-address-localization-when-LC_ADD.patch |  33 ----
 ...-to-LDFLAGS-when-linking-libphonenum.patch |  36 ----
 ...ntrispection-support-to-work-with-OE.patch |  75 ---------
 .../eds/evolution-data-server_3.32.4.bb       | 155 ------------------
 ...-format-attribute-to-_synctex_malloc.patch |  12 +-
 .../evince/0001-help-remove-YELP-macro.patch  |  24 ---
 ...vDocumentModel-get-type-function-dec.patch |  33 ----
 ...02-add-a-formatting-attribute-check.patch} |   0
 .../recipes-gnome/evince/evince_3.28.2.bb     |  65 --------
 .../recipes-gnome/evince/evince_3.34.1.bb     |  52 ++++++
 .../evolution-data-server-native.bb           |  23 +++
 .../evolution-data-server.bb                  |  70 ++++++++
 .../evolution-data-server.inc                 |  15 ++
 ...keLists.txt-Remove-TRY_RUN-for-iconv.patch |  28 ++--
 ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch |   0
 ...the-Novell-sample-contact-with-somet.patch |   0
 .../0004-call-native-helpers.patch}           |  33 ++--
 .../evolution-data-server/iconv-detect.h      |   0
 .../file-roller/file-roller_3.32.2.bb         |  26 +++
 ...001-Remove-help-directory-from-build.patch |  29 ----
 ...ify-handle_builder_error-with-format.patch |  31 ----
 ...aver.c-Define-ACCESSPERMS-if-not-def.patch |  31 ----
 ...1-workaround-void-pointer-arithmetic.patch |  57 -------
 ...format-literal-warning-to-fix-build-.patch |  38 -----
 .../recipes-gnome/gedit/gedit_2.30.4.bb       |  33 ----
 .../recipes-gnome/gedit/gedit_3.34.0.bb       |  44 +++++
 .../geocode-glib/geocode-glib_3.26.1.bb       |  20 +++
 .../recipes-gnome/gexiv2/gexiv2_0.12.0.bb     |  19 +++
 .../gnome-autoar/gnome-autoar_0.2.3.bb        |  18 ++
 .../gnome-font-viewer_3.34.0.bb               |  25 +++
 .../gnome-settings-daemon_3.34.1.bb           |  59 +++++++
 .../gnome-terminal/gnome-terminal_3.34.2.bb   |  36 ++++
 .../gtksourceview-classic-light_1.0.bb        |   3 -
 .../gtksourceview/gtksourceview2_2.10.5.bb    |  32 ----
 .../libgweather/libgweather_3.34.0.bb         |  24 +++
 ...ome-desktop-thumbnail-API-with-new-g.patch |  40 -----
 .../recipes-gnome/nautilus/nautilus_3.18.5.bb |  33 ----
 .../recipes-gnome/nautilus/nautilus_3.34.1.bb |  32 ++++
 .../recipes-gnome/tracker/tracker_2.3.1.bb    |  50 ++++++
 .../recipes-support/libwacom/libwacom_0.33.bb |  14 ++
 40 files changed, 562 insertions(+), 786 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-to-work-with-OE.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
 rename meta-gnome/recipes-gnome/evince/evince/{0001-add-a-formatting-attribute-check.patch => 0002-add-a-formatting-attribute-check.patch} (100%)
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
 create mode 100644 meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch (60%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch (100%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch (100%)
 rename meta-gnome/recipes-gnome/{eds/evolution-data-server/0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch => evolution-data-server/evolution-data-server/0004-call-native-helpers.patch} (52%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/iconv-detect.h (100%)
 create mode 100644 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
 create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
 create mode 100644 meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
 create mode 100644 meta-gnome/recipes-support/libwacom/libwacom_0.33.bb

-- 
2.21.0


