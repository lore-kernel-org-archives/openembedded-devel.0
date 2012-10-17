Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOUin-000275-Tx
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:35:46 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 07:22:26 -0700
Received: by mail-wi0-f171.google.com with SMTP id hj13so673963wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=C8ru+9WwvlCiPJAZOjY72qNsoI96dCG8WpytdF+4kCg=;
	b=Oel1Cn5kMGZohtIS+kWJIU88F7JgavUkxBRIyIj8/G5CztMq5QKVfdoOWi9fmQTUN6
	bvOGw5H+NuBUY6zTtJXPTa9X2wRsQ30KeORb8/7Zehf5tuWj9SagAaYNR13EJXh5tdzx
	notTj8cVfwN49YsHDCwkv6+3QnETKamQfJqFK1KXDmF/BjXpwZJS7QJr+6cr2LP25QuR
	Z0o2/BLQXyLhkS1ttoCgcj9ABTU3OVG91m7ibhas4abjVdMXbs0KSbeJXyAcNxooAlcB
	7E7zP+m7YJ3pTKU3WZ8J64HFmgCljV0738TdgaXjaNw/sP4Bh1s+O96tzy1RxTpcXjG2
	lWlw==
Received: by 10.180.99.99 with SMTP id ep3mr4495563wib.15.1350483744213;
	Wed, 17 Oct 2012 07:22:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bn7sm27887640wib.8.2012.10.17.07.22.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 07:22:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 15:21:11 +0100
Message-Id: <1350483671-28179-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1350483671-28179-1-git-send-email-ross.burton@intel.com>
References: <1350483671-28179-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlPG1ofkw19wRc4QcJyN0XYlbrmrTd2V76XSSmPk3aRaFv9JbmfBOdrkRCahD8wdVuSM5x/
Subject: [PATCH] [meta-multimedia] gst123: add package
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
X-List-Received-Date: Wed, 17 Oct 2012 14:35:46 -0000

gst123 is useful for testing as it simply uses PlayBin, but can display the
pipeline being used for QA purposes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb    |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
new file mode 100644
index 0000000..b543958
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
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



