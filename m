Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NxM6j-0002oJ-Me
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:15:58 +0200
Received: by fg-out-1718.google.com with SMTP id e12so741094fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=el/SSYq9ZzzbaX+pdYa20k6HAVQffzOQ8lzPmtkHCac=;
	b=u0XZ3+EDd4OQO/1V9QQc1MXec9ASCgUbZwP0U7sEVtwX6pHu1AOclC+M+SycbiBzgb
	Bxjj0WbhXHgGRtsKWaZ6Ei7tpPkg/4CKEoLje1RlDAE1bgB40N68hasl53xX9ofqIBOC
	33lkH5y55b67GYxGvZhmPRIEidZRLaepOlI3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XfQqyJpSD4lwgi5rGzv4sWwO7Hpbqc28xtIqEX3kH1pPx9AUVfEv3Gu7gqb2ygQPhZ
	n7yULDoSruta9QPeloqNt1S2PQ6osoV/GMrnQvESQJt+HRDqf85vQ+KKH+GGcY2VwDKe
	YLwbgzFDEEVLcbWorzklVDaiDCXUMIxmF66TE=
Received: by 10.87.63.21 with SMTP id q21mr2221692fgk.52.1270134702110;
	Thu, 01 Apr 2010 08:11:42 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm5661275fxm.11.2010.04.01.08.11.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 08:11:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Apr 2010 17:11:50 +0200
Message-Id: <1270134711-32158-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] EFL: move SRCREVs from sane-srcrevs.inc to efl/e17 recipes
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
X-List-Received-Date: Thu, 01 Apr 2010 15:15:59 -0000

* Or we can move them to e.bbclass, python-efl.inc instead.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/sane-srcrevs.inc       |   84 ----------------------------
 recipes/e17/bubble-keyboard_svn.bb         |    1 +
 recipes/e17/cpu_svn.bb                     |    4 -
 recipes/e17/e-wm_svn.bb                    |    1 +
 recipes/e17/edje-editor_svn.bb             |    1 +
 recipes/e17/edje-player_svn.bb             |    1 +
 recipes/e17/edje-viewer_svn.bb             |    1 +
 recipes/e17/elementary-alarm_svn.bb        |    1 +
 recipes/e17/elementary-sms_svn.bb          |    1 +
 recipes/e17/elmdentica_svn.bb              |    1 +
 recipes/e17/enna_svn.bb                    |    1 +
 recipes/e17/entrance_0.9.0.010.bb          |    3 +
 recipes/e17/essential-dialer_svn.bb        |    1 +
 recipes/e17/eve_svn.bb                     |    1 +
 recipes/e17/exalt_svn.bb                   |    1 +
 recipes/e17/exhibit_svn.bb                 |    1 +
 recipes/e17/expedite_svn.bb                |    1 +
 recipes/e17/exquisite-theme-illume.bb      |    1 +
 recipes/e17/exquisite_svn.bb               |    1 +
 recipes/e17/gridpad_svn.bb                 |    1 +
 recipes/e17/illume-keyboard-default_svn.bb |    1 +
 recipes/e17/intuition_svn.bb               |    1 +
 recipes/e17/rage_svn.bb                    |    1 +
 recipes/e17/waker_svn.bb                   |    1 +
 recipes/efl1/ecore_svn.bb                  |    1 +
 recipes/efl1/edb_svn.bb                    |    1 +
 recipes/efl1/edbus_svn.bb                  |    1 +
 recipes/efl1/edje_svn.bb                   |    1 +
 recipes/efl1/eet_svn.bb                    |    1 +
 recipes/efl1/eflpp_svn.bb                  |    1 +
 recipes/efl1/efreet_svn.bb                 |    1 +
 recipes/efl1/eina_svn.bb                   |    1 +
 recipes/efl1/elementary_svn.bb             |    1 +
 recipes/efl1/embryo_svn.bb                 |    1 +
 recipes/efl1/emotion_svn.bb                |    1 +
 recipes/efl1/engrave_svn.bb                |    1 +
 recipes/efl1/enhance_svn.bb                |    1 +
 recipes/efl1/epdf_svn.bb                   |    1 +
 recipes/efl1/epeg_svn.bb                   |    1 +
 recipes/efl1/esmart_svn.bb                 |    1 +
 recipes/efl1/evas.inc                      |    1 +
 recipes/efl1/evolve_svn.bb                 |    1 +
 recipes/efl1/ewl_svn.bb                    |    1 +
 recipes/efl1/exml_svn.bb                   |    1 +
 recipes/efl1/imlib2_svn.bb                 |    1 +
 recipes/efl1/libeflvala_svn.bb             |    1 +
 recipes/efl1/libefso_svn.bb                |    1 +
 recipes/efl1/libeweather_svn.bb            |    1 +
 recipes/python/python-ecore_svn.bb         |    1 +
 recipes/python/python-edbus_svn.bb         |    1 +
 recipes/python/python-edje_svn.bb          |    1 +
 recipes/python/python-elementary_svn.bb    |    1 +
 recipes/python/python-emotion_svn.bb       |    1 +
 recipes/python/python-evas_svn.bb          |    1 +
 54 files changed, 54 insertions(+), 88 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 1576724..fa62616 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -20,7 +20,6 @@ SRCREV_pn-bfin-uclibc ?= "1857"
 SRCREV_pn-blipomoko ?= "93295f36f7b45c691df247cb2a65227facf13654"
 SRCREV_pn-bootchart-lite ?= "4"
 SRCREV_pn-bt-configure ?= "9654c88ff74bca89cf747937cbec67421d2f1cbc"
