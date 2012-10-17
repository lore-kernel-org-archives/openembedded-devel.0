Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOSJI-0003it-PQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 14:01:16 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 04:47:57 -0700
Received: by mail-wi0-f177.google.com with SMTP id hj13so472001wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 04:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+ER9JDjvN0gh9g8UP7spDjS3EhBtybTwImsc5X7GcJs=;
	b=hYWHaKogEA7b2Revl5gyXqp325/5VMbMijo5+0XAXRI5VEolETxr44XJcIFM3G5O+w
	+ZwaJnRAtwYVsMpGVxhVLYTL1ni73WiDjozr/6WidpRgE+5tcBQQOA+h7dEqGdNq1WFy
	n3TUZZtdz25wpCLtmdZRGS7BOV3JQklRI/Ivaxupm5SjjnWDxzHE+BdgGO3AgBDouPGN
	mU9V6qoDdZ6+429tHXUL0YtU4U4M1jAffu3TMJcTk7QNx5iVTDLi+iKKVmeygFoRkiON
	aIe13CwQX+YNeQxGN0JjKJdEVbu9M+6r4E0t7h7ubb+YS38Oh8LGRn95npEaxeMdkqcm
	zZxw==
Received: by 10.216.99.199 with SMTP id x49mr11498730wef.171.1350474475296;
	Wed, 17 Oct 2012 04:47:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp6sm3898584wib.0.2012.10.17.04.47.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 04:47:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 12:46:45 +0100
Message-Id: <1350474405-3421-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmKI7FpxXMvjEL93lODt4rRnpqGxaYL939U82taw+Ss6TqA8kMnQN1DNomq1W6SbboLgFLr
Subject: [PATCH] gst123: add package
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
X-List-Received-Date: Wed, 17 Oct 2012 12:01:17 -0000

gst123 is useful for testing as it simply uses PlayBin, but can display the
pipeline being used for QA purposes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb    |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb

diff --git a/meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb
new file mode 100644
index 0000000..b543958
--- /dev/null
+++ b/meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "gst123"
+DESCRIPTION = "Flexible command line player in the spirit of ogg123 and mpg123, based on GStreamer"
+HOMEPAGE = "http://space.twc.de/~stefan/gst123.php"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
+
+DEPENDS = "libx11 gstreamer gtk+ ncurses"
+
+PR = "r0"
+
+# This is actually the commit after 0.3.1 which fixes a display bug
+SRCREV = "3e46d2e501da68d929bb5f26900a292a5fc04a1f"
+
+SRC_URI = "git://space.twc.de/public/git/gst123.git;protocol=http"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
1.7.10



