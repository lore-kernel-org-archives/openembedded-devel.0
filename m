Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0519977D5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:04 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o21so5800626wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BQo/yz62AA3rmQtS62pGivDNjMTqVtC1blZNKVx8LPc=;
	b=UuNPUJOwmRl5m+DoCV2MAwepRiowcXqejB9Z1hLsYLPKtACIJdd1UGBrYAZ+KX0VLQ
	P3dZjE7IBkHs9Lz7JNHv82lJRaCWFKjybLBZQJyCX4iXp0QQluH8Q2AVH8/jC9p9uQqa
	BL0oFus4R027ywkYkJmDipL3dma41/vClzvj288fysBWnv+9l/ta5vKejq2kARUeAl4L
	Kr6VC8RzDsvj+TCAsEGzUI9xcfjcSJEUpve1ZJUupKE8pl0YWa6Tik7ddFl60OzdpdTs
	G8tWzTAGsbdQMYOuzl3/u23fpVIu5vg/thwbBCPsqBFqJVIjXm/zYeWJhtXUgjCRd32n
	g4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BQo/yz62AA3rmQtS62pGivDNjMTqVtC1blZNKVx8LPc=;
	b=LKZFV2SdKEhMbv4u5FTVZqg440el72oUNfzHSWcR2YizYsUNQ7KRGnX4rHUFLRkVDX
	M0OJN5gOitE1drRO1r8L2fYGL6J9S59s1V8baJ/XJ9Dv2lNuAu+B1fXkEpY/vEsXu7Us
	J6NgmF3G4gtTTRj9Z1AhmDHysfCoVEAOLeqNBho8jOR40Ai9ry+/hKcoJQEbVrk58fFz
	U113RgeDJCuMlt7CygjQfH9Aue7MOGDFASuoEcoFu3oXmacOadZwWufQ+gmtkMvdtAqr
	qejXoQtlJ6z72DiGSUunZdDsywqrxHk+HgwOdDLeQn3NdKVRzwoUfHF3UFleXEqJpUzA
	JzWQ==
X-Gm-Message-State: AN3rC/4BdPVJZlxdO2el1j6N+kelQN6abUS6auiDe7uX7kynzOtD4l2+vSQtGxZ+lEFmnQ==
X-Received: by 10.223.131.229 with SMTP id 92mr4372938wre.181.1492027025922;
	Wed, 12 Apr 2017 12:57:05 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:25 +0200
Message-Id: <20170412195638.3243-17-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 16/29] xfce4-whiskermenu-plugin: update 2.1.0 -> 2.1.2
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_2.1.0.bb => xfce4-whiskermenu-plugin_2.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.0.bb => xfce4-whiskermenu-plugin_2.1.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.0.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.0.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.2.bb
index 81be871..46b508a 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "29240011d455d0fc591b4a1e2262b7a7"
-SRC_URI[sha256sum] = "7e25706376e00fd216a9295aca3d0ff9f34bc13d4962bb6217e5f4270b973a80"
+SRC_URI[md5sum] = "eb07c2107c9d1276e9b1bec01f7347a1"
+SRC_URI[sha256sum] = "efd95c330055fd7901a59a48569d14885c168017c5fdb2e233976a78bccb8923"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.9.3


