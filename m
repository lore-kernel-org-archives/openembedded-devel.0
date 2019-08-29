Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9286F6D470
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 10:39:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Jzd32jzjz2Y
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567075175;
	bh=TDQvlZhUfEolPg/APSr5h2hMVf3Fy5Amq9sjsftcWPc=;
	h=From:To:Subject:Date:From;
	b=t2n0gWizgT3abNkYETLxBpM9InGlAnDlD1Ufh20SMiOTinBMDWINQVcGuCRl2Gngj
	tJkzulwWcFWVccZ8bzWqT9hJcNrc3tj4N1LWmpHMfZhQ8+Yep//ai+CyiYbckiZeK6
	5VeczdUuAKAP6G3fx20XrUCnqM7m6PwsEuK92EdGxP6GlfqVPKQKndwsSX1Klotmbl
	PIfsNd8MrVKlVoQSJ6VjNCYOQn98IA59qYPFVLFzq0u5KV6J9hocqVpSVt6iyETRWT
	xq13oGsxNdmoc5N22eyS/U4mpbYNOhzpyay7A23qxmYCMhRRJb3R2DD01YfVECxRek
	fOKnOeCWhb5tzOeTelVxeTc3wOtRLhlYT6oYPUjFP6HO8cZpN2Fhj1Om1NN2lu6+gR
	KXon+4AZUdh9jIOyj4sS4PZZNyWfDYIPLTairqXuc2AhRIWcJSGnauT4xVGGtx7Jsc
	DPaZrOy6UOQxi67iZItYNPEOvtZqEPtrHPqY4gT3o0r86kbSKDEe96WNJQYbvpoQXL
	OeGVvTSi+Vy0duTCG3ApLEAvlA552AXLZ0DNBmoHU/FQV0HWcavw9YE0tcSETDB4LX
	zq6yZxMS9QqX6hOpsGNW9o3PK7QTOP3IrYg3phBGedRkJ4G3mJ4p99FEUOTaOGzt00
	D2/jOILq3up7zHEhuYdB1p7Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 13:39:34 +0300
Message-Id: <20190829103934.21804-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libwebsockets: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 10:39:35 -0000

lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    if (m)
       ^

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
index 50620d99e..fcabeb902 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
@@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
 PACKAGES =+ "${PN}-testapps"
 
 FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
+
+CFLAGS_append = " -Wno-error"
-- 
2.17.1


