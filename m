Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC227887D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 10:10:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 9so10169338wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eeD/MlfIEoWIbmxneNJDxxMxDub1Ihl+UYTIm3LZvvU=;
	b=BI+iV7gvU1XWUKFO7uiHRVvqCbopowWo/yj03lRh0Sbbq4rPULUK+Ph55e1TLN42lV
	j09x/6renLGsdZXZWi45sixNKfAgnIOBghqO+XojhpoJungHGzqM/H06Fs39yylbQeyY
	9vvPbUFCLDSPRaGzVw+w1Z1wPd5BRODUPDQ0ussUjhfHw5I+ODdz5D5rRG9KbKQCnySu
	4kuteUpda7WyXsdllNW72xlswx2hXUXEPyPss43RqEb9Wd4hs5ULoi2zI3LVoe5IuUA1
	giNhHsaCYvIHACL/zCu4QMpbVRrYiqLSEdXTZNuPsrT+/WgVLJLveenj+nhTBYFweEA0
	JAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eeD/MlfIEoWIbmxneNJDxxMxDub1Ihl+UYTIm3LZvvU=;
	b=LlJaogcDt3wkWHKHG51CjIidGb5HAl0ID8PVkf5E16mTU+xWUtV+HEFTsHTVQCkuQw
	YTWdJF68uX81aw2wyUnZ7rQ/dvMcXJKit6vgkX9cned7SDQrCvzctkosw1tgQak8fNLK
	5RPqaPJ3K7d6FvP2Z2n5F5lwecFRpxN3onbB8ZuACjzlxDi07g3D2/z0URCe/qBSL4+8
	cK4GA5SFReSUuovn2dmmAvkW9XofQI1i2ctHABMsELobbLje8jUjBf3u6efr8vScjBes
	t+l9czsEZ3P+7va/w71chT+UM/KH31KnLvK+WhaINnZxKfuqjfVUnVLC1nMx/iwJCoNo
	vzMA==
X-Gm-Message-State: AKGB3mL4pztqDMe+T+GAOJySg3JIVCRGxnQt4hCDHem1Qro0ZyXnNFlF
	H8koAmr1lAkArVXm2waOZ/a3IA==
X-Google-Smtp-Source: ACJfBosC1FBiQapgg0i+s2HJTTc/amPPxfBe9ZaMkxEbMwoComBiRWoF5F582uI69VdZXfiYLGaZwg==
X-Received: by 10.28.111.218 with SMTP id c87mr1656459wmi.91.1513246206546;
	Thu, 14 Dec 2017 02:10:06 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id c3sm1840174wrf.21.2017.12.14.02.10.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 02:10:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:09:25 +0100
Message-Id: <20171214100929.11094-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171214100929.11094-1-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] fltk: add -fPIC to compile flags
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
X-List-Received-Date: Thu, 14 Dec 2017 10:10:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building yoshimi failes otherwise with many errors as:
| error: <sysroot>/usr/lib/libfltk.a(Fl_File_Browser.cxx.o): requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 542fd66..be76062 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -14,6 +14,10 @@ EXTRA_OECMAKE = " \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
+# for sake of other packages linking against fltk libs
+CFLAGS += "-fPIC"
+CXXFLAGS += "-fPIC"
+
 PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,"
 PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
 PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
-- 
2.9.5


