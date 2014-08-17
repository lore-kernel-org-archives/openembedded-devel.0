Return-Path: <andrei@gherzan.ro>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id DCE7970DFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 15:56:49 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id ty20so3741706lab.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6H4DvnBcI4kF8z1zxu5NqhtvfvBHex4d7vaDAvCRsTc=;
	b=KqyvFqzCmUzkhTr2gmWQgkGOY9+Ny5aPxmCe5QkYMtkXCwcq/GLa1Bos17nv8gnlBK
	6UdwDy49IYREZ8pqOx1A2JcirBfChUHI+96IcYMIJDS+gZQEhqYFQ5TEND6E/YjMvILD
	MEaOttwVjfKfsqGEavZsIPNh2rkySnidsf08Y4OetV1IyGY7JzebB/SNqTRQXfQL0RIq
	Eyn4Pw+75gwpD+uQBGK2lpAplG9eD3v/08yIcCuYNsToVnRruCIhR+B9npcRviflI9hk
	yzXOf8C7DawsuGllQr/wqVYJLh6wY+hQEyQMyU89jYhdXZG8YXrGogYgdYe2LI6WYOQ1
	s6NA==
X-Gm-Message-State: ALoCoQnAymyhXZRhpke7IT7yBbkfR+Byc5Y/hHbha7SFhUniOmRzaQJEP8dZ8YnLXJqXS27EnhWR
X-Received: by 10.152.5.42 with SMTP id p10mr3400722lap.82.1408291009580;
	Sun, 17 Aug 2014 08:56:49 -0700 (PDT)
Received: from otp-agherzan-l1.gjk.dk (dhcp-189-34.gjk.dk. [195.249.189.34])
	by mx.google.com with ESMTPSA id
	sc8sm22808212lbb.27.2014.08.17.08.56.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Aug 2014 08:56:48 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Aug 2014 17:56:41 +0200
Message-Id: <1408291001-3603-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.9.3
Subject: [meta-multimedia][PATCH 1/1] rtmpdump: Integrate v2.4
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
X-List-Received-Date: Sun, 17 Aug 2014 15:56:50 -0000

Change-Id: I2d8e84189674074385c41f50dc535081e9c845af
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../rtmpdump/rtmpdump/fix-racing-build-issue.patch | 18 ++++++++++++++++++
 .../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb    | 22 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
 create mode 100644 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
new file mode 100644
index 0000000..bb3d8b0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
@@ -0,0 +1,18 @@
+Make sure libdir (SODIR) is created when running parallel make.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: git/librtmp/Makefile
+===================================================================
+--- git.orig/librtmp/Makefile
++++ git/librtmp/Makefile
+@@ -107,6 +107,7 @@ install_base:	librtmp.a librtmp.pc
+ 	cp librtmp.3 $(MANDIR)/man3
+ 
+ install_so:	librtmp.$(SO_EXT)
++	-mkdir -p $(SODIR)
+ 	cp librtmp.$(SO_EXT) $(SODIR)
+ 	cd $(SODIR); ln -sf librtmp.$(SO_EXT) librtmp.$(SOX)
+ 
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
new file mode 100644
index 0000000..a1e6502
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -0,0 +1,22 @@
+SUMMARY = "RTMP Dump"
+DESCRIPTION = "rtmpdump is a toolkit for RTMP streams. All forms of RTMP are \
+supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://."
+HOMEPAGE = "http://rtmpdump.mplayerhq.hu/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "openssl zlib"
+
+SRCREV = "3121324046e4ca1934e7e28293fc8326475d5053"
+SRC_URI = " \
+    git://git.ffmpeg.org/rtmpdump \
+    file://fix-racing-build-issue.patch"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep
+
+EXTRA_OEMAKE = " \
+    CC='${CC}' LD='${LD} ${STAGING_LIBDIR}' \
+    SYS=posix INC=-I=/usr/include DESTDIR=${D} \
+    prefix=${prefix} libdir=${libdir} incdir=${includedir}/librtmp bindir=${bindir} mandir=${mandir}"
-- 
1.9.3


