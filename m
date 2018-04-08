Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B35257554A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:03 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id g14so3721225pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d5T8FcpHymLgI2jvU9JNA1XWxI+90ol4A6wqkEXPpFQ=;
	b=u6G5hYlOMpeyyDrB1Y5ZVj82OKDFtJRtabXmMkVzfJsDShH79H8odxwViVDuv/k0NE
	J2xD6zqXy3MGoZ/0yBlf1WUXtmSFHU8lvlppb3YFI+NBWf6VGiv9WQbyDMvyV2F92SBf
	lXli7yBlk7+xZ1RlTXxxKE7gUZXJUUnF6RFhJAGNtwqmMVg8KWuV2nCfYaW8hVyK9oud
	H3gSq23rrgpyyI9IWRHYDcE7UQr8Uu8oQxJNur2+W7sycSCok9LTfFG3nRKmQsJp7bRd
	AqrhMqK6AyxsHkGlBNvicFqlZie0PVkLv84oLENWkB90dJklgkSYaTKEaRgdEvDPtrcn
	tyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d5T8FcpHymLgI2jvU9JNA1XWxI+90ol4A6wqkEXPpFQ=;
	b=SZ6mV4Q1JCCOGWibQ9/vgJ/1bkyOSgZ7wDrOwD+mgrhPWwe/JXZqMQq8+UZ56HKvNx
	fqm1//+kDYN31hzcAZkbPCNAC+9SE1+wagJ0pGooc+jAd3MIQeNsJn79AE2aTKWjmXGM
	47tJjweOx9QSoHTEQwkhEZueuKLue/YbfeCTFVoqrGmhRLH8ssWbwsw+/mOToJePmz6D
	ritCl0lPH8SaJImp23hWraG89PxMUbqwj7Jp48/TwNbfHkdkMfjQbLdodU7Ncu64r9gQ
	ok7j9+PLjbtyFIaKMY/r4fiZzjkoD4+DQns9kv8m4YzokzdhDRhLSAAMyZmTRjROixdl
	kmLA==
X-Gm-Message-State: AElRT7EnvYj6Xj/BoJ3+xvMkKtU9DycYBJ0314urM657cQpM2aWpTKRx
	SpoX3QXy+AVpiOkk664ibvY=
X-Google-Smtp-Source: AIpwx4+e6U/qCsrUi0tlrE4dlb0i0AslXHZrsc5kgPCPr+lrCjlCKRSzZMMg+AZT6t+xnzQy4XIpQg==
X-Received: by 10.101.73.74 with SMTP id q10mr22222703pgs.323.1523170744403;
	Sat, 07 Apr 2018 23:59:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:24 -0700
Message-Id: <1523170729-26321-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 12/37] xserver-common: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:03 -0000

WARNING: xserver-common-1.34-r9 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-Don-t-install-Xsession-or-Xserver.patch
patching file Makefile
Hunk #1 succeeded at 20 with fuzz 1.

and others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-COPYING-add-GPLv2-license-file.patch        | 12 +++++-------
 .../0001-Don-t-install-Xsession-or-Xserver.patch     | 14 ++++++--------
 .../0002-add-setdpi-Xinit.d-script.patch             | 12 +++++-------
 ...0006-add-support-for-etc-X11-xserver-system.patch | 14 ++++++--------
 ...functions-file-instead-etc-init.d-functions.patch | 20 +++++++++-----------
 ...ommon-add-dpi-and-nocursor-params-for-gta01.patch | 16 +++++++---------
 ...ommon-add-support-for-n900-alias-nokia_rx-5.patch | 15 ++++++---------
 ...ommon-add-support-for-nexus-S-alias-herring.patch | 14 ++++++--------
 ...ommon-add-support-for-nexus-one-alias-mahim.patch | 15 ++++++---------
 ...ommon-add-support-for-gta04-alias-OpenPhoen.patch | 15 ++++++---------
 ...ommon-add-support-for-tuna-alias-Galaxy-Nex.patch | 13 +++++--------
 ...0015-xserver-common-disable-TCP-connections.patch |  4 +++-
 12 files changed, 70 insertions(+), 94 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
