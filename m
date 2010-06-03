Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKDF3-0005ID-0K
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:26:04 +0200
Received: by gwb15 with SMTP id 15so205700gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=GRBXwJcle/n0bKygU98jUKz1qc0Qw2NiqG7hEyfeHM8=;
	b=tNyzPZW16/FtfAGoK6Wyh2qfzampBPawgOF7Nh6+eHzWqEKW5y0C8PrfxOvE7D1fPX
	H3rbtX0j7R9zahB53Ez25fkE+jW3qkNUI/WOveuMNGv22emtZX2p4hYFDZhGCCg7F3oQ
	MASH2QYdgByBVy/KZSR0S82oAVLa7a1SFzVL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dcbtXNextZtYry4YMx1X2EpQqVOBdqIkauvVyJ/GdmntN/AGBmrh6vHN0O5d69eqRO
	Fj++UOukFjhL4Xw1f4BwSI/qN46XwdA+26lX1BUMqurSIQUXFrkOuyJtRvG3VZT7kd2q
	3pbKSeuicNN0Aei+AAt6URrD3QxVx9h2Rznn0=
Received: by 10.101.2.12 with SMTP id e12mr10375859ani.13.1275582103655;
	Thu, 03 Jun 2010 09:21:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id m39sm896610ann.11.2010.06.03.09.21.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 09:21:42 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 11:15:45 -0500
Message-Id: <1275581747-22223-3-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1275581747-22223-2-git-send-email-chase.maupin@ti.com>
References: <1275581747-22223-1-git-send-email-chase.maupin@ti.com>
	<1275581747-22223-2-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 3/5] alsa-state/dm6467-evm: add asound file from arago
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
X-List-Received-Date: Thu, 03 Jun 2010 16:26:04 -0000

* Add the asound.state file for the Texas Instruments
  dm6467-evm platform from arago.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/alsa/alsa-state/dm6467-evm/asound.state |  767 +++++++++++++++++++++++
 1 files changed, 767 insertions(+), 0 deletions(-)
 create mode 100644 recipes/alsa/alsa-state/dm6467-evm/asound.state