-SRCREV_pn-bubble-keyboard ?= "194"
 SRCREV_pn-calc ?= "cff7c833d4fce0d39de0812bfc9ed9e0eb8fac09"
 SRCREV_pn-calibrateproto ?= "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
 SRCREV_pn-cdparanoia ?= "16684"
@@ -52,7 +51,6 @@ SRCREV_pn-elementary-theme-sixteen ?= "2ac643cc273d144bb731a8cbb8ec6b3615de43a0"
 SRCREV_pn-elf2flt ?= "1786"
 SRCREV_pn-epdfview ?= "346"
 SRCREV_pn-epiphany ?= "7837"
-SRCREV_pn-essential-dialer ?= "194"
 SRCREV_pn-ezx-boot-usb-native ?= "2512"
 SRCREV_pn-ezx-gen-blob ?= "2517"
 SRCREV_pn-ezxd ?= "2513"
@@ -70,16 +68,13 @@ SRCREV_pn-gpe-contacts ?= "9312"
 SRCREV_pn-gpe-gallery ?= "9376"
 SRCREV_pn-gpe-mini-browser2 ?= "9900"
 SRCREV_pn-gpe-sketchbook ?= "9547"
-SRCREV_pn-gridpad ?= "194"
 SRCREV_pn-gtkhtml2 ?= "1158"
 SRCREV_pn-gypsy ?= "134"
 SRCREV_pn-hildon-1 ?= "14429"
 SRCREV_pn-illume-theme-freesmartphone ?= "b1b0f6adc59e6f72a3929771058e3750bf181bc5"
-SRCREV_pn-intuition ?= "194"
 SRCREV_pn-kismet ?= "2285"
 SRCREV_pn-kismet-newcore ?= "2285"
 SRCREV_pn-libcalenabler2 ?= "1410"
-SRCREV_pn-libefso ?= "194"
 SRCREV_pn-libfakekey ?= "1455"
 SRCREV_pn-libgdbus ?= "aeab6e3c0185b271ca343b439470491b99cc587f"
 SRCREV_pn-libgee ?= "a86abd4240622ec377bbc5773850a4593e13f7eb"
@@ -212,85 +207,6 @@ SRCREV_pn-wlan-ng-utils ?= "1859"
 SRCREV_pn-xoo ?= "1971"
 SRCREV_pn-xserver-kdrive-glamo ?= "9b28d998424c77fbc057dd3a022ccbb122793a52"
 
-# Enlightenment Foundation Libraries
-# Caution: This is not alphabetically, but (roughly) dependency-sorted.
-# Please leave it like that.
 EFL_SRCREV ?= "47642"
