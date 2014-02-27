Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1370C6F317
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 02:02:06 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kx10so1794882pab.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 18:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=828BL+mRuFS19EkInkRjkeCG/Gw35wJFFiq/oYw11JU=;
	b=vdg5/6s55ZopcXHjChtHKel+Ou0PQ1n2XVizIyPN2mWIlu72rY258notJu0at+2MW+
	hrjEql57RRtaBmQlTG/jGpOo6B2e6tsVA3iLHo4jcpSvv4TUigg1oOcXmjF1ZMqhe9g7
	fRQ+WZ/n596PGxAb4nLOhmPta8W7+/5FScrtXMf7b4eBeIyRXl5HRHoVZrgcCjzbVICQ
	yVnANsQ5YTOZ2uK4OMkS1crxTnaekrRG+oQpIwejhnxeWQ3yV1cMgWVcqr4p4EkMHKmv
	RNJvE0QH2djCe3FMgulcLUiM/RzVgeuwW6CkSDs1mb1TGNXBaij2Tz3reVsIR7FkyVkP
	N/WQ==
X-Received: by 10.66.250.202 with SMTP id ze10mr12416035pac.153.1393466527473; 
	Wed, 26 Feb 2014 18:02:07 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id c7sm7928455pbt.0.2014.02.26.18.02.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 18:02:06 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 13:06:38 +1100
Message-Id: <1393466798-13105-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] xterm: split out resize into a separate package
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
X-List-Received-Date: Thu, 27 Feb 2014 02:02:07 -0000

The resize program is useful on its own without xterm. For example, it
may be used to resize a serial console.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_293.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
index 67853b9..acc5b87 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
@@ -20,4 +20,13 @@ do_configure() {
     oe_runconf
 }
 
-FILES_${PN} += " /usr/lib/X11"
+PACKAGES =+ "${PN}-resize ${PN}-resize-dbg ${PN}-resize-doc"
+
+FILES_${PN} += "/usr/lib/X11"
+FILES_${PN}-resize += "${bindir}/resize"
+FILES_${PN}-resize-dbg += "${bindir}/.debug/resize"
+FILES_${PN}-resize-doc += "${mandir}/man1/resize.1"
+
+RRECOMMENDS_${PN} += "${PN}-resize"
+RRECOMMENDS_${PN}-dbg += "${PN}-resize-dbg"
+RRECOMMENDS_${PN}-doc += "${PN}-resize-doc"
-- 
1.9.0


