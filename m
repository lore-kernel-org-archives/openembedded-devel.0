Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4876C6E8C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 02:35:53 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so10046332pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 18:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ho/SxU5ey95KwrgoIrxaVFNK5GatRe2jrNbEEFa1MOk=;
	b=nvTyf2A4mV4k9g7pLhYJiqlj/DOhkpmzRBMYw95lXUJsDMdOepNRtyKjMNCVhRVnVE
	UP/FPA59LCKqoXz3EajOST73MkXGVJI/INA8vW6TQ8LL75ZhaiijyHGFHl5SZmNxff5B
	4yFwXfl3J3YgScAMQLt4a37k+IEEm22b6Fif5ZD+QuHGHTKhwpgmXC4p6y/miPh18tj4
	K2C8CdifJM98vm/B5fNWj7HhlnTAoJjzN/e63sR/5TlG0y29vBF9XSRHxsma3m99t+6O
	SPvSsID7QdHGmLwTpeZMtEgPQigAMzExCbIlNOMvZgd19/XV7uIBZRisZmrflXOrh56L
	FGTw==
X-Received: by 10.66.124.230 with SMTP id ml6mr43890805pab.29.1392258954085;
	Wed, 12 Feb 2014 18:35:54 -0800 (PST)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id un5sm2528044pab.3.2014.02.12.18.35.52
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 18:35:53 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Feb 2014 18:35:28 -0800
Message-Id: <1392258928-32123-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][dora][PATCH] qtbase.inc: PACKAGECONFIG[gstreamer] gst-plugins-base dependency missing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2014 02:35:54 -0000

When testing for GStreamer support, the qtbase 5.1.1 configure script
tries to determine pkg-config information for both gstreamer-0.10 and
gstreamer-plugins-base-0.10.

If either one is unavailable then the configure test fails (with the
slightly confusing error that gst/gst.h can't be found, even when the
gstreamer header files are present in sysroot).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 7018c69..71da726 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -104,7 +104,7 @@ PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb,libxkbcommon"
 PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
 # depends on glib
-PACKAGECONFIG[gstreamer] = "-gstreamer,-no-gstreamer,gstreamer"
+PACKAGECONFIG[gstreamer] = "-gstreamer,-no-gstreamer,gstreamer gst-plugins-base"
 PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
 PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
-- 
1.8.1.2


