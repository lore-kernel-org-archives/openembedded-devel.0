Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nr5Gk-0000c7-9h
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:03:26 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id C10944098
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:00:20 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkI+ABqGnUtT4zvyPGdsb2JhbACabQwBAQEBNy2IIaB/jDGEewQ
X-IronPort-AV: E=Sophos;i="4.49,641,1262559600"; d="scan'208";a="50252620"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 15 Mar 2010 09:00:09 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 09:00:07 +0100
Message-Id: <1268640007-6783-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 195.54.99.197
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v2 1/1] alsa-state: Support all atmel at91 boards
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
X-List-Received-Date: Mon, 15 Mar 2010 08:03:27 -0000

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/alsa/alsa-state.bb                         |   29 ++-
 recipes/alsa/alsa-state/at91/asound.conf           |    2 +
 recipes/alsa/alsa-state/at91/asound.state          |  283 ++++++++++++++++++++
 recipes/alsa/alsa-state/at91sam9263ek/asound.conf  |    2 -
 recipes/alsa/alsa-state/at91sam9263ek/asound.state |  283 --------------------
 recipes/alsa/alsa-state/at91sam9g45ek/asound.conf  |    2 -
 recipes/alsa/alsa-state/at91sam9g45ek/asound.state |  283 --------------------
 7 files changed, 313 insertions(+), 571 deletions(-)
 create mode 100644 recipes/alsa/alsa-state/at91/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91/asound.state
 delete mode 100644 recipes/alsa/alsa-state/at91sam9263ek/asound.conf
 delete mode 100644 recipes/alsa/alsa-state/at91sam9263ek/asound.state
 delete mode 100644 recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
 delete mode 100644 recipes/alsa/alsa-state/at91sam9g45ek/asound.state

diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
index d77db70..c487455 100644
--- a/recipes/alsa/alsa-state.bb
+++ b/recipes/alsa/alsa-state.bb
@@ -5,9 +5,16 @@
 # Filename: alsa-state.bb
 
 DESCRIPTION = "Alsa Scenario Files"
+LICENSE = "MIT"# Copyright Matthias Hentges <devel@hentges.net> (c) 2007
+# License: MIT (see http://www.opensource.org/licenses/mit-license.php
+#               for a copy of the license)
+#
+# Filename: alsa-state.bb
+
+DESCRIPTION = "Alsa Scenario Files"
 LICENSE = "MIT"
 PV = "0.2.0"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "\
   file://asound.conf \
@@ -19,6 +26,25 @@ SRC_URI_append_a780 = "file://gsmhandset.state \
                        file://gsmheadset.state \
 		       file://stereoout.state"
 
+ALSA_STATE_AT91 = "\
+	file://at91/asound.conf \
+	file://at91/asound.state \
+	file://alsa-state \
+	"
+
+SRC_URI_at91sam9260ek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9261ek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9263ek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9g10ek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9g20ek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9g20ek_2mmc	= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9g45ek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9g45ekes		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9m10ekes		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9m10g45ek	= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9rlek		= " $(ALSA_STATE_AT91} "
+SRC_URI_at91sam9xeek		= " $(ALSA_STATE_AT91} "
+
 inherit update-rc.d
 
 INITSCRIPT_NAME = "alsa-state"
@@ -59,3 +85,4 @@ pkg_postinst_${PN}() {
 		update-rc.d ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 	fi
 }
