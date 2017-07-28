Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDE9784A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:03:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t138so8705041wmt.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CD+7TEdpmzyNpeF13h15Cd2+ic9a1+i1U6Bgg+lXCAk=;
	b=RaeLH324ohiYLBZlTOTODiB2Hokc1WhYZAelxijB63PE0bACNXKhuddwVGzw/jCY8O
	RMWuHtaQ3hjuOZiFaQiTrx2L+76Ia1Bi5faqOrfGbXcZCSJE5r1rp6bzueucDnwViP24
	1arz0nlGUoh7SgEzaSvsdu14dVmFkwgiFgFSDzkxNKOEKdlTYLgl6e4OGHJ6LznPCqWC
	ZyDBKht8vmbF4zHLhGbHUpDZ96byTMM7B0MOcVeofVaA3j9l9Rvk6SAF4XYzlJjUORtz
	76WJCF70EWWHtW5/hY8lvSiJsyw2r369RmA894ygM3W6B7i+SWiy5aYNFEmQZRsAZK5s
	CuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CD+7TEdpmzyNpeF13h15Cd2+ic9a1+i1U6Bgg+lXCAk=;
	b=K3XIfMiKuQQEr31B00d3vVNEg4n4sT9QS+hlLYCcLMQZDK08APDxRb5+hd7r5xL53D
	TixnVJpj4Y/xc3K3M6REbKBDRzAn6eP1i2qJDb2jA5WKCilI8iRT2iBsLxB+k1TuRpOR
	uDQwYNErbfykn50wcCEtdtAByq5pn91/+X0D9tO/gPgbuvrO8Tk/kHGIHYG+i8DhqNWT
	agUzVfW35IGw8U2sWBOkMugfV9UeD/Rklj82n2xYJd9bLodGPpN1Kkup0kBWBp08n+CV
	hl9BZ2L6Vq/prqsmBKsvNgZYY0+p6iLpaNrcF0AXyRPsnV3Ng76FH2L3kaGMT4jEfJlT
	PJzA==
X-Gm-Message-State: AIVw112kKBYuQWF4zfNzNH1H6sDj/HKhBE9qt0JPE4RCBDdIo+kCm7tq
	ceEVrg3VcxwPMeR8
X-Received: by 10.80.174.101 with SMTP id c92mr6675485edd.2.1501250618849;
	Fri, 28 Jul 2017 07:03:38 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.6])
	by smtp.gmail.com with ESMTPSA id h3sm6137096edj.22.2017.07.28.07.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 07:03:38 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:03:19 +0200
Message-Id: <1501250599-6900-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-multimedia] [PATCH] libebml: inherit dos2unix
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
X-List-Received-Date: Fri, 28 Jul 2017 14:03:38 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Drop do_unpack postfuncs dos2unix, inherit dos2unix.bbclass instead, to
make the code cleaner.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index bbbe563..16e17e9 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "libebml is a C++ libary to parse EBML files"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "\
     http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
@@ -10,15 +10,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
 SRC_URI[sha256sum] = "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
 
-do_unpack[postfuncs] += "dos2unix"
-
-dos2unix () {
-    cr="$(printf '\r')"
-    for f in ${S}/make/*/Makefile; do
-        tr -d "$cr" <"$f" >"$f.new" && \
-            mv "$f.new" "$f"
-    done
-}
+inherit dos2unix
 
 LIBEBML_OS = "Unknown"
 LIBEBML_OS_linux = "Linux"
-- 
2.7.4


