Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKChi-0002Kc-9p
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:51:36 +0200
Received: by gwb15 with SMTP id 15so173533gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bcw3xHvevSa40eyXla4VdYHqMVP3Lph9sDmWWisYFNo=;
	b=ZhhRxastq3aP6lfVl2n/veD55FNWodbPFr3VmcA9qH/1N2kuQWRY6RRmXxP+9kY1Oa
	ya9V8vQseOQHsw0LYL3ZUeR30AFV7bTXMbhG+3/XnJiPxCDWU/aEHL9V9iniqfUwnocQ
	hikhN1EDc5RBDQpVkc7Py9IEXigov/+sFYBGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=i5lNfg1FEYHi1nUS9tvZ01M5s+Pi2zbNT1FlIL7rHxI1jUl0XQWkAPzelXJ4lE06sH
	5mb96rB7vddbP3xN390lHUdjgHYODPUpXAIA3Vhno54jkVDTdUkwA+i6ud4IOzwCEjI7
	kwuIS45qvfY3sDeeP+KZQBimM/NhBUGx4s7Zc=
Received: by 10.150.55.24 with SMTP id d24mr9526636yba.186.1275580037757;
	Thu, 03 Jun 2010 08:47:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w3sm8802100ybi.21.2010.06.03.08.47.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 08:47:17 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 10:41:25 -0500
Message-Id: <1275579688-19909-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 1/4] alsa-state/dm355-evm: add asound file
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
X-List-Received-Date: Thu, 03 Jun 2010 15:51:36 -0000

* Add the asound.state file for the Texas Instruments
  dm355-evm platform.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../alsa-state/{tosa => dm355-evm}/asound.state    |  644 ++++++++++----------
 1 files changed, 321 insertions(+), 323 deletions(-)
 copy recipes/alsa/alsa-state/{tosa => dm355-evm}/asound.state (56%)

diff --git a/recipes/alsa/alsa-state/tosa/asound.state b/recipes/alsa/alsa-state/dm355-evm/asound.state
similarity index 56%
copy from recipes/alsa/alsa-state/tosa/asound.state
copy to recipes/alsa/alsa-state/dm355-evm/asound.state
index c38265d..8a5f84a 100644
--- a/recipes/alsa/alsa-state/tosa/asound.state
+++ b/recipes/alsa/alsa-state/dm355-evm/asound.state
@@ -1,330 +1,381 @@
-state.Tosa {
+state.EVM {
 	control.1 {
 		comment.access 'read write'
 		comment.type INTEGER
 		comment.count 2
-		comment.range '0 - 31'
+		comment.range '0 - 127'
+		comment.dbmin -6350
+		comment.dbmax 0
 		iface MIXER
-		name 'Speaker Playback Volume'
-		value.0 25
-		value.1 25
+		name 'PCM Playback Volume'
+		value.0 127
+		value.1 127
 	}
 	control.2 {
 		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Speaker Playback Switch'
-		value true
+		name 'Line DAC Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.3 {
 		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
+		comment.type BOOLEAN
+		comment.count 1
 		iface MIXER
-		name 'Headphone Playback Volume'
-		value.0 20
-		value.1 20
+		name 'LineL Playback Switch'
+		value true
 	}
 	control.4 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Headphone Playback Switch'
+		name 'LineR Playback Switch'
 		value true
 	}
 	control.5 {
 		comment.access 'read write'
 		comment.type INTEGER
 		comment.count 2
-		comment.range '0 - 31'
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'PCM Playback Volume'
-		value.0 23
-		value.1 23
+		name 'LineL DAC Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.6 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type INTEGER
 		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Speaker Playback ZC Switch'
-		value true
+		name 'LineL Left PGA Bypass Playback Volume'
+		value 118
 	}
 	control.7 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type INTEGER
 		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Speaker Playback Invert Switch'
-		value true
+		name 'LineR Right PGA Bypass Playback Volume'
+		value 118
 	}
 	control.8 {
 		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Headphone Playback ZC Switch'
-		value true
+		name 'LineL Line2 Bypass Playback Volume'
+		value.0 71
+		value.1 118
 	}
 	control.9 {
 		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Mono Playback ZC Switch'
-		value false
+		name 'LineR Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 71
 	}
 	control.10 {
 		comment.access 'read write'
 		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Mono Playback Volume'
-		value 0
+		name 'Mono DAC Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.11 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 15'
 		iface MIXER
-		name 'ALC Target Volume'
-		value 11
+		name 'Mono DAC Playback Switch'
+		value true
 	}
 	control.12 {
 		comment.access 'read write'
 		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 15'
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC Hold Time'
-		value 2
+		name 'Mono PGA Bypass Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.13 {
 		comment.access 'read write'
 		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 15'
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC Decay Time'
-		value 3
+		name 'Mono Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.14 {
 		comment.access 'read write'
 		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 15'
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC Attack Time'
-		value 2
+		name 'HP DAC Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.15 {
 		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 None
-		comment.item.1 Left
-		comment.item.2 Right
-		comment.item.3 Stereo
+		comment.type BOOLEAN
+		comment.count 2
 		iface MIXER
-		name 'ALC Function'
-		value None
+		name 'HP DAC Playback Switch'
+		value.0 true
+		value.1 true
 	}
 	control.16 {
 		comment.access 'read write'
 		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 7'
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC Max Volume'
-		value 7
+		name 'HP Right PGA Bypass Playback Volume'
+		value.0 118
+		value.1 71
 	}
 	control.17 {
 		comment.access 'read write'
 		comment.type INTEGER
 		comment.count 1
-		comment.range '0 - 3'
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC ZC Timeout'
-		value 0
+		name 'HPL PGA Bypass Playback Volume'
+		value 118
 	}
 	control.18 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type INTEGER
 		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC ZC Switch'
