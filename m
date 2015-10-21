Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9999A76102
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 19:40:29 +0000 (UTC)
Received: by wijp11 with SMTP id p11so204586wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=S/1LiIQFEEWkiBlCH4ClDMcX03oc64mdzr1f/3bMCmk=;
	b=q6f06MKKFUVwjTWpBYkF4NNlsbngDHCMBOxnlxz4CzKHTdAIARh1IDdZ6E3JnLG5zC
	sHoL0RM1S8WcPkkgVYEDzxuxJj/3tUGqfWsrpU4OuteXxrLbzONFCbwMr7ND2Od5o3L6
	nzHnNwlg3hFZRZmo465kMw0lC2WzcAyeJu/scT9UNdySfH5vodHUILaVi6qnchLMtZFo
	6uKfetJxI4onBtsum1K1zmca1kIKEWJyrNa4fVEyNez5HfbjPBduAM+9p5XO6FvX6TL6
	+2fz6Z8CpSCiGdpzuOEjCpmJVkT4mwIFRCyjeAq1XLeaFvyxkmSvPvle4DXTIf7P0wP5
	4Pqw==
X-Received: by 10.180.81.228 with SMTP id d4mr36868915wiy.38.1445456429248;
	Wed, 21 Oct 2015 12:40:29 -0700 (PDT)
Received: from localhost.localdomain (p4FDF14D2.dip0.t-ipconnect.de.
	[79.223.20.210]) by smtp.googlemail.com with ESMTPSA id
	g9sm6288wix.1.2015.10.21.12.40.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 12:40:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2015 21:40:18 +0200
Message-Id: <1445456418-2756-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1445456418-2756-1-git-send-email-schnitzeltony@googlemail.com>
References: <1445456418-2756-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsdl2-image: Initial add 2.0.0
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
X-List-Received-Date: Wed, 21 Oct 2015 19:40:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libsdl-image/libsdl2-image_2.0.0.bb            | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb
new file mode 100644
index 0000000..a6885da
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Simple DirectMedia Layer image library v2"
+SECTION = "libs"
+
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8f66a2e45aa301ea73b5ab275aeb0702"
+
+DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
+
+SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
+SRC_URI[md5sum] = "fb399c8386fb3248f1b33cfe81bdf92b"
+SRC_URI[sha256sum] = "b29815c73b17633baca9f07113e8ac476ae66412dec0d29a5045825c27a47234"
+
+S = "${WORKDIR}/SDL2_image-${PV}"
+
+inherit autotools pkgconfig
+
+# Disable the run-time loading of the libs and bring back the soname dependencies.
+EXTRA_OECONF += "--disable-jpg-shared --disable-png-shared -disable-tif-shared"
+
+do_configure_prepend() {
+    # make autoreconf happy
+    touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
+    # Removing these files fixes a libtool version mismatch.
+    rm -f ${S}/acinclude/libtool.m4
+    rm -f ${S}/acinclude/sdl2.m4
+    rm -f ${S}/acinclude/pkg.m4
+    rm -f ${S}/acinclude/lt~obsolete.m4
+    rm -f ${S}/acinclude/ltoptions.m4
+    rm -f ${S}/acinclude/ltsugar.m4
+    rm -f ${S}/acinclude/ltversion.m4
+}
-- 
2.1.0


