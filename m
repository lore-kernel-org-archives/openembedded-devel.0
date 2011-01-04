Received: from mail-yw0-f65.google.com ([209.85.213.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PaCgi-0007oo-Sg
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 20:36:57 +0100
Received: by ywo32 with SMTP id 32so3734759ywo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 11:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Iq9B+F16umyjrNUJL51DiZEMYg1PdTuha7n8wgAzpkk=;
	b=wpYkQI7n6oMMyttfHr5ngyZ6u25ATOolenCvzPVwJ7toY6JrGpuXvMP4ChjsbzmVag
	h8GDfDv7f41g3+UWj518DWHtCKj5Gsn63V/BTKCQh9cxPRI0AfU4daNS9zZYGb6+GZtW
	YghMfrf+O4YnREIzFylNYOAF3eR7FglWzHKn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GpauM1jtSUVrHdsdu/M8JKiK4FsAY4ZJKi9fSKTc0ftHnMeGOEAJdCqdwKOTPdveuQ
	YXT5QIHB2iE9s0LzmbewC8K0TKrUNhYOoYPNWbUd7WuRuVPLOrARBGpfdaiMRenuCQAG
	iTNfSrW+WpqzLB5Ge1tlQoniTMBFajnAcqa+k=
Received: by 10.151.84.10 with SMTP id m10mr2102524ybl.177.1294169784460;
	Tue, 04 Jan 2011 11:36:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q31sm10921751yba.18.2011.01.04.11.36.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Jan 2011 11:36:23 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 13:36:17 -0600
Message-Id: <1294169777-9968-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] matrix-tui: adding multi platform support
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
X-List-Received-Date: Tue, 04 Jan 2011 19:36:57 -0000

* adding am180x, am181x, da850-omapl138, am3517 and am3715 support
* Updating SRC rev to pull in matrix-tui project with platform support
* removing INSANE_SKIP, it originally handled pre-built binaries which
  have since been removed
* Creating version 1.1 of the recipe
* matrix-tui.inc with platform support is backwards compatible with
  previous versions

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Jeff Lance <j-lance@ti.com>
---
 recipes/ti/matrix-tui.inc    |   12 ++++++++++--
 recipes/ti/matrix-tui_1.1.bb |    4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 recipes/ti/matrix-tui_1.1.bb

diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
index 6983406..1ad8aa8 100644
--- a/recipes/ti/matrix-tui.inc
+++ b/recipes/ti/matrix-tui.inc
@@ -5,9 +5,16 @@ SECTION = "multimedia"
 PRIORITY = "optional"
 DEPENDS = "libxml2 zlib ncurses"
 
-INC_PR = "r5"
+INC_PR = "r7"
 
-INSANE_SKIP_${PN} = "True"
+COMPATIBLE_MACHINE = "(omapl138|omap3)"
+
+PLATFORM_am37x-evm = "am3715"
+PLATFORM_beagleboard = "am3715"
+PLATFORM_am3517-evm = "am3517"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_da850-omapl138-evm = "am180x"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
 	file://init \
@@ -36,6 +43,7 @@ do_compile() {
 }
 
 do_install() {
+	export PLATFORM=${PLATFORM}
 	make DESTDIR=${D} install
 	install -d ${D}${sysconfdir}/init.d/
 	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-tui
diff --git a/recipes/ti/matrix-tui_1.1.bb b/recipes/ti/matrix-tui_1.1.bb
new file mode 100644
index 0000000..8f2ccbe
--- /dev/null
+++ b/recipes/ti/matrix-tui_1.1.bb
@@ -0,0 +1,4 @@
+require matrix-tui.inc
+
+SRCREV = "34"
+PR = "${INC_PR}.2"
-- 
1.7.0.4