-SRCREV_pn-edb-native ?= "${EFL_SRCREV}"
-SRCREV_pn-edb ?= "${EFL_SRCREV}"
-SRCREV_pn-eina-native ?= "${EFL_SRCREV}"
-SRCREV_pn-eina ?= "${EFL_SRCREV}"
-SRCREV_pn-eet-native ?= "${EFL_SRCREV}"
-SRCREV_pn-eet ?= "${EFL_SRCREV}"
-SRCREV_pn-evas-native ?= "${EFL_SRCREV}"
-SRCREV_pn-evas ?= "${EFL_SRCREV}"
-SRCREV_pn-ecore-native ?= "${EFL_SRCREV}"
-SRCREV_pn-ecore ?= "${EFL_SRCREV}"
-SRCREV_pn-edbus ?= "${EFL_SRCREV}"
-SRCREV_pn-embryo-native ?= "${EFL_SRCREV}"
-SRCREV_pn-embryo ?= "${EFL_SRCREV}"
-SRCREV_pn-edje-native ?= "${EFL_SRCREV}"
-SRCREV_pn-edje-sdk ?= "${EFL_SRCREV}"
-SRCREV_pn-edje ?= "${EFL_SRCREV}"
-SRCREV_pn-elementary ?= "${EFL_SRCREV}"
-SRCREV_pn-emotion ?= "${EFL_SRCREV}"
-SRCREV_pn-ewl ?= "${EFL_SRCREV}"
-SRCREV_pn-epeg ?= "${EFL_SRCREV}"
-SRCREV_pn-epdf ?= "${EFL_SRCREV}"
-SRCREV_pn-esmart ?= "${EFL_SRCREV}"
-SRCREV_pn-efreet ?= "${EFL_SRCREV}"
-SRCREV_pn-exml ?= "${EFL_SRCREV}"
-SRCREV_pn-enhance ?= "${EFL_SRCREV}"
-SRCREV_pn-engrave ?= "${EFL_SRCREV}"
-SRCREV_pn-evolve-native ?= "${EFL_SRCREV}"
-SRCREV_pn-evolve ?= "${EFL_SRCREV}"
-SRCREV_pn-gevas2 ?= "${EFL_SRCREV}"
-SRCREV_pn-imlib2 ?= "${EFL_SRCREV}"
-SRCREV_pn-libeweather ?= "${EFL_SRCREV}"
-
-# Enlightenment Bindings
-SRCREV_pn-libeflvala ?= "${EFL_SRCREV}"
-SRCREV_pn-eflpp ?= "${EFL_SRCREV}"
-SRCREV_pn-python-evas ?= "${EFL_SRCREV}"
-SRCREV_pn-python-ecore ?= "${EFL_SRCREV}"
-SRCREV_pn-python-edje ?= "${EFL_SRCREV}"
-SRCREV_pn-python-elementary ?= "${EFL_SRCREV}"
-SRCREV_pn-python-edbus ?= "${EFL_SRCREV}"
-SRCREV_pn-python-emotion ?= "${EFL_SRCREV}"
-SRCREV_pn-python-ewl ?= "${EFL_SRCREV}"
-
-# Enlightenment Applications
-SRCREV_pn-edje-editor ?= "${EFL_SRCREV}"
-SRCREV_pn-edje-player ?= "${EFL_SRCREV}"
-SRCREV_pn-edje-viewer ?= "${EFL_SRCREV}"
-SRCREV_pn-elementary-alarm ?= "${EFL_SRCREV}"
-SRCREV_pn-elementary-sms ?= "${EFL_SRCREV}"
-SRCREV_pn-elmdentica ?= "${EFL_SRCREV}"
-SRCREV_pn-emphasis ?= "${EFL_SRCREV}"
-SRCREV_pn-ephoto ?= "${EFL_SRCREV}"
-SRCREV_pn-eve ?= "${EFL_SRCREV}"
-SRCREV_pn-examine ?= "${EFL_SRCREV}"
-SRCREV_pn-exhibit ?= "${EFL_SRCREV}"
-SRCREV_pn-expedite ?= "${EFL_SRCREV}"
-SRCREV_pn-elitaire ?= "${EFL_SRCREV}"
-SRCREV_pn-entice ?= "${EFL_SRCREV}"
-SRCREV_pn-entrance ?= "${EFL_SRCREV}"
-SRCREV_pn-e-utils ?= "${EFL_SRCREV}"
-SRCREV_pn-e-wm ?= "${EFL_SRCREV}"
-SRCREV_pn-enna ?= "${EFL_SRCREV}"
-SRCREV_pn-exquisite ?= "${EFL_SRCREV}"
-SRCREV_pn-exquisite-theme-illume ?= "${EFL_SRCREV}"
-SRCREV_pn-rage ?= "${EFL_SRCREV}"
-SRCREV_pn-illume ?= "${EFL_SRCREV}"
-SRCREV_pn-illume-theme-illume ?= "${EFL_SRCREV}"
-SRCREV_pn-waker ?= "${EFL_SRCREV}"
-
-#illume default keyboards
-SRCREV_pn-illume-keyboard-default ?= "${EFL_SRCREV}"
-
-#exalt
-SRCREV_pn-exalt ?= "${EFL_SRCREV}"
-SRCREV_pn-exalt-client ?= "${EFL_SRCREV}"
-
 
 require conf/distro/include/sane-srcrevs-fso.inc