diff --git a/recipes/alsa/alsa-state/dm6467-evm/asound.state b/recipes/alsa/alsa-state/dm6467-evm/asound.state
new file mode 100644
index 0000000..0ddbb54
--- /dev/null
+++ b/recipes/alsa/alsa-state/dm6467-evm/asound.state
@@ -0,0 +1,767 @@
+state.EVM {
+	control.1 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 127'
+		comment.dbmin -6350
+		comment.dbmax 0
+		iface MIXER
+		name 'PCM Playback Volume'
+		value.0 127
+		value.1 127
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'Line DAC Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'LineL Playback Switch'
+		value true
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'LineR Playback Switch'
+		value true
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'LineL DAC Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'LineL Left PGA Bypass Playback Volume'
+		value 118
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'LineR Right PGA Bypass Playback Volume'
+		value 118
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'LineL Line2 Bypass Playback Volume'
+		value.0 71
+		value.1 118
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'LineR Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 71
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'Mono DAC Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Mono DAC Playback Switch'
+		value true
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'Mono PGA Bypass Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.13 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'Mono Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.14 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HP DAC Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.15 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'HP DAC Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.16 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HP Right PGA Bypass Playback Volume'
+		value.0 118
+		value.1 71
+	}
+	control.17 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HPL PGA Bypass Playback Volume'
+		value 118
+	}
+	control.18 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HPR PGA Bypass Playback Volume'
+		value 118
+	}
+	control.19 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HP Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.20 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HPCOM DAC Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.21 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'HPCOM DAC Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.22 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HPLCOM PGA Bypass Playback Volume'
+		value 118
+	}
+	control.23 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HPRCOM PGA Bypass Playback Volume'
+		value 118
+	}
+	control.24 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 118'
+		comment.dbmin -5900
+		comment.dbmax 0
+		iface MIXER
+		name 'HPCOM Line2 Bypass Playback Volume'
+		value.0 118
+		value.1 118
+	}
+	control.25 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'AGC Switch'
+		value.0 false
+		value.1 false
+	}
+	control.26 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 119'
+		comment.dbmin 0
+		comment.dbmax 5950
+		iface MIXER
+		name 'PGA Capture Volume'
+		value.0 32
+		value.1 32
+	}
+	control.27 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'PGA Capture Switch'
+		value.0 true
+		value.1 true
+	}
+	control.28 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 2
+		comment.item.0 Disabled
+		comment.item.1 '0.0045xFs'
+		comment.item.2 '0.0125xFs'
+		comment.item.3 '0.025xFs'
+		iface MIXER
+		name 'ADC HPF Cut-off'
+		value.0 Disabled
+		value.1 Disabled
+	}
+	control.29 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right Line2 Bypass Mixer LineL Switch'
+		value false
+	}
+	control.30 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right Line2 Bypass Mixer LineR Switch'
+		value false
+	}
+	control.31 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right Line2 Bypass Mixer Mono Switch'
+		value false
+	}
+	control.32 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right Line2 Bypass Mixer HP Switch'
+		value false
+	}
+	control.33 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right Line2 Bypass Mixer HPRCOM Switch'
+		value false
+	}
+	control.34 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left Line2 Bypass Mixer LineL Switch'
+		value false
+	}
+	control.35 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left Line2 Bypass Mixer LineR Switch'
+		value false
+	}
+	control.36 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left Line2 Bypass Mixer Mono Switch'
+		value false
+	}
+	control.37 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left Line2 Bypass Mixer HP Switch'
+		value false
+	}
+	control.38 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left Line2 Bypass Mixer HPLCOM Switch'
+		value false
+	}
+	control.39 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer LineL Switch'
+		value false
+	}
+	control.40 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer LineR Switch'
+		value false
+	}
+	control.41 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer Mono Switch'
+		value false
+	}
+	control.42 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer HPL Switch'
+		value false
+	}
+	control.43 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer HPR Switch'
+		value false
+	}
+	control.44 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer HPLCOM Switch'
+		value false
+	}
+	control.45 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Bypass Mixer HPRCOM Switch'
+		value false
+	}
+	control.46 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer LineL Switch'
+		value false
+	}
+	control.47 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer LineR Switch'
+		value false
+	}
+	control.48 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer Mono Switch'
+		value false
+	}
+	control.49 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer HPL Switch'
+		value false
+	}
+	control.50 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer HPR Switch'
+		value false
+	}
+	control.51 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer HPLCOM Switch'
+		value false
+	}
+	control.52 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Bypass Mixer HPRCOM Switch'
+		value false
+	}
+	control.53 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
+		iface MIXER
+		name 'Right Line2R Mux'
+		value single-ended
+	}
+	control.54 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
+		iface MIXER
+		name 'Right Line1R Mux'
+		value single-ended
+	}
+	control.55 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
+		iface MIXER
+		name 'Right Line1L Mux'
+		value single-ended
+	}
+	control.56 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Mixer Line1R Switch'
+		value false
+	}
+	control.57 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Mixer Line1L Switch'
+		value false
+	}
+	control.58 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Mixer Line2R Switch'
+		value false
+	}
+	control.59 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Mixer Mic3L Switch'
+		value false
+	}
+	control.60 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right PGA Mixer Mic3R Switch'
+		value true
+	}
+	control.61 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
+		iface MIXER
+		name 'Left Line2L Mux'
+		value single-ended
+	}
+	control.62 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
+		iface MIXER
+		name 'Left Line1R Mux'
+		value single-ended
+	}
+	control.63 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 single-ended
+		comment.item.1 differential
+		iface MIXER
+		name 'Left Line1L Mux'
+		value single-ended
+	}
+	control.64 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Mixer Line1L Switch'
+		value false
+	}
+	control.65 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Mixer Line1R Switch'
+		value false
+	}
+	control.66 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Mixer Line2L Switch'
+		value false
+	}
+	control.67 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Mixer Mic3L Switch'
+		value true
+	}
+	control.68 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left PGA Mixer Mic3R Switch'
+		value false
+	}
+	control.69 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'differential of HPROUT'
+		comment.item.1 'constant VCM'
+		comment.item.2 single-ended
+		comment.item.3 'differential of HPLCOM'
+		comment.item.4 'external feedback'
+		iface MIXER
+		name 'Right HPCOM Mux'
+		value 'differential of HPROUT'
+	}
+	control.70 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right DAC_R1 Mixer LineL Switch'
+		value false
+	}
+	control.71 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right DAC_R1 Mixer LineR Switch'
+		value true
+	}
+	control.72 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right DAC_R1 Mixer Mono Switch'
+		value true
+	}
+	control.73 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right DAC_R1 Mixer HP Switch'
+		value true
+	}
+	control.74 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right DAC_R1 Mixer HPCOM Switch'
+		value true
+	}
+	control.75 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 DAC_R1
+		comment.item.1 DAC_R3
+		comment.item.2 DAC_R2
+		iface MIXER
+		name 'Right DAC Mux'
+		value DAC_R1
+	}
+	control.76 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'differential of HPLOUT'
+		comment.item.1 'constant VCM'
+		comment.item.2 single-ended
+		iface MIXER
+		name 'Left HPCOM Mux'
+		value 'differential of HPLOUT'
+	}
+	control.77 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left DAC_L1 Mixer LineL Switch'
+		value true
+	}
+	control.78 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left DAC_L1 Mixer LineR Switch'
+		value false
+	}
+	control.79 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left DAC_L1 Mixer Mono Switch'
+		value true
+	}
+	control.80 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left DAC_L1 Mixer HP Switch'
+		value true
+	}
+	control.81 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left DAC_L1 Mixer HPCOM Switch'
+		value true
+	}
+	control.82 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 DAC_L1
+		comment.item.1 DAC_L3
+		comment.item.2 DAC_L2
+		iface MIXER
+		name 'Left DAC Mux'
+		value DAC_L1
+	}
+}
-- 
1.6.0.4



