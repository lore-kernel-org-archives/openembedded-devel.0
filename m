Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 979F27CE27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 03:56:46 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y8so11208572pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 19:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kjtoqs7if9pvaCMt0JJo8AVdzu4bQOQuAl3qn4s3ab0=;
	b=lItkXR24PuaLZ/Wmj3t/2QP8lVqE6NiQQ6aORvKpO1AflGwRrpR/Q9KFQYOjHA7wz7
	xsEOo3KlWuvig/98QD3tXEnfWuaAuYSxvTWlTYfmJ4k9HkP14SCXDHxzFjXACPfOoR/3
	gBpqBq4PeCswCBx5ZN/h3nLa/zOWLlv2oy+RO6sZgUTPnH9XrG7gRZ+OZF1W+8G9DA79
	/RuNfSpCFzdgfiyafuqpBZcBFqDFyItAw/NmohwQ+/UqRFVFpbcaM7vZyVP+I5EchKah
	6WV/sVKHJ6GXGE3Zs+S/kPW2kKC+EE4atcPoMvTescmMZHDEpv7a9rbqB/lebIPUMBF6
	hlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kjtoqs7if9pvaCMt0JJo8AVdzu4bQOQuAl3qn4s3ab0=;
	b=Bad3nGifW7rpUWHoOEtAJI/6A5v3cuZRbHsXTr2acu5EH831lotLDHO01eKd8ZgZHR
	2mR51IobgsDhJ+GqP69ecOgbe/iI7SkpaQ6sTvb5AOu6JLV5fBAb4R2iwZZjkb1rQRiD
	hjW3VlXWVdEGpU9a0PaIaM72rN0hLisyb8zOL/7mZOuAMHnmcNnl3kIpb0eV9IciS7nu
	6LIlls0GnsIRUNJK6O8Mgi8fHzgY5yuGhFoNSCIYha7W/PrOBCi42NcM8s3t/mzFAkNT
	+8SJ8ZcWzuhzEO/07alSAXlQBzCpAQZNZb3hCs0Uk/bd8gCuBZPMP1ZCUFDXFUBgHY9D
	y/HQ==
X-Gm-Message-State: APjAAAVSaut/A4+Yw0N+0S4h8QrcvnvRmFxOTO3BnRiGJwsTRKNE6X0j
	b00vLYHY+f8xI4F9+VND0Dcgo33U5M8=
X-Google-Smtp-Source: APXvYqzG4MzrxqEW78TF+bTJbKlAFj7Oq6WhBPzIFUDtOFgUlJ7Ey8X8aEikkbGiNwnQMhs5ARmaAg==
X-Received: by 2002:a17:902:a614:: with SMTP id
	u20mr50261851plq.107.1577419007021; 
	Thu, 26 Dec 2019 19:56:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r30sm36673613pfl.162.2019.12.26.19.56.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 19:56:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Dec 2019 19:56:35 -0800
Message-Id: <20191227035639.303716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/5] mpd: Fix build with gcc10
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
X-List-Received-Date: Fri, 27 Dec 2019 03:56:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ingBuffer-Include-cstddef-for-size_t.patch | 27 +++++++++++++
 ...-Include-stdexcept-for-runtime_error.patch | 38 +++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.20.22.bb |  2 +
 3 files changed, 67 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch
new file mode 100644
index 0000000000..1d869aa833
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch
@@ -0,0 +1,27 @@
+From c14877071f14b218835f7fb034dea11bd1ba56f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Dec 2019 09:40:16 -0800
+Subject: [PATCH] StringBuffer: Include cstddef for size_t
+
+Fixes
+a.cpp:3:1: error: 'size_t' does not name a type
+    3 | size_t s;
+      | ^~~~~~
+a.cpp:2:1: note: 'size_t' is defined in header '<cstddef>'; did you forget to '#include <cstddef>'?
+
+Upstream-Status: Submitted [https://github.com/MusicPlayerDaemon/MPD/pull/697]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/StringBuffer.hxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/util/StringBuffer.hxx
++++ b/src/util/StringBuffer.hxx
+@@ -31,6 +31,7 @@
+ #define STRING_BUFFER_HPP
+ 
+ #include <array>
++#include <cstddef>
+ 
+ /**
+  * A statically allocated string buffer.
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch
new file mode 100644
index 0000000000..1f11867191
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch
@@ -0,0 +1,38 @@
+From 06f78ced45f6622a2e02cd09e6a2c0c22a98b89e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Dec 2019 09:41:55 -0800
+Subject: [PATCH 2/2] Include <stdexcept> for runtime_error
+
+Fixes
+
+../git/src/LocateUri.cxx:65:14: error: 'runtime_error' is not a member of 'std'
+   65 |   throw std::runtime_error("Unsupported URI scheme");
+      |              ^~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [ Fixed differently upstream ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/LocateUri.cxx      | 1 +
+ src/pcm/PcmConvert.cxx | 1 +
+ 2 files changed, 2 insertions(+)
+
+--- a/src/LocateUri.cxx
++++ b/src/LocateUri.cxx
+@@ -17,6 +17,7 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ 
++#include <stdexcept>
+ #include "config.h"
+ #include "LocateUri.hxx"
+ #include "client/Client.hxx"
+--- a/src/pcm/PcmConvert.cxx
++++ b/src/pcm/PcmConvert.cxx
+@@ -17,6 +17,7 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ 
++#include <stdexcept>
+ #include "config.h"
+ #include "PcmConvert.hxx"
+ #include "ConfiguredResampler.hxx"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
index 6c6ad42375..133ee6e792 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
@@ -19,6 +19,8 @@ DEPENDS += " \
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/MPD;branch=v0.20.x \
     file://mpd.conf.in \
+    file://0001-StringBuffer-Include-cstddef-for-size_t.patch \
+    file://0002-Include-stdexcept-for-runtime_error.patch \
 "
 SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"
 S = "${WORKDIR}/git"
-- 
2.24.1