diff --git a/recipes/e17/bubble-keyboard_svn.bb b/recipes/e17/bubble-keyboard_svn.bb
index 202771c..ad5ce70 100644
--- a/recipes/e17/bubble-keyboard_svn.bb
+++ b/recipes/e17/bubble-keyboard_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 DEPENDS = "ecore evas edje libfakekey"
 PV = "0.1.4+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "194"
 
 SRC_URI = "svn://svn.om.vptt.ch/trunk/;proto=http;module=bubble-keyboard"
 S = "${WORKDIR}/bubble-keyboard"
diff --git a/recipes/e17/cpu_svn.bb b/recipes/e17/cpu_svn.bb
index 3c0a8c7..3dc049d 100644
--- a/recipes/e17/cpu_svn.bb
+++ b/recipes/e17/cpu_svn.bb
@@ -2,7 +2,3 @@ LICENSE = "MIT"
 PV = "0.0.1+svnr${SRCREV}"
 
 require e-module.inc
-
-
-
-
diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
index f1a5715..2ab6b82 100644
--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT BSD"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
 PR = "r13"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives
 
diff --git a/recipes/e17/edje-editor_svn.bb b/recipes/e17/edje-editor_svn.bb
index 4978fa7..12ffa2d 100644
--- a/recipes/e17/edje-editor_svn.bb
+++ b/recipes/e17/edje-editor_svn.bb
@@ -6,6 +6,7 @@ SRCNAME = "edje_editor"
 
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/edje-player_svn.bb b/recipes/e17/edje-player_svn.bb
index 8474835..40c0c99 100644
--- a/recipes/e17/edje-player_svn.bb
+++ b/recipes/e17/edje-player_svn.bb
@@ -5,6 +5,7 @@ DEPENDS = "etk"
 SRCNAME = "edje_editor"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/edje-viewer_svn.bb b/recipes/e17/edje-viewer_svn.bb
index a572879..40a5f17 100644
--- a/recipes/e17/edje-viewer_svn.bb
+++ b/recipes/e17/edje-viewer_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "elementary"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r3"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/elementary-alarm_svn.bb b/recipes/e17/elementary-alarm_svn.bb
index 2123f48..9fee65d 100644
--- a/recipes/e17/elementary-alarm_svn.bb
+++ b/recipes/e17/elementary-alarm_svn.bb
@@ -4,6 +4,7 @@ DEPENDS = "elementary"
 SECTION = "x11"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/elementary-sms_svn.bb b/recipes/e17/elementary-sms_svn.bb
index a673036..a426aa5 100644
--- a/recipes/e17/elementary-sms_svn.bb
+++ b/recipes/e17/elementary-sms_svn.bb
@@ -4,6 +4,7 @@ DEPENDS = "ecore edbus elementary libefso"
 SECTION = "x11"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/elmdentica_svn.bb b/recipes/e17/elmdentica_svn.bb
index c0cf56a..c6fb284 100644
--- a/recipes/e17/elmdentica_svn.bb
+++ b/recipes/e17/elmdentica_svn.bb
@@ -8,3 +8,4 @@ AUTHOR = "seabra"
 inherit e
 
 PV = "0.9.0+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
diff --git a/recipes/e17/enna_svn.bb b/recipes/e17/enna_svn.bb
index 8f4ddc4..f81990c 100644
--- a/recipes/e17/enna_svn.bb
+++ b/recipes/e17/enna_svn.bb
@@ -5,6 +5,7 @@ DEPENDS += "libmusicbrainz lightmediascanner libxml2 taglib"
 SECTION = "x11/multimedia"
 PV = "0.2.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/entrance_0.9.0.010.bb b/recipes/e17/entrance_0.9.0.010.bb
index 34b6f8a..a988e50 100644
--- a/recipes/e17/entrance_0.9.0.010.bb
+++ b/recipes/e17/entrance_0.9.0.010.bb
@@ -5,6 +5,9 @@ DEPENDS = "evas ecore edje esmart bash keylaunch xserver-common login-manager"
 RDEPENDS += "glibc-gconv-iso8859-1 entrance-themes"
 PR = "r2"
 
