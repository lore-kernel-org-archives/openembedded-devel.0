Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 358977DC48
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 21:36:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b1so9655501wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xurmwT24gUi1YRNcm0Px/VS/RwZ+82ZAt3vsvtJcfNE=;
	b=Lkqj7smUSeX6vSy+GJ6C7lQNMRIfez1y1LCDhaGINrxUcpDM/GALwmmfrtvx2T7lLD
	EulPAvgRBHQtPS7ZTv8aIL4AaT2uA3+Qh+Ub5HWWEpzLudN9X744JbDLOmFt3QXXKUrD
	lM/9rkiWrY/FDaB5cM4oPFKx9MANxFylzjmfKkDpbkD9Au/WNkq89nsbte+NjxXd/Qyn
	IOK0mhBumKlL0EI3GaOI3hz6mk4AniuDaVov6OG8X9Zove+uZQfjTLljzDCPeRJ+lodw
	BE4iEFQQi+WXCrUs/PFCz8osD3CkoA7rCSdXHtxTwFXay0AG0QACNUns5GIIbOXJKl1U
	gslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xurmwT24gUi1YRNcm0Px/VS/RwZ+82ZAt3vsvtJcfNE=;
	b=h28MKRTyA0dY/rveCdK2zPSseDEZvnElYYwS51dU83pn/OLvZ1+TSpy0BsS3utLKnb
	05+OV4w2+/vnLPKV8CCC5YM0SjXY83NgttPTUlY/n0Rr24bmqhvoGGXzXGa3ZEayRQen
	gGBHcC7gMulgAqu1ka5szLL/9l3IU7WOl4SuUBK9tZ/wOkQwQP5y7mtsElja17the07K
	eeAUVjCzX0JcQg8RIwebaUXr3TvPmdi49Jo/ZLJfTWcfPyaz8eWTRDk6QxsODp0lmS3r
	tXREe8QxMVyJRccM6z3hxdNauV/BOUZ9OQqBDYvwDFYWWpIoUv3/44RuTrn+jAhhYgoz
	TaLg==
X-Gm-Message-State: APjAAAXmr0VoCJGBVbR6F+sDn1xVcJDVlD8L7hQ7RfRzO8/lb+LCQDgA
	rnud8I1Fnmk+lh6Ms0xqcTWFpXqxvgE=
X-Google-Smtp-Source: APXvYqxxfRGX75qelxJStC7OaodHGvFEPYcW9RNPa8cNIe92ZMEMa1K6HkkV/sofJ2kIeMI2OtM1SA==
X-Received: by 2002:a05:6000:10cc:: with SMTP id
	b12mr10637034wrx.182.1556400965492; 
	Sat, 27 Apr 2019 14:36:05 -0700 (PDT)
Received: from localhost.localdomain (5-13-153-104.residential.rdsnet.ro.
	[5.13.153.104])
	by smtp.gmail.com with ESMTPSA id x20sm954257wrg.29.2019.04.27.14.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 14:36:04 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
X-Google-Original-From: Beniamin Sandu <beniamin.sandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Apr 2019 00:35:51 +0300
Message-Id: <20190427213551.14485-1-beniamin.sandu@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: create recipe for version 1.9.1
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
X-List-Received-Date: Sat, 27 Apr 2019 21:36:05 -0000

Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
---
 .../recipes-support/unbound/unbound_1.9.1.bb  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.1.bb

diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
new file mode 100644
index 000000000..84bbe6581
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
+DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
+	features including enhanced security (DNSSEC) validation, Internet Protocol \
+	Version 6 (IPv6), and a client resolver library API as an integral part of the \
+	architecture"
+
+HOMEPAGE = "https://www.unbound.net/"
+SECTION = "net"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
+
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
+SRCREV="16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
+
+inherit autotools pkgconfig systemd
+
+DEPENDS = "openssl libevent libtool-native bison-native expat"
+RDEPENDS_${PN} = "bash openssl-bin"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
+		--with-ssl=${STAGING_EXECPREFIXDIR}"
+
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd,,systemd"
+
+do_install_append() {
+	# systemd support
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${systemd_unitdir}/system/
+		install -m 0644 ${B}/contrib/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
+	fi
+}
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-- 
2.17.1


