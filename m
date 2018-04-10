Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AFD1E7493D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 21:01:11 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id x82so16128wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ePpmbPF6nImdc8jg3YB5g2qE6FzMwzoKqx9AZTPBqlc=;
	b=aXl2wAQ+WLF77JV6pyjDEtf8RH786ET/kKgFy0uKiiq+yD03OLBs5ZSy2d+5/7S/bl
	DR7p2+3XG0pHQnOZGTKZb3hJsDks7l7eClXN+BUzMWbX9CFquVHC/IUPlCD2bC9fqeLk
	2R5yI2aHLBWEjdMQ3kxhV6Jui1niDo3g9GN93FBkTJfcnW56KXrYSXf+baZPJw8lUXCC
	Y1MbpJhnXWT09yPuI+LMQgLElEBVh9vftyhRm6Q84hGso+QloRvwAwoGI3P5seJtOTMr
	Rp3ZA05W7zey8vgGzjJwkUR340Dcq/6OhTXmIJNrojSaqnOTr39Yjt0uF4EWZkaxQlOp
	V0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ePpmbPF6nImdc8jg3YB5g2qE6FzMwzoKqx9AZTPBqlc=;
	b=jYJ8uApX43RI1XgiTNV/uym9aZ0AgT/+SPJSQ7QBL33LLAE8n09Q/HOFHWY8JjKnTI
	HEVWh/cFAycpcLuGeA76kRTEtIbp9CZEFUOj2LaUNRaLnFLDHGOwE4hUymcm5utlKnO+
	l6i/Vk4vIlWW2J04UN8ub3fwQDkWJfh849SItyFIh+kZYImpBqXK2p8LB5V5MEq8Deir
	3VZSW5knYmsAZtQp8pFDyukFWHBKABAH9SaXEfo5dVZ7WD9utVidVTaFqgltddk8VuOe
	KEeA65uBOQq1P0BmlCU9cPKtQpYdLE0eWVhV3tmaG9p7BCL0w+yu75f0wjj33l5AM8BY
	4frg==
X-Gm-Message-State: ALQs6tDqsR4MoGlVMp/PPXT93o9wPJf2VZGsqfiRDSAQalnwl5g+Z9Lb
	nzShVbmsSYtddSflkb20oW6uhQ==
X-Google-Smtp-Source: AIpwx49f8+fDwnPNCGwUKRGF0awvVR4yFyML3RBytzQACp5PXuhUueY/79n72YODwFPg7QKhSS1HNg==
X-Received: by 10.28.126.69 with SMTP id z66mr667577wmc.56.1523394071511;
	Tue, 10 Apr 2018 14:01:11 -0700 (PDT)
Received: from localhost.localdomain
	(host167-216-dynamic.251-95-r.retail.telecomitalia.it.
	[95.251.216.167]) by smtp.gmail.com with ESMTPSA id
	b38sm4305968wrg.81.2018.04.10.14.01.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Apr 2018 14:01:10 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 23:01:05 +0200
Message-Id: <1523394065-15465-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH] zaurusd: refresh patches (using devtool)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2018 21:01:12 -0000

Silence warnings about ingnored context.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0001-zaurusd-add-support-for-collie.patch      |  16 +-
 recipes-bsp/zaurusd/zaurusd/add-poodle.patch       |  14 +-
 .../zaurusd/zaurusd/alsa-6000x-default.state.patch | 166 +++++++++++----------
 .../zaurusd/zaurusd/alsa-cxx00-default.state.patch |  61 ++++----
 .../zaurusd/zaurusd/avoid-rotated-server.patch     | 106 +++++++------
 .../zaurusd/zaurusd/disable-alsa-handling.patch    |  16 +-
 recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch    |  10 +-
 .../use-ts-symlink-instead-of-hardcoding.diff      | 111 ++++++++++----
 8 files changed, 300 insertions(+), 200 deletions(-)

diff --git a/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
index 36ded13..0d242f5 100644
--- a/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
+++ b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
@@ -1,17 +1,17 @@
-From 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 2001
+From 668a7bc50ca8f36df5a0eae73a5fa251aada9cc4 Mon Sep 17 00:00:00 2001
 From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
 Date: Fri, 5 Aug 2011 16:00:10 +0400
 Subject: [PATCH] zaurusd: add support for collie
-Upstream-Status: Pending
 
 Note: alsa mixer support is disabled, as collie doesn't support sound (yet).
 
 Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
 ---
- config/mach-config/mach-collie-functions |    4 ++++
- config/mach-config/mach-collie-vars.in   |    3 +++
- configure.ac                             |    1 +
- 3 files changed, 8 insertions(+), 0 deletions(-)
+ config/mach-config/mach-collie-functions | 4 ++++
+ config/mach-config/mach-collie-vars.in   | 3 +++
+ configure.ac                             | 1 +
+ 3 files changed, 8 insertions(+)
  create mode 100644 config/mach-config/mach-collie-functions
  create mode 100644 config/mach-config/mach-collie-vars.in
 
@@ -35,7 +35,7 @@ index 0000000..ec1bfb8
 +
 +ALSA_MIXER_INIT=@appconfdir@/alsa/5500-default.state
 diff --git a/configure.ac b/configure.ac
