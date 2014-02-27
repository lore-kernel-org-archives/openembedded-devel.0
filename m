Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0276CAD5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:13:37 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id bj1so1888461pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 19:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1T/2IAIN15FamdlwRoNSNR9ZAnSzIwPFgyYIiOJ9JWk=;
	b=f8H76rD5QLSrr5iPMbBboLryP1ItPAXfbVW68ZqxIVJK6aP8zENEOQNkg87GygajbM
	JpvyJpp1OKYHI6+1FH9lHeYS0NfFilhku9PSZbr92ldfmXJV4YJ7WrI6wa+7iJrA3kxu
	slefadGsxQKlhfRKx0tyBtSYhSeSFiCoZHAxH3ForQDW5LNVsM1sP58k9FfK5TaYTWUL
	IVY3+2WIpPg5KRvZaKGNswtGRZgMLfxT0HaM11gKclFXDVsvy3f4WPhwaKLmd8Y9+zMh
	16m1KWNUKvXnaNL6ZQT0CKl5SciYxqCB+6frCpzKOM/NkHg/cTuW33SUTYEwz0LglxbS
	5A9g==
X-Received: by 10.68.212.10 with SMTP id ng10mr10764217pbc.95.1393470818577;
	Wed, 26 Feb 2014 19:13:38 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vx10sm20074695pac.17.2014.02.26.19.13.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 19:13:37 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 14:18:22 +1100
Message-Id: <1393471102-14702-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH v2] xterm: split out resize into a separate package
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
X-List-Received-Date: Thu, 27 Feb 2014 03:13:40 -0000

The resize program is useful on its own without xterm. For example, it
may be used to resize a serial console.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_293.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
index 67853b9..61bf71e 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
@@ -20,4 +20,13 @@ do_configure() {
     oe_runconf
 }
 
-FILES_${PN} += " /usr/lib/X11"
+PACKAGES =+ "${PN}-resize ${PN}-resize-dbg ${PN}-resize-doc"
+
+FILES_${PN} += "${libdir}/X11"
+FILES_${PN}-resize += "${bindir}/resize"
+FILES_${PN}-resize-dbg += "${bindir}/.debug/resize"
+FILES_${PN}-resize-doc += "${mandir}/man1/resize.1"
+
+RRECOMMENDS_${PN} += "${PN}-resize"
+RRECOMMENDS_${PN}-dbg += "${PN}-resize-dbg"
+RRECOMMENDS_${PN}-doc += "${PN}-resize-doc"
-- 
1.9.0


