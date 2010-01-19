Received: from proxy3.bredband.net ([195.54.101.73])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NXNFn-0003Bu-QL
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 00:12:58 +0100
Received: from ipb2.telenor.se (195.54.127.165) by proxy3.bredband.net
	(7.3.140.3)
	id 4AD3E1BA026C2A57 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 00:10:40 +0100
X-SMTPAUTH-B2: 
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuIOAJfKVUtT4zqIPGdsb2JhbAAIiC6TQAEBAQE3vDiEMwQ
X-IronPort-AV: E=Sophos;i="4.49,307,1262559600"; d="scan'208";a="27833093"
Received: from c-883ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.58.136])
	by ipb2.telenor.se with ESMTP; 20 Jan 2010 00:10:39 +0100
Message-ID: <4B563BEF.3000708@atmel.com>
Date: Wed, 20 Jan 2010 00:10:39 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.101.73
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add alsa configuration files for SAM9G45EK
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
X-List-Received-Date: Tue, 19 Jan 2010 23:12:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Add ALSA config files for AT91SAM9G45EK

/etc/asound.conf
/etc/asound.state
---
 recipes/alsa/alsa-state/at91sam9g45ek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9g45ek/asound.state |  283
++++++++++++++++++++
 2 files changed, 285 insertions(+), 0 deletions(-)
 create mode 100644 recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9g45ek/asound.state

diff --git a/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
b/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  }
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
b/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
new file mode 100644
index 0000000..ee646a1
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9g45ek/asound.state
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
-- 
1.6.0.2

-- 
Best Regards
Ulf Samuelsson