+
diff --git a/recipes/alsa/alsa-state/at91/asound.conf b/recipes/alsa/alsa-state/at91/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91/asound.state b/recipes/alsa/alsa-state/at91/asound.state
new file mode 100644
index 0000000..ee646a1
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91/asound.state
@@ -0,0 +1,283 @@
+state.AC97 {
+	control.1 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Master Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -4650
+		comment.dbmax 0
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 22
+		value.1 22
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Headphone Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -4650
+		comment.dbmax 0
+		iface MIXER
+		name 'Headphone Playback Volume'
+		value.0 22
+		value.1 22
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Master Mono Playback Switch'
+		value false
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 31'
+		comment.dbmin -4650
+		comment.dbmax 0
+		iface MIXER
+		name 'Master Mono Playback Volume'
+		value 0
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Phone Playback Switch'
+		value false
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'Phone Playback Volume'
+		value 0
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mic Playback Switch'
+		value false
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'Mic Playback Volume'
+		value 0
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mic Boost (+20dB)'
+		value false
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Line Playback Switch'
+		value.0 false
+		value.1 false
+	}
+	control.13 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'Line Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.14 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'CD Playback Switch'
+		value.0 false
+		value.1 false
+	}
+	control.15 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'CD Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.16 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Aux Playback Switch'
+		value.0 false
+		value.1 false
+	}
+	control.17 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'Aux Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.18 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'PCM Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.19 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'PCM Playback Volume'
+		value.0 22
+		value.1 22
+	}
+	control.20 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 2
+		comment.item.0 Mic
+		comment.item.1 CD
+		comment.item.2 Video
+		comment.item.3 Aux
+		comment.item.4 Line
+		comment.item.5 Mix
+		comment.item.6 'Mix Mono'
+		comment.item.7 Phone
+		iface MIXER
+		name 'Capture Source'
+		value.0 Mic
+		value.1 Mic
+	}
+	control.21 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Capture Switch'
+		value.0 true
+		value.1 true
+	}
+	control.22 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 15'
+		comment.dbmin 0
+		comment.dbmax 2250
+		iface MIXER
+		name 'Capture Volume'
+		value.0 11
+		value.1 11
+	}
+	control.23 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 Mix
+		comment.item.1 Mic
+		iface MIXER
+		name 'Mono Output Select'
+		value Mix
+	}
+	control.24 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 Mic1
+		comment.item.1 Mic2
+		iface MIXER
+		name 'Mic Select'
+		value Mic1
+	}
+	control.25 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Stereo Mic'
+		value false
+	}
+	control.26 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Headphone Jack Sense'
+		value false
+	}
+	control.27 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Line Jack Sense'
+		value false
+	}
+	control.28 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'External Amplifier'
+		value true
+	}
+}
diff --git a/recipes/alsa/alsa-state/at91sam9263ek/asound.conf b/recipes/alsa/alsa-state/at91sam9263ek/asound.conf
deleted file mode 100644
index 87bb5ec..0000000
--- a/recipes/alsa/alsa-state/at91sam9263ek/asound.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-pcm.!default {  type hw  card 0  } 
-ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9263ek/asound.state b/recipes/alsa/alsa-state/at91sam9263ek/asound.state
deleted file mode 100644
index ee646a1..0000000
--- a/recipes/alsa/alsa-state/at91sam9263ek/asound.state
+++ /dev/null
@@ -1,283 +0,0 @@
-state.AC97 {
-	control.1 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Master Playback Switch'
-		value.0 true
-		value.1 true
-	}
-	control.2 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -4650
-		comment.dbmax 0
-		iface MIXER
-		name 'Master Playback Volume'
-		value.0 22
-		value.1 22
-	}
-	control.3 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Headphone Playback Switch'
-		value.0 true
-		value.1 true
-	}
-	control.4 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -4650
-		comment.dbmax 0
-		iface MIXER
-		name 'Headphone Playback Volume'
-		value.0 22
-		value.1 22
-	}
-	control.5 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Master Mono Playback Switch'
-		value false
-	}
-	control.6 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
-		comment.dbmin -4650
-		comment.dbmax 0
-		iface MIXER
-		name 'Master Mono Playback Volume'
-		value 0
-	}
-	control.7 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Phone Playback Switch'
-		value false
-	}
-	control.8 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Phone Playback Volume'
-		value 0
-	}
-	control.9 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Mic Playback Switch'
-		value false
-	}
-	control.10 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Mic Playback Volume'
-		value 0
-	}
-	control.11 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Mic Boost (+20dB)'
-		value false
-	}
-	control.12 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Line Playback Switch'
-		value.0 false
-		value.1 false
-	}
-	control.13 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Line Playback Volume'
-		value.0 0
-		value.1 0
-	}
-	control.14 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'CD Playback Switch'
-		value.0 false
-		value.1 false
-	}
-	control.15 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'CD Playback Volume'
-		value.0 0
-		value.1 0
-	}
-	control.16 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Aux Playback Switch'
-		value.0 false
-		value.1 false
-	}
-	control.17 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Aux Playback Volume'
-		value.0 0
-		value.1 0
-	}
-	control.18 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'PCM Playback Switch'
-		value.0 true
-		value.1 true
-	}
-	control.19 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'PCM Playback Volume'
-		value.0 22
-		value.1 22
-	}
-	control.20 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 2
-		comment.item.0 Mic
-		comment.item.1 CD
-		comment.item.2 Video
-		comment.item.3 Aux
-		comment.item.4 Line
-		comment.item.5 Mix
-		comment.item.6 'Mix Mono'
-		comment.item.7 Phone
-		iface MIXER
-		name 'Capture Source'
-		value.0 Mic
-		value.1 Mic
-	}
-	control.21 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Capture Switch'
-		value.0 true
-		value.1 true
-	}
-	control.22 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 15'
-		comment.dbmin 0
-		comment.dbmax 2250
-		iface MIXER
-		name 'Capture Volume'
-		value.0 11
-		value.1 11
-	}
-	control.23 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 Mix
-		comment.item.1 Mic
-		iface MIXER
-		name 'Mono Output Select'
-		value Mix
-	}
-	control.24 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 Mic1
-		comment.item.1 Mic2
-		iface MIXER
-		name 'Mic Select'
-		value Mic1
-	}
-	control.25 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Stereo Mic'
-		value false
-	}
-	control.26 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Headphone Jack Sense'
-		value false
-	}
-	control.27 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Line Jack Sense'
-		value false
-	}
-	control.28 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'External Amplifier'
-		value true
-	}
-}
diff --git a/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf b/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
deleted file mode 100644
index fa98593..0000000
--- a/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-pcm.!default {  type hw  card 0  }
-ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g45ek/asound.state b/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
deleted file mode 100644
index ee646a1..0000000
--- a/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
+++ /dev/null
@@ -1,283 +0,0 @@
-state.AC97 {
-	control.1 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Master Playback Switch'
-		value.0 true
-		value.1 true
-	}
-	control.2 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -4650
-		comment.dbmax 0
-		iface MIXER
-		name 'Master Playback Volume'
-		value.0 22
-		value.1 22
-	}
-	control.3 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Headphone Playback Switch'
-		value.0 true
-		value.1 true
-	}
-	control.4 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -4650
-		comment.dbmax 0
-		iface MIXER
-		name 'Headphone Playback Volume'
-		value.0 22
-		value.1 22
-	}
-	control.5 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Master Mono Playback Switch'
-		value false
-	}
-	control.6 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
-		comment.dbmin -4650
-		comment.dbmax 0
-		iface MIXER
-		name 'Master Mono Playback Volume'
-		value 0
-	}
-	control.7 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Phone Playback Switch'
-		value false
-	}
-	control.8 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Phone Playback Volume'
-		value 0
-	}
-	control.9 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Mic Playback Switch'
-		value false
-	}
-	control.10 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Mic Playback Volume'
-		value 0
-	}
-	control.11 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Mic Boost (+20dB)'
-		value false
-	}
-	control.12 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Line Playback Switch'
-		value.0 false
-		value.1 false
-	}
-	control.13 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Line Playback Volume'
-		value.0 0
-		value.1 0
-	}
-	control.14 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'CD Playback Switch'
-		value.0 false
-		value.1 false
-	}
-	control.15 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'CD Playback Volume'
-		value.0 0
-		value.1 0
-	}
-	control.16 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Aux Playback Switch'
-		value.0 false
-		value.1 false
-	}
-	control.17 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'Aux Playback Volume'
-		value.0 0
-		value.1 0
-	}
-	control.18 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'PCM Playback Switch'
-		value.0 true
-		value.1 true
-	}
-	control.19 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
-		comment.dbmin -3450
-		comment.dbmax 1200
-		iface MIXER
-		name 'PCM Playback Volume'
-		value.0 22
-		value.1 22
-	}
-	control.20 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 2
-		comment.item.0 Mic
-		comment.item.1 CD
-		comment.item.2 Video
-		comment.item.3 Aux
-		comment.item.4 Line
-		comment.item.5 Mix
-		comment.item.6 'Mix Mono'
-		comment.item.7 Phone
-		iface MIXER
-		name 'Capture Source'
-		value.0 Mic
-		value.1 Mic
-	}
-	control.21 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 2
-		iface MIXER
-		name 'Capture Switch'
-		value.0 true
-		value.1 true
-	}
-	control.22 {
-		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 15'
-		comment.dbmin 0
-		comment.dbmax 2250
-		iface MIXER
-		name 'Capture Volume'
-		value.0 11
-		value.1 11
-	}
-	control.23 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 Mix
-		comment.item.1 Mic
-		iface MIXER
-		name 'Mono Output Select'
-		value Mix
-	}
-	control.24 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 Mic1
-		comment.item.1 Mic2
-		iface MIXER
-		name 'Mic Select'
-		value Mic1
-	}
-	control.25 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Stereo Mic'
-		value false
-	}
-	control.26 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Headphone Jack Sense'
-		value false
-	}
-	control.27 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'Line Jack Sense'
-		value false
-	}
-	control.28 {
-		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
-		iface MIXER
-		name 'External Amplifier'
-		value true
-	}
-}
-- 
1.6.0.2



