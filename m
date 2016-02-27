Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4C74B77264
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 21:22:52 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id w11so922455wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bXKethqi6J97CXhFOcbdWjU/QYR0iFbgQuSeheOyVDU=;
	b=xZBhx42s7DtKTNwzJVybBPLcsKPW9tTUmaWZXDNkod5Ru5fIn1stJhUmJP3PjmWuoT
	FlOUdcnTBfvfPoRXx+yZyByR6FEG13KakQTTPz9xflJRxz1dXMjJYP9+jwVscBNjkqOS
	aIr3nGc42xFoYXHav5N7GFmPcrm3nZLjBV1lDCU8tsvBp8XaLrfePUMm1L4PwK58VRO6
	uD3DCeiWaKZmsNr3ESI5dwaA4ECdolBq4RhbPNstydcCYFO9AMVcMx52M6kMsILYK3g+
	YJjNn9sBafpMBr+KP2ENRH+NwaNZlPuLI7Qfu3Sr+ZnxwhGM72Mz+2Hkelbr0jDHCU1p
	mmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bXKethqi6J97CXhFOcbdWjU/QYR0iFbgQuSeheOyVDU=;
	b=D3O0fP0CVB3mOD2VmNcsLS5znOyGR65UkLUIlxcapxrN1QeoPYI3ScTzek65zuVA0v
	RpyLg/Ocz0NUroDSTzrvdBYkAJx6YiSZh69ZlRy/2PDbk7p8SoSwRLnvc074IWpCpfx6
	yR3jAdqTulNOwVNEZnqqDoe/2eUiXQYcW+iG0NyK/XT1hL4BD2d1SPRMQUn/OTfVIOiL
	UGkRUSx2ccOWyaS2KZp4MxpKs/0h5RMU6xGVwNpnGfElAbQ+2rlWuhhDc7XY4L15bU+M
	M22QhLDMVtVKfFlWjfEQL9SALNBlTiMb4SCv1yWaFR9VQ1xIlj5cZ36w3NEvc0MLtlIA
	VYhA==
X-Gm-Message-State: AD7BkJKMVn9DgY3u+gTVzSVneGGr54uzRefo9VKccd0wFwm4SusC6UhkEA582dIBRcyn6Q==
X-Received: by 10.28.99.136 with SMTP id x130mr4499637wmb.12.1456608173047;
	Sat, 27 Feb 2016 13:22:53 -0800 (PST)
Received: from localhost.localdomain (p4FDF0D70.dip0.t-ipconnect.de.
	[79.223.13.112]) by smtp.googlemail.com with ESMTPSA id
	w136sm8747615wmw.0.2016.02.27.13.22.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Feb 2016 13:22:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2016 22:22:14 +0100
Message-Id: <1456608134-4063-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] ne10: fix parsing
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
X-List-Received-Date: Sat, 27 Feb 2016 21:22:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ERROR: ParseError at /home/superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-support/ne10/ne10_1.2.1.bb:41: unparsed line: 'in .text [textrel]'      | ETA:  00:00:13

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 5bfe80a..4d753a0 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -37,8 +37,6 @@ do_install() {
     cp -a ${B}/modules/libNE10.so ${D}${libdir}/
 }
 
-# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations
-in .text [textrel]                                                                                     
-# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations
-in .text [textrel]
+# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations in .text [textrel]
+# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations in .text [textrel]
 INSANE_SKIP_${PN} += "textrel"
-- 
2.5.0