index 29dd71a..2bfe85b 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
@@ -1,7 +1,7 @@
-From 834fa06920f88ceedf752964c8e296c653d541e4 Mon Sep 17 00:00:00 2001
+From f919725918fad2b32504f89a28310fcae4ab0406 Mon Sep 17 00:00:00 2001
 From: Yu Ke <ke.yu@intel.com>
 Date: Wed, 11 Apr 2012 14:26:16 +0200
-Subject: [PATCH 01/12] COPYING: add GPLv2 license file
+Subject: [PATCH] COPYING: add GPLv2 license file
 
 this is a local file recipe and the license file is missing.In order
 to pass the license checksum checking, the license file is needed. So
@@ -9,9 +9,10 @@ this patch add the GPLv2 license file.
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- COPYING |  339 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 files changed, 339 insertions(+), 0 deletions(-)
+ COPYING | 339 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 339 insertions(+)
  create mode 100644 COPYING
 
 diff --git a/COPYING b/COPYING
@@ -359,6 +360,3 @@ index 0000000..d511905
 +consider it more useful to permit linking proprietary applications with the
 +library.  If this is what you want to do, use the GNU Lesser General
 +Public License instead of this License.
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
index 26288d6..0ed12d1 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
@@ -1,4 +1,4 @@
-From c92ce6a4b3622874f820b5ec487a2b63f519826c Mon Sep 17 00:00:00 2001
+From 1002a1137b140dad3319bf3206fec5b6c6b74fea Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 10 Nov 2016 14:33:05 +0200
 Subject: [PATCH] Don't install Xsession or Xserver
@@ -8,15 +8,16 @@ Xsession scripts and xserver-common from this recipe will still
 be used as before.
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index caa5de1..7e36bbc 100644
+index caa5de1..9428205 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -20,7 +20,5 @@ install-program:
+@@ -20,8 +20,6 @@ install-program:
  	install -m 755 run-calibrate.sh $(DESTDIR)$(PREFIX)/bin/run-calibrate.sh
  	install -m 644 X11/Xdefaults $(DESTDIR)/etc/X11/Xdefaults
  	install -m 755 X11/Xinit $(DESTDIR)/etc/X11/Xinit
@@ -25,6 +26,3 @@ index caa5de1..7e36bbc 100644
  	install -m 755 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
  	install -m 755 X11/functions $(DESTDIR)/etc/X11/functions
  	install -d $(DESTDIR)/etc/X11/xmodmap
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
index 23b5345..0be3fa5 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
@@ -1,12 +1,13 @@
-From 3d1a1a8273112668927a6c6bb3e361e896f5b229 Mon Sep 17 00:00:00 2001
+From 3b5f431a370054bfc090796e8d55de8c8cea46f4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:28:45 +0200
-Subject: [PATCH 02/12] add setdpi Xinit.d script
+Subject: [PATCH] add setdpi Xinit.d script
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/Xinit.d/50setdpi |   92 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 files changed, 92 insertions(+), 0 deletions(-)
+ X11/Xinit.d/50setdpi | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 92 insertions(+)
  create mode 100644 X11/Xinit.d/50setdpi
 
 diff --git a/X11/Xinit.d/50setdpi b/X11/Xinit.d/50setdpi
