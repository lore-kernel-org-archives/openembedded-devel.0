Received: from [87.194.255.145] (helo=woodbine.london.02.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1M6XRL-0005fV-Tv
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 00:05:40 +0200
Received: from shodan.localnet (93.96.131.185) by woodbine.london.02.net
	(8.5.016.1)
	id 49D39EA901F0DE23 for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 22:58:13 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 22:58:11 +0100
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200905192258.11747.bluelightning@bluelightning.org>
Subject: [RFC] [PATCH] update zaurusd to latest SVN
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
X-List-Received-Date: Tue, 19 May 2009 22:05:40 -0000
X-Groupsio-MsgNum: 10509
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ztyEKN6boFlaA7e"

--Boundary-00=_ztyEKN6boFlaA7e
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'd like to update zaurusd to the latest SVN version in .dev. Attached is a 
patch that does this, which I have tested on my SL-C3000. Note that I had to 
update several of the patches; I did so based on the assumption that the 
versions of a few files (eg. alsa state files) were already correct as 
previously built in OE.

Any objections?

Cheers,
Paul

--Boundary-00=_ztyEKN6boFlaA7e
Content-Type: text/x-patch;
  charset="UTF-8";
  name="zaurusd_20090501.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="zaurusd_20090501.patch"

diff --git a/conf/distro/include/sane-srcdates.inc b/conf/distro/include/sane-srcdates.inc
index 1be3dab..114eaa3 100644
--- a/conf/distro/include/sane-srcdates.inc
+++ b/conf/distro/include/sane-srcdates.inc
@@ -47,7 +47,7 @@ SRCDATE_xcompmgr ?= "20060814"
 SRCDATE_xirssi ?= "20060814"
 SRCDATE_xsvg ?= "20060814"
 SRCDATE_yamonenv ?= "20060814"
-SRCDATE_zaurusd ?= "20060628"
+SRCDATE_zaurusd ?= "20090501"
 
 # Freedesktop.org
 SRCDATE_poppler0.6 = "20070708"
diff --git a/recipes/zaurusd/files/add-poodle.patch b/recipes/zaurusd/files/add-poodle.patch
index 4f91413..3793faf 100644
--- a/recipes/zaurusd/files/add-poodle.patch
+++ b/recipes/zaurusd/files/add-poodle.patch
@@ -1,16 +1,10 @@
-diff -Nur zaurusd.orig/config/mach-config/mach-poodle-functions zaurusd/config/mach-config/mach-poodle-functions
---- zaurusd.orig/config/mach-config/mach-poodle-functions	1970-01-01 01:00:00.000000000 +0100
-+++ zaurusd/config/mach-config/mach-poodle-functions	2006-05-14 12:43:01.000000000 +0200
-@@ -0,0 +1,3 @@
-+#HAVE_INPUT_SWITCHES=1
-+#HAVE_ALSA_MIXER=1
-+
-diff -Nur zaurusd.orig/config/mach-config/mach-poodle-vars zaurusd/config/mach-config/mach-poodle-vars
---- zaurusd.orig/config/mach-config/mach-poodle-vars 1970-01-01 01:00:00.000000000 +0100
-+++ zaurusd/config/mach-config/mach-poodle-vars	2006-05-14 12:42:42.000000000 +0200
-@@ -0,0 +1,9 @@
-+MACHINE=poodle
-+
+--- zaurusd/config/mach-config/mach-poodle-vars.in	(revision 418)
++++ zaurusd/config/mach-config/mach-poodle-vars.in	(working copy)
+@@ -1,3 +1,9 @@
+ MACHINE=poodle
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/5600-default.state
+\ No newline at end of file
 +export SWITCH_EVENT_ZMIXER=1
 +SWITCH_EVENT_DEVICE=/dev/input/event0
 +
@@ -18,17 +12,4 @@ diff -Nur zaurusd.orig/config/mach-config/mach-poodle-vars zaurusd/config/mach-c
 +#TSKEYS_DEVICE=/dev/input/event1
 +
 +ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
-\ Kein Zeilenumbruch am Dateiende.
-diff -Nur zaurusd.orig/scripts/detect-machine zaurusd/scripts/detect-machine
---- zaurusd.orig/scripts/detect-machine	2006-05-07 13:39:11.000000000 +0200
-+++ zaurusd/scripts/detect-machine	2006-05-14 12:40:38.000000000 +0200
-@@ -27,6 +27,9 @@
-         "SHARP Tosa")
- 		MACHINE=tosa
-         	;;	
-+	"SHARP Poodle")
-+		MACHINE=poodle
-+		;;
- 	"Simpad")
- 		;;
- 	"HP iPAQ H2200")
+\ No newline at end of file
diff --git a/recipes/zaurusd/files/alsa-6000x-default.state.patch b/recipes/zaurusd/files/alsa-6000x-default.state.patch
index 857b8c8..29c98f7 100644
--- a/recipes/zaurusd/files/alsa-6000x-default.state.patch
+++ b/recipes/zaurusd/files/alsa-6000x-default.state.patch
@@ -1,6 +1,28 @@
---- zaurusd/config/alsa/6000x-default.state.old	2008-03-21 02:21:47.000000000 -0500
-+++ zaurusd/config/alsa/6000x-default.state	2008-03-30 07:48:06.000000000 -0500
-@@ -37,13 +37,23 @@ state.Tosa {
+--- zaurusd/config/alsa/6000x-default.state	2009-04-25 22:57:30.000000000 +0100
++++ zaurusd/config/alsa/6000x-default.state	2009-05-14 10:41:29.000000000 +0100
+@@ -6,8 +6,8 @@
+ 		comment.range '0 - 31'
+ 		iface MIXER
+ 		name 'Speaker Playback Volume'
+-		value.0 27
+-		value.1 27
++		value.0 25
++		value.1 25
+ 	}
+ 	control.2 {
+ 		comment.access 'read write'
+@@ -24,8 +24,8 @@
+ 		comment.range '0 - 31'
+ 		iface MIXER
+ 		name 'Headphone Playback Volume'
+-		value.0 26
+-		value.1 26
++		value.0 20
++		value.1 20
+ 	}
+ 	control.4 {
+ 		comment.access 'read write'
+@@ -37,13 +37,23 @@
  	}
  	control.5 {
  		comment.access 'read write'
@@ -25,7 +47,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -51,7 +61,7 @@ state.Tosa {
+@@ -51,7 +61,7 @@
  		name 'Speaker Playback Invert Switch'
  		value true
  	}
@@ -34,7 +56,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -59,7 +69,7 @@ state.Tosa {
+@@ -59,7 +69,7 @@
  		name 'Headphone Playback ZC Switch'
  		value true
  	}
@@ -43,7 +65,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -67,7 +77,7 @@ state.Tosa {
+@@ -67,7 +77,7 @@
  		name 'Mono Playback ZC Switch'
  		value false
  	}
@@ -52,7 +74,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -76,7 +86,7 @@ state.Tosa {
+@@ -76,7 +86,7 @@
  		name 'Mono Playback Volume'
  		value 0
  	}
@@ -61,7 +83,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -85,16 +95,16 @@ state.Tosa {
+@@ -85,16 +95,16 @@
  		name 'ALC Target Volume'
  		value 11
  	}
@@ -81,7 +103,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -103,7 +113,7 @@ state.Tosa {
+@@ -103,7 +113,7 @@
  		name 'ALC Decay Time'
  		value 3
  	}
@@ -90,7 +112,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -112,7 +122,7 @@ state.Tosa {
+@@ -112,7 +122,7 @@
  		name 'ALC Attack Time'
  		value 2
  	}
@@ -99,7 +121,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -124,7 +134,7 @@ state.Tosa {
+@@ -124,7 +134,7 @@
  		name 'ALC Function'
  		value None
  	}
@@ -108,7 +130,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -133,7 +143,7 @@ state.Tosa {
+@@ -133,16 +143,16 @@
  		name 'ALC Max Volume'
  		value 7
  	}
@@ -117,16 +139,18 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -142,7 +152,7 @@ state.Tosa {
+ 		comment.range '0 - 3'
+ 		iface MIXER
  		name 'ALC ZC Timeout'
- 		value 0
+-		value 1
++		value 0
  	}
 -	control.17 {
 +	control.18 {
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -150,7 +160,7 @@ state.Tosa {
+@@ -150,7 +160,7 @@
  		name 'ALC ZC Switch'
  		value false
  	}
@@ -135,7 +159,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -158,7 +168,7 @@ state.Tosa {
+@@ -158,7 +168,7 @@
  		name 'ALC NG Switch'
  		value false
  	}
@@ -144,7 +168,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -168,7 +178,7 @@ state.Tosa {
+@@ -168,7 +178,7 @@
  		name 'ALC NG Type'
  		value 'Constant Gain'
  	}
@@ -153,7 +177,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -177,16 +187,16 @@ state.Tosa {
+@@ -177,16 +187,16 @@
  		name 'ALC NG Threshold'
  		value 31
  	}
@@ -173,7 +197,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -195,7 +205,7 @@ state.Tosa {
+@@ -195,7 +205,7 @@
  		name 'ALC Headphone Volume'
  		value 5
  	}
@@ -182,7 +206,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -203,7 +213,7 @@ state.Tosa {
+@@ -203,7 +213,7 @@
  		name 'Out3 Switch'
  		value false
  	}
@@ -191,7 +215,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -211,7 +221,7 @@ state.Tosa {
+@@ -211,7 +221,7 @@
  		name 'Out3 ZC Switch'
  		value true
  	}
@@ -200,7 +224,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -220,7 +230,7 @@ state.Tosa {
+@@ -220,7 +230,7 @@
  		name 'Out3 Volume'
  		value 0
  	}
@@ -209,7 +233,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -229,7 +239,7 @@ state.Tosa {
+@@ -229,7 +239,7 @@
  		name 'PCBeep Bypass Headphone Volume'
  		value 0
  	}
@@ -218,7 +242,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -238,7 +248,7 @@ state.Tosa {
+@@ -238,7 +248,7 @@
  		name 'PCBeep Bypass Speaker Volume'
  		value 0
  	}
@@ -227,7 +251,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -247,16 +257,16 @@ state.Tosa {
+@@ -247,16 +257,16 @@
  		name 'PCBeep Bypass Phone Volume'
  		value 0
  	}
@@ -247,7 +271,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -265,7 +275,7 @@ state.Tosa {
+@@ -265,7 +275,7 @@
  		name 'Aux Playback Speaker Volume'
  		value 0
  	}
@@ -256,7 +280,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -274,7 +284,7 @@ state.Tosa {
+@@ -274,7 +284,7 @@
  		name 'Aux Playback Phone Volume'
  		value 0
  	}
@@ -265,7 +289,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -283,7 +293,7 @@ state.Tosa {
+@@ -283,7 +293,7 @@
  		name 'Phone Volume'
  		value 0
  	}
@@ -274,7 +298,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 2
-@@ -293,7 +303,7 @@ state.Tosa {
+@@ -293,7 +303,7 @@
  		value.0 23
  		value.1 23
  	}
@@ -283,7 +307,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -301,7 +311,7 @@ state.Tosa {
+@@ -301,7 +311,7 @@
  		name 'Capture 20dB Boost Switch'
  		value true
  	}
@@ -292,7 +316,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -309,7 +319,7 @@ state.Tosa {
+@@ -309,7 +319,7 @@
  		name 'Capture to Phone 20dB Boost Switch'
  		value true
  	}
@@ -301,7 +325,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -317,7 +327,7 @@ state.Tosa {
+@@ -317,7 +327,7 @@
  		name '3D Upper Cut-off Switch'
  		value false
  	}
@@ -310,7 +334,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -325,7 +335,7 @@ state.Tosa {
+@@ -325,7 +335,7 @@
  		name '3D Lower Cut-off Switch'
  		value false
  	}
@@ -319,7 +343,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -334,7 +344,7 @@ state.Tosa {
+@@ -334,7 +344,7 @@
  		name '3D Playback Volume'
  		value 0
  	}
@@ -328,7 +352,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -344,7 +354,7 @@ state.Tosa {
+@@ -344,7 +354,7 @@
  		name 'Bass Control'
  		value 'Adaptive Boost'
  	}
@@ -337,7 +361,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -352,7 +362,7 @@ state.Tosa {
+@@ -352,7 +362,7 @@
  		name 'Bass Cut-off Switch'
  		value true
  	}
@@ -346,7 +370,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -360,7 +370,7 @@ state.Tosa {
+@@ -360,7 +370,7 @@
  		name 'Tone Cut-off Switch'
  		value false
  	}
@@ -355,7 +379,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -368,7 +378,7 @@ state.Tosa {
+@@ -368,7 +378,7 @@
  		name 'Playback Attenuate (-6dB) Switch'
  		value false
  	}
@@ -364,7 +388,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -377,7 +387,7 @@ state.Tosa {
+@@ -377,7 +387,7 @@
  		name 'Bass Volume'
  		value 8
  	}
@@ -373,7 +397,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -386,7 +396,7 @@ state.Tosa {
+@@ -386,7 +396,7 @@
  		name 'Treble Volume'
  		value 5
  	}
@@ -382,7 +406,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -394,7 +404,7 @@ state.Tosa {
+@@ -394,7 +404,7 @@
  		name 'Capture ADC Switch'
  		value false
  	}
@@ -391,7 +415,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 2
-@@ -405,17 +415,17 @@ state.Tosa {
+@@ -405,17 +415,17 @@
  		value.0 '+0.75dB Steps'
  		value.1 '+0.75dB Steps'
  	}
@@ -413,7 +437,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -423,7 +433,7 @@ state.Tosa {
+@@ -423,7 +433,7 @@
  		name 'Capture ZC Switch'
  		value false
  	}
@@ -422,7 +446,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -432,7 +442,7 @@ state.Tosa {
+@@ -432,7 +442,7 @@
  		name 'Mic 1 Volume'
  		value 23
  	}
@@ -431,7 +455,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -441,7 +451,7 @@ state.Tosa {
+@@ -441,7 +451,7 @@
  		name 'Mic 2 Volume'
  		value 23
  	}
@@ -440,7 +464,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -449,7 +459,7 @@ state.Tosa {
+@@ -449,7 +459,7 @@
  		name 'Mic 20dB Boost Switch'
  		value false
  	}
@@ -449,7 +473,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -457,7 +467,7 @@ state.Tosa {
+@@ -457,7 +467,7 @@
  		name 'Speaker Mixer PCBeep Bypass Swi'
  		value false
  	}
@@ -458,7 +482,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -465,7 +475,7 @@ state.Tosa {
+@@ -465,7 +475,7 @@
  		name 'Speaker Mixer Aux Playback Swit'
  		value false
  	}
@@ -467,7 +491,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -473,7 +483,7 @@ state.Tosa {
+@@ -473,7 +483,7 @@
  		name 'Speaker Mixer Phone Bypass Swit'
  		value false
  	}
@@ -476,7 +500,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -481,7 +491,7 @@ state.Tosa {
+@@ -481,7 +491,7 @@
  		name 'Speaker Mixer Line Bypass Switc'
  		value false
  	}
@@ -485,7 +509,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -489,7 +499,7 @@ state.Tosa {
+@@ -489,7 +499,7 @@
  		name 'Speaker Mixer PCM Playback Swit'
  		value true
  	}
@@ -494,7 +518,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -497,7 +507,7 @@ state.Tosa {
+@@ -497,7 +507,7 @@
  		name 'Phone Mixer PCBeep Bypass Switc'
  		value false
  	}
@@ -503,7 +527,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -505,7 +515,7 @@ state.Tosa {
+@@ -505,7 +515,7 @@
  		name 'Phone Mixer Aux Playback Switch'
  		value false
  	}
@@ -512,7 +536,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -513,7 +523,7 @@ state.Tosa {
+@@ -513,7 +523,7 @@
  		name 'Phone Mixer Line Bypass Switch'
  		value false
  	}
@@ -521,7 +545,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -521,7 +531,7 @@ state.Tosa {
+@@ -521,7 +531,7 @@
  		name 'Phone Mixer PCM Playback Switch'
  		value false
  	}
@@ -530,7 +554,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -529,7 +539,7 @@ state.Tosa {
+@@ -529,7 +539,7 @@
  		name 'Phone Mixer Mic 1 Sidetone Swit'
  		value false
  	}
@@ -539,7 +563,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -537,55 +547,103 @@ state.Tosa {
+@@ -537,7 +547,7 @@
  		name 'Phone Mixer Mic 2 Sidetone Swit'
  		value false
  	}
@@ -548,9 +572,8 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
- 		iface MIXER
--		name 'HP Mixer PCBeep Bypass Switch'
-+		name 'Right HP Mixer PCBeep Bypass Sw'
+@@ -545,7 +555,7 @@
+ 		name 'Right HP Mixer PCBeep Bypass Sw'
  		value false
  	}
 -	control.64 {
@@ -558,9 +581,8 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
- 		iface MIXER
--		name 'HP Mixer Aux Playback Switch'
-+		name 'Right HP Mixer Aux Playback Swi'
+@@ -553,7 +563,7 @@
+ 		name 'Right HP Mixer Aux Playback Swi'
  		value false
  	}
 -	control.65 {
@@ -568,9 +590,8 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
- 		iface MIXER
--		name 'HP Mixer Phone Bypass Switch'
-+		name 'Right HP Mixer Phone Bypass Swi'
+@@ -561,7 +571,7 @@
+ 		name 'Right HP Mixer Phone Bypass Swi'
  		value false
  	}
 -	control.66 {
@@ -578,9 +599,8 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
- 		iface MIXER
--		name 'HP Mixer Line Bypass Switch'
-+		name 'Right HP Mixer Line Bypass Swit'
+@@ -569,7 +579,7 @@
+ 		name 'Right HP Mixer Line Bypass Swit'
  		value false
  	}
 -	control.67 {
@@ -588,9 +608,8 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
- 		iface MIXER
--		name 'HP Mixer PCM Playback Switch'
-+		name 'Right HP Mixer PCM Playback Swi'
+@@ -577,7 +587,7 @@
+ 		name 'Right HP Mixer PCM Playback Swi'
  		value true
  	}
 -	control.68 {
@@ -598,159 +617,153 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
- 		iface MIXER
--		name 'HP Mixer Mic Sidetone Switch'
-+		name 'Right HP Mixer Mic Sidetone Swi'
+@@ -585,7 +595,7 @@
+ 		name 'Right HP Mixer Mic Sidetone Swi'
  		value false
  	}
 -	control.69 {
 +	control.70 {
-+		comment.access 'read write'
-+		comment.type BOOLEAN
-+		comment.count 1
-+		iface MIXER
-+		name 'Left HP Mixer PCBeep Bypass Swi'
-+		value false
-+	}
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -593,7 +603,7 @@
+ 		name 'Left HP Mixer PCBeep Bypass Swi'
+ 		value false
+ 	}
+-	control.70 {
 +	control.71 {
-+		comment.access 'read write'
-+		comment.type BOOLEAN
-+		comment.count 1
-+		iface MIXER
-+		name 'Left HP Mixer Aux Playback Swit'
-+		value false
-+	}
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -601,7 +611,7 @@
+ 		name 'Left HP Mixer Aux Playback Swit'
+ 		value false
+ 	}
+-	control.71 {
 +	control.72 {
-+		comment.access 'read write'
-+		comment.type BOOLEAN
-+		comment.count 1
-+		iface MIXER
-+		name 'Left HP Mixer Phone Bypass Swit'
-+		value false
-+	}
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -609,7 +619,7 @@
+ 		name 'Left HP Mixer Phone Bypass Swit'
+ 		value false
+ 	}
+-	control.72 {
 +	control.73 {
-+		comment.access 'read write'
-+		comment.type BOOLEAN
-+		comment.count 1
-+		iface MIXER
-+		name 'Left HP Mixer Line Bypass Switc'
-+		value false
-+	}
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -617,7 +627,7 @@
+ 		name 'Left HP Mixer Line Bypass Switc'
+ 		value false
+ 	}
+-	control.73 {
 +	control.74 {
-+		comment.access 'read write'
-+		comment.type BOOLEAN
-+		comment.count 1
-+		iface MIXER
-+		name 'Left HP Mixer PCM Playback Swit'
-+		value true
-+	}
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -625,7 +635,7 @@
+ 		name 'Left HP Mixer PCM Playback Swit'
+ 		value true
+ 	}
+-	control.74 {
 +	control.75 {
-+		comment.access 'read write'
-+		comment.type BOOLEAN
-+		comment.count 1
-+		iface MIXER
-+		name 'Left HP Mixer Mic Sidetone Swit'
-+		value false
-+	}
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -633,7 +643,7 @@
+ 		name 'Left HP Mixer Mic Sidetone Swit'
+ 		value false
+ 	}
+-	control.75 {
 +	control.76 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -595,7 +653,7 @@ state.Tosa {
+@@ -641,9 +651,9 @@
+ 		comment.item.1 Line
+ 		iface MIXER
  		name 'Differential Source'
- 		value Mic
+-		value Line
++		value Mic
  	}
--	control.70 {
+-	control.76 {
 +	control.77 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -607,7 +665,7 @@ state.Tosa {
+@@ -653,9 +663,9 @@
+ 		comment.item.3 Stereo
+ 		iface MIXER
  		name 'Mic Select Source'
- 		value Differential
+-		value 'Mic 1'
++		value Differential
  	}
--	control.71 {
+-	control.77 {
 +	control.78 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -623,7 +681,7 @@ state.Tosa {
+@@ -671,7 +681,7 @@
  		name 'Right Capture Select'
  		value Mic
  	}
--	control.72 {
+-	control.78 {
 +	control.79 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -639,7 +697,7 @@ state.Tosa {
+@@ -687,7 +697,7 @@
  		name 'Left Capture Select'
  		value Mic
  	}
--	control.73 {
+-	control.79 {
 +	control.80 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -651,7 +709,7 @@ state.Tosa {
+@@ -699,7 +709,7 @@
  		name 'Capture Phone Mux'
  		value Mute
  	}
--	control.74 {
+-	control.80 {
 +	control.81 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -659,9 +717,9 @@ state.Tosa {
- 		comment.item.1 'Headphone Mix'
- 		iface MIXER
+@@ -709,7 +719,7 @@
  		name 'Speaker Mux'
--		value 'Headphone Mix'
-+		value 'Speaker Mix'
+ 		value 'Speaker Mix'
  	}
--	control.75 {
+-	control.81 {
 +	control.82 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -673,7 +731,7 @@ state.Tosa {
+@@ -721,7 +731,7 @@
  		name 'Out3 Mux'
  		value Left
  	}
--	control.76 {
+-	control.82 {
 +	control.83 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -685,7 +743,7 @@ state.Tosa {
+@@ -733,7 +743,7 @@
  		name 'ALC Sidetone Mux'
  		value Stereo
  	}
--	control.77 {
+-	control.83 {
 +	control.84 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -696,17 +754,16 @@ state.Tosa {
- 		comment.item.4 Off
- 		iface MIXER
+@@ -746,7 +756,7 @@
  		name 'Jack Function'
--		value Headphone
-+		value Off
+ 		value Off
  	}
--	control.78 {
+-	control.84 {
 +	control.85 {
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
--		comment.item.0 Auto
--		comment.item.1 On
--		comment.item.2 Off
-+		comment.item.0 On
-+		comment.item.1 Off
- 		iface MIXER
- 		name 'Speaker Function'
--		value Auto
-+		value On
- 	}
- }
diff --git a/recipes/zaurusd/files/alsa-cxx00-default.state.patch b/recipes/zaurusd/files/alsa-cxx00-default.state.patch
index b7a149b..d65ed4a 100644
--- a/recipes/zaurusd/files/alsa-cxx00-default.state.patch
+++ b/recipes/zaurusd/files/alsa-cxx00-default.state.patch
@@ -1,3 +1,6 @@
+NOTE: Patch slightly modified from original; unmodified comments from 
+original patch copied below.
+=============================================================================
 http://bugs.openembedded.net/show_bug.cgi?id=2617
 - Fixes default ALSA state for SL-Cxx00.
   * Treble level reflects kernel fix alsa-wm8750-treble.patch (>2.6.24).
@@ -13,10 +16,8 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
   * Enabled Zero Cross volume changes.
 - Do not alter incorrect mixer levels by zaurus-mixer-callback.
 
-Index: zaurusd/config/alsa/cxx00-default.state
-===================================================================
---- zaurusd.orig/config/alsa/cxx00-default.state	2006-06-28 08:45:07.000000000 +0000
-+++ zaurusd/config/alsa/cxx00-default.state	2007-11-27 23:06:43.000000000 +0000
+--- zaurusd/config/alsa/cxx00-default.state	2009-04-25 22:57:30.000000000 +0100
++++ zaurusd/config/alsa/cxx00-default.state	2009-05-14 10:41:29.000000000 +0100
 @@ -6,8 +6,8 @@
  		comment.range '0 - 63'
  		iface MIXER
@@ -39,7 +40,7 @@ Index: zaurusd/config/alsa/cxx00-default.state
  	}
  	control.3 {
  		comment.access 'read write'
-@@ -24,26 +24,26 @@
+@@ -24,8 +24,8 @@
  		comment.count 2
  		iface MIXER
  		name 'Capture Switch'
@@ -50,25 +51,23 @@ Index: zaurusd/config/alsa/cxx00-default.state
  	}
  	control.4 {
  		comment.access 'read write'
- 		comment.type BOOLEAN
+@@ -33,8 +33,8 @@
  		comment.count 2
  		iface MIXER
--		name 'Out1 Playback ZC Switch'
+ 		name 'Headphone Playback ZC Switch'
 -		value.0 false
 -		value.1 false
-+		name 'Headphone Playback ZC Switch'
 +		value.0 true
 +		value.1 true
  	}
  	control.5 {
  		comment.access 'read write'
- 		comment.type BOOLEAN
+@@ -42,8 +42,8 @@
  		comment.count 2
  		iface MIXER
--		name 'Out2 Playback ZC Switch'
+ 		name 'Speaker Playback ZC Switch'
 -		value.0 false
 -		value.1 false
-+		name 'Speaker Playback ZC Switch'
 +		value.0 true
 +		value.1 true
  	}
@@ -148,15 +147,6 @@ Index: zaurusd/config/alsa/cxx00-default.state
  	}
  	control.34 {
  		comment.access 'read write'
-@@ -321,7 +321,7 @@
- 		comment.type BOOLEAN
- 		comment.count 1
- 		iface MIXER
--		name 'Right Out2 Playback Invert Switch'
-+		name 'Right Speaker Playback Invert Switch'
- 		value true
- 	}
- 	control.36 {
 @@ -331,8 +331,8 @@
  		comment.range '0 - 3'
  		iface MIXER
@@ -190,27 +180,23 @@ Index: zaurusd/config/alsa/cxx00-default.state
  	}
  	control.40 {
  		comment.access 'read write'
-@@ -378,9 +378,9 @@
- 		comment.count 2
+@@ -379,8 +379,8 @@
  		comment.range '0 - 127'
  		iface MIXER
--		name 'Out1 Playback Volume'
--		value.0 120
--		value.1 120
-+		name 'Headphone Playback Volume'
+ 		name 'Headphone Playback Volume'
+-		value.0 70
+-		value.1 70
 +		value.0 105
 +		value.1 105
  	}
  	control.42 {
  		comment.access 'read write'
-@@ -388,9 +388,9 @@
- 		comment.count 2
+@@ -389,8 +389,8 @@
  		comment.range '0 - 127'
  		iface MIXER
--		name 'Out2 Playback Volume'
--		value.0 119
--		value.1 119
-+		name 'Speaker Playback Volume'
+ 		name 'Speaker Playback Volume'
+-		value.0 70
+-		value.1 70
 +		value.0 127
 +		value.1 127
  	}
@@ -252,50 +238,3 @@ Index: zaurusd/config/alsa/cxx00-default.state
  	}
  	control.50 {
  		comment.access 'read write'
-@@ -610,9 +610,8 @@
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
--		comment.item.0 Auto
--		comment.item.1 On
--		comment.item.2 Off
-+		comment.item.0 On
-+		comment.item.1 Off
- 		iface MIXER
- 		name 'Speaker Function'
- 		value On
-Index: zaurusd/scripts/zaurus-mixer-callback.in
-===================================================================
---- zaurusd.orig/scripts/zaurus-mixer-callback.in	2007-11-27 23:32:45.000000000 +0000
-+++ zaurusd/scripts/zaurus-mixer-callback.in	2007-11-27 23:36:54.000000000 +0000
-@@ -16,8 +16,6 @@
- JACK="$1"
- SPK="$2"
- LEFT="true"
--RLPLAYBACK="false"
--RLBYPASS="false"
- 
- case $SPK in
-   "On")
-@@ -37,8 +35,6 @@
-     ;;
-   "Headset" | "Mic" | "Line")
-     LEFT="false"
--    RLPLAYBACK="true"
--    RLBYPASS="true"
-     SPK="Off"
-     ;;
-   *)
-@@ -58,12 +54,6 @@
- }; /Speaker Function/ {
- N
- s:\(Speaker Function.*\n.*value \).*$:\1$SPK:
--}; /Right Mixer Left Playback/ {
--N
--s:\(Right Mixer Left Playback.*\n.*value \).*$:\1$RLPLAYBACK:
--}; /Right Mixer Left Bypass/ {
--N
--s:\(Right Mixer Left Bypass.*\n.*value \).*$:\1$RLBYPASS:
- }; /Left Mixer Playback/ {
- N
- s:\(Left Mixer Playback.*\n.*value \).*$:\1$LEFT:
diff --git a/recipes/zaurusd/zaurusd_svn.bb b/recipes/zaurusd/zaurusd_svn.bb
index b2b1622..6240492 100644
--- a/recipes/zaurusd/zaurusd_svn.bb
+++ b/recipes/zaurusd/zaurusd_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 DEPENDS = "tslib"
 RDEPENDS = "procps"
 PV = "0.0+svn${SRCDATE}"
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
            file://zaurus-hinge.in \
@@ -14,7 +14,6 @@ SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
 	   file://disable-alsa-handling.patch;patch=1 \
 	   file://zaurus-hinge.matchbox-portrait \	   
 	   file://zaurus-hinge.matchbox-landscape \
-	   file://tslib-1.diff;patch=1 \
 	   file://zaurus-hinge.bl-on \
 	   file://zaurus-hinge.bl-off \
 	   file://01-check-toggle-landscape \

--Boundary-00=_ztyEKN6boFlaA7e--
