Return-Path: <drew.moseley@northern.tech>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC537EEFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 19:58:56 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id h28so22262999vsl.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kD1gbV9zVnNTvczuw0I6gCGKmjwgYI2MSY0cYoDdG74=;
	b=bcT2ETauDFMV+TSbUnJXRiEyGk7SaBTsaQ8HH3O8eGhuqbWPtc1BnifQ+H11q+gSdC
	ajHVBOe76+LvDXNLzI+m87XfxUM/WyM6Byh3d1SnFsqyUqKj7Jup6g4EDODWNc3cCLIX
	rzKB8Lz6TinxEqfyQg4CCMN6oZVQKPe+N28WQDGGPgbBzG2NqLUT8q9eg845fO8dY0DH
	N2btt2NZWnDHAnaN5ocDK3pJ4de7DOwgaTRDFcUHSPD+DhxFMoQSBlU9WLlP7Vex9GKj
	7hIIE2H0e7oRTjye9eVybYBWwEHXAzNcKPZpA5z9MJLx3GUHAdHZRMbSBO/Sx0nwLIC3
	hpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kD1gbV9zVnNTvczuw0I6gCGKmjwgYI2MSY0cYoDdG74=;
	b=uVkQ05m4euHZ1XWFRsvwDPTqVJJ6iOnDEcgqT3wODR2Up1Pe5XrJXnK/Dkp9G/5AXD
	22CJ2kI9sbzgsH6Q3J/hkh64AnrzjbHfYaoTpK+csQDbQPNAfVVFBaNAObD3IP19/ByE
	IeV6RZMGy8vW/6h0h/stZplR+6FbTx1vMDNxAM9vpjqYCO3bwetviS3xsPENozMf1SmQ
	vV89juQspfAHpP5IEMYW5UnFxlmKIskXd+Mpw745fWeXqyWmeHsK4dXw5SWmgIiRiit6
	de+qzxxgTpS9K/aKUwlI0BjRAopnhNw+3IHD+zm0cXrmrIvsQ1HpewWRrq0sRMjefWSC
	J2Ow==
X-Gm-Message-State: APjAAAXfZ5mSZn7u4gCFlilQetyTB09ya24jPQn1Gffy6jx8oS2ceOa4
	VTxF/FZhBJGgjj+5f7Tcq/FV+D+pCI5Bqw==
X-Google-Smtp-Source: APXvYqwsV40jSxuiesQf0ofWjohEFPDGpO5TcpR9LwED3fERQ1Pwe5gR3grCO2FUJ418OMqeMoI5DQ==
X-Received: by 2002:a67:e9d9:: with SMTP id q25mr32705144vso.74.1563566336784; 
	Fri, 19 Jul 2019 12:58:56 -0700 (PDT)
Received: from dmoseley-build.c.developers-build-hub.internal
	(189.109.211.35.bc.googleusercontent.com. [35.211.109.189])
	by smtp.googlemail.com with ESMTPSA id
	q190sm7628198vkb.39.2019.07.19.12.58.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Jul 2019 12:58:56 -0700 (PDT)
From: drew.moseley@northern.tech
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2019 19:58:56 +0000
Message-Id: <20190719195856.4305-1-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] networkmanager: Use ALTERNATIVES for resolv-conf handling.
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
X-List-Received-Date: Fri, 19 Jul 2019 19:58:56 -0000
Content-Transfer-Encoding: 8bit

From: Drew Moseley <drew.moseley@northern.tech>

This brings the networkmanager in sync with how systemd-resolved and connman
work. Additionally this allows it to function with a read-only rootFS.

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
---
 .../networkmanager/networkmanager_1.18.0.bb          | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 21fbea9c1..037566783 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc
+inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -141,6 +141,16 @@ FILES_${PN}-nmtui-doc = " \
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'NetworkManager.service NetworkManager-dispatcher.service', '', d)}"
 
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
+ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
+
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
+
+    # For read-only filesystem, do not create links during bootup
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
+    fi
 }
-- 
2.22.0


