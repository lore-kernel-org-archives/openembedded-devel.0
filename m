Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PVAMQ-000589-Go
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:07:10 +0100
Received: (qmail 19689 invoked by uid 503); 21 Dec 2010 22:42:43 -0000
Received: from b9.ovh.net (HELO mail241.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Dec 2010 22:42:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Dec 2010 00:07:05 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Dec 2010 00:07:03 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 23:03:47 +0100
Message-Id: <1292969027-18762-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1292969027-18762-1-git-send-email-eric@eukrea.com>
References: <20101221150222.GB4665@gmail.com>
	<1292969027-18762-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2668101305253080394
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/2] asterisk: fix SRC_URI
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
X-List-Received-Date: Tue, 21 Dec 2010 22:07:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* keep the higher version which fetch and patch
* fix SRC_URI for all the asterisk recipes

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb   |    2 +-
 .../asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb |    2 +-
 .../asterisk/asterisk-core-sounds-en-g729_1.4.8.bb |    2 +-
 .../asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb  |    2 +-
 .../asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb |    2 +-
 .../asterisk-extra-sounds-en-alaw_1.4.7.bb         |    2 +-
 .../asterisk-extra-sounds-en-g729_1.4.7.bb         |    2 +-
 .../asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb |    2 +-
 .../asterisk-extra-sounds-en-ulaw_1.4.7.bb         |    2 +-
 .../asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb   |    2 +-
 .../asterisk/asterisk-moh-freeplay-g729_0.0.0.bb   |    2 +-
 .../asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb    |    2 +-
 .../asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb   |    2 +-
 recipes/asterisk/asterisk_1.4.23.1.bb              |    2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb b/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
index 416afdb..e2c8923 100644
--- a/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
+++ b/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
@@ -4,7 +4,7 @@ LICENSE="GPL"
 DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-sounds-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-sounds-${PV}.tar.gz"
 
 do_install() {
         oe_runmake DESTDIR=${D} install
diff --git a/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
index b5f3e31..e2adb8f 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-alaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-alaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
index 9cc6867..34b77b8 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-g729-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-g729-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
index bef02db..956b7e0 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-gsm-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-gsm-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
index ed776fc..60c8c4e 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-ulaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-ulaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
index 554c71a..ac5c747 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-alaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-alaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
index 763f68c..67422bc 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-g729-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-g729-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
index 6f2830c..688034f 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-gsm-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-gsm-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
index 3975975..201da89 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-ulaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-ulaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
index 566882a..24548f6 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-alaw.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-alaw.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
index cadadc4..efe6d6e 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-g729.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-g729.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
index b608b8f..6b62da3 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-gsm.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-gsm.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
index ac91615..05a96d6 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-ulaw.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-ulaw.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk_1.4.23.1.bb b/recipes/asterisk/asterisk_1.4.23.1.bb
index af6967a..ed44508 100644
--- a/recipes/asterisk/asterisk_1.4.23.1.bb
+++ b/recipes/asterisk/asterisk_1.4.23.1.bb
@@ -8,7 +8,7 @@ SECTION = "console/telephony"
 DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg libvorbis"
 #RRECOMMENDS_${PN} = "logrotate"
 
-SRC_URI="http://downloads.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz \
+SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-${PV}.tar.gz \
 #	file://sounds.xml.patch \
 	file://Makefile.patch \
 	file://logrotate \
-- 
1.6.3.3



