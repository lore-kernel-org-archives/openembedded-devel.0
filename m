Return-Path: <marc.ferland@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA9960808
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 15:43:52 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so2713257qcy.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 08:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=BNsoxwjCR10eU5v09ipnItNAgO9BoWpbcg1JJ/bp8Jw=;
	b=KmpbsTkE7TholqdvFAgVWMFP2YT4p0EZQz00SaqJrseHTELEx9t8MFHY5wLuaGxSkY
	F0jKazW/SUyEZkhASSx6xwVtd7sU5fNQeIhty1jMIywL6k78FU+/QZIvbb9Vyll6NvkR
	OR5H83GSPPUOTR36Olo+kzkmUb2fkiKe4aabyLdGCfQ4D07g/eC0yAMXMTVGio1YAzeB
	0gWiRqJvRW00bZgsAb9nMf52z1galiuLP+vLoLmEwL2DlCaxjfnkATJujbYTDtGDDUha
	ZQSqsvQa/IJ1zJx/a6e9TXNEycD0MNfIH4D4hXuEovffgFWEsvO+OAzhZfsFG7mvjOM2
	NPpg==
X-Received: by 10.224.92.134 with SMTP id r6mr14910542qam.82.1398959033645;
	Thu, 01 May 2014 08:43:53 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id q8sm2759743qas.5.2014.05.01.08.43.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 01 May 2014 08:43:52 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 01 May 2014 11:43:56 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 May 2014 11:43:56 -0400
Message-Id: <1398959036-4028-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCHv2] lmsensors: update 3.3.3 -> 3.3.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 May 2014 15:43:53 -0000

This commit also adds a new package (lmsensors-sensorsconfconvert-doc)
for the sensors-conf-convert script man page which was added in 3.3.5.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 .../lm_sensors/{lmsensors_3.3.3.bb => lmsensors_3.3.5.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/lm_sensors/{lmsensors_3.3.3.bb => lmsensors_3.3.5.bb} (93%)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
similarity index 93%
rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
rename to meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
index a965c29..c2aefba 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2
            file://fancontrol.init \
            file://sensord.init \
 "
-SRC_URI[md5sum] = "73c2fcccdab6049d289c5e0c596192a1"
-SRC_URI[sha256sum] = "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d5ea05b2bfca84955"
+SRC_URI[md5sum] = "da506dedceb41822e64865f6ba34828a"
+SRC_URI[sha256sum] = "5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf"
 
 inherit update-rc.d
 
@@ -67,7 +67,7 @@ PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc"
 PACKAGES =+ "${PN}-sensorsdetect ${PN}-sensorsdetect-doc"
 
 # sensors-conf-convert script
-PACKAGES =+ "${PN}-sensorsconfconvert"
+PACKAGES =+ "${PN}-sensorsconfconvert ${PN}-sensorsconfconvert-doc"
 
 # pwmconfig script
 PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
@@ -109,6 +109,7 @@ RDEPENDS_${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
 
 # sensors-conf-convert script files
 FILES_${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
+FILES_${PN}-sensorsconfconvert-doc = "${mandir}/man8/sensors-conf-convert.8"
 RDEPENDS_${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
 
 # pwmconfig script files
-- 
1.8.3.2


