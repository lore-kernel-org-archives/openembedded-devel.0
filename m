Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkYXM-0006MB-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 12:07:09 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 02:52:26 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so4538266fav.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 02:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ehQZsE9psht4A0aztu7foXI+nj0WDbpTd912FZ4QMe4=;
	b=Sjp/Y5Pf56EE4dzFWYE8ZWxiUedJVseTc3YeJv+MaIpCIH2qyXJVouXanfz8eHu/eP
	H/omklI/rhl4VHLDIxzaKfiOnzUjv/2PRb1QTGYjgwTHihNpeC/M8Yo8zeJ6xN+RsrZI
	zX9qSDtmSI179KA8VUqhaX1/FvT1q1RhE2jpgdAtUd3eZqgKN1KiXqWf1wf9P4g8ThXs
	sVphUOJA7KqApkSuJi8SqGO0E3Tj0sbPdVlzz2cZ2uvRtIgv0Gs6YT0urGyPzFkGTJXZ
	VyXh5Mb9VZ24phcWIQl7NYHuFjNw7QEqB+1mPbaQ5iW0eaTNmJvqCz0ayjOKlil43p0i
	tR8Q==
Received: by 10.194.236.166 with SMTP id uv6mr16118995wjc.34.1355741544885;
	Mon, 17 Dec 2012 02:52:24 -0800 (PST)
Received: by 10.194.236.166 with SMTP id uv6mr16118976wjc.34.1355741544729;
	Mon, 17 Dec 2012 02:52:24 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h19sm10551095wiv.7.2012.12.17.02.52.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 02:52:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2012 10:50:39 +0000
Message-Id: <1355741439-13106-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkK6nm73OC8wq6NLDa9yk/yA3gEVDuBGGTfgjYbCnhTNquKWO5fOG+BD+pwTlZm7/oUReJOAvHDUJK+cvBAEuGo7yvVVfoLHgnoTkozW4Y/DAls8gwHW0/ZPym/nSvC9kV07xk2j0JEo/dM9PhbpnDxzHsKk3tT4oV8AQuDg37L+nUT3AaDHuPKYPnWbS6P7MwPcZcI
Subject: [meta-multimedia PATCH] gst123: add package
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
X-List-Received-Date: Mon, 17 Dec 2012 11:07:09 -0000

gst123 is useful for testing as it simply uses PlayBin, but can display the
pipeline being used for QA purposes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb     |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
new file mode 100644
index 0000000..ce7d669
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Flexible CLI player in the spirit of mpg123, based on GStreamer"
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