-		value false
+		name 'HPR PGA Bypass Playback Volume'
+		value 118
 	}
 	control.19 {
 		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC NG Switch'
-		value false
+		name 'HP Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.20 {
 		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 'Constant Gain'
-		comment.item.1 Mute
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC NG Type'
-		value 'Constant Gain'
+		name 'HPCOM DAC Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.21 {
 		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
+		comment.type BOOLEAN
+		comment.count 2
 		iface MIXER
-		name 'ALC NG Threshold'
-		value 31
+		name 'HPCOM DAC Playback Switch'
+		value.0 true
+		value.1 true
 	}
 	control.22 {
 		comment.access 'read write'
 		comment.type INTEGER
 		comment.count 1
-		comment.range '0 - 7'
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Mic Headphone  Volume'
-		value 7
+		name 'HPLCOM PGA Bypass Playback Volume'
+		value 118
 	}
 	control.23 {
 		comment.access 'read write'
 		comment.type INTEGER
 		comment.count 1
-		comment.range '0 - 7'
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'ALC Headphone Volume'
-		value 5
+		name 'HPRCOM PGA Bypass Playback Volume'
+		value 118
 	}
 	control.24 {
 		comment.access 'read write'
-		comment.type BOOLEAN
-		comment.count 1
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
 		iface MIXER
-		name 'Out3 Switch'
-		value false
+		name 'HPCOM Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 118
 	}
 	control.25 {
 		comment.access 'read write'
 		comment.type BOOLEAN
-		comment.count 1
+		comment.count 2
 		iface MIXER
-		name 'Out3 ZC Switch'
-		value true
+		name 'AGC Switch'
+		value.0 false
+		value.1 false
 	}
 	control.26 {
 		comment.access 'read write'
 		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 31'
+		comment.count 2
+		comment.range '0 - 119'
+		comment.dbmin 0
+		comment.dbmax 5950
 		iface MIXER
-		name 'Out3 Volume'
-		value 0
+		name 'PGA Capture Volume'
+		value.0 32
+		value.1 32
 	}
 	control.27 {
 		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 7'
+		comment.type BOOLEAN
+		comment.count 2
 		iface MIXER
-		name 'PCBeep Bypass Headphone Volume'
-		value 0
+		name 'PGA Capture Switch'
+		value.0 true
+		value.1 true
 	}
 	control.28 {
 		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 1
-		comment.range '0 - 7'
+		comment.type ENUMERATED
+		comment.count 2
+		comment.item.0 Disabled
+		comment.item.1 '0.0045xFs'
+		comment.item.2 '0.0125xFs'
+		comment.item.3 '0.025xFs'
 		iface MIXER
-		name 'PCBeep Bypass Speaker Volume'
-		value 0
+		name 'ADC HPF Cut-off'
+		value.0 Disabled
+		value.1 Disabled
 	}
 	control.29 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 7'
 		iface MIXER
-		name 'PCBeep Bypass Phone Volume'
-		value 0
+		name 'Right Line2 Bypass Mixer LineL Switch'
+		value false
 	}
 	control.30 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 7'
 		iface MIXER
-		name 'Aux Playback Headphone Volume'
-		value 5
+		name 'Right Line2 Bypass Mixer LineR Switch'
+		value false
 	}
 	control.31 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 7'
 		iface MIXER
