Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A649A77AE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so4747714wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gqfJ+eHRnkNGVoqs7/4ntfo/N3yeNdbYMrEnDd3+gsA=;
	b=XklEWEYuXJvcboPYYTNew7LDVtZAHl+XBzjH4Of/WCqpCe9zftbRXMFL9tIAssJ0C9
	VQGl15ulHp7geluoUxK9U/UxMTuKaD8bmoQG+04FCxgDOPGaPqt0doZzYL/9kb68+bgH
	pyAt52mEC8PhVHsB5dP5KdfNDirMOo0cKpXCqNPVcUCFHNHiH4sQRoJFE94wQzARQaw6
	V2b11ce1GhVCbI8BF1kqTeK86u7TKqYXAfDZaBKc4+73TFlths1dP6lEWg5iSAsldLc1
	W3GPwkucfujEnIO7l7L3rcJAY7SAID9hhUOjFvpgynNGNjQw1H6g0yVoxuDQqVhQT57r
	mV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gqfJ+eHRnkNGVoqs7/4ntfo/N3yeNdbYMrEnDd3+gsA=;
	b=ZAERqznCAFOrz5tN2ZIU49KwFXwWuUUKfa7wUChvqScx4tkCerEWub963wu2kFVk0g
	PYeYCp4m9ucyACI/+9x793rtCpLRMaNejaLfOtScMnsfosaM1qLW64MenACKoU0QYf9s
	E+iFN/8kHObjl62RTFKBPHRhjIpmAv2OvulFadDPLPUAuTlQVGSU7zd2f/iIer9dol+C
	6H/I3UIbyndt4edshVYA8DqgynA/V3FygqI2PUDZlKEseE+VN+wjIkKew7ubB71h5Dtf
	Oo2z+dQOxt8ZV+kg3LUBDJxoB+oP6ToGP6bQBm/pPP3oL3nP7Qmg2cKau1Wscno4UAwP
	EJlQ==
X-Gm-Message-State: AHYfb5jSG1iDshI18KK6wiAs1SbfaIja5qASoHGydsIyqDjjWM6BvZB9
	ZWA+V1p9Gh9AhzZG
X-Received: by 10.28.111.66 with SMTP id k63mr4248589wmc.165.1502228317240;
	Tue, 08 Aug 2017 14:38:37 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:16 +0200
Message-Id: <20170808213821.17561-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] xfce4-whiskermenu-plugin: update 2.1.2 -> 2.1.3
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_2.1.2.bb => xfce4-whiskermenu-plugin_2.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.2.bb => xfce4-whiskermenu-plugin_2.1.3.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.3.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.3.bb
index 46b508a..3c67a2f 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "eb07c2107c9d1276e9b1bec01f7347a1"
-SRC_URI[sha256sum] = "efd95c330055fd7901a59a48569d14885c168017c5fdb2e233976a78bccb8923"
+SRC_URI[md5sum] = "032a2bb0a0d4a2e3c8c136910c8b551d"
+SRC_URI[sha256sum] = "e8918c1255f7ab86b950ebd13555fe87046c01a1a4cb0b5d460024b6efc01769"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.9.4


