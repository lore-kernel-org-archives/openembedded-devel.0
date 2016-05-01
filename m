Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7120D6E666
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 23:18:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e201so14797209wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=d3EbfPvGgQtoaRRs3PkPZQJRP0fQEZ+qRoXARwk+wVs=;
	b=scyZS8vQBvU2rdMqTI9VbHxsqqRoEwUAwNVU1HZNPo61YNDWV2/h7iPF29tz4WMEWh
	xWvoVS7t6hOkQBlXZ6c/eDbf1Bf08sM6kHCS4fSynLc39FSRa41FqiocMWKyuwJxuLqb
	yC0nfMSzhGx22o/t5X8cUAxicKfFMYwdygTJx0uSwTiy1qygW8yMxWG1I+B8UI78fiF6
	+bW2UfmVB0WaTtaO5FK/GdosAuPQy275lDEdYiJ1p96JO93Uvr0XGLO6UopbHTpTqXRD
	p3OuqOXgxdAVw0dbzYYMDY2sA9NM22CK/q9TZtYhcLhQS9qCfI4rjY6WzbGb6Oneai2v
	vMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d3EbfPvGgQtoaRRs3PkPZQJRP0fQEZ+qRoXARwk+wVs=;
	b=gxbkcgCLhE7jRBhr9QhMxYTLh7hod/Mu61oieePsEJf8IQxhCYtztbiDEHvjFCCU7Z
	UBKeM5czAfPw/znKiDGofZLAp4D/p/v4PiA7CqviRCXH6cXJIp6PcesSN+JA4n9GXbee
	A6o7TwK+TRx45OsS2j5pkbeyrPyc20M1wX3L5og+zQqrCtpXdGvfVlB8R9F91BmHwzQT
	CPXaZi4G+J8UiYwvwsT56NbrnNYsmB6F4x3jXz8AdTMTUAKKizRVgWXljwpon1SbAenn
	vxL5+izEDySffWhTzRY6mhUewvMG0/SBMTrndFKSL/XKDhOdl5tKa9wF5veRy+S7zjIc
	PO/w==
X-Gm-Message-State: AOPr4FXcRAVcJx2q6Q00lO/47zUm/GpXSE7t/x8ApzqD418/tGpAE5c8jV9LFSOYqcEXWg==
X-Received: by 10.28.194.69 with SMTP id s66mr16334954wmf.88.1462144687912;
	Sun, 01 May 2016 16:18:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A03E5.dip0.t-ipconnect.de.
	[91.10.3.229]) by smtp.googlemail.com with ESMTPSA id
	e16sm15572258wmc.3.2016.05.01.16.18.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 May 2016 16:18:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2016 01:17:49 +0200
Message-Id: <1462144669-18427-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
References: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] xfce4-eyes-plugin: update to 4.4.5
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
X-List-Received-Date: Sun, 01 May 2016 23:18:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../eyes/{xfce4-eyes-plugin_4.4.4.bb => xfce4-eyes-plugin_4.4.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.4.bb => xfce4-eyes-plugin_4.4.5.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.4.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.5.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.4.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.5.bb
index ee32219..4e4c410 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.4.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "136f52a256fad8cfd29fb2976e08ebc8"
-SRC_URI[sha256sum] = "240ce85b68d3d161f276ebbea97072dd6ee3df77062fd073bf6eeb4d3d1400ca"
+SRC_URI[md5sum] = "b2881924fdcc1230d9fa82c10f1a6afe"
+SRC_URI[sha256sum] = "648f7a1738d852af9482d11330b8ab33901f05256984de73d8cea4d7d7311937"
 
 FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
2.5.5


