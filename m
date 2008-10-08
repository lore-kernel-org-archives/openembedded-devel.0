Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KnVio-0000a2-AF
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 11:52:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KnVeJ-0003Mp-3f
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 09:48:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 09:48:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 09:48:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Oct 2008 11:47:58 +0200
Message-ID: <gchvke$7nq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: [oe-commits] : gpe-sketchbook: add missing dependency (patch by raster), stylize, convert SVN build to SRCREV
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
X-List-Received-Date: Wed, 08 Oct 2008 09:52:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Does gpe-sketchbook require a kernel and bootloader upgrade?

diff --git a/conf/distro/include/sane-srcrevs.inc 
b/conf/distro/include/sane-srcrevs.inc
index 1675386..9a48bfa 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -50,6 +50,7 @@ SRCREV_pn-fstests ?= "204"
  SRCREV_pn-gconf-dbus ?= "641"
  SRCREV_pn-gnuradio ?= "9721"
  SRCREV_pn-gpe-contacts ?= "9312"
+SRCREV_pn-gpe-sketchbook ?= "9547"
  SRCREV_pn-gsm0710muxd ?= "3ff86b129640b647ccba3d86eb243d864671b039"
  SRCREV_pn-gsmd2 ?= "963f34df8fa3ff4b301079dcf86e9acea6b6fe0f"
  SRCREV_pn-gtkhtml2 ?= "1158"
@@ -80,8 +81,8 @@ SRCREV_pn-lightmediascanner ?= "68"
  SRCREV_pn-linux-bfin ?= "3758"
  SRCREV_pn-linux-hackndev-2.6 ?= "1308"
  SRCREV_pn-linux-ixp4xx ?= "1066"
-SRCREV_pn-linux-openmoko ?= "968c41d0c32099d78927849a71e2ef3143cc05e7"
-SRCREV_pn-linux-openmoko-devel ?= 
"e20ce2bd6fc6e711eed58a580ae117cb574abe96"
+SRCREV_pn-linux-openmoko ?= "bc2caff9cdef8a16297a2cb196306f88fa5ea2c2"
+SRCREV_pn-linux-openmoko-devel ?= 
"8119fb41bf9cfd12964fa5e987ff6dbaf5729f75"
  SRCREV_pn-llvm-gcc4 ?= "374"
  SRCREV_pn-llvm-gcc4-cross ?= "374"
  SRCREV_pn-maemo-mapper ?= "118"
@@ -178,7 +179,7 @@ SRCREV_pn-sphyrna-python ?= "45"
  SRCREV_pn-starling ?= "9574"
  SRCREV_pn-tichy ?= "168"
  SRCREV_pn-tmut ?= "60"
-SRCREV_pn-u-boot-openmoko ?= "ba029a1426bfca169572bf80d50a8b190a6b0e19"
+SRCREV_pn-u-boot-openmoko ?= "414367bf5b65942947dd5d569c27d2a8e8e5e562"
  SRCREV_pn-u-boot-openmoko-devel ?= 
"ba029a1426bfca169572bf80d50a8b190a6b0e19"
  SRCREV_pn-usbpath ?= "3172"
  SRCREV_pn-usbpath-native ?= "3172"





