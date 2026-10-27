Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13113.1793082786500285351
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 23:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norik.com header.s=default header.b=mOR8UTUL;
 spf=pass (domain: norik.com, ip: 46.19.12.180, mailfrom: primoz.fiser@norik.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VjGpCl26FSAY7QjeRHd7jy/T3UkTayPwBGs2mzAbgJI=; b=mOR8UTUL5BXHYuNxMqFo6NyIZy
	rcViACfhLlE378LUcHUt8dlHmo7yhRWnafc3D2Rzxkkw0yTpsKBDf8snD4SKu8AvtGVr011u+miud
	mQDiVBzX3Nl+2Id664H3TlSx3IMXQY4nw5yBV+Ih6qYED1EIn/4AAhrJ1ytFosl81TshU2Ct7nyk/
	dri6ixyrp16j0wLFytyMItaf84bxjy4cM4IKQODfIiHHkWm98GdY5V9aHhEto8KXvVLzQSCzFIZds
	iyXxb7lE57Bt2lQaW45J/B2RKchT3J3HhTeVdexcMLNZkaQgrPIwtTh122VSBujIljxChHJk4s6KZ
	pu2aoaQg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:53844 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xLak5-000000004dp-3jk4;
	Tue, 27 Oct 2026 07:33:04 +0100
From: Primoz Fiser <primoz.fiser@norik.com>
To: openembedded-devel@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com,
	upstream@lists.phytec.de
Subject: [meta-oe][wrynose][PATCH] opencv: rewrite build-tree paths in all CPU-dispatch stub files
Date: Tue, 27 Oct 2026 07:33:02 +0100
Message-Id: <20261027063302.2742839-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131457
Content-Type: text/plain; charset="utf-8"

The recipe already rewrote the absolute ${S} path embedded in two
PowerPC VSX3 dispatch stubs (arithm.vsx3.cpp, convert.vsx3.cpp) before
packaging, but OpenCV's cmake ocv_add_dispatched_file() macro generates
one such stub per enabled ISA in every module (avx, avx2, avx512_skx,
sse4_1, sse4_2, neon, ...). On NEON builds this produces further
dispatch stubs under ${B}/modules/dnn/* (layers_common.neon.cpp,
fast_gemm_kernels.neon.cpp, conv_block.neon.cpp) whose #include lines
still embed the raw build-tree path, tripping the buildpaths QA check
once copied verbatim into the opencv-src package.

Generalize the existing sed-based rewrite to find and fix every
generated dispatch stub under ${B}/modules, instead of a hardcoded
two-file list, so any ISA/module combination is covered.

Backport of commit fdfca71954f5 from the blacksail branch, with the
same fix applied to the still-current 4.13.0 recipe on wrynose.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 meta-oe/recipes-support/opencv/opencv_4.13.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
index 981b06e33b4a..4891ad9a5abf 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
@@ -213,10 +213,8 @@ do_install:append() {
         rm -rf ${D}${bindir}/setup_vars_opencv4.sh
     fi
 
-    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
-        if [ -f ${B}/modules/core/$fn ]; then
-            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules/core/$fn
-        fi
+    find ${B}/modules -name "*.cpp" | xargs -r grep -l "${S}" | while read -r fn; do
+        sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' "$fn"
     done
 
     if [ -d ${D}/${bindir}/shape ]; then
-- 
2.34.1

