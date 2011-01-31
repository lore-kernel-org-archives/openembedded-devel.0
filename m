Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pjzna-0005VJ-Qe
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 20:52:31 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id A87E7EB32B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 20:51:16 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+AHOhRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvXqFTgSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="170533001"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 31 Jan 2011 20:51:16 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 20:51:00 +0100
Message-Id: <1296503466-3877-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 2/8] Add ALSA support for at91sam9xe
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
X-List-Received-Date: Mon, 31 Jan 2011 19:52:31 -0000

---
 recipes/alsa/alsa-state/at91sam9xeek/asound.conf  |    2 +
 recipes/alsa/alsa-state/at91sam9xeek/asound.state |  108 +++++++++++++++++++++
 2 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 recipes/alsa/alsa-state/at91sam9xeek/asound.conf
 create mode 100644 recipes/alsa/alsa-state/at91sam9xeek/asound.state

diff --git a/recipes/alsa/alsa-state/at91sam9xeek/asound.conf b/recipes/alsa/alsa-state/at91sam9xeek/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9xeek/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/recipes/alsa/alsa-state/at91sam9xeek/asound.state b/recipes/alsa/alsa-state/at91sam9xeek/asound.state
new file mode 100644
index 0000000..3d86e4c
--- /dev/null
+++ b/recipes/alsa/alsa-state/at91sam9xeek/asound.state
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
-- 
1.6.3.3