+# entrance and estickies were removed in 46590 for rewrite, move back to EFL_SRCREV when they're back
+SRCREV = "46589"
+
 inherit e
 
 SRC_URI += "\
diff --git a/recipes/e17/essential-dialer_svn.bb b/recipes/e17/essential-dialer_svn.bb
index ff7d4db..7fdb52c 100644
--- a/recipes/e17/essential-dialer_svn.bb
+++ b/recipes/e17/essential-dialer_svn.bb
@@ -3,6 +3,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 DEPENDS = "ecore edbus elementary libefso"
 PV = "0.1.0.0+svnr${SRCPV}"
+SRCREV = "194"
 
 SRC_URI = "svn://svn.om.vptt.ch/trunk/;proto=http;module=essential-dialer"
 S = "${WORKDIR}/essential-dialer"
diff --git a/recipes/e17/eve_svn.bb b/recipes/e17/eve_svn.bb
index baa4a6c..d51aed3 100644
--- a/recipes/e17/eve_svn.bb
+++ b/recipes/e17/eve_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL"
 DEPENDS = "webkit-efl evas ecore edje"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r4"
+SRCREV = "${EFL_SRCREV}"
 
 LDFLAGS += "-lstdc++"
 
diff --git a/recipes/e17/exalt_svn.bb b/recipes/e17/exalt_svn.bb
index 9dc3b03..4e9f39f 100644
--- a/recipes/e17/exalt_svn.bb
+++ b/recipes/e17/exalt_svn.bb
@@ -6,6 +6,7 @@ DEPENDS = "elementary vpnc wpa-supplicant ecore eet edbus"
 RDEPENDS = "vpnc wpa-supplicant"
 
 PV = "0.9+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/exhibit_svn.bb b/recipes/e17/exhibit_svn.bb
index 1742ed8..b897582 100644
--- a/recipes/e17/exhibit_svn.bb
+++ b/recipes/e17/exhibit_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "evas ecore epsilon edje eet etk efreet"
 PV = "0.1.1+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/expedite_svn.bb b/recipes/e17/expedite_svn.bb
index 800e586..f5c26e3 100644
--- a/recipes/e17/expedite_svn.bb
+++ b/recipes/e17/expedite_svn.bb
@@ -4,6 +4,7 @@ RDEPENDS = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-softwa
 LICENSE = "MIT BSD"
 PV = "0.6.0+svnr${SRCPV}"
 PR = "r3"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
diff --git a/recipes/e17/exquisite-theme-illume.bb b/recipes/e17/exquisite-theme-illume.bb
index 49be863..cfbebc2 100644
--- a/recipes/e17/exquisite-theme-illume.bb
+++ b/recipes/e17/exquisite-theme-illume.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT/BSD"
 SECTION = "x11"
 PV = "1.0+svnr${SRCPV}"
 PR = "r6"
+SRCREV = "${EFL_SRCREV}"
 
 inherit update-alternatives
 
diff --git a/recipes/e17/exquisite_svn.bb b/recipes/e17/exquisite_svn.bb
index 9c1bc2c..256b5bd 100644
--- a/recipes/e17/exquisite_svn.bb
+++ b/recipes/e17/exquisite_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "eet evas ecore embryo edje"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r9"
+SRCREV = "${EFL_SRCREV}"
 RDEPENDS = "initscripts"
 RRECOMMENDS_${PN} = "exquisite-themes"
 RCONFLICTS_${PN} = "psplash virtual-psplash"
diff --git a/recipes/e17/gridpad_svn.bb b/recipes/e17/gridpad_svn.bb
index 82be816..fa08081 100644
--- a/recipes/e17/gridpad_svn.bb
+++ b/recipes/e17/gridpad_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 DEPENDS = "ecore evas edje libfakekey"
 PV = "2.0+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "194"
 
 SRC_URI = "svn://svn.om.vptt.ch/trunk/;proto=http;module=GridPad"
 S = "${WORKDIR}/GridPad"
