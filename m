Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id B4E3A6C4E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 15:17:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z5so21174861wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 07:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vbzs3uyjVUDqe+RvdxrzXTn0o4qUd5G8XzrHmx1+jGo=;
	b=Gcj6cFXpeUaHrfsoxi1MXTmRkVCnWdgvEduqP0wvY6p/TQXUhS55/6Y+cAjFSQV1TO
	7l1RA1YDhaqw/Y3+pcpS/WL8/ihnNPDuFrQ8dS990l1mOujxF5EMvomX99R8HM6p3+Ox
	6QgIQZ/YTiOzVd0vBklK7XOtkdEIrKBjoHEEAkBrBg/PztmtIjPRBrlUlg+P9v+Y7M2T
	aijfN1VRFqgl/LkeBuTFYRiT2tMiDeTvUPQGSSo3XYhV3BJFEG4IDQqSrCPkWCE+xgNy
	2oWFO8I//sqwZ140OxC68+5aIPthQ+P7MdKkjZJ1kCSSsQWvbioKg/yG7cLrp0ULu+CP
	3QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vbzs3uyjVUDqe+RvdxrzXTn0o4qUd5G8XzrHmx1+jGo=;
	b=ATx9mIhxh/Qe+oRRRSKOaXwAXi2AjsyqLnCvu+clBSZ/hfp1U74kGWYfLowfZ3WfFH
	dfJTEoauIf6v14eVFPvrLQ6jotFNf4/WoWp8K3TwrcO+Q8fO+kbFyKp7mt61iKPdFCbu
	Yjg2zKqIhM/Dain7XbJ1uIk1PmdgMhfeG66IKMDJMTZ/GYVRAU3aIEO3b7zKKoG5+774
	OG5zAi626xZY2q7GuOy3HTR4vfv4hP2QnOgTUTuIVVHJIfx1MGGxapNxYyr0D3aKQnPn
	dqMbkdKkbjA2c/7miJ4uRhlSfxtlEJaSATEz6lBNyi/g12Bv5a2malgJWk9S6j8gH9iL
	6Yfg==
X-Gm-Message-State: AJcUukeEtMUXcJjIRI8+GycTi2KIAwehsElqggJxnT8I3mDyAKibAIjv
	+2hNdkYIxfXVuAXN3OoIpcvEWPGf
X-Google-Smtp-Source: ALg8bN79rMKbtjHhHhIZaWGkiohX4BWf6TN5cAHoKQVTfloTxbzSZfgQGLVg3xRZWtnzpOKEgZEcOg==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr24897602wrp.242.1546010247003; 
	Fri, 28 Dec 2018 07:17:27 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC09E931E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:9e93:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v1sm39228834wrw.90.2018.12.28.07.17.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Dec 2018 07:17:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 16:17:13 +0100
Message-Id: <20181228151713.19266-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181228151713.19266-1-schnitzeltony@gmail.com>
References: <20181228151713.19266-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [thud][PATCH 4/4] openjpeg: fix build for multilib
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
X-List-Received-Date: Fri, 28 Dec 2018 15:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: openjpeg-2.3.0-r0 do_package: QA Issue: openjpeg: Files/directories were installed but not shipped in any package:
|   /usr/lib/libopenjp2.a
|   /usr/lib/libopenjp2.so
|   /usr/lib/libopenjp2.so.2.3.0
|   /usr/lib/libopenjp2.so.7
|   /usr/lib/cmake
|   /usr/lib/pkgconfig
|   /usr/lib/cmake/openjpeg-2.3
|   /usr/lib/cmake/openjpeg-2.3/OpenJPEGConfig.cmake
|   /usr/lib/cmake/openjpeg-2.3/OpenJPEGTargets.cmake
|   /usr/lib/cmake/openjpeg-2.3/OpenJPEGTargets-noconfig.cmake
|   /usr/lib/pkgconfig/libopenjp2.pc

* Addresses [1]
* Build tested with poppler in multilib and non-multilib environment

(From master: a96e6d71)

[1] https://github.com/openembedded/meta-openembedded/issues/103

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
index c50d55e4b..d30ff4825 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
@@ -14,3 +14,6 @@ SRCREV = "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
 S = "${WORKDIR}/git"
 
 inherit cmake
+
+# for multilib
+EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/', '')}"
-- 
2.20.1


