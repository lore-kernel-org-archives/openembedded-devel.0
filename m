Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7F877D4C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 21:33:28 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c24so6625951pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vxjebdxDvvHyHXiEktu0hVD7igwC5heJ2XoIQ2iPonM=;
	b=foyCvw4rzEICwgTaX0HDAm+F4+MUMSHyEj7yl3bwv07PTdXNfFc68cQuPPSzFR5u6b
	Glq9JoZDe1TAfXpBsBoP+MCzLqaC3uogiWNJNK68eWS9ZIARzK67hsa3domERFteGaem
	57F4sJCDM5hX+ltSzQ9zflbrc/8JBvgyDJcwKYIwmWN0EgluWyXnXCQazSNQL1gdZFHc
	ZXz7OMH2cgLLu+Z8cXb/D+XCZGJ4l8RLMloN6eI2z7MMQ5a6X4S4X97H3hgVKruY0796
	R5YOwmNRMs1UMNUDlY+Jm07YvYJe1+9Vz8isW0xwsvLinJ6JfpUJa06BrasnPSA+GpnZ
	pFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vxjebdxDvvHyHXiEktu0hVD7igwC5heJ2XoIQ2iPonM=;
	b=Qa7Fhw8Z6SKQ3n0j2k02fwbKs7j4pDFX40DLiJmuUITLydmuhhJN3Rqp3chUw3+GXv
	Wfm0HHbul90zvfd/MzIW2aLD4IMjHZfGnagCsR30d0wQyMLHkH5gHyTEyeO59ERDch8B
	aKlNIWv+WNbMfTUcJUlpN3lTXwepoLWcns7V4SGGkWuwef9OocWT3p2k5beEO+s9skZ3
	E+ulpSzNbuGZjoG/IeNZUxJoGeD6ziZqDBonkvqbJ/OuTLzl/YFF8L9Qh7oST4K4N6Qb
	f6NGHdrcqAOpt/jMdMu7eEAL6PdPXHcWLyCOBeCpvBR/PSk3gEyqqKuAkLlG2JbkRenD
	AGyA==
X-Gm-Message-State: AIVw110B46yITFtwuowLbaTMMpdSnN9VEO443xG9rv8l7bQxS+lCKQBP
	YHwAgVhm5BV/mKS5
X-Received: by 10.99.8.66 with SMTP id 63mr10859pgi.15.1498944809780;
	Sat, 01 Jul 2017 14:33:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	k129sm26060081pfc.87.2017.07.01.14.33.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 14:33:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 14:33:09 -0700
Message-Id: <20170701213310.18913-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-multimedia][PATCH 1/2] crossguid: Add recipe
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
X-List-Received-Date: Sat, 01 Jul 2017 21:33:29 -0000

Needed by kodi

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/crossguid/crossguid.bb         | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/crossguid/crossguid.bb

diff --git a/meta-multimedia/recipes-support/crossguid/crossguid.bb b/meta-multimedia/recipes-support/crossguid/crossguid.bb
new file mode 100644
index 000000000..228b8b654
--- /dev/null
+++ b/meta-multimedia/recipes-support/crossguid/crossguid.bb
@@ -0,0 +1,25 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Lightweight cross platform C++ GUID/UUID library"
+HOMEPAGE = "https://github.com/graeme-hill/crossguid"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1373274bc8d8001edc54933919f36f68"
+DEPENDS += "util-linux"
+
+PV = "0.0+git${SRCPV}"
+
+SRCREV = "b56957ac453575e91ca1b63a80c0077c2b0d011a"
+SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	${CXX} -c guid.cpp -o guid.o ${CXXFLAGS} -std=c++11 -DGUID_LIBUUID
+	${AR} rvs libcrossguid.a guid.o
+}
+
+do_install() {
+	install -D -m 0644 ${B}/libcrossguid.a ${D}${libdir}/libcrossguid.a
+	install -D -m 0644 ${S}/guid.h ${D}${includedir}/guid.h
+}
-- 
2.13.2


