Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOULj-0004qz-Nm
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:11:55 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 06:58:06 -0700
Received: by mail-we0-f175.google.com with SMTP id t44so4477677wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 06:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=C8ru+9WwvlCiPJAZOjY72qNsoI96dCG8WpytdF+4kCg=;
	b=TAmoojZY4qFdcDDD1MlRNIZTal9LzOByLp3Wm1GMRsfgZdihv0b7qP2OOnKXniQ25q
	yPVfLpsgDn4lajsNF61e4yZXyIDh5UUle1NQiN8SQ4X8uUJ8lOlylHymhWI+41zKPaj0
	QB5mp0RbCcG57bQolPIyJtsk3gv6XgrqeiGHe2PIqAsD6aaeOwSjpeM1pxr3m8l2pJrQ
	bqUhu8T/ac+4e4yESFjpPiPI+WJXcER9Y8n4lNQ6KhbwuSSwEIqJzGDBfX49rn+/qXBG
	+Pxk9u1rPceNHP5u8e7GlIUryFVHZS7mqpiTF7lhqLdJR6pHemgmPe65h89SToFoFreW
	Tizg==
Received: by 10.180.82.35 with SMTP id f3mr4393545wiy.6.1350482308656;
	Wed, 17 Oct 2012 06:58:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ay10sm27761957wib.2.2012.10.17.06.58.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 06:58:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 14:57:18 +0100
Message-Id: <1350482238-27747-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1350482238-27747-1-git-send-email-ross.burton@intel.com>
References: <1350482238-27747-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlgg27MA4L8A2SsWE1+4g9Zz7zYgJaxgzTbeajxcBXGdjbVmo7vO/75EUjQSSiOcNPr9rZM
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
X-List-Received-Date: Wed, 17 Oct 2012 14:11:56 -0000

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