-index 78ea2ae..5160fab 100644
+index 36f858c..8ee281b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -65,6 +65,7 @@ AC_CONFIG_FILES([
@@ -46,5 +46,3 @@ index 78ea2ae..5160fab 100644
    config/mach-config/mach-corgi-vars
    config/mach-config/mach-husky-vars
    config/mach-config/mach-poodle-vars
---
-1.7.2.5
diff --git a/recipes-bsp/zaurusd/zaurusd/add-poodle.patch b/recipes-bsp/zaurusd/zaurusd/add-poodle.patch
index 3793faf..6698aeb 100644
--- a/recipes-bsp/zaurusd/zaurusd/add-poodle.patch
+++ b/recipes-bsp/zaurusd/zaurusd/add-poodle.patch
@@ -1,5 +1,15 @@
---- zaurusd/config/mach-config/mach-poodle-vars.in	(revision 418)
-+++ zaurusd/config/mach-config/mach-poodle-vars.in	(working copy)
+From 9edcb004b09cef8e01598482935fc6ba2a6beb81 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 24 Jul 2011 19:12:32 +0100
+
+---
+ config/mach-config/mach-poodle-vars.in | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/config/mach-config/mach-poodle-vars.in b/config/mach-config/mach-poodle-vars.in
+index 949460a..cbb1478 100644
+--- a/config/mach-config/mach-poodle-vars.in
++++ b/config/mach-config/mach-poodle-vars.in
 @@ -1,3 +1,9 @@
  MACHINE=poodle
  
diff --git a/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch b/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch
index 29c98f7..0409100 100644
--- a/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch
+++ b/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch
@@ -1,6 +1,16 @@
---- zaurusd/config/alsa/6000x-default.state	2009-04-25 22:57:30.000000000 +0100
-+++ zaurusd/config/alsa/6000x-default.state	2009-05-14 10:41:29.000000000 +0100
-@@ -6,8 +6,8 @@
+From dfd71335507681ec984195265ed5866e677d9bb6 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 24 Jul 2011 19:12:32 +0100
+
+---
+ config/alsa/6000x-default.state | 192 +++++++++++++++++++++-------------------
+ 1 file changed, 101 insertions(+), 91 deletions(-)
+
+diff --git a/config/alsa/6000x-default.state b/config/alsa/6000x-default.state
+index d2bf5e2..c38265d 100644
+--- a/config/alsa/6000x-default.state
++++ b/config/alsa/6000x-default.state
+@@ -6,8 +6,8 @@ state.Tosa {
  		comment.range '0 - 31'
  		iface MIXER
  		name 'Speaker Playback Volume'
@@ -11,7 +21,7 @@
  	}
  	control.2 {
  		comment.access 'read write'
-@@ -24,8 +24,8 @@
+@@ -24,8 +24,8 @@ state.Tosa {
  		comment.range '0 - 31'
  		iface MIXER
  		name 'Headphone Playback Volume'
@@ -22,7 +32,7 @@
  	}
  	control.4 {
  		comment.access 'read write'
-@@ -37,13 +37,23 @@
+@@ -37,13 +37,23 @@ state.Tosa {
  	}
  	control.5 {
  		comment.access 'read write'
@@ -47,7 +57,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -51,7 +61,7 @@
+@@ -51,7 +61,7 @@ state.Tosa {
  		name 'Speaker Playback Invert Switch'
  		value true
  	}
@@ -56,7 +66,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -59,7 +69,7 @@
+@@ -59,7 +69,7 @@ state.Tosa {
  		name 'Headphone Playback ZC Switch'
  		value true
  	}
@@ -65,7 +75,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -67,7 +77,7 @@
+@@ -67,7 +77,7 @@ state.Tosa {
  		name 'Mono Playback ZC Switch'
  		value false
  	}
@@ -74,7 +84,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -76,7 +86,7 @@
+@@ -76,7 +86,7 @@ state.Tosa {
  		name 'Mono Playback Volume'
  		value 0
  	}
@@ -83,7 +93,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -85,16 +95,16 @@
+@@ -85,16 +95,16 @@ state.Tosa {
  		name 'ALC Target Volume'
  		value 11
  	}
@@ -103,7 +113,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -103,7 +113,7 @@
+@@ -103,7 +113,7 @@ state.Tosa {
  		name 'ALC Decay Time'
  		value 3
  	}
@@ -112,7 +122,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -112,7 +122,7 @@
+@@ -112,7 +122,7 @@ state.Tosa {
  		name 'ALC Attack Time'
  		value 2
  	}
@@ -121,7 +131,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -124,7 +134,7 @@
+@@ -124,7 +134,7 @@ state.Tosa {
  		name 'ALC Function'
  		value None
  	}
@@ -130,7 +140,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -133,16 +143,16 @@
+@@ -133,16 +143,16 @@ state.Tosa {
  		name 'ALC Max Volume'
  		value 7
  	}
@@ -150,7 +160,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -150,7 +160,7 @@
+@@ -150,7 +160,7 @@ state.Tosa {
  		name 'ALC ZC Switch'
  		value false
  	}
@@ -159,7 +169,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -158,7 +168,7 @@
+@@ -158,7 +168,7 @@ state.Tosa {
  		name 'ALC NG Switch'
  		value false
  	}
@@ -168,7 +178,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -168,7 +178,7 @@
+@@ -168,7 +178,7 @@ state.Tosa {
  		name 'ALC NG Type'
  		value 'Constant Gain'
  	}
@@ -177,7 +187,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -177,16 +187,16 @@
+@@ -177,16 +187,16 @@ state.Tosa {
  		name 'ALC NG Threshold'
  		value 31
  	}
@@ -197,7 +207,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -195,7 +205,7 @@
+@@ -195,7 +205,7 @@ state.Tosa {
  		name 'ALC Headphone Volume'
  		value 5
  	}
@@ -206,7 +216,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -203,7 +213,7 @@
+@@ -203,7 +213,7 @@ state.Tosa {
  		name 'Out3 Switch'
  		value false
  	}
@@ -215,7 +225,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -211,7 +221,7 @@
+@@ -211,7 +221,7 @@ state.Tosa {
  		name 'Out3 ZC Switch'
  		value true
  	}
@@ -224,7 +234,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -220,7 +230,7 @@
+@@ -220,7 +230,7 @@ state.Tosa {
  		name 'Out3 Volume'
  		value 0
  	}
@@ -233,7 +243,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -229,7 +239,7 @@
+@@ -229,7 +239,7 @@ state.Tosa {
  		name 'PCBeep Bypass Headphone Volume'
  		value 0
  	}
@@ -242,7 +252,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -238,7 +248,7 @@
+@@ -238,7 +248,7 @@ state.Tosa {
  		name 'PCBeep Bypass Speaker Volume'
  		value 0
  	}
@@ -251,7 +261,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -247,16 +257,16 @@
+@@ -247,16 +257,16 @@ state.Tosa {
  		name 'PCBeep Bypass Phone Volume'
  		value 0
  	}
@@ -271,7 +281,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -265,7 +275,7 @@
+@@ -265,7 +275,7 @@ state.Tosa {
  		name 'Aux Playback Speaker Volume'
  		value 0
  	}
@@ -280,7 +290,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -274,7 +284,7 @@
+@@ -274,7 +284,7 @@ state.Tosa {
  		name 'Aux Playback Phone Volume'
  		value 0
  	}
@@ -289,7 +299,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -283,7 +293,7 @@
+@@ -283,7 +293,7 @@ state.Tosa {
  		name 'Phone Volume'
  		value 0
  	}
@@ -298,7 +308,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 2
-@@ -293,7 +303,7 @@
+@@ -293,7 +303,7 @@ state.Tosa {
  		value.0 23
  		value.1 23
  	}
@@ -307,7 +317,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -301,7 +311,7 @@
+@@ -301,7 +311,7 @@ state.Tosa {
  		name 'Capture 20dB Boost Switch'
  		value true
  	}
@@ -316,7 +326,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -309,7 +319,7 @@
+@@ -309,7 +319,7 @@ state.Tosa {
  		name 'Capture to Phone 20dB Boost Switch'
  		value true
  	}
@@ -325,7 +335,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -317,7 +327,7 @@
+@@ -317,7 +327,7 @@ state.Tosa {
  		name '3D Upper Cut-off Switch'
  		value false
  	}
@@ -334,7 +344,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -325,7 +335,7 @@
+@@ -325,7 +335,7 @@ state.Tosa {
  		name '3D Lower Cut-off Switch'
  		value false
  	}
@@ -343,7 +353,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -334,7 +344,7 @@
+@@ -334,7 +344,7 @@ state.Tosa {
  		name '3D Playback Volume'
  		value 0
  	}
@@ -352,7 +362,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -344,7 +354,7 @@
+@@ -344,7 +354,7 @@ state.Tosa {
  		name 'Bass Control'
  		value 'Adaptive Boost'
  	}
@@ -361,7 +371,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -352,7 +362,7 @@
+@@ -352,7 +362,7 @@ state.Tosa {
  		name 'Bass Cut-off Switch'
  		value true
  	}
@@ -370,7 +380,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -360,7 +370,7 @@
+@@ -360,7 +370,7 @@ state.Tosa {
  		name 'Tone Cut-off Switch'
  		value false
  	}
@@ -379,7 +389,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -368,7 +378,7 @@
+@@ -368,7 +378,7 @@ state.Tosa {
  		name 'Playback Attenuate (-6dB) Switch'
  		value false
  	}
@@ -388,7 +398,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -377,7 +387,7 @@
+@@ -377,7 +387,7 @@ state.Tosa {
  		name 'Bass Volume'
  		value 8
  	}
@@ -397,7 +407,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -386,7 +396,7 @@
+@@ -386,7 +396,7 @@ state.Tosa {
  		name 'Treble Volume'
  		value 5
  	}
@@ -406,7 +416,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -394,7 +404,7 @@
+@@ -394,7 +404,7 @@ state.Tosa {
  		name 'Capture ADC Switch'
  		value false
  	}
@@ -415,7 +425,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 2
-@@ -405,17 +415,17 @@
+@@ -405,17 +415,17 @@ state.Tosa {
  		value.0 '+0.75dB Steps'
  		value.1 '+0.75dB Steps'
  	}
@@ -437,7 +447,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -423,7 +433,7 @@
+@@ -423,7 +433,7 @@ state.Tosa {
  		name 'Capture ZC Switch'
  		value false
  	}
@@ -446,7 +456,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -432,7 +442,7 @@
+@@ -432,7 +442,7 @@ state.Tosa {
  		name 'Mic 1 Volume'
  		value 23
  	}
@@ -455,7 +465,7 @@
  		comment.access 'read write'
  		comment.type INTEGER
  		comment.count 1
-@@ -441,7 +451,7 @@
+@@ -441,7 +451,7 @@ state.Tosa {
  		name 'Mic 2 Volume'
  		value 23
  	}
@@ -464,7 +474,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -449,7 +459,7 @@
+@@ -449,7 +459,7 @@ state.Tosa {
  		name 'Mic 20dB Boost Switch'
  		value false
  	}
@@ -473,7 +483,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -457,7 +467,7 @@
+@@ -457,7 +467,7 @@ state.Tosa {
  		name 'Speaker Mixer PCBeep Bypass Swi'
  		value false
  	}
@@ -482,7 +492,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -465,7 +475,7 @@
+@@ -465,7 +475,7 @@ state.Tosa {
  		name 'Speaker Mixer Aux Playback Swit'
  		value false
  	}
@@ -491,7 +501,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -473,7 +483,7 @@
+@@ -473,7 +483,7 @@ state.Tosa {
  		name 'Speaker Mixer Phone Bypass Swit'
  		value false
  	}
@@ -500,7 +510,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -481,7 +491,7 @@
+@@ -481,7 +491,7 @@ state.Tosa {
  		name 'Speaker Mixer Line Bypass Switc'
  		value false
  	}
@@ -509,7 +519,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -489,7 +499,7 @@
+@@ -489,7 +499,7 @@ state.Tosa {
  		name 'Speaker Mixer PCM Playback Swit'
  		value true
  	}
@@ -518,7 +528,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -497,7 +507,7 @@
+@@ -497,7 +507,7 @@ state.Tosa {
  		name 'Phone Mixer PCBeep Bypass Switc'
  		value false
  	}
@@ -527,7 +537,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -505,7 +515,7 @@
+@@ -505,7 +515,7 @@ state.Tosa {
  		name 'Phone Mixer Aux Playback Switch'
  		value false
  	}
@@ -536,7 +546,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -513,7 +523,7 @@
+@@ -513,7 +523,7 @@ state.Tosa {
  		name 'Phone Mixer Line Bypass Switch'
  		value false
  	}
@@ -545,7 +555,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -521,7 +531,7 @@
+@@ -521,7 +531,7 @@ state.Tosa {
  		name 'Phone Mixer PCM Playback Switch'
  		value false
  	}
@@ -554,7 +564,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -529,7 +539,7 @@
+@@ -529,7 +539,7 @@ state.Tosa {
  		name 'Phone Mixer Mic 1 Sidetone Swit'
  		value false
  	}
@@ -563,7 +573,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -537,7 +547,7 @@
+@@ -537,7 +547,7 @@ state.Tosa {
  		name 'Phone Mixer Mic 2 Sidetone Swit'
  		value false
  	}
@@ -572,7 +582,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -545,7 +555,7 @@
+@@ -545,7 +555,7 @@ state.Tosa {
  		name 'Right HP Mixer PCBeep Bypass Sw'
  		value false
  	}
@@ -581,7 +591,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -553,7 +563,7 @@
+@@ -553,7 +563,7 @@ state.Tosa {
  		name 'Right HP Mixer Aux Playback Swi'
  		value false
  	}
@@ -590,7 +600,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -561,7 +571,7 @@
+@@ -561,7 +571,7 @@ state.Tosa {
  		name 'Right HP Mixer Phone Bypass Swi'
  		value false
  	}
@@ -599,7 +609,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -569,7 +579,7 @@
+@@ -569,7 +579,7 @@ state.Tosa {
  		name 'Right HP Mixer Line Bypass Swit'
  		value false
  	}
@@ -608,7 +618,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -577,7 +587,7 @@
+@@ -577,7 +587,7 @@ state.Tosa {
  		name 'Right HP Mixer PCM Playback Swi'
  		value true
  	}
@@ -617,7 +627,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -585,7 +595,7 @@
+@@ -585,7 +595,7 @@ state.Tosa {
  		name 'Right HP Mixer Mic Sidetone Swi'
  		value false
  	}
@@ -626,7 +636,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -593,7 +603,7 @@
+@@ -593,7 +603,7 @@ state.Tosa {
  		name 'Left HP Mixer PCBeep Bypass Swi'
  		value false
  	}
@@ -635,7 +645,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -601,7 +611,7 @@
+@@ -601,7 +611,7 @@ state.Tosa {
  		name 'Left HP Mixer Aux Playback Swit'
  		value false
  	}
@@ -644,7 +654,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -609,7 +619,7 @@
+@@ -609,7 +619,7 @@ state.Tosa {
  		name 'Left HP Mixer Phone Bypass Swit'
  		value false
  	}
@@ -653,7 +663,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -617,7 +627,7 @@
+@@ -617,7 +627,7 @@ state.Tosa {
  		name 'Left HP Mixer Line Bypass Switc'
  		value false
  	}
@@ -662,7 +672,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -625,7 +635,7 @@
+@@ -625,7 +635,7 @@ state.Tosa {
  		name 'Left HP Mixer PCM Playback Swit'
  		value true
  	}
@@ -671,7 +681,7 @@
  		comment.access 'read write'
  		comment.type BOOLEAN
  		comment.count 1
-@@ -633,7 +643,7 @@
+@@ -633,7 +643,7 @@ state.Tosa {
  		name 'Left HP Mixer Mic Sidetone Swit'
  		value false
  	}
@@ -680,7 +690,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -641,9 +651,9 @@
+@@ -641,9 +651,9 @@ state.Tosa {
  		comment.item.1 Line
  		iface MIXER
  		name 'Differential Source'
@@ -692,7 +702,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -653,9 +663,9 @@
+@@ -653,9 +663,9 @@ state.Tosa {
  		comment.item.3 Stereo
  		iface MIXER
  		name 'Mic Select Source'
@@ -704,7 +714,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -671,7 +681,7 @@
+@@ -671,7 +681,7 @@ state.Tosa {
  		name 'Right Capture Select'
  		value Mic
  	}
@@ -713,7 +723,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -687,7 +697,7 @@
+@@ -687,7 +697,7 @@ state.Tosa {
  		name 'Left Capture Select'
  		value Mic
  	}
@@ -722,7 +732,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -699,7 +709,7 @@
+@@ -699,7 +709,7 @@ state.Tosa {
  		name 'Capture Phone Mux'
  		value Mute
  	}
@@ -731,7 +741,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -709,7 +719,7 @@
+@@ -709,7 +719,7 @@ state.Tosa {
  		name 'Speaker Mux'
  		value 'Speaker Mix'
  	}
@@ -740,7 +750,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -721,7 +731,7 @@
+@@ -721,7 +731,7 @@ state.Tosa {
  		name 'Out3 Mux'
  		value Left
  	}
@@ -749,7 +759,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -733,7 +743,7 @@
+@@ -733,7 +743,7 @@ state.Tosa {
  		name 'ALC Sidetone Mux'
  		value Stereo
  	}
@@ -758,7 +768,7 @@
  		comment.access 'read write'
  		comment.type ENUMERATED
  		comment.count 1
-@@ -746,7 +756,7 @@
+@@ -746,7 +756,7 @@ state.Tosa {
  		name 'Jack Function'
  		value Off
  	}
diff --git a/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch b/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch
index d65ed4a..56f2018 100644
--- a/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch
+++ b/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch
@@ -1,4 +1,9 @@
-NOTE: Patch slightly modified from original; unmodified comments from 
+From 335105e985d0935afce84c215eb12baed1f7006d Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 24 Jul 2011 19:12:32 +0100
+Subject: [PATCH] initial commit of meta-handheld
+
+NOTE: Patch slightly modified from original; unmodified comments from
 original patch copied below.
 =============================================================================
 http://bugs.openembedded.net/show_bug.cgi?id=2617
@@ -16,9 +21,15 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
   * Enabled Zero Cross volume changes.
 - Do not alter incorrect mixer levels by zaurus-mixer-callback.
 
---- zaurusd/config/alsa/cxx00-default.state	2009-04-25 22:57:30.000000000 +0100
-+++ zaurusd/config/alsa/cxx00-default.state	2009-05-14 10:41:29.000000000 +0100
-@@ -6,8 +6,8 @@
+---
+ config/alsa/cxx00-default.state | 66 ++++++++++++++++++++---------------------
+ 1 file changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/config/alsa/cxx00-default.state b/config/alsa/cxx00-default.state
+index d218543..d1bacfb 100644
+--- a/config/alsa/cxx00-default.state
++++ b/config/alsa/cxx00-default.state
+@@ -6,8 +6,8 @@ state.Spitz {
  		comment.range '0 - 63'
  		iface MIXER
  		name 'Capture Volume'
@@ -29,7 +40,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.2 {
  		comment.access 'read write'
-@@ -15,8 +15,8 @@
+@@ -15,8 +15,8 @@ state.Spitz {
  		comment.count 2
  		iface MIXER
  		name 'Capture ZC Switch'
@@ -40,7 +51,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.3 {
  		comment.access 'read write'
-@@ -24,8 +24,8 @@
+@@ -24,8 +24,8 @@ state.Spitz {
  		comment.count 2
  		iface MIXER
  		name 'Capture Switch'
@@ -51,7 +62,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.4 {
  		comment.access 'read write'
-@@ -33,8 +33,8 @@
+@@ -33,8 +33,8 @@ state.Spitz {
  		comment.count 2
  		iface MIXER
  		name 'Headphone Playback ZC Switch'
@@ -62,7 +73,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.5 {
  		comment.access 'read write'
-@@ -42,8 +42,8 @@
+@@ -42,8 +42,8 @@ state.Spitz {
  		comment.count 2
  		iface MIXER
  		name 'Speaker Playback ZC Switch'
@@ -73,7 +84,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.6 {
  		comment.access 'read write'
-@@ -92,8 +92,8 @@
+@@ -92,8 +92,8 @@ state.Spitz {
  		comment.range '0 - 255'
  		iface MIXER
  		name 'PCM Volume'
@@ -84,7 +95,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.11 {
  		comment.access 'read write'
-@@ -131,7 +131,7 @@
+@@ -131,7 +131,7 @@ state.Spitz {
  		comment.range '0 - 15'
  		iface MIXER
  		name 'Treble Volume'
@@ -93,7 +104,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.15 {
  		comment.access 'read write'
-@@ -188,7 +188,7 @@
+@@ -188,7 +188,7 @@ state.Spitz {
  		comment.item.1 Playback
  		iface MIXER
  		name '3D Mode'
@@ -102,7 +113,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.21 {
  		comment.access 'read write'
-@@ -226,7 +226,7 @@
+@@ -226,7 +226,7 @@ state.Spitz {
  		comment.count 1
  		iface MIXER
  		name 'ALC Capture ZC Switch'
@@ -111,7 +122,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.25 {
  		comment.access 'read write'
-@@ -235,7 +235,7 @@
+@@ -235,7 +235,7 @@ state.Spitz {
  		comment.range '0 - 15'
  		iface MIXER
  		name 'ALC Capture Hold Time'
@@ -120,7 +131,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.26 {
  		comment.access 'read write'
-@@ -244,7 +244,7 @@
+@@ -244,7 +244,7 @@ state.Spitz {
  		comment.range '0 - 15'
  		iface MIXER
  		name 'ALC Capture Decay Time'
@@ -129,7 +140,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.27 {
  		comment.access 'read write'
-@@ -253,7 +253,7 @@
+@@ -253,7 +253,7 @@ state.Spitz {
  		comment.range '0 - 15'
  		iface MIXER
  		name 'ALC Capture Attack Time'
@@ -138,7 +149,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.28 {
  		comment.access 'read write'
-@@ -306,7 +306,7 @@
+@@ -306,7 +306,7 @@ state.Spitz {
  		comment.count 1
  		iface MIXER
  		name 'ZC Timeout Switch'
@@ -147,7 +158,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.34 {
  		comment.access 'read write'
-@@ -331,8 +331,8 @@
+@@ -331,8 +331,8 @@ state.Spitz {
  		comment.range '0 - 3'
  		iface MIXER
  		name 'Mic Boost'
@@ -158,7 +169,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.37 {
  		comment.access 'read write'
-@@ -341,8 +341,8 @@
+@@ -341,8 +341,8 @@ state.Spitz {
  		comment.range '0 - 7'
  		iface MIXER
  		name 'Bypass Left Playback Volume'
@@ -169,7 +180,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.38 {
  		comment.access 'read write'
-@@ -361,8 +361,8 @@
+@@ -361,8 +361,8 @@ state.Spitz {
  		comment.range '0 - 7'
  		iface MIXER
  		name 'Bypass Mono Playback Volume'
@@ -180,7 +191,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.40 {
  		comment.access 'read write'
-@@ -379,8 +379,8 @@
+@@ -379,8 +379,8 @@ state.Spitz {
  		comment.range '0 - 127'
  		iface MIXER
  		name 'Headphone Playback Volume'
@@ -191,7 +202,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.42 {
  		comment.access 'read write'
-@@ -389,8 +389,8 @@
+@@ -389,8 +389,8 @@ state.Spitz {
  		comment.range '0 - 127'
  		iface MIXER
  		name 'Speaker Playback Volume'
@@ -202,7 +213,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.43 {
  		comment.access 'read write'
-@@ -399,7 +399,7 @@
+@@ -399,7 +399,7 @@ state.Spitz {
  		comment.range '0 - 127'
  		iface MIXER
  		name 'Mono Playback Volume'
@@ -211,7 +222,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.44 {
  		comment.access 'read write'
-@@ -411,7 +411,7 @@
+@@ -411,7 +411,7 @@ state.Spitz {
  		comment.item.3 'Digital Mono'
  		iface MIXER
  		name 'Right ADC Mux'
@@ -220,7 +231,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.45 {
  		comment.access 'read write'
-@@ -423,7 +423,7 @@
+@@ -423,7 +423,7 @@ state.Spitz {
  		comment.item.3 'Digital Mono'
  		iface MIXER
  		name 'Left ADC Mux'
@@ -229,7 +240,7 @@ http://bugs.openembedded.net/show_bug.cgi?id=2617
  	}
  	control.46 {
  		comment.access 'read write'
-@@ -471,7 +471,7 @@
+@@ -471,7 +471,7 @@ state.Spitz {
  		comment.item.4 Differential
  		iface MIXER
  		name 'Left Line Mux'
diff --git a/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch b/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch
index 8d72401..fdb6f2b 100644
--- a/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch
+++ b/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch
@@ -1,8 +1,24 @@
-Index: zaurusd/config/mach-config/mach-akita-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-akita-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-akita-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
+From bef06331c6454c7d7815930e19fdcb2c3409fbe3 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 24 Jul 2011 19:12:32 +0100
+
+---
+ config/mach-config/mach-akita-vars.in     | 5 ++++-
+ config/mach-config/mach-borzoi-vars.in    | 5 ++++-
+ config/mach-config/mach-corgi-vars.in     | 5 ++++-
+ config/mach-config/mach-htcuniversal-vars | 3 +++
+ config/mach-config/mach-husky-vars.in     | 5 ++++-
+ config/mach-config/mach-poodle-vars.in    | 5 ++++-
+ config/mach-config/mach-shepherd-vars.in  | 5 ++++-
+ config/mach-config/mach-spitz-vars.in     | 5 ++++-
+ config/mach-config/mach-tosa-vars.in      | 5 ++++-
+ 9 files changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/config/mach-config/mach-akita-vars.in b/config/mach-config/mach-akita-vars.in
+index d5b831f..c4cb671 100644
+--- a/config/mach-config/mach-akita-vars.in
++++ b/config/mach-config/mach-akita-vars.in
+@@ -7,4 +7,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
  TSKEYS_DEVICE=/dev/input/event1
  
@@ -12,11 +28,11 @@ Index: zaurusd/config/mach-config/mach-akita-vars.in
 +
 +export XRANDR_LANDSCAPE=right
 +export XRANDR_PORTRAIT=normal
-Index: zaurusd/config/mach-config/mach-borzoi-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-borzoi-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-06-22 20:51:00.000000000 +0000
-@@ -7,4 +7,7 @@
+diff --git a/config/mach-config/mach-borzoi-vars.in b/config/mach-config/mach-borzoi-vars.in
+index 0d0a8ca..55cba7f 100644
+--- a/config/mach-config/mach-borzoi-vars.in
++++ b/config/mach-config/mach-borzoi-vars.in
+@@ -7,4 +7,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
  TSKEYS_DEVICE=/dev/input/event1
  
@@ -26,11 +42,11 @@ Index: zaurusd/config/mach-config/mach-borzoi-vars.in
 +
 +export XRANDR_LANDSCAPE=right
 +export XRANDR_PORTRAIT=normal
-Index: zaurusd/config/mach-config/mach-corgi-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-corgi-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
+diff --git a/config/mach-config/mach-corgi-vars.in b/config/mach-config/mach-corgi-vars.in
+index 54fceaa..548ada2 100644
+--- a/config/mach-config/mach-corgi-vars.in
++++ b/config/mach-config/mach-corgi-vars.in
+@@ -7,4 +7,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
  TSKEYS_DEVICE=/dev/input/event1
  
@@ -40,22 +56,22 @@ Index: zaurusd/config/mach-config/mach-corgi-vars.in
 +
 +export XRANDR_LANDSCAPE=normal
 +export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-htcuniversal-vars
-===================================================================
---- zaurusd.orig/config/mach-config/mach-htcuniversal-vars	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-htcuniversal-vars	2009-06-22 20:49:01.000000000 +0000
-@@ -2,3 +2,6 @@
+diff --git a/config/mach-config/mach-htcuniversal-vars b/config/mach-config/mach-htcuniversal-vars
+index 490c020..7c2c6da 100644
+--- a/config/mach-config/mach-htcuniversal-vars
++++ b/config/mach-config/mach-htcuniversal-vars
+@@ -2,3 +2,6 @@ MACHINE=htcuniversal
  
  export SWITCH_EVENT_ZHINGE=1
  SWITCH_EVENT_DEVICE=/dev/input/event3
 +
 +export XRANDR_LANDSCAPE=normal
 +export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-husky-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-husky-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-husky-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
+diff --git a/config/mach-config/mach-husky-vars.in b/config/mach-config/mach-husky-vars.in
+index 64e1238..b6e4ab8 100644
+--- a/config/mach-config/mach-husky-vars.in
++++ b/config/mach-config/mach-husky-vars.in
+@@ -7,4 +7,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
  TSKEYS_DEVICE=/dev/input/event1
  
@@ -65,11 +81,11 @@ Index: zaurusd/config/mach-config/mach-husky-vars.in
 +
 +export XRANDR_LANDSCAPE=normal
 +export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-poodle-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-poodle-vars.in	2009-06-22 20:49:01.000000000 +0000
-+++ zaurusd/config/mach-config/mach-poodle-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -6,4 +6,7 @@
+diff --git a/config/mach-config/mach-poodle-vars.in b/config/mach-config/mach-poodle-vars.in
+index cbb1478..71af6d7 100644
+--- a/config/mach-config/mach-poodle-vars.in
++++ b/config/mach-config/mach-poodle-vars.in
+@@ -6,4 +6,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
  #TSKEYS_DEVICE=/dev/input/event1
  
@@ -79,11 +95,11 @@ Index: zaurusd/config/mach-config/mach-poodle-vars.in
 +
 +export XRANDR_LANDSCAPE=normal
 +export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-shepherd-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-shepherd-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
+diff --git a/config/mach-config/mach-shepherd-vars.in b/config/mach-config/mach-shepherd-vars.in
+index 1d3987e..c77eb56 100644
+--- a/config/mach-config/mach-shepherd-vars.in
++++ b/config/mach-config/mach-shepherd-vars.in
+@@ -7,4 +7,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
  TSKEYS_DEVICE=/dev/input/event1
  
@@ -93,11 +109,11 @@ Index: zaurusd/config/mach-config/mach-shepherd-vars.in
 +
 +export XRANDR_LANDSCAPE=normal
 +export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-spitz-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-spitz-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
+diff --git a/config/mach-config/mach-spitz-vars.in b/config/mach-config/mach-spitz-vars.in
+index 0d0a8ca..55cba7f 100644
+--- a/config/mach-config/mach-spitz-vars.in
++++ b/config/mach-config/mach-spitz-vars.in
+@@ -7,4 +7,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
  TSKEYS_DEVICE=/dev/input/event1
  
@@ -107,11 +123,11 @@ Index: zaurusd/config/mach-config/mach-spitz-vars.in
 +
 +export XRANDR_LANDSCAPE=right
 +export XRANDR_PORTRAIT=normal
-Index: zaurusd/config/mach-config/mach-tosa-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-tosa-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -6,4 +6,7 @@
+diff --git a/config/mach-config/mach-tosa-vars.in b/config/mach-config/mach-tosa-vars.in
+index 7f52bb2..97f0e93 100644
+--- a/config/mach-config/mach-tosa-vars.in
++++ b/config/mach-config/mach-tosa-vars.in
+@@ -6,4 +6,7 @@ SWITCH_EVENT_DEVICE=/dev/input/event0
  #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
  #TSKEYS_DEVICE=/dev/input/event1
  
diff --git a/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch b/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch
index 8f1879d..839b42e 100644
--- a/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch
+++ b/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch
@@ -1,6 +1,16 @@
---- zaurusd/config/config.in.orig	2007-05-21 21:58:14.000000000 +0000
-+++ zaurusd/config/config.in	2007-05-21 22:10:26.000000000 +0000
-@@ -11,11 +11,5 @@
+From 7675d11d0adc31ac7b5ad643d72b9ac724b94bdc Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 24 Jul 2011 19:12:32 +0100
+
+---
+ config/config.in | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/config/config.in b/config/config.in
+index 166f3a9..cf0daa4 100755
+--- a/config/config.in
++++ b/config/config.in
+@@ -11,11 +11,5 @@ fi
  . @appconfdir@/mach-config-vars
  . @appconfdir@/mach-config-funcs
  
diff --git a/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch b/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch
index 9eed68f..9a592c0 100644
--- a/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch
+++ b/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch
@@ -1,4 +1,4 @@
-From f271fa43ec63ed5650296a393403318ab0e553d4 Mon Sep 17 00:00:00 2001
+From 571d1a134665c80d01a2a3cc2db576662b68243d Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Sun, 5 Aug 2012 01:41:16 +0100
 Subject: [PATCH] scripts/zaurusd: use pidof instead of mangling output of ps
@@ -8,9 +8,10 @@ busybox provides working pidof if sysvinit doesn't, so use that.
 Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
 ---
- scripts/zaurusd.in |    5 +----
- 1 files changed, 1 insertions(+), 4 deletions(-)
+ scripts/zaurusd.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/scripts/zaurusd.in b/scripts/zaurusd.in
 index ad896aa..acb5158 100755
@@ -28,6 +29,3 @@ index ad896aa..acb5158 100755
          [ "$pid" != "" ] && kill $pid
  }
  
--- 
-1.7.1
-
diff --git a/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff b/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff
index 9c418ec..5cb81ed 100644
--- a/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff
+++ b/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff
@@ -1,6 +1,23 @@
---- /tmp/mach-akita-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-akita-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
+From ba8caa82de5e947469f74477b0c41feb8a0824ef Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 24 Jul 2011 19:12:32 +0100
+
+---
+ config/mach-config/mach-akita-vars.in    | 3 +--
+ config/mach-config/mach-borzoi-vars.in   | 3 +--
+ config/mach-config/mach-corgi-vars.in    | 3 +--
+ config/mach-config/mach-husky-vars.in    | 3 +--
+ config/mach-config/mach-poodle-vars.in   | 3 +--
+ config/mach-config/mach-shepherd-vars.in | 3 +--
+ config/mach-config/mach-spitz-vars.in    | 3 +--
+ config/mach-config/mach-tosa-vars.in     | 3 +--
+ 8 files changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/config/mach-config/mach-akita-vars.in b/config/mach-config/mach-akita-vars.in
+index c4cb671..dffc694 100644
+--- a/config/mach-config/mach-akita-vars.in
++++ b/config/mach-config/mach-akita-vars.in
+@@ -5,9 +5,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
@@ -8,10 +25,14 @@
 +TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
---- /tmp/mach-borzoi-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
+-
+ export XRANDR_LANDSCAPE=right
+ export XRANDR_PORTRAIT=normal
+diff --git a/config/mach-config/mach-borzoi-vars.in b/config/mach-config/mach-borzoi-vars.in
+index 55cba7f..d27bf2f 100644
+--- a/config/mach-config/mach-borzoi-vars.in
++++ b/config/mach-config/mach-borzoi-vars.in
+@@ -5,9 +5,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
@@ -19,10 +40,14 @@
 +TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
---- /tmp/mach-corgi-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
+-
+ export XRANDR_LANDSCAPE=right
+ export XRANDR_PORTRAIT=normal
+diff --git a/config/mach-config/mach-corgi-vars.in b/config/mach-config/mach-corgi-vars.in
+index 548ada2..fac5a0a 100644
+--- a/config/mach-config/mach-corgi-vars.in
++++ b/config/mach-config/mach-corgi-vars.in
+@@ -5,9 +5,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
@@ -30,10 +55,14 @@
 +TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
---- /tmp/mach-husky-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-husky-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
+-
+ export XRANDR_LANDSCAPE=normal
+ export XRANDR_PORTRAIT=left
+diff --git a/config/mach-config/mach-husky-vars.in b/config/mach-config/mach-husky-vars.in
+index b6e4ab8..ef7c09e 100644
+--- a/config/mach-config/mach-husky-vars.in
++++ b/config/mach-config/mach-husky-vars.in
+@@ -5,9 +5,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
@@ -41,10 +70,14 @@
 +TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
---- /tmp/mach-poodle-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-poodle-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -4,6 +4,6 @@
+-
+ export XRANDR_LANDSCAPE=normal
+ export XRANDR_PORTRAIT=left
+diff --git a/config/mach-config/mach-poodle-vars.in b/config/mach-config/mach-poodle-vars.in
+index 71af6d7..fc3e2c7 100644
+--- a/config/mach-config/mach-poodle-vars.in
++++ b/config/mach-config/mach-poodle-vars.in
+@@ -4,9 +4,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
@@ -52,10 +85,14 @@
 +#TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
-\ No newline at end of file
---- /tmp/mach-shepherd-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
+-
+ export XRANDR_LANDSCAPE=normal
+ export XRANDR_PORTRAIT=left
+diff --git a/config/mach-config/mach-shepherd-vars.in b/config/mach-config/mach-shepherd-vars.in
+index c77eb56..90f5ab3 100644
+--- a/config/mach-config/mach-shepherd-vars.in
++++ b/config/mach-config/mach-shepherd-vars.in
+@@ -5,9 +5,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
@@ -63,10 +100,14 @@
 +TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
---- /tmp/mach-spitz-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
+-
+ export XRANDR_LANDSCAPE=normal
+ export XRANDR_PORTRAIT=left
+diff --git a/config/mach-config/mach-spitz-vars.in b/config/mach-config/mach-spitz-vars.in
+index 55cba7f..d27bf2f 100644
+--- a/config/mach-config/mach-spitz-vars.in
++++ b/config/mach-config/mach-spitz-vars.in
+@@ -5,9 +5,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
@@ -74,10 +115,14 @@
 +TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
---- /tmp/mach-tosa-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -4,6 +4,6 @@
+-
+ export XRANDR_LANDSCAPE=right
+ export XRANDR_PORTRAIT=normal
+diff --git a/config/mach-config/mach-tosa-vars.in b/config/mach-config/mach-tosa-vars.in
+index 97f0e93..97f75b9 100644
+--- a/config/mach-config/mach-tosa-vars.in
++++ b/config/mach-config/mach-tosa-vars.in
+@@ -4,9 +4,8 @@ export SWITCH_EVENT_ZMIXER=1
  SWITCH_EVENT_DEVICE=/dev/input/event0
  
  #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
@@ -85,4 +130,6 @@
 +#TSKEYS_DEVICE=/dev/input/touchscreen0
  
  ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
-\ No newline at end of file
+-
+ export XRANDR_LANDSCAPE=normal
+ export XRANDR_PORTRAIT=left
-- 
2.7.4