-		name 'Aux Playback Speaker Volume'
-		value 0
+		name 'Right Line2 Bypass Mixer Mono Switch'
+		value false
 	}
 	control.32 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 7'
 		iface MIXER
-		name 'Aux Playback Phone Volume'
-		value 0
+		name 'Right Line2 Bypass Mixer HP Switch'
+		value false
 	}
 	control.33 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 15'
 		iface MIXER
-		name 'Phone Volume'
-		value 0
+		name 'Right Line2 Bypass Mixer HPRCOM Switch'
+		value false
 	}
 	control.34 {
 		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 31'
+		comment.type BOOLEAN
+		comment.count 1
 		iface MIXER
-		name 'Line Capture Volume'
-		value.0 23
-		value.1 23
+		name 'Left Line2 Bypass Mixer LineL Switch'
+		value false
 	}
 	control.35 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Capture 20dB Boost Switch'
-		value true
+		name 'Left Line2 Bypass Mixer LineR Switch'
+		value false
 	}
 	control.36 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Capture to Phone 20dB Boost Switch'
-		value true
+		name 'Left Line2 Bypass Mixer Mono Switch'
+		value false
 	}
 	control.37 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name '3D Upper Cut-off Switch'
+		name 'Left Line2 Bypass Mixer HP Switch'
 		value false
 	}
 	control.38 {
@@ -332,42 +383,39 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name '3D Lower Cut-off Switch'
+		name 'Left Line2 Bypass Mixer HPLCOM Switch'
 		value false
 	}
 	control.39 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 15'
 		iface MIXER
-		name '3D Playback Volume'
-		value 0
+		name 'Right PGA Bypass Mixer LineL Switch'
+		value false
 	}
 	control.40 {
 		comment.access 'read write'
-		comment.type ENUMERATED
+		comment.type BOOLEAN
 		comment.count 1
-		comment.item.0 'Linear Control'
-		comment.item.1 'Adaptive Boost'
 		iface MIXER
-		name 'Bass Control'
-		value 'Adaptive Boost'
+		name 'Right PGA Bypass Mixer LineR Switch'
+		value false
 	}
 	control.41 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Bass Cut-off Switch'
-		value true
+		name 'Right PGA Bypass Mixer Mono Switch'
+		value false
 	}
 	control.42 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Tone Cut-off Switch'
+		name 'Right PGA Bypass Mixer HPL Switch'
 		value false
 	}
 	control.43 {
@@ -375,136 +423,133 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Playback Attenuate (-6dB) Switch'
+		name 'Right PGA Bypass Mixer HPR Switch'
 		value false
 	}
 	control.44 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 15'
 		iface MIXER
-		name 'Bass Volume'
-		value 8
+		name 'Right PGA Bypass Mixer HPLCOM Switch'
+		value false
 	}
 	control.45 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 15'
 		iface MIXER
-		name 'Treble Volume'
-		value 5
+		name 'Right PGA Bypass Mixer HPRCOM Switch'
+		value false
 	}
 	control.46 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Capture ADC Switch'
+		name 'Left PGA Bypass Mixer LineL Switch'
 		value false
 	}
 	control.47 {
 		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 2
-		comment.item.0 '+1.5dB Steps'
-		comment.item.1 '+0.75dB Steps'
+		comment.type BOOLEAN
+		comment.count 1
 		iface MIXER
-		name 'Capture Volume Steps'
-		value.0 '+0.75dB Steps'
-		value.1 '+0.75dB Steps'
+		name 'Left PGA Bypass Mixer LineR Switch'
+		value false
 	}
 	control.48 {
 		comment.access 'read write'
-		comment.type INTEGER
-		comment.count 2
-		comment.range '0 - 63'
+		comment.type BOOLEAN
+		comment.count 1
 		iface MIXER
-		name 'Capture Volume'
-		value.0 0
-		value.1 0
+		name 'Left PGA Bypass Mixer Mono Switch'
+		value false
 	}
 	control.49 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Capture ZC Switch'
+		name 'Left PGA Bypass Mixer HPL Switch'
 		value false
 	}
 	control.50 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 31'
 		iface MIXER
-		name 'Mic 1 Volume'
-		value 23
+		name 'Left PGA Bypass Mixer HPR Switch'
+		value false
 	}
 	control.51 {
 		comment.access 'read write'
-		comment.type INTEGER
+		comment.type BOOLEAN
 		comment.count 1
-		comment.range '0 - 31'
 		iface MIXER
-		name 'Mic 2 Volume'
-		value 23
+		name 'Left PGA Bypass Mixer HPLCOM Switch'
+		value false
 	}
 	control.52 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Mic 20dB Boost Switch'
