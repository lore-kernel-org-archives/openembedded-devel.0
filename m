Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nmacmunn@gmail.com>) id 1QA5gh-0006qT-O8
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 21:25:15 +0200
Received: by iye7 with SMTP id 7so943049iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=UBYsjMiM8XjrJLCtYL3ALV2Kg4uXblzq6Qpe4GLmfPg=;
	b=QDyGJ8eRA3zgMijHX2uN7hKzoxyHMEqxJQ3j+UjxKWqcH5KxkqZ8OZJhREXwcPSc0B
	QLN17CFEPNwNQYmkQBIZpnC3xWAYlk+VCVEgSMxA52OALFLuA+K04R3tkebUOg4sMk+s
	ufvK1Mr27JjY8u27xRsbFGTpjDd4cXOPvuy2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=M8QUupn43FFjl2BryYDGND1Mk7GPr4a29WuH51PwcQ3BFbI9X5plozXF/TkreXrCQT
	1lNS4USueZDfYtsSNThDC8l8aVsdPglmk4U6WpOZUzGz0dtk3hH1GCnrJB1ulJuGLYu0
	As8UJ+C4i7tS15YfM6IJiIUL6iPkrWWyaGNGU=
Received: by 10.43.65.132 with SMTP id xm4mr2227694icb.424.1302722579669;
	Wed, 13 Apr 2011 12:22:59 -0700 (PDT)
Received: from localhost.localdomain ([74.3.164.55])
	by mx.google.com with ESMTPS id y10sm615384iba.63.2011.04.13.12.22.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 12:22:58 -0700 (PDT)
From: Neil MacMunn <nmacmunn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2011 12:22:29 -0700
Message-Id: <1302722549-6351-1-git-send-email-neil@gumstix.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] networkmanager-openvpn: added version 0.8.3.995
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Apr 2011 19:25:15 -0000

* Makes networkmanager-openvpn compatible with networkmanager version 0.8.3.999
* This recipe adapted from version 0.8.1

Signed-off-by: Neil MacMunn <neil@gumstix.com>
---
 .../networkmanager-openvpn_0.8.3.995.bb            |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 recipes/networkmanager/networkmanager-openvpn_0.8.3.995.bb

diff --git a/recipes/networkmanager/networkmanager-openvpn_0.8.3.995.bb b/recipes/networkmanager/networkmanager-openvpn_0.8.3.995.bb
new file mode 100644
index 0000000..808970a
--- /dev/null
+++ b/recipes/networkmanager/networkmanager-openvpn_0.8.3.995.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "NetworkManager"
+SECTION = "net/misc"
+LICENSE = "GPL"
+PRIORITY = "optional"
+DEPENDS = "networkmanager libnl dbus dbus-glib hal wireless-tools policykit gnutls util-linux-ng ppp libglade gnome-keyring"
+RDEPENDS_${PN} = "wpa-supplicant dhcp-client \
+           ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
+           "
+
+EXTRA_OECONF = " \
+		--with-distro=debian \
+		--with-crypto=gnutls \
+		--disable-more-warnings"
+
+inherit autotools pkgconfig
+
+PR = "r0"
+
+SRC_URI += "${GNOME_MIRROR}/NetworkManager-openvpn/0.8/NetworkManager-openvpn-${PV}.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "5b996d3167bc0b75f5b4e65338100ff5"
+SRC_URI[sha256sum] = "bf11a963f526239fe1654b4824321eafb5f527e10fcef6b7fa5fdceaa4d9ce5c"
+
+
+S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
+
+FILES_${PN} += " \
+		${libdir}/NetworkManager/*.so \
+		${datadir}/gnome-vpn-properties \
+		${datadir}/icons "
+
-- 
1.7.1



