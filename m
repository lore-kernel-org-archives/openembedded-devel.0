Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PE6VL-0006Le-Uw
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 21:33:53 +0100
Received: by bwz10 with SMTP id 10so2161251bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 13:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bnGI8Sm15qdcZXtIT6xmqLWPx2CVCblRKmF2rVNWvRA=;
	b=B4NANQzSoKy9UQenpXgpiW7NVqWGd5YaNQzT7oTl/AVhWMzLAhj6XR1WG9YuxBhV/j
	z0uNgKzkyd+VgzIDxmiwGyo+VsgsAa5h5qQd24a9oneJFA426/kPm7ZnJzVa82Cl/pWo
	3IIzYezpJjfVjaIuHTIk5wwlbtl9sFn09Deg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nMe0aGrQD4a6gfDN7qpw5bHA8nAR1j0W0NQWmiTuMY9RkbulxrZwpCRjtFzqmt2tln
	mUS5mfb83tveN7qYMlqcXjyF/ZgtjGSopa8Za1VdGC/rTP+wmKH85HL8Q7zgXuePBSUx
	fOEx2gF2BrjGQHsOsQUn9AT3zTMxqlE0rJK/o=
Received: by 10.204.115.197 with SMTP id j5mr1046548bkq.205.1288902779858;
	Thu, 04 Nov 2010 13:32:59 -0700 (PDT)
Received: from localhost.localdomain ([46.128.240.207])
	by mx.google.com with ESMTPS id t10sm338358bkj.16.2010.11.04.13.32.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 13:32:59 -0700 (PDT)
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 21:32:51 +0100
Message-Id: <1288902771-12604-1-git-send-email-lazy.gopher@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gst-rtsp: added recipe for v0.10.7
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
X-List-Received-Date: Thu, 04 Nov 2010 20:33:53 -0000

* reworked old versions with common .inc file
* added version of 0.10.7

Signed-off-by: Maksym Parkachov <lazy.gopher@gmail.com>
---
 recipes/gstreamer/gst-rtsp.inc       |    8 ++++++++
 recipes/gstreamer/gst-rtsp_0.10.4.bb |   12 +-----------
 recipes/gstreamer/gst-rtsp_0.10.5.bb |   11 +----------
 recipes/gstreamer/gst-rtsp_0.10.7.bb |    4 ++++
 4 files changed, 14 insertions(+), 21 deletions(-)
 create mode 100644 recipes/gstreamer/gst-rtsp.inc
 create mode 100644 recipes/gstreamer/gst-rtsp_0.10.7.bb

diff --git a/recipes/gstreamer/gst-rtsp.inc b/recipes/gstreamer/gst-rtsp.inc
new file mode 100644
index 0000000..0d83097
--- /dev/null
+++ b/recipes/gstreamer/gst-rtsp.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "Gstreamer RTSP server"
+LICENSE = "LGPLv2"
+
+DEPENDS = "gst-plugins-base gstreamer"
+
+SRC_URI = "http://people.freedesktop.org/~wtay/gst-rtsp-${PV}.tar.bz2"
+
+inherit autotools
diff --git a/recipes/gstreamer/gst-rtsp_0.10.4.bb b/recipes/gstreamer/gst-rtsp_0.10.4.bb
index 2909c67..265f0f7 100644
--- a/recipes/gstreamer/gst-rtsp_0.10.4.bb
+++ b/recipes/gstreamer/gst-rtsp_0.10.4.bb
@@ -1,14 +1,4 @@
-DESCRIPTION = "Gstreamer RTSP server"
-LICENSE = "LGPLv2"
-
-DEPENDS = "gst-plugins-base gstreamer"
-
-SRC_URI = "http://people.freedesktop.org/~wtay/gst-rtsp-${PV}.tar.bz2"
-
-inherit autotools
-
-
-
+require gst-rtsp.inc
 
 SRC_URI[md5sum] = "8daaca1299aeb42c6aac47b30291005b"
 SRC_URI[sha256sum] = "1ebf3571d16dbab401f2ebf0362e3d67457fb88711ad15a4ab51bd3730267fb7"
diff --git a/recipes/gstreamer/gst-rtsp_0.10.5.bb b/recipes/gstreamer/gst-rtsp_0.10.5.bb
index e36f974..dbaddc3 100644
--- a/recipes/gstreamer/gst-rtsp_0.10.5.bb
+++ b/recipes/gstreamer/gst-rtsp_0.10.5.bb
@@ -1,13 +1,4 @@
-DESCRIPTION = "Gstreamer RTSP server"
-LICENSE = "LGPLv2"
-
-DEPENDS = "gst-plugins-base gstreamer"
-
-SRC_URI = "http://people.freedesktop.org/~wtay/gst-rtsp-${PV}.tar.bz2"
-
-inherit autotools
-
-
+require gst-rtsp.inc
 
 SRC_URI[md5sum] = "caca55e2ff497c0a327df3bc65a4a662"
 SRC_URI[sha256sum] = "a6f0a0c6c466683ee688aa8475623850fdacb549b2339a502831fdd3d74f984e"
diff --git a/recipes/gstreamer/gst-rtsp_0.10.7.bb b/recipes/gstreamer/gst-rtsp_0.10.7.bb
new file mode 100644
index 0000000..2b0b9e0
--- /dev/null
+++ b/recipes/gstreamer/gst-rtsp_0.10.7.bb
@@ -0,0 +1,4 @@
+require gst-rtsp.inc
+
+SRC_URI[md5sum] = "3c2e0bf09bb66e302b6c64cb9e8f1eb6"
+SRC_URI[sha256sum] = "53f352442db7b802248ea239b702e5db7e8fb5fe852f90e4e73c90204aa759c5"
-- 
1.7.2.3



