Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C954571B20
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:58:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c17so633520wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dWF0MBt68E7ZLbofbC1uh2v+wSp+mz+6TGFB7MORxeM=;
	b=RXdo93OmO6Wb+ItifQXCgqGU9plHhlwSu4nbpRFMhIgi+pApOx9iKtyCjN3Xl0hujs
	gHDA2XcMJXpf3tsQq1Bggsz7SiZWhC1ulchW9wCqg8XBU2xGdAY49oMvLAfROrjZ0oz9
	FHJHWz1Z8jkC0jeg7NgYy0dcn8MTSPA3rd+I4/IaWSqi4EkQ/NApv+IaRupYMNtDnhB3
	P8VHwkd1JGczu7/Ph2X9OhLi2FzjDwBIrw21hr7PtnqcXnAXQas9fMizjcFwYX9uYv/C
	3S6kXCQ52b8ZpAGB7mfYnQ7cw3ENTJSOSvRMul/nJZny7UP/V4SJaH3soOxTvrYadFGN
	DCWQ==
X-Gm-Message-State: ABUngvejnVrqkmbFCBg4+vgCdwzZ3mjBVU9mlY2XYaeka0cFZnNOxmfrcFNTQZXt+1aQJw==
X-Received: by 10.28.198.67 with SMTP id w64mr3950209wmf.13.1478203128158;
	Thu, 03 Nov 2016 12:58:48 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id 71sm728726wmo.7.2016.11.03.12.58.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 12:58:47 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 19:58:46 +0000
Message-Id: <20161103195846.26528-1-git@andred.net>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] streamripper: add v1.64.6
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
X-List-Received-Date: Thu, 03 Nov 2016 19:58:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 .../0001-ripstream-fix-compilation.patch           | 39 ++++++++++++++++++++++
 .../streamripper/streamripper_1.64.6.bb            | 35 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-ripstream-fix-compilation.patch
 create mode 100644 meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-ripstream-fix-compilation.patch b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-ripstream-fix-compilation.patch
new file mode 100644
index 0000000..ecb18ca
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-ripstream-fix-compilation.patch
@@ -0,0 +1,39 @@
+From 600ee578b5779f08538e62a0758d2c2843e868b8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Fri, 28 Oct 2016 12:00:02 +0100
+Subject: [PATCH] ripstream: fix compilation
+
+| ../../streamripper-1.64.6/lib/ripstream.c: In function 'write_id3v2_frame':
+| ../../streamripper-1.64.6/lib/ripstream.c:717:5: error: unknown type name '__uint32_t'
+|      __uint32_t framesize = 0;
+|      ^~~~~~~~~~
+
+The already included srtypes.h does the right thing for all
+platforms (I think). It certainly works well here.
+
+Upstream-Status: Inappropriate [no upstream activity for 7+ years]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ lib/ripstream.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/ripstream.c b/lib/ripstream.c
+index c671e18..7f311c6 100644
+--- a/lib/ripstream.c
++++ b/lib/ripstream.c
+@@ -713,11 +713,7 @@ write_id3v2_frame(RIP_MANAGER_INFO* rmi, char* tag_name, mchar* data,
+     int rc;
+     char bigbuf[HEADER_SIZE] = "";
+     ID3V2frame id3v2frame;
+-#ifndef WIN32
+-    __uint32_t framesize = 0;
+-#else
+-    unsigned long int framesize = 0;
+-#endif
++    uint32_t framesize = 0;
+ 
+     memset(&id3v2frame, '\000', sizeof(id3v2frame));
+     strncpy(id3v2frame.id, tag_name, 4);
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
new file mode 100644
index 0000000..c470d3c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -0,0 +1,35 @@
+SUMMARY = "download online streams into audio files"
+DESCRIPTION = "This command-line tool can be used to record MPEG III \
+and OGG online radio-streams into track-separated audio files."
+HOMEPAGE = "http://streamripper.sourceforge.net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "glib-2.0 libmad libogg libvorbis"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+    file://0001-ripstream-fix-compilation.patch \
+"
+SRC_URI[mdsum] = "a37a1a8b8f9228522196a122a1c2dd32"
+SRC_URI[sha256sum] = "c1d75f2e9c7b38fd4695be66eff4533395248132f3cc61f375196403c4d8de42"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--with-included-argv=yes --with-included-libmad=no"
+EXTRA_OECONF += "\
+    --with-ogg-includes=${STAGING_INCDIR} \
+    --with-ogg-libraries=${STAGING_LIBDIR} \
+    --with-vorbis-includes=${STAGING_INCDIR} \
+    --with-vorbis-libraries=${STAGING_LIBDIR} \
+"
+
+do_configure_prepend() {
+    # autotools complain otherwise
+    mv ${S}/libmad-0.15.1b/CHANGES ${S}/libmad-0.15.1b/ChangeLog
+    touch ${S}/libmad-0.15.1b/NEWS ${S}/libmad-0.15.1b/AUTHORS
+    mv ${S}/CHANGES ${S}/ChangeLog
+    touch ${S}/NEWS ${S}/AUTHORS
+}
+
+# the included argv library needs this
+CFLAGS_append = " -DANSI_PROTOTYPES"
-- 
2.10.1


