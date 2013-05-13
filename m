Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ubmwf-0006V0-0O
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 09:13:25 +0200
Received: by mail-ea0-f178.google.com with SMTP id q16so310201ead.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 23:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=5H+70Ipd7BeqJyCfR3u7nvTkvbfyiTmlajkkBwBx2XY=;
	b=njjVeNMaWc+WUfCxJZtjn9WpsbVd0uN9DN8t44Y/xeCpyBXeDbRvqw1PHXQVcWCn2/
	3RZLCjJ2mwvHownisjwEutXfbzX9WzokMjN3x5sGKZVubX6ungakIC3k9TofqFcqpkF3
	HYS2vXmZj+HjxEKUkcKd/f8c+dEldXZU+Zs/X2h050wxGq3b3spOQMTK6RCVsJa6KJTI
	GjlFKK8KNjSri9ZdCZboUSY+J/mmSoFYGwrAFyxrWk+F4/ORdCCqsQx44BsC87xpyJav
	OgbJYJM7BuH2LKnD1aWdKSZSW0ZNoUQjLDuzFh+Z/qvwA1dgns2XWkj8jQC7RHb7bj55
	e5Qw==
X-Received: by 10.14.108.1 with SMTP id p1mr75506938eeg.31.1368428107767;
	Sun, 12 May 2013 23:55:07 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id q1sm20848713eez.6.2013.05.12.23.55.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 23:55:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 08:55:00 +0200
Message-Id: <1368428101-22402-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQnnRDFpZcvO9h2yzFKf8VYYLBeXUtlB5zKFc+3MNq/48tXKElGdWqkLtZYpevBfGZuARBxU
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/2] read-edid: add 2.0.0
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
X-List-Received-Date: Mon, 13 May 2013 07:13:37 -0000

only build parse-edid, get-edid uses x86.h

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...emove-check-for-x86.h-we-don-t-build-get-.patch | 28 ++++++++++++++++++++++
 .../recipes-support/read-edid/read-edid_2.0.0.bb   | 23 ++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch
 create mode 100644 meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb

diff --git a/meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch b/meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch
new file mode 100644
index 0000000..4408002
--- /dev/null
+++ b/meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch
@@ -0,0 +1,28 @@
+From eb7590cc2cdd5c35403af4567d8524e017010f1c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 11 May 2013 07:58:17 +0200
+Subject: [PATCH] configure: remove check for x86.h, we don't build get-edid
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Upstream-status: Inappropriate [OE specific]
+---
+ configure.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ac85a21..f53e904 100644
+--- a/configure.in
++++ b/configure.in
+@@ -8,8 +8,6 @@ dnl Checks for programs
+ 
+ AC_PROG_CC
+ 
+-AC_CHECK_HEADER([libx86.h], [], [AC_MSG_ERROR([libx86.h not found])])
+-
+ dnl Simple, huh?
+ 
+ AC_OUTPUT([Makefile])
+-- 
+1.8.1.4
+
diff --git a/meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb b/meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb
new file mode 100644
index 0000000..b002906
--- /dev/null
+++ b/meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "read-edid elucidates various very useful informations from a conforming PnP monitor"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d0bf70fa1ef81fe4741ec0e6231dadfd"
+
+SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
+           file://0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch"
+
+SRC_URI[md5sum] = "586e7fa1167773b27f4e505edc93274b"
+SRC_URI[sha256sum] = "246ec14ec509e09ac26fe6862b120481b2cc881e2f142ba40886d6eec15e77e8"
+
+inherit autotools
+
+do_compile() {
+    oe_runmake parse-edid
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 parse-edid ${D}${bindir}
+}
+
+PACKAGES =+ "parse-edid"
+FILES_parse-edid = "${bindir}/parse-edid"
-- 
1.8.1.4



