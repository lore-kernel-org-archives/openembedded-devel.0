Return-Path: <brgl@bgdev.pl>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 67F0F6BA11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 22:34:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t3so4562687pga.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sw6sqZY+o6xrrebiEXBdaXbnhY4zp/THSTybUKeVwNY=;
	b=XZBIi6RXBNAa5iU/4EAmOoMaN415vpghy3S9RvG7yKN9QE7HmCM2P1VLeVhOo7qGRO
	c3dqyChCuMdYKuNtNKTxY82LPvU6a5DO0SZv4hdCeIItxS60QiUi6KhPNydXOJRGCNhi
	dhJ7PhnixHu17s8XjgVFRjA3RLr8U50SaZ8IhiNW8RC0OsLc/rrCw0P7vd+hNzUZhlbA
	YsVNG8JNGipWMsm1Q5iK78JCGAnQfA7CepDU42EQRkEfFOsoIx0gBgpbs7dRzuLwavCe
	m3iK34KVef750iFFt8YerGa3WhrrRBxmHa+N8Y74ViGYpQbwH8W12SDQTtTFNGZfDwmB
	atdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sw6sqZY+o6xrrebiEXBdaXbnhY4zp/THSTybUKeVwNY=;
	b=TDQ/fMuv97MzemtZtqDInz9+POxx1+Nnsk6XCYwWew9WKZK7MoZWmjtzZnuAyy+/GJ
	1a5y0yWlSs3j4IWFhY1p3QzoVrL8qGE3iwwMHISXF1Dnr4/Ne3asbIuX2bKXnLQFKtAx
	y1RLY7PestmbZNgHuvWlLiwDR7uRSxjcw1z094wVXapG9Pp92+SNEsuPXcDOw72X8oil
	aoT83SrNbrUH+vYwJMpSQwyuGh0+SX/iQwFaMVko9FkLUfzGzs6FDzyH6eRSknGek2+x
	dEzdVsjPs1ENcGKGw0Keye30E8hmz8rz8ckVvuqavh5JmMjbDP5rkdi/FjMTnaXH2sCL
	yb2A==
X-Gm-Message-State: APjAAAVlpKfGGEH+lV56harJEswjr8CXeQ91lYEm1R8iqQ4jM/SyiGjX
	mBUK2IXM/bvlBuFpv1Lo9lIIWQ==
X-Google-Smtp-Source: APXvYqxypqViEgIpT1/h52CCv71qT/IEDTdgNkQ4Zx4KLdHGzn5clgxjRf2jVVwzDOVRJ06Apqe+oA==
X-Received: by 2002:a63:4e26:: with SMTP id c38mr11962584pgb.260.1570746878189;
	Thu, 10 Oct 2019 15:34:38 -0700 (PDT)
Received: from debian-brgl.local ([204.153.194.98])
	by smtp.gmail.com with ESMTPSA id 6sm5797121pgl.40.2019.10.10.15.34.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 15:34:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 00:34:27 +0200
Message-Id: <20191010223429.31337-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH 1/3] networkd-dispatcher: use distro_features_check to check for systemd
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
X-List-Received-Date: Thu, 10 Oct 2019 22:34:37 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use distro_features_check to check for systemd in DISTRO_FEATURES
instead of a hand-crafted python function.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.0.1.bb     | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index 008a7ac9a..c700bd17c 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -1,9 +1,3 @@
-python __anonymous() {
-    features = d.getVar('DISTRO_FEATURES')
-    if not features or 'systemd' not in features:
-        raise bb.parse.SkipPackage('networkd-dispatcher needs systemd in DISTRO_FEATURES')
-}
-
 SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
 DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
 more limited in the types of events it supports due to the limited nature of \
@@ -13,7 +7,10 @@ AUTHOR = "Clayton Craft and others"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
+inherit distro_features_check
+
 RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
+REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/networkd-dispatcher-${PV}.tar.bz2"
 SRC_URI[md5sum] = "304d7dcc21331ea295e207f8493cb8d8"
-- 
2.23.0