diff --git a/recipes/e17/illume-keyboard-default_svn.bb b/recipes/e17/illume-keyboard-default_svn.bb
index f9fd8fd..4eb8ed2 100644
--- a/recipes/e17/illume-keyboard-default_svn.bb
+++ b/recipes/e17/illume-keyboard-default_svn.bb
@@ -3,6 +3,7 @@ SECTION = "x11/data"
 SRCNAME = "e/src/modules/illume/keyboards"
 PV = "0.16.999.060+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http"
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/recipes/e17/intuition_svn.bb b/recipes/e17/intuition_svn.bb
index caa0fdd..9b2d594 100644
--- a/recipes/e17/intuition_svn.bb
+++ b/recipes/e17/intuition_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 DEPENDS = "elementary sqlite"
 PV = "0.2.0+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "194"
 
 SRC_URI = "svn://svn.om.vptt.ch/trunk/;proto=http;module=intuition"
 S = "${WORKDIR}/intuition"
diff --git a/recipes/e17/rage_svn.bb b/recipes/e17/rage_svn.bb
index 3a4ccb0..edf6e69 100644
--- a/recipes/e17/rage_svn.bb
+++ b/recipes/e17/rage_svn.bb
@@ -5,5 +5,6 @@ LICENSE = "MIT BSD"
 DEPENDS = "emotion evas ecore edje"
 SECTION = "x11/multimedia"
 PV = "0.3.0.042+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e
diff --git a/recipes/e17/waker_svn.bb b/recipes/e17/waker_svn.bb
index 1b8b39e..b1707d4 100644
--- a/recipes/e17/waker_svn.bb
+++ b/recipes/e17/waker_svn.bb
@@ -4,6 +4,7 @@ DEPENDS = "ecore edbus"
 SECTION = "console"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/ecore_svn.bb b/recipes/efl1/ecore_svn.bb
index fc3d125..bcee012 100644
--- a/recipes/efl1/ecore_svn.bb
+++ b/recipes/efl1/ecore_svn.bb
@@ -1,4 +1,5 @@
 require ecore.inc
+SRCREV = "${EFL_SRCREV}"
 PR = "r11"
 
 SRC_URI += "\
diff --git a/recipes/efl1/edb_svn.bb b/recipes/efl1/edb_svn.bb
index ec64278..0c143ed 100644
--- a/recipes/efl1/edb_svn.bb
+++ b/recipes/efl1/edb_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "zlib"
 PV = "1.0.5.050+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/edbus_svn.bb b/recipes/efl1/edbus_svn.bb
index d26b40c..087bfe7 100644
--- a/recipes/efl1/edbus_svn.bb
+++ b/recipes/efl1/edbus_svn.bb
@@ -3,6 +3,7 @@ DEPENDS = "dbus ecore"
 LICENSE = "MIT BSD"
 PV = "0.5.0.060+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/edje_svn.bb b/recipes/efl1/edje_svn.bb
index e438e1b..1fd67cd 100644
--- a/recipes/efl1/edje_svn.bb
+++ b/recipes/efl1/edje_svn.bb
@@ -3,6 +3,7 @@ DEPENDS = "lua5.1 eet evas ecore embryo edje-native"
 LICENSE = "MIT BSD"
 PV = "0.9.92.060+svnr${SRCPV}"
 PR = "r6"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/eet_svn.bb b/recipes/efl1/eet_svn.bb
index 579fb28..919ca46 100644
--- a/recipes/efl1/eet_svn.bb
+++ b/recipes/efl1/eet_svn.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "EET is the Enlightenment data storage library"
 DEPENDS = "pkgconfig zlib jpeg openssl eina"
 LICENSE = "MIT BSD"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/efl1/eflpp_svn.bb b/recipes/efl1/eflpp_svn.bb
index c54e8be..1ea3e65 100644
--- a/recipes/efl1/eflpp_svn.bb
+++ b/recipes/efl1/eflpp_svn.bb
@@ -3,6 +3,7 @@ AUTHOR = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 HOMEPAGE = "http://www.vanille-media.de/site/index.php/projects/efl/"
 LICENSE = "LGPL"
 DEPENDS = "evas ecore edje emotion esmart etk ewl libsigc++-2.0"
+SRCREV = "${EFL_SRCREV}"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r1" 
 
diff --git a/recipes/efl1/efreet_svn.bb b/recipes/efl1/efreet_svn.bb
index ae442ee..dda0874 100644
--- a/recipes/efl1/efreet_svn.bb
+++ b/recipes/efl1/efreet_svn.bb
@@ -3,6 +3,7 @@ DEPENDS = "ecore"
 LICENSE = "MIT BSD"
 PV = "0.5.0.060+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/eina_svn.bb b/recipes/efl1/eina_svn.bb