+		name 'Left PGA Bypass Mixer HPRCOM Switch'
 		value false
 	}
 	control.53 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
 		iface MIXER
-		name 'Speaker Mixer PCBeep Bypass Swi'
-		value false
+		name 'Right Line2R Mux'
+		value single-ended
 	}
 	control.54 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
 		iface MIXER
-		name 'Speaker Mixer Aux Playback Swit'
-		value false
+		name 'Right Line1R Mux'
+		value single-ended
 	}
 	control.55 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
 		iface MIXER
-		name 'Speaker Mixer Phone Bypass Swit'
-		value false
+		name 'Right Line1L Mux'
+		value single-ended
 	}
 	control.56 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Speaker Mixer Line Bypass Switc'
-		value false
+		name 'Right PGA Mixer Line1R Switch'
+		value true
 	}
 	control.57 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Speaker Mixer PCM Playback Swit'
-		value true
+		name 'Right PGA Mixer Line1L Switch'
+		value false
 	}
 	control.58 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Phone Mixer PCBeep Bypass Switc'
+		name 'Right PGA Mixer Line2R Switch'
 		value false
 	}
 	control.59 {
@@ -512,7 +557,7 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Phone Mixer Aux Playback Switch'
+		name 'Right PGA Mixer Mic3L Switch'
 		value false
 	}
 	control.60 {
@@ -520,47 +565,53 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Phone Mixer Line Bypass Switch'
+		name 'Right PGA Mixer Mic3R Switch'
 		value false
 	}
 	control.61 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
 		iface MIXER
-		name 'Phone Mixer PCM Playback Switch'
-		value false
+		name 'Left Line2L Mux'
+		value single-ended
 	}
 	control.62 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
 		iface MIXER
-		name 'Phone Mixer Mic 1 Sidetone Swit'
-		value false
+		name 'Left Line1R Mux'
+		value single-ended
 	}
 	control.63 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
 		iface MIXER
-		name 'Phone Mixer Mic 2 Sidetone Swit'
-		value false
+		name 'Left Line1L Mux'
+		value single-ended
 	}
 	control.64 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Right HP Mixer PCBeep Bypass Sw'
-		value false
+		name 'Left PGA Mixer Line1L Switch'
+		value true
 	}
 	control.65 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Right HP Mixer Aux Playback Swi'
+		name 'Left PGA Mixer Line1R Switch'
 		value false
 	}
 	control.66 {
@@ -568,7 +619,7 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Right HP Mixer Phone Bypass Swi'
+		name 'Left PGA Mixer Line2L Switch'
 		value false
 	}
 	control.67 {
@@ -576,7 +627,7 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Right HP Mixer Line Bypass Swit'
+		name 'Left PGA Mixer Mic3L Switch'
 		value false
 	}
 	control.68 {
@@ -584,23 +635,28 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Right HP Mixer PCM Playback Swi'
-		value true
+		name 'Left PGA Mixer Mic3R Switch'
+		value false
 	}
 	control.69 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 'differential of HPROUT'
+		comment.item.1 'constant VCM'
+		comment.item.2 single-ended
+		comment.item.3 'differential of HPLCOM'
+		comment.item.4 'external feedback'
 		iface MIXER
-		name 'Right HP Mixer Mic Sidetone Swi'
-		value false
+		name 'Right HPCOM Mux'
+		value 'differential of HPROUT'
 	}
 	control.70 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Left HP Mixer PCBeep Bypass Swi'
+		name 'Right DAC_R1 Mixer LineL Switch'
 		value false
 	}
 	control.71 {
@@ -608,162 +664,104 @@ state.Tosa {
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Left HP Mixer Aux Playback Swit'
-		value false
+		name 'Right DAC_R1 Mixer LineR Switch'
+		value true
 	}
 	control.72 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Left HP Mixer Phone Bypass Swit'
-		value false
+		name 'Right DAC_R1 Mixer Mono Switch'
+		value true
 	}
 	control.73 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Left HP Mixer Line Bypass Switc'
