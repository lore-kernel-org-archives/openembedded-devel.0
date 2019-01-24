Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7B6D6BB2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:14:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id d15so4197761wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cFv5XEu8WbFYdRDSX+t29PYaZIsnUTWGQ19kAoy5/Ow=;
	b=OgzBCKDSRHlD2OK+HS/YSCrKat1o4RWFTTE+vlDGMYFB2bVhfC+EUXiHzoLRqVYyWr
	hx1awTpxSl28pVAKWw26NjJO8ZNdZQPCH4YgEfqs+JumWb/nolqjb535H9dbYhpw0mdn
	kpvWEmqgD8sVVjK2geWtyK4gotwoPciBYSuYpeMRZe3J26a5hfzqh1H+Mx5vMXIh09s1
	pXt64qdwffukyujx5n9Vm+9jmyAZPTdutnqmDVCtY/vQVLpKHzjgcBX7j83mHoAL6ONr
	DVLV+deuEPfLfaZj8ip4SXmW8qxuDdEhBvHeJdgNJyz9a1qDQrs43QUGAe5XHVOewMwK
	ll9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cFv5XEu8WbFYdRDSX+t29PYaZIsnUTWGQ19kAoy5/Ow=;
	b=Dm7D2fHB+mTqkEYSYZotYUIohouiaXfauJhvxb8eOv1cKsHBoAcc9ADu1qIIfTjD2d
	BdjiCv9Tkq7ff+jop+ApQnud44krQwC8rZlGRzUR1stcjLg6+M10tTqz6865ItkUttOh
	eu428AUNZYxeNymHO2reRoGC7w56n0Lm2LysN1mtmAYoK7rfdONCP5/HX+V6LXN1EJee
	GuiuxjeQr7w7sFTGAFyq1aeBgyIBJegvt2o/YaJY0fqCk3gL0Ae8FT3XfwWmKRLRMg1A
	NxysvYCXCsALPzARRYUUecH/J7CD/gKgGBxo+OClYP0qNZvfDUAH6unMZ1MVYH0HdM03
	lj0A==
X-Gm-Message-State: AJcUukezfkQrLJYm/pSGBVttg6fvQv9JaeGIZg1D8aJh333TU2THm8Hh
	MPUFV0X0TOzRAemjiA293boir7xS
X-Google-Smtp-Source: ALg8bN6I/m0vg+mS7EErQyJ+Nu34U7D95I860sNwA+FcPGYsy1a7qq/YXBr2YHnyNOucTWSaYaN8gw==
X-Received: by 2002:a1c:2804:: with SMTP id o4mr3904877wmo.150.1548353653056; 
	Thu, 24 Jan 2019 10:14:13 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	c10sm100318274wrw.49.2019.01.24.10.14.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 10:14:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jan 2019 19:13:54 +0100
Message-Id: <20190124181355.4609-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124181355.4609-1-schnitzeltony@gmail.com>
References: <20190124181355.4609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] xfce4-whiskermenu-plugin: upgrade 2.3.0 -> 2.3.1
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
X-List-Received-Date: Thu, 24 Jan 2019 18:14:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.3.0.bb => xfce4-whiskermenu-plugin_2.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.0.bb => xfce4-whiskermenu-plugin_2.3.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.0.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.0.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.1.bb
index 24a32fc0a..c2a37abf9 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "d2383c3eb1b54adf5a206973bd20f159"
-SRC_URI[sha256sum] = "7e569bb0dff7e3db3d964e23323f54c6de7249741c6a0e33a0fa501d83040b16"
+SRC_URI[md5sum] = "ed16fcc671cb4e4853701b81fdb5dcee"
+SRC_URI[sha256sum] = "22fb7277adc2e2313dfada03d69040edc3ac2c2080104cbdd9a3c47ebad0cab2"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.20.1