index a871721..6873e83 100644
--- a/recipes/efl1/eina_svn.bb
+++ b/recipes/efl1/eina_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Eina is the Enlightenment data library"
 LICENSE = "LGPL"
 PV = "0.0.2.060+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/elementary_svn.bb b/recipes/efl1/elementary_svn.bb
index fc4b451..1ee8f37 100644
--- a/recipes/efl1/elementary_svn.bb
+++ b/recipes/efl1/elementary_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPL"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r8"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/embryo_svn.bb b/recipes/efl1/embryo_svn.bb
index c8d67f9..24cf2ab 100644
--- a/recipes/efl1/embryo_svn.bb
+++ b/recipes/efl1/embryo_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
 LICENSE = "MIT BSD"
 PV = "0.9.9.060+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/emotion_svn.bb b/recipes/efl1/emotion_svn.bb
index c5733be..c453adc 100644
--- a/recipes/efl1/emotion_svn.bb
+++ b/recipes/efl1/emotion_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "eet evas ecore edje gstreamer gst-plugins-base"
 PV = "0.1.0.042+svnr${SRCPV}"
 PR = "r4"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/engrave_svn.bb b/recipes/efl1/engrave_svn.bb
index d4a00bf..6791a0d 100644
--- a/recipes/efl1/engrave_svn.bb
+++ b/recipes/efl1/engrave_svn.bb
@@ -4,5 +4,6 @@ LICENSE = "MIT"
 DEPENDS = "evas ecore"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/enhance_svn.bb b/recipes/efl1/enhance_svn.bb
index ae3405e..ee28071 100644
--- a/recipes/efl1/enhance_svn.bb
+++ b/recipes/efl1/enhance_svn.bb
@@ -3,5 +3,6 @@ LICENSE = "MIT"
 DEPENDS = "exml"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/epdf_svn.bb b/recipes/efl1/epdf_svn.bb
index be223d2..c905051 100644
--- a/recipes/efl1/epdf_svn.bb
+++ b/recipes/efl1/epdf_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r3"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/epeg_svn.bb b/recipes/efl1/epeg_svn.bb
index 3b97262..c314337 100644
--- a/recipes/efl1/epeg_svn.bb
+++ b/recipes/efl1/epeg_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT"
 DEPENDS = "jpeg"
 PV = "0.9.0+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/esmart_svn.bb b/recipes/efl1/esmart_svn.bb
index bdcb6db..3e1991f 100644
--- a/recipes/efl1/esmart_svn.bb
+++ b/recipes/efl1/esmart_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "evas ecore edje imlib2 libtool"
 PV = "0.9.0.050+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
index 271b8e5..bc2645d 100644
--- a/recipes/efl1/evas.inc
+++ b/recipes/efl1/evas.inc
@@ -2,6 +2,7 @@ DESCRIPTION = "Evas is the Enlightenment canvas API"
 LICENSE = "MIT BSD"
 # can also depend on valgrind, libsdl-x11, directfb
 DEPENDS = "librsvg eina eet freetype jpeg libpng virtual/libx11 libxext libxrender fontconfig libfribidi"
+SRCREV = "${EFL_SRCREV}"
 PV = "0.9.9.060+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/efl1/evolve_svn.bb b/recipes/efl1/evolve_svn.bb
index e11406c..a92341a 100644
--- a/recipes/efl1/evolve_svn.bb
+++ b/recipes/efl1/evolve_svn.bb
@@ -3,5 +3,6 @@ LICENSE = "MIT"
 DEPENDS = "etk evolve-native"
 PV = "0.1.0.001+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/recipes/efl1/ewl_svn.bb b/recipes/efl1/ewl_svn.bb
index 871a43f..9e309c4 100644
--- a/recipes/efl1/ewl_svn.bb
+++ b/recipes/efl1/ewl_svn.bb
@@ -3,6 +3,7 @@ DEPENDS = "evas ecore edje emotion efreet"
 LICENSE = "MIT BSD"
 PV = "0.5.3.050+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/exml_svn.bb b/recipes/efl1/exml_svn.bb
index 3c505f2..3d06578 100644
--- a/recipes/efl1/exml_svn.bb
+++ b/recipes/efl1/exml_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT"
 DEPENDS = "libxml2 libxslt ecore"
 PV = "0.1.1+svnr${SRCPV}"
 PR = "r2"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/imlib2_svn.bb b/recipes/efl1/imlib2_svn.bb
