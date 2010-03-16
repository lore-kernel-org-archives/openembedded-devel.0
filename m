Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NrRP1-0008DR-0y
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 08:41:34 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id BDBFA4451B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 08:38:20 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AitDAHPSnktT4zvyPGdsb2JhbACHYZMRDAEBAQE3LasYA41OhHwE
X-IronPort-AV: E=Sophos;i="4.49,649,1262559600"; d="scan'208";a="50890580"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 08:38:19 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 08:38:18 +0100
Message-Id: <1268725098-13467-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v3 1/1] alsa-state: add alsa-state for at91 processors
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
X-List-Received-Date: Tue, 16 Mar 2010 07:41:36 -0000

From: Nicolas Ferre <nicolas.ferre@atmel.com>

+ at91sam9260ek
+ at91sam9261ek
+ at91sam9263ek	(updated)
+ at91sam9g10ek
+ at91sam9g20ek
+ at91sam9g20ek_2mmc
+ at91sam9g45ek	(updated)
+ at91sam9g45ekes
+ at91sam9m10ekes
+ at91sam9m10g45ek
+ at91sam9rlek

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/alsa/alsa-state.bb                         |    2 +-
 recipes/alsa/alsa-state/at91sam9260ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9260ek/asound.state |  108 ++++
 recipes/alsa/alsa-state/at91sam9261ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9261ek/asound.state |  108 ++++
 recipes/alsa/alsa-state/at91sam9263ek/asound.state |  283 ++++++++++
 recipes/alsa/alsa-state/at91sam9g10ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9g10ek/asound.state |  108 ++++
 recipes/alsa/alsa-state/at91sam9g20ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9g20ek/asound.state |  133 +++++
 .../alsa/alsa-state/at91sam9g20ek_2mmc/asound.conf |    2 +
 .../alsa-state/at91sam9g20ek_2mmc/asound.state     |  133 +++++
 recipes/alsa/alsa-state/at91sam9g45ek/asound.conf  |    2 +-
 recipes/alsa/alsa-state/at91sam9g45ek/asound.state |  283 ++++++++++
 .../alsa/alsa-state/at91sam9g45ekes/asound.conf    |    2 +
 .../alsa/alsa-state/at91sam9g45ekes/asound.state   |  566 ++++++++++++++++++++
 .../alsa/alsa-state/at91sam9m10ekes/asound.conf    |    2 +
 .../alsa/alsa-state/at91sam9m10ekes/asound.state   |  566 ++++++++++++++++++++
 .../alsa/alsa-state/at91sam9m10g45ek/asound.conf   |    2 +
 .../alsa/alsa-state/at91sam9m10g45ek/asound.state  |  566 ++++++++++++++++++++
 recipes/alsa/alsa-state/at91sam9rlek/asound.conf   |    2 +
 recipes/alsa/alsa-state/at91sam9rlek/asound.state  |  566 ++++++++++++++++++++
 22 files changed, 3440 insertions(+), 2 deletions(-)
 create mode 100644 recipes/alsa/alsa-state/at91sam9260ek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9260ek/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9261ek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9261ek/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9g10ek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9g10ek/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9g20ek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9g20ek/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9g45ekes/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9g45ekes/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9m10ekes/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9m10ekes/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9m10g45ek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9m10g45ek/asound.state
 create mode 100644 recipes/alsa/alsa-state/at91sam9rlek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9rlek/asound.state

diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
index d77db70..b6b494e 100644
--- a/recipes/alsa/alsa-state.bb
+++ b/recipes/alsa/alsa-state.bb
@@ -7,7 +7,7 @@
 DESCRIPTION = "Alsa Scenario Files"
 LICENSE = "MIT"
 PV = "0.2.0"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "\
   file://asound.conf \
diff --git a/recipes/alsa/alsa-state/at91sam9260ek/asound.conf b/recipes/alsa/alsa-state/at91sam9260ek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9260ek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9260ek/asound.state b/recipes/alsa/alsa-state/at91sam9260ek/asound.state
new file mode 100644
index 0000000..3d86e4c
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9260ek/asound.state
@@ -0,0 +1,108 @@
+state.at73c213_0 {
+	control.1 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 22
+		value.1 22
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Master Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		iface MIXER
+		name 'PCM Playback Volume'
+		value.0 20
+		value.1 20
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'PCM Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mono PA Playback Switch'
+		value false
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 14'
+		iface MIXER
+		name 'PA Playback Volume'
+		value 0
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PA High Gain Playback Switch'
+		value false
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PA Playback Switch'
+		value false
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '14 - 31'
+		iface MIXER
+		name 'Aux Capture Volume'
+		value 14
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Aux Capture Switch'
+		value false
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '14 - 31'
+		iface MIXER
+		name 'Line Capture Volume'
+		value.0 14
+		value.1 14
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Line Capture Switch'
+		value false
+	}
+}
diff --git a/recipes/alsa/alsa-state/at91sam9261ek/asound.conf b/recipes/alsa/alsa-state/at91sam9261ek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9261ek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9261ek/asound.state b/recipes/alsa/alsa-state/at91sam9261ek/asound.state
new file mode 100644
index 0000000..40a6457
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9261ek/asound.state
@@ -0,0 +1,108 @@
+state.at73c213_1 {
+	control.1 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 23
+		value.1 23
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Master Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		iface MIXER
+		name 'PCM Playback Volume'
+		value.0 16
+		value.1 16
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'PCM Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mono PA Playback Switch'
+		value false
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 14'
+		iface MIXER
+		name 'PA Playback Volume'
+		value 0
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PA High Gain Playback Switch'
+		value false
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PA Playback Switch'
+		value false
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '14 - 31'
+		iface MIXER
+		name 'Aux Capture Volume'
+		value 14
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Aux Capture Switch'
+		value false
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '14 - 31'
+		iface MIXER
+		name 'Line Capture Volume'
+		value.0 14
+		value.1 14
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Line Capture Switch'
+		value false
+	}
+}
diff --git a/recipes/alsa/alsa-state/at91sam9263ek/asound.state b/recipes/alsa/alsa-state/at91sam9263ek/asound.state
index ee646a1..e8d3218 100644
--- a/recipes/alsa/alsa-state/at91sam9263ek/asound.state
+++ b/recipes/alsa/alsa-state/at91sam9263ek/asound.state
@@ -281,3 +281,286 @@ state.AC97 {
 		value true
 	}
 }
