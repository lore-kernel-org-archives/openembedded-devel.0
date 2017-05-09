Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id DAAAA71A91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:28 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id u187so40230841pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=chmEcuSL70c+6MoSI8PtjCU1xLSHDR3pDARLdzrX7RE=;
	b=H3j/S9touESn2YiAsbd8DRxUuDaQWaCxxmQUYZdVQvnMcorgD2TMX11sPdV6RvEmc2
	uNC6J38x9XXYENA5oOaeQ3x3W93M//mkoeqEuL8kvpcp6NRpgph2HVp8G6k3/YnVPyF9
	do+xUGweX3j8AXCJ/JrQJOH3e3Sv1p8AGwGp6bYGaKj9NTuVTAj/r72ojzbq4E5SZptb
	RfoxMrRpWwSDKLZ4oqNSBhmiRYPTyRCP5qZ2VjeHS798ryyjiXpKYGopS5Rpm7ARhDE7
	5QWn1fYRKxPWEqahFMFCwMdUgqUtcqE6bCBSzDBcPbKVMIGLDy+a2uhi4RX8tjVXZeKk
	zigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=chmEcuSL70c+6MoSI8PtjCU1xLSHDR3pDARLdzrX7RE=;
	b=YQwaXwUjsSGClM+4ggjteAaGs/PzJR3TFvpsuUKTzX45otIQao4ntqPSclIsotgNyk
	sJiDZfcC/LqGWTqxTZ2w75/z4FVQuKEVqW9StgsHXCgUkgQnowUqOnFpAznse9cu4JT6
	rDKB7B9+vIEZG3XFuLc/KuQsECtxGKnr8ep6ONajl/cVWnm7KW++QJpL6uHOMVjCi7nx
	ArrDvbCSFrQaN33PorysuPPevHIYy0Y1FlhiHixxx9Y4vEu9MQENIZFtKHAfDSsAo8I0
	3jwycinFPbP0cVLFOid7LMNJARJLgRw/a0sURaydcAvuN6fW+VXYV3ZT1LU+/6W7jMui
	MgHg==
X-Gm-Message-State: AN3rC/4fZqJTKLK6Dwkg2NEWgOKNXSRxotmizpmpOxJIEOC7XjvnKIDY
	glDh3eXhikf28Y/g
X-Received: by 10.99.232.69 with SMTP id a5mr23057575pgk.167.1494316649686;
	Tue, 09 May 2017 00:57:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:09 -0700
Message-Id: <20170509075711.1575-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 7/9] media-service-upnp, renderer-service-upnp: Delete
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
X-List-Received-Date: Tue, 09 May 2017 07:57:29 -0000

These repos are gone from upstream https://github.com/01org

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dleyna/media-service-upnp_0.5.0.bb             | 24 ------------------
 .../dleyna/renderer-service-upnp_0.3.0.bb          | 29 ----------------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb
deleted file mode 100644
index baaf42b28..000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "discover, browse and search UPNP/DLNA media servers"
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://src/media-service-upnp.c;beginline=1;endline=21;md5=584eb103b4f6f3432c43d169b6a123a1"
-
-DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
-
-SRC_URI = "git://github.com/01org/${BPN}.git"
-SRCREV = "0dbc74a79aa07a8f8c7d32e1d2de6c4d3a0f95bc"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    install -d ${D}${bindir}
-    install -m 0755 dms-info ${D}${bindir}
-}
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-FILES_${PN}-tests = "${bindir}/dms-info"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
deleted file mode 100644
index 4d06d2c68..000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "discover and manipulate UPNP/DLNA media renderers"
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://src/renderer-service-upnp.c;beginline=1;endline=21;md5=c25c3082684eb4ca87474b7528c6dc15"
-
-PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S}) - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
-
-SRC_URI = "git://github.com/01org/${BPN}.git"
-SRCREV = "4a0b1d7cd8e22d3cb0e09c77c344ceccbcbbd34f"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    install -d ${D}${bindir}
-    install -m 0755 test/rendererconsole.py ${D}${bindir}
-}
-
-PACKAGES =+ "${PN}-tests"
-
-RDEPENDS_${PN}-tests = "python-dbus python-json python-misc python-pkgutil python-xml"
-
-FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-# When we have GI, package cap
-FILES_${PN}-tests = "${bindir}/rendererconsole.py"
-- 
2.12.2