index 230ba71..320020a 100644
--- a/recipes/efl1/imlib2_svn.bb
+++ b/recipes/efl1/imlib2_svn.bb
@@ -5,6 +5,7 @@ DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
 PV = "1.4.2.001+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/efl1/libeflvala_svn.bb b/recipes/efl1/libeflvala_svn.bb
index 8793857..56f8773 100644
--- a/recipes/efl1/libeflvala_svn.bb
+++ b/recipes/efl1/libeflvala_svn.bb
@@ -5,6 +5,7 @@ SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "0.5.0+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "${EFL_SRCREV}"
 
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=vala;proto=http"
 S = "${WORKDIR}/vala"
diff --git a/recipes/efl1/libefso_svn.bb b/recipes/efl1/libefso_svn.bb
index 14b6d9f..a9f77f5 100644
--- a/recipes/efl1/libefso_svn.bb
+++ b/recipes/efl1/libefso_svn.bb
@@ -3,6 +3,7 @@ SECTION = "e/libs"
 LICENSE = "GPLv2"
 DEPENDS = "ecore edbus efreet"
 PV = "0.0.1+svnr${SRCPV}"
+SRCREV = "194"
 
 SRC_URI = "svn://svn.om.vptt.ch/trunk/;proto=http;module=libefso"
 S = "${WORKDIR}/libefso"
diff --git a/recipes/efl1/libeweather_svn.bb b/recipes/efl1/libeweather_svn.bb
index 6668f08..7aced57 100644
--- a/recipes/efl1/libeweather_svn.bb
+++ b/recipes/efl1/libeweather_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPL"
 DEPENDS = "ecore edje"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/recipes/python/python-ecore_svn.bb b/recipes/python/python-ecore_svn.bb
index 9907b27..94daaf1 100644
--- a/recipes/python/python-ecore_svn.bb
+++ b/recipes/python/python-ecore_svn.bb
@@ -1,4 +1,5 @@
 require python-efl.inc
+SRCREV = "${EFL_SRCREV}"
 DEPENDS += "python-evas ecore"
 RDEPENDS += "python-evas"
 
diff --git a/recipes/python/python-edbus_svn.bb b/recipes/python/python-edbus_svn.bb
index 6a9b61e..00fffed 100644
--- a/recipes/python/python-edbus_svn.bb
+++ b/recipes/python/python-edbus_svn.bb
@@ -1,4 +1,5 @@
 require python-efl.inc
+SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edbus python-dbus"
 RDEPENDS += "python-dbus"
 
diff --git a/recipes/python/python-edje_svn.bb b/recipes/python/python-edje_svn.bb
index 5b429b4..2c087ca 100644
--- a/recipes/python/python-edje_svn.bb
+++ b/recipes/python/python-edje_svn.bb
@@ -1,4 +1,5 @@
 require python-efl.inc
+SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edje python-evas"
 RDEPENDS += "python-evas"
 
diff --git a/recipes/python/python-elementary_svn.bb b/recipes/python/python-elementary_svn.bb
index b4e5dbb..ad82e04 100644
--- a/recipes/python/python-elementary_svn.bb
+++ b/recipes/python/python-elementary_svn.bb
@@ -1,4 +1,5 @@
 require python-efl.inc
+SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary"
 RDEPENDS += "python-evas python-ecore python-edje" 
 PV = "0.1+svnr${SRCPV}"
diff --git a/recipes/python/python-emotion_svn.bb b/recipes/python/python-emotion_svn.bb
index 9a9628e..38e1355 100644
--- a/recipes/python/python-emotion_svn.bb
+++ b/recipes/python/python-emotion_svn.bb
@@ -1,3 +1,4 @@
 require python-efl.inc
+SRCREV = "${EFL_SRCREV}"
 DEPENDS += "emotion python-evas"
 RDEPENDS += "python-ecore"
diff --git a/recipes/python/python-evas_svn.bb b/recipes/python/python-evas_svn.bb
index 3af7afd..d2568ba 100644
--- a/recipes/python/python-evas_svn.bb
+++ b/recipes/python/python-evas_svn.bb
@@ -1,4 +1,5 @@
 require python-efl.inc
+SRCREV = "${EFL_SRCREV}"
 DEPENDS += "evas"
 
 do_stage() {
-- 
1.7.0.3