-		value false
+		name 'Right DAC_R1 Mixer HP Switch'
+		value true
 	}
 	control.74 {
 		comment.access 'read write'
 		comment.type BOOLEAN
 		comment.count 1
 		iface MIXER
-		name 'Left HP Mixer PCM Playback Swit'
+		name 'Right DAC_R1 Mixer HPCOM Switch'
 		value true
 	}
 	control.75 {
 		comment.access 'read write'
-		comment.type BOOLEAN
+		comment.type ENUMERATED
 		comment.count 1
+		comment.item.0 DAC_R1
+		comment.item.1 DAC_R3
+		comment.item.2 DAC_R2
 		iface MIXER
-		name 'Left HP Mixer Mic Sidetone Swit'
-		value false
+		name 'Right DAC Mux'
+		value DAC_R1
 	}
 	control.76 {
 		comment.access 'read write'
 		comment.type ENUMERATED
 		comment.count 1
-		comment.item.0 Mic
-		comment.item.1 Line
+		comment.item.0 'differential of HPLOUT'
+		comment.item.1 'constant VCM'
+		comment.item.2 single-ended
 		iface MIXER
-		name 'Differential Source'
-		value Mic
+		name 'Left HPCOM Mux'
+		value 'differential of HPLOUT'
 	}
 	control.77 {
 		comment.access 'read write'
-		comment.type ENUMERATED
+		comment.type BOOLEAN
 		comment.count 1
-		comment.item.0 'Mic 1'
-		comment.item.1 Differential
-		comment.item.2 'Mic 2'
-		comment.item.3 Stereo
 		iface MIXER
-		name 'Mic Select Source'
-		value Differential
+		name 'Left DAC_L1 Mixer LineL Switch'
+		value true
 	}
 	control.78 {
 		comment.access 'read write'
-		comment.type ENUMERATED
+		comment.type BOOLEAN
 		comment.count 1
-		comment.item.0 Mic
-		comment.item.1 NC
-		comment.item.2 NC
-		comment.item.3 'Speaker Mixer'
-		comment.item.4 Line
-		comment.item.5 'Headphone Mixer'
-		comment.item.6 'Phone Mixer'
-		comment.item.7 Phone
 		iface MIXER
-		name 'Right Capture Select'
-		value Mic
+		name 'Left DAC_L1 Mixer LineR Switch'
+		value false
 	}
 	control.79 {
 		comment.access 'read write'
-		comment.type ENUMERATED
+		comment.type BOOLEAN
 		comment.count 1
-		comment.item.0 Mic
-		comment.item.1 NC
-		comment.item.2 NC
-		comment.item.3 'Speaker Mixer'
-		comment.item.4 Line
-		comment.item.5 'Headphone Mixer'
-		comment.item.6 'Phone Mixer'
-		comment.item.7 Phone
 		iface MIXER
-		name 'Left Capture Select'
-		value Mic
+		name 'Left DAC_L1 Mixer Mono Switch'
+		value true
 	}
 	control.80 {
 		comment.access 'read write'
-		comment.type ENUMERATED
+		comment.type BOOLEAN
 		comment.count 1
-		comment.item.0 Stereo
-		comment.item.1 Left
-		comment.item.2 Right
-		comment.item.3 Mute
 		iface MIXER
-		name 'Capture Phone Mux'
-		value Mute
+		name 'Left DAC_L1 Mixer HP Switch'
+		value true
 	}
 	control.81 {
 		comment.access 'read write'
-		comment.type ENUMERATED
+		comment.type BOOLEAN
 		comment.count 1
-		comment.item.0 'Speaker Mix'
-		comment.item.1 'Headphone Mix'
 		iface MIXER
-		name 'Speaker Mux'
-		value 'Speaker Mix'
+		name 'Left DAC_L1 Mixer HPCOM Switch'
+		value true
 	}
 	control.82 {
 		comment.access 'read write'
 		comment.type ENUMERATED
 		comment.count 1
-		comment.item.0 Left
-		comment.item.1 VREF
-		comment.item.2 'Left + Right'
-		comment.item.3 Mono
-		iface MIXER
-		name 'Out3 Mux'
-		value Left
-	}
-	control.83 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 Stereo
-		comment.item.1 Left
-		comment.item.2 Right
-		comment.item.3 None
-		iface MIXER
-		name 'ALC Sidetone Mux'
-		value Stereo
-	}
-	control.84 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 Headphone
-		comment.item.1 Mic
-		comment.item.2 Line
-		comment.item.3 Headset
-		comment.item.4 Off
-		iface MIXER
-		name 'Jack Function'
-		value Off
-	}
-	control.85 {
-		comment.access 'read write'
-		comment.type ENUMERATED
-		comment.count 1
-		comment.item.0 On
-		comment.item.1 Off
+		comment.item.0 DAC_L1
+		comment.item.1 DAC_L3
+		comment.item.2 DAC_L2
 		iface MIXER
-		name 'Speaker Function'
-		value On
+		name 'Left DAC Mux'
+		value DAC_L1
 	}
 }
-- 
1.6.0.4



