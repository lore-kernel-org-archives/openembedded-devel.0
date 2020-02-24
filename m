Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD576168A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:33:54 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a5so8991463wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 05:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vZjHTV0U3iPI0JHEW8+8nRUonBD4bLrUaQ2c/NBKtDY=;
	b=WA1IJc0uzaKlsJU9Uy0huNbK+gJAXDa17YxVmFVSuLy57JM3DNrAvwZyqA0PZKHuYd
	kWcxPNM887x3oR8s/iwP/2BW7ilV7s8+hZht3EVGZoZEtu88ovekDC0bW+8vgNfygCSz
	OI42eRnzZxVF0DTphHZ1qGF0IUrfEO6fB2NiljZG8jipJEG1oDjRhJ3MLVoIxpmnefvh
	iyG3FctdWZllRUJucBu/PmeGDIEaqMYUj2Y1lxhkQXvAWfaauEt/6MDF/55Ape0d9fvy
	RpCI/Dimas7dJ+DeyBICvq7MlmJZl+GPWiRywgAdq9saVvSzd8a7abp50VRxVSmRlqh4
	x8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vZjHTV0U3iPI0JHEW8+8nRUonBD4bLrUaQ2c/NBKtDY=;
	b=q8tEwS3sGSWA0N2DsJBCkqdJNAT/P35cIkU9oWw5m0cw67iuh5c4apfa3jY+fMFj34
	lpEl4bghvZSwsC6q2HXGYWJaQ2yrRoRRwUYPlmnJNVMGyelyqJa+syubpEslCZpdKbxP
	uyInFouSCViLDhoIEtjU6EWPtn9sj05v76xIuyEta+vH0EFQAj1BrZWvccNA+21IaIL0
	ukCDE33tfq9HcBNEX+rZqVpbHUOPJ9oPoBncYOx6oPoXsQtXqEKdoKR8F2FiPWZf2lzf
	f1tzgcPGO1F3QH6o7Om4PhqNUq6XizhBEEBLaSHUElqCCkeQyjs7g/pxjIsFeiywkWd4
	HsBg==
X-Gm-Message-State: APjAAAVehboAsMGtLQiXUCJwwMbggxTUkScaXiFA6fXJeA/TirAXaCqH
	KrByI972KznAe/EfZNMRtRUhsAnURbE=
X-Google-Smtp-Source: APXvYqz3uSOTmi/PBS7BpNA6O8wNumiDtOvYD4bY9txmbYvV4Hz0UzLnJ6SgAz0gbp6qSssq1KQiYA==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr22041391wmb.0.1582551234955; 
	Mon, 24 Feb 2020 05:33:54 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0C8C561445DB707649E5F9.dip0.t-ipconnect.de.
	[2003:f0:7f0c:8c56:1445:db70:7649:e5f9])
	by smtp.gmail.com with ESMTPSA id
	q12sm3308572wrg.71.2020.02.24.05.33.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 05:33:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 14:33:43 +0100
Message-Id: <20200224133344.15280-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200224133344.15280-1-schnitzeltony@gmail.com>
References: <20200224133344.15280-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] xfce4-sensors-plugin: upgrade 1.2.97 -> 1.3.92
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
X-List-Received-Date: Mon, 24 Feb 2020 13:33:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Although not explicitly mentioned in release announcement it seems that
this is a develpoment release. It was tested and there could be no reason
found not to use this version.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ensors-plugin_1.2.97.bb => xfce4-sensors-plugin_1.3.92.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.2.97.bb => xfce4-sensors-plugin_1.3.92.bb} (86%)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.97.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
similarity index 86%
rename from meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.97.bb
rename to meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
index 4d78bb2bf..8b650143f 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.97.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "0c74c3112c5e6e07647c116cd43ff5a7"
-SRC_URI[sha256sum] = "7524ec4534de9ef7f676de2895a41bf70b73b94da5a27fd4a022b16eda56d0f4"
+SRC_URI[md5sum] = "7327c4c316ebd5d93665e77b432b8d89"
+SRC_URI[sha256sum] = "3dc6643d2c064b7718badff44b948f8d410f00f13db197820b26ae38045f5112"
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-- 
2.21.0


