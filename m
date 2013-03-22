Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Eb-0007gi-Vc
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:35 +0100
Received: by mail-wi0-f175.google.com with SMTP id c10so2796217wiw.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=cHUG4ODhUZpNfkSBVALfNPzGcc2qfPM2hHp0LxRa6OI=;
	b=EPm0fEjVipJHrjc8tSFksISgLhCMB4KJohVLJCl4x/0yEP7y7p3Kajj7ECXMTYLVyu
	WBhgOzLkqN2piBkcylDcngi0Muqli0NIaoXjtWyGpbB2NGM45XNgBwlkGLvsDwNsa7Vc
	w9o/vmD3C3zVBm2GKqqwYZ2hAn6KbBzqjI7FTHncndgmO6215UvfYmp1yJET8al11xAS
	I6lz/bvBI8iw1Pkn/jLQLFYo4V+pTy+Y5VOlFTM3Kx0CqfaxDJSpXvPGV2fCAwhFezYc
	sEnB07jHtLVzIJvLqUjRdmwGJ4Xg0Pr11GsNpBIdCazZrrM+4dpr1o7z//2GYX/SbVYC
	xwuA==
X-Received: by 10.194.83.33 with SMTP id n1mr4842573wjy.7.1363974100172;
	Fri, 22 Mar 2013 10:41:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:27 +0000
Message-Id: <45454ff4a5b7d742a1483664a8f5bcd059c7d810.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn/gXf5TqFrX1xhQYgzttVCrAnhMWGbWyF705EhM622DQ7xIf+kV+LUKQsQCpq+BTcDieqd
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/22] systemd: split out the hwdb data
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:29 -0000

The hardware databases are not essential and also quite large, so split them out
into udev-hwdb.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |   22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 56ced66..a006ec8 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -180,13 +180,13 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-hwdb"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf"
+RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${base_libdir}/systemd/systemd-udevd \
@@ -209,7 +209,6 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/78*.rules \
                /lib/udev/rules.d/8*.rules \
                /lib/udev/rules.d/95*.rules \
-               ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
@@ -220,6 +219,8 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
+FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
+
 # TODO:
 # u-a for runlevel and telinit
 
@@ -239,6 +240,21 @@ update-alternatives --remove shutdown ${base_bindir}/systemctl
 update-alternatives --remove poweroff ${base_bindir}/systemctl
 }
 
+pkg_postinst_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	udevadm hwdb --update
+}
+
+pkg_prerm_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	rm -f ${sysconfdir}/udev/hwdb.bin
+}
 
 # As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
 # building udev and systemd in world builds.
-- 
1.7.10.4