@@ -107,6 +108,3 @@ index 0000000..04a2edd
 +
 +set_dpi "$SET_SCREEN_DPI"
 +set_rxvt_font "$SCREEN_DPI"
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
index 7ee8572..53a283f 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
@@ -1,15 +1,16 @@
-From 0c42e1fb84cc2bfe768bed17f3b979aca868cf64 Mon Sep 17 00:00:00 2001
+From b60e364c35d56a2a3164254d98c9931bfa3feed4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:34:43 +0200
-Subject: [PATCH 06/12] add support for /etc/X11/xserver-system
+Subject: [PATCH] add support for /etc/X11/xserver-system
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
+ X11/xserver-common | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index 4c7ed6e..6d8c9df 100644
+index 52655cb..bb7c2ff 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -204,3 +204,8 @@ fi
@@ -21,6 +22,3 @@ index 4c7ed6e..6d8c9df 100644
 +if [ -e /etc/X11/xserver-system ] ; then                    
 +       . /etc/X11/xserver-system                    
 +fi                    
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
index 8791226..94a3540 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
@@ -1,17 +1,18 @@
-From 63e6b9a54e1f12dbf7ddbfe3376fff4c382421a5 Mon Sep 17 00:00:00 2001
+From 492c65a32a4ae44c34580ed8ac5d3f50a155cfef Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:36:02 +0200
-Subject: [PATCH 07/12] use own functions file instead /etc/init.d/functions
+Subject: [PATCH] use own functions file instead /etc/init.d/functions
 
 * so we don't have to depend on initscripts
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- Makefile             |    1 +
- X11/Xinit.d/11zaurus |    2 +-
- X11/Xinit.d/12keymap |    2 +-
- X11/functions        |   11 +++++++++++
- X11/xserver-common   |    2 +-
+ Makefile             |  1 +
+ X11/Xinit.d/11zaurus |  2 +-
+ X11/Xinit.d/12keymap |  2 +-
+ X11/functions        | 11 +++++++++++
+ X11/xserver-common   |  2 +-
  5 files changed, 15 insertions(+), 3 deletions(-)
  create mode 100644 X11/functions
 
@@ -70,7 +71,7 @@ index 0000000..a1311ad
 +		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
 +}
 diff --git a/X11/xserver-common b/X11/xserver-common
