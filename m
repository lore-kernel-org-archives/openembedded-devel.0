Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 587D06F532
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 04:30:57 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id bj1so4644742pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 20:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h5ojLQeB5p8TBK7kaJ020Yh4gEcSb7IpDoNvOQTLYM8=;
	b=WjAQbfoYxcVyu2adNAKGHcHjtD6roQO8hVxJz1Nvv8zS7bVB9z9WZb39YTGX88lPZG
	xfobBtwJkXZwUmKIamdPZgN0EcG5vqkSpj4RGrCY6TxQDZQKNO5PaGpZrOUEcj+stq45
	g+FcoYSRTUIuYeNZXWFEjHVFaV7eAJ8dBTdlRUpvimIG288BVe1x1CCUkPC4ocGSV86Q
	i1nUSuKfrlzshPx2Nbgx1cZRI7UXjiFTq6sJo86ACXBIIe25yFI0bFqHslM6OBvi5+iy
	r/8RJ7Ogr20JgBFD/IzwJEE0ATmlecJ+BRKU548WU9YTnLS9XU9pHRdSqn7Qbv5OM0ac
	E5RQ==
X-Received: by 10.68.76.68 with SMTP id i4mr23401483pbw.73.1393907458073;
	Mon, 03 Mar 2014 20:30:58 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	om6sm42382949pbc.43.2014.03.03.20.30.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 20:30:57 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Mar 2014 15:35:54 +1100
Message-Id: <1393907754-12236-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] fbgrab: fix installed but not shipped warnings
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
X-List-Received-Date: Tue, 04 Mar 2014 04:30:59 -0000

WARNING: QA Issue: fbgrab: Files/directories were installed but not shipped
  /usr/man
  /usr/man/man1
  /usr/man/man1/fbgrab.1.gz

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
index 2b04c74..48edc2c 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
@@ -12,3 +12,7 @@ S = "${WORKDIR}/${PN}"
 
 SRC_URI[md5sum] = "15b432735d6efd0373722bb96577b945"
 SRC_URI[sha256sum] = "61e0772ad6ea744ee597ae478398ddd0ba6fceee2cf343859bebde2c15bafb91"
+
+do_configure_prepend() {
+    sed -i 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' ${S}/Makefile
+}
-- 
1.9.0


