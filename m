Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqxL3-0004c6-Mq
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 00:35:20 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id BAEB6EBDD6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 00:29:17 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Akk4AOkNnUtT4zvyPGdsb2JhbACaaQwBAQEBNy2qEQOMIYR7BA
X-IronPort-AV: E=Sophos;i="4.49,639,1262559600"; d="scan'208";a="50171549"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 15 Mar 2010 00:29:13 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 00:29:13 +0100
Message-Id: <1268609353-31224-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 1/1] alsa-state: Add support for at91 boards
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
X-List-Received-Date: Sun, 14 Mar 2010 23:35:20 -0000

Add ALSA configuration files for at91 boards

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/alsa/alsa-state/at91sam9260ek/asound.conf  |   11 +
 recipes/alsa/alsa-state/at91sam9260ek/asound.state |  566 ++++++++++++++++++++
 recipes/alsa/alsa-state/at91sam9261ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9261ek/asound.state |  108 ++++
 recipes/alsa/alsa-state/at91sam9g10ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9g10ek/asound.state |  566 ++++++++++++++++++++
 recipes/alsa/alsa-state/at91sam9g20ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9g20ek/asound.state |  566 ++++++++++++++++++++
 .../alsa/alsa-state/at91sam9g20ek_2mmc/asound.conf |    2 +
 .../alsa-state/at91sam9g20ek_2mmc/asound.state     |  566 ++++++++++++++++++++
 .../alsa/alsa-state/at91sam9g45ekes/asound.conf    |    2 +
 .../alsa/alsa-state/at91sam9g45ekes/asound.state   |  566 ++++++++++++++++++++
 .../alsa/alsa-state/at91sam9m10ekes/asound.conf    |    2 +
 .../alsa/alsa-state/at91sam9m10ekes/asound.state   |  566 ++++++++++++++++++++
 .../alsa/alsa-state/at91sam9m10g45ek/asound.conf   |    2 +
 .../alsa/alsa-state/at91sam9m10g45ek/asound.state  |  566 ++++++++++++++++++++
 recipes/alsa/alsa-state/at91sam9rlek/asound.conf   |    2 +
 recipes/alsa/alsa-state/at91sam9rlek/asound.state  |  566 ++++++++++++++++++++
 recipes/alsa/alsa-state/at91sam9xeek/asound.conf   |   11 +
 recipes/alsa/alsa-state/at91sam9xeek/asound.state  |  566 ++++++++++++++++++++
 20 files changed, 5240 insertions(+), 0 deletions(-)
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
 create mode 100644 recipes/alsa/alsa-state/at91sam9xeek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9xeek/asound.state

diff --git a/recipes/alsa/alsa-state/at91sam9260ek/asound.conf b/recipes/alsa/alsa-state/at91sam9260ek/asound.conf
new file mode 100644
index 0000000..f2f45c8
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9260ek/asound.conf
@@ -0,0 +1,11 @@
+# default at91sam9g45ek configuration
+
+pcm.!default {
+  type hw
+  card 0
+}
+
+ctl.!default {
+  type hw
+  card 0
+}
diff --git a/recipes/alsa/alsa-state/at91sam9260ek/asound.state b/recipes/alsa/alsa-state/at91sam9260ek/asound.state
new file mode 100644
index 0000000..a107844
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9260ek/asound.state
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
+		value.0 false
+		value.1 false
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
+		value.0 0
+		value.1 0
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Headphone Playback Switch'
+		value.0 false
+		value.1 false
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
+		value.0 0
+		value.1 0
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
+		value.0 false
+		value.1 false
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
+		value.0 0
+		value.1 0
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
+		value.0 0
+		value.1 0
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
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g10ek/asound.state
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
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g20ek/asound.state
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
index 0000000..e8d3218
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g20ek_2mmc/asound.state
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
diff --git a/recipes/alsa/alsa-state/at91sam9xeek/asound.conf b/recipes/alsa/alsa-state/at91sam9xeek/asound.conf
new file mode 100644
index 0000000..f2f45c8
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9xeek/asound.conf
@@ -0,0 +1,11 @@
+# default at91sam9g45ek configuration
+
+pcm.!default {
+  type hw
+  card 0
+}
+
+ctl.!default {
+  type hw
+  card 0
+}
diff --git a/recipes/alsa/alsa-state/at91sam9xeek/asound.state b/recipes/alsa/alsa-state/at91sam9xeek/asound.state
new file mode 100644
index 0000000..a107844
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9xeek/asound.state
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
+		value.0 false
+		value.1 false
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
+		value.0 0
+		value.1 0
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'Headphone Playback Switch'
+		value.0 false
+		value.1 false
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
+		value.0 0
+		value.1 0
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
+		value.0 false
+		value.1 false
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
+		value.0 0
+		value.1 0
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
+		value.0 0
+		value.1 0
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