-index 6d8c9df..de92bb7 100644
+index bb7c2ff..d622f2a 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -30,7 +30,7 @@ if [ -f /etc/profile ]; then
@@ -82,6 +83,3 @@ index 6d8c9df..de92bb7 100644
  
  fallback_screen_arg() {
      geom=`fbset | grep geometry`
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
index e35e4a7..90d0f25 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
@@ -1,16 +1,17 @@
-From 0ee7bf87e0c83abc79de3a99dfa3c87dd5c5b229 Mon Sep 17 00:00:00 2001
+From e2abbe110e71a7b4b56564e6b9d58ffa7f34a9e8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:37:29 +0200
-Subject: [PATCH 08/12] xserver-common: add dpi and nocursor params for gta01
- and gta02
+Subject: [PATCH] xserver-common: add dpi and nocursor params for gta01 and
+ gta02
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    8 ++++++--
- 1 files changed, 6 insertions(+), 2 deletions(-)
+ X11/xserver-common | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index de92bb7..f76fa5f 100644
+index d622f2a..a2c0591 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -133,15 +133,19 @@ else
@@ -35,6 +36,3 @@ index de92bb7..f76fa5f 100644
              fi
              ;;
          "motorola_ezx_platform")
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
index 1a0bde8..8fb69b3 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
@@ -1,16 +1,16 @@
-From 6d6caecb7172b9b33e7364564b0e6eabf67b6e8b Mon Sep 17 00:00:00 2001
+From f2d808cea5b9f69158f82e16c06f882a6db10d63 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:40:14 +0200
-Subject: [PATCH 09/12] xserver-common: add support for n900 alias
- nokia_rx-51_board
+Subject: [PATCH] xserver-common: add support for n900 alias nokia_rx-51_board
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
+ X11/xserver-common | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index f76fa5f..86ed17f 100644
+index a2c0591..b8c37e6 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -132,6 +132,13 @@ else
@@ -27,6 +27,3 @@ index f76fa5f..86ed17f 100644
          "gta01" )
              DPI="280"
              if [ "$XSERVER" != "Xorg" ] ; then
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
index 688be40..d30c7bb 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
@@ -1,15 +1,16 @@
-From 52003e6b52b1417c1a0e57243d83349addcdacf6 Mon Sep 17 00:00:00 2001
+From a194ba2013f9e58cf73cd39b57be68386e501eda Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:40:44 +0200
-Subject: [PATCH 10/12] xserver-common: add support for nexus S alias herring
+Subject: [PATCH] xserver-common: add support for nexus S alias herring
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
+ X11/xserver-common | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index 86ed17f..5c9a6eb 100644
+index b8c37e6..9aa6b24 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -126,6 +126,9 @@ else
@@ -22,6 +23,3 @@ index 86ed17f..5c9a6eb 100644
          "generic_omap1510/1610/1710")
              ARGS="$ARGS -screen ${SCREEN_SIZE}"
              DPI="225" ;;
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
index f80456d..23e17f0 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
@@ -1,16 +1,16 @@
-From 0ecc978b7d8cb6867646fb2a29523ebef3afa016 Mon Sep 17 00:00:00 2001
+From dfd832b35b6cb4cf2b6f2b51df7b0999f10c8ca1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:41:06 +0200
-Subject: [PATCH 11/12] xserver-common: add support for nexus one alias
- mahimahi
+Subject: [PATCH] xserver-common: add support for nexus one alias mahimahi
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
+ X11/xserver-common | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index 5c9a6eb..55594fd 100644
+index 9aa6b24..8da926e 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -129,6 +129,9 @@ else
@@ -23,6 +23,3 @@ index 5c9a6eb..55594fd 100644
          "generic_omap1510/1610/1710")
              ARGS="$ARGS -screen ${SCREEN_SIZE}"
              DPI="225" ;;
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
index 54a0329..5e794f6 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
@@ -1,16 +1,16 @@
-From d194f0302582f1ca599f2ea58c15e15f4fd6bdef Mon Sep 17 00:00:00 2001
+From d9e05e53b30c66705852256ff5c603252aa94b2c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 11 Apr 2012 14:41:52 +0200
-Subject: [PATCH 12/12] xserver-common: add support for gta04 alias
- OpenPhoenux
+Subject: [PATCH] xserver-common: add support for gta04 alias OpenPhoenux
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    8 ++++++++
- 1 files changed, 8 insertions(+), 0 deletions(-)
+ X11/xserver-common | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index 55594fd..434333e 100644
+index 8da926e..d9325dd 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -161,6 +161,14 @@ else
@@ -28,6 +28,3 @@ index 55594fd..434333e 100644
          "motorola_ezx_platform")
              ARGS="$ARGS -screen 240x320"
              DPI="170" ;;
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
index 49321eb..78d2e40 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
@@ -1,13 +1,13 @@
-From 176c3bd3d86c223fd44b0f15b62d38526bb3b0d2 Mon Sep 17 00:00:00 2001
+From 57ab521ffc1024f21105ca14be2d041a477942b1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 17 Aug 2012 13:00:56 +0200
-Subject: [PATCH 13/13] xserver-common: add support for tuna alias Galaxy
- Nexus
+Subject: [PATCH] xserver-common: add support for tuna alias Galaxy Nexus
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- X11/xserver-common |    8 ++++++++
- 1 files changed, 8 insertions(+), 0 deletions(-)
+ X11/xserver-common | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
 index d9325dd..017e5ae 100644
@@ -28,6 +28,3 @@ index d9325dd..017e5ae 100644
          "motorola_ezx_platform")
              ARGS="$ARGS -screen 240x320"
              DPI="170" ;;
--- 
-1.7.8.6
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
index 06df261..a731917 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
@@ -1,3 +1,4 @@
+From 5236209e30e0f45113e140f0667c8ffcfe621536 Mon Sep 17 00:00:00 2001
 From: Javier Viguera <javier.viguera@digi.com>
 Date: Wed, 26 Nov 2014 09:24:44 +0100
 Subject: [PATCH] xserver-common: disable TCP connections
@@ -5,12 +6,13 @@ Subject: [PATCH] xserver-common: disable TCP connections
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Javier Viguera <javier.viguera@digi.com>
+
 ---
  X11/xserver-common | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/X11/xserver-common b/X11/xserver-common
-index 017e5aee1ab0..4dc48c412741 100644
+index 017e5ae..4dc48c4 100644
 --- a/X11/xserver-common
 +++ b/X11/xserver-common
 @@ -44,7 +44,7 @@ SCREEN_SIZE=`fallback_screen_arg`
-- 
2.7.4


