Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tka0U-0007vt-Q8
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 13:41:18 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 04:26:23 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so4623084fav.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 04:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=mhrWARsCDN6rQHquxjXWanHIYVB4grQ6bxhN7cvxAUI=;
	b=Bry1YBVxm4Qn/tqHGg4eRqys643S2ZWB2x5cny6dD7S0khBdNWeIf6Jf7TPi3fwECt
	hE6Vxmfjhry1yBufVwqeP0jweMemwUCaq1qm3+Nclxn31pGfMvRI6zmEpWVnMamzsHIE
	MiMyD9p9liKqdYF3qAIch91FxzuXDjsQMUy33e8obRkn0XKOkqfXN2+Yg0BlBvQq9ymZ
	JsCvopU5gaoiudS7oQXiadNsWD38MFPTRJVIFJMwFKei0O2SmtyIBp2XHmMWGhhwNw5p
	gaqE3FzJpMI3v6+dHwlqotxDhuyJnN9GRyKYySTjH93HRyfYYRLdzlvVvUzQOtDdym/9
	6MsA==
Received: by 10.180.20.176 with SMTP id o16mr15385753wie.10.1355747181658;
	Mon, 17 Dec 2012 04:26:21 -0800 (PST)
Received: by 10.180.20.176 with SMTP id o16mr15385627wie.10.1355747180246;
	Mon, 17 Dec 2012 04:26:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hg17sm10902336wib.1.2012.12.17.04.26.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 04:26:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2012 12:24:37 +0000
Message-Id: <1355747077-21644-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQma0GbSc6/2nktsHRRRRCuzsyDM09+mGzI10t1xJx7dRqdHTNiwm1NrpaQrV+NmfTwSWkMrdABhGemR1jIjpHC4L+NBR2PFT89OVexXgW3cLdg0tPlsGfTDVQoL1Gz1v5xSSrvZWlRRH9WGEX7eJICB1ZzibsUtNPC2vQhCPpvEth+UIVdB4Jgjn1ZmwwApHkRiW52u
Subject: [meta-multimedia PATCH V2] gst123: add package
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
X-List-Received-Date: Mon, 17 Dec 2012 12:41:19 -0000

gst123 is useful for testing as it simply uses PlayBin, but can display the
pipeline being used for QA purposes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/files/display.patch                  |   60 ++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb   |   17 ++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch b/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
new file mode 100644
index 0000000..61b0e6c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3e46d2e501da68d929bb5f26900a292a5fc04a1f Mon Sep 17 00:00:00 2001
+From: Stefan Westerfeld <stefan@space.twc.de>
+Date: Mon, 23 Apr 2012 03:10:22 +0200
+Subject: [PATCH] Fix time display updates (broken by introduction of quiet
+ mode).
+
+---
+ src/gst123.cc |    1 +
+ src/msg.cc    |    7 +++++++
+ src/msg.h     |    1 +
+ 3 files changed, 9 insertions(+)
+
+diff --git a/src/gst123.cc b/src/gst123.cc
+index 20e91e5..ce5876d 100644
+--- a/src/gst123.cc
++++ b/src/gst123.cc
+@@ -640,6 +640,7 @@ cb_print_position (gpointer *data)
+       else
+         blanks += "         ";
+       Msg::print ("%s%s\r", status.c_str(), blanks.c_str());
++      Msg::flush();
+     }
+ 
+   /* call me again */
+diff --git a/src/msg.cc b/src/msg.cc
+index 547cd90..33cada2 100644
+--- a/src/msg.cc
++++ b/src/msg.cc
+@@ -41,6 +41,13 @@ print (const char *format, ...)
+     }
+ }
+ 
++void
++flush()
++{
++  if (!Options::the().quiet)
++    fflush (stdout);
++}
++
+ }
+ 
+ }
+diff --git a/src/msg.h b/src/msg.h
+index e0ced24..5bebac0 100644
+--- a/src/msg.h
++++ b/src/msg.h
+@@ -27,6 +27,7 @@ namespace Msg
+ {
+ 
+ void print (const char *format, ...);
++void flush();
+ 
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
new file mode 100644
index 0000000..7898b08
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Flexible CLI player in the spirit of mpg123, based on GStreamer"
+HOMEPAGE = "http://space.twc.de/~stefan/gst123.php"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
+
+DEPENDS = "libx11 gstreamer gst-plugins-base gtk+ ncurses"
+
+SRC_URI = "http://space.twc.de/~stefan/gst123/${BPN}-${PV}.tar.bz2 \
+           file://display.patch"
+
+SRC_URI[md5sum] = "1e77767c9d6fecee5641f95804f160fe"
+SRC_URI[sha256sum] = "89d1de025eca0466c125dcd6a11b64341bdf98ee4c03c3e5a12321d77cb8b0ce"
+
+PR = "r0"
+
+inherit autotools
-- 
1.7.10