+state.AC97C {
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
diff --git a/recipes/alsa/alsa-state/at91sam9g10ek/asound.conf b/recipes/alsa/alsa-state/at91sam9g10ek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g10ek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g10ek/asound.state b/recipes/alsa/alsa-state/at91sam9g10ek/asound.state
new file mode 100644
index 0000000..40a6457
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g10ek/asound.state
@@ -0,0 +1,108 @@
+state.at73c213_1 {
+	control.1 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 23
+		value.1 23
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Master Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		iface MIXER
+		name 'PCM Playback Volume'
+		value.0 16
+		value.1 16
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'PCM Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mono PA Playback Switch'
+		value false
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 14'
+		iface MIXER
+		name 'PA Playback Volume'
+		value 0
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PA High Gain Playback Switch'
+		value false
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PA Playback Switch'
+		value false
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '14 - 31'
+		iface MIXER
+		name 'Aux Capture Volume'
+		value 14
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Aux Capture Switch'
+		value false
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '14 - 31'
+		iface MIXER
+		name 'Line Capture Volume'
+		value.0 14
+		value.1 14
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Line Capture Switch'
+		value false
+	}
+}
diff --git a/recipes/alsa/alsa-state/at91sam9g20ek/asound.conf b/recipes/alsa/alsa-state/at91sam9g20ek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g20ek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g20ek/asound.state b/recipes/alsa/alsa-state/at91sam9g20ek/asound.state
new file mode 100644
index 0000000..da98b4e
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g20ek/asound.state
@@ -0,0 +1,133 @@
+state.AT91SAMG20EK {
+	control.1 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 127'
+		comment.dbmin -12100
+		comment.dbmax 600
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 115
+		value.1 115
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Master Playback ZC Switch'
+		value.0 false
+		value.1 false
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'Capture Volume'
+		value.0 23
+		value.1 23
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Line Capture Switch'
+		value.0 false
+		value.1 false
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mic Boost (+20dB)'
+		value false
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mic Capture Switch'
+		value false
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 3'
+		comment.dbmin -1500
+		comment.dbmax -600
+		iface MIXER
+		name 'Sidetone Playback Volume'
+		value 0
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'ADC High Pass Filter Switch'
+		value true
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Store DC Offset Switch'
+		value false
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 None
+		comment.item.1 '32Khz'
+		comment.item.2 '44.1Khz'
+		comment.item.3 '48Khz'
+		iface MIXER
+		name 'Playback De-emphasis'
+		value None
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Line In'
+		comment.item.1 Mic
+		iface MIXER
+		name 'Input Mux'
+		value 'Line In'
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Output Mixer Line Bypass Switch'
+		value false
+	}
+	control.13 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Output Mixer Mic Sidetone Switch'
+		value false
+	}
+	control.14 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Output Mixer HiFi Playback Switch'
+		value true
+	}
+}
diff --git a/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.conf b/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.state b/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.state
new file mode 100644
index 0000000..da98b4e
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.state
@@ -0,0 +1,133 @@
+state.AT91SAMG20EK {
+	control.1 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 127'
+		comment.dbmin -12100
+		comment.dbmax 600
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 115
+		value.1 115
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Master Playback ZC Switch'
+		value.0 false
+		value.1 false
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin -3450
+		comment.dbmax 1200
+		iface MIXER
+		name 'Capture Volume'
+		value.0 23
+		value.1 23
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Line Capture Switch'
+		value.0 false
+		value.1 false
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mic Boost (+20dB)'
+		value false
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mic Capture Switch'
+		value false
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 3'
+		comment.dbmin -1500
+		comment.dbmax -600
+		iface MIXER
+		name 'Sidetone Playback Volume'
+		value 0
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'ADC High Pass Filter Switch'
+		value true
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Store DC Offset Switch'
+		value false
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 None
+		comment.item.1 '32Khz'
+		comment.item.2 '44.1Khz'
+		comment.item.3 '48Khz'
+		iface MIXER
+		name 'Playback De-emphasis'
+		value None
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Line In'
+		comment.item.1 Mic
+		iface MIXER
+		name 'Input Mux'
+		value 'Line In'
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Output Mixer Line Bypass Switch'
+		value false
+	}
+	control.13 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Output Mixer Mic Sidetone Switch'
+		value false
+	}
+	control.14 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Output Mixer HiFi Playback Switch'
+		value true
+	}
+}
diff --git a/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf b/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
index fa98593..87bb5ec 100644
--- a/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
+++ b/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
@@ -1,2 +1,2 @@
-pcm.!default {  type hw  card 0  }
+pcm.!default {  type hw  card 0  } 
 ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g45ek/asound.state b/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
index ee646a1..e8d3218 100644
--- a/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
+++ b/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
@@ -281,3 +281,286 @@ state.AC97 {
 		value true
 	}
 }
+state.AC97C {
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
diff --git a/recipes/alsa/alsa-state/at91sam9g45ekes/asound.conf b/recipes/alsa/alsa-state/at91sam9g45ekes/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g45ekes/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g45ekes/asound.state b/recipes/alsa/alsa-state/at91sam9g45ekes/asound.state
new file mode 100644
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g45ekes/asound.state
@@ -0,0 +1,566 @@
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
+state.AC97C {
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
diff --git a/recipes/alsa/alsa-state/at91sam9m10ekes/asound.conf b/recipes/alsa/alsa-state/at91sam9m10ekes/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9m10ekes/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9m10ekes/asound.state b/recipes/alsa/alsa-state/at91sam9m10ekes/asound.state
new file mode 100644
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9m10ekes/asound.state
@@ -0,0 +1,566 @@
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
+state.AC97C {
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
diff --git a/recipes/alsa/alsa-state/at91sam9m10g45ek/asound.conf b/recipes/alsa/alsa-state/at91sam9m10g45ek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9m10g45ek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9m10g45ek/asound.state b/recipes/alsa/alsa-state/at91sam9m10g45ek/asound.state
new file mode 100644
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9m10g45ek/asound.state
@@ -0,0 +1,566 @@
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
+state.AC97C {
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
diff --git a/recipes/alsa/alsa-state/at91sam9rlek/asound.conf b/recipes/alsa/alsa-state/at91sam9rlek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9rlek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9rlek/asound.state b/recipes/alsa/alsa-state/at91sam9rlek/asound.state
new file mode 100644
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9rlek/asound.state
@@ -0,0 +1,566 @@
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
+state.AC97C {
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
-- 
1.6.0.2



