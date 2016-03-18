Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id CA13360290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 16:51:37 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so38361275wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gbvvJBDmZRuj6aEKFq6AKuOZ1V/21jDfyRwlMWgHLAA=;
	b=yuBJPGjP7SJOnippfFVcXNnpovCJLlwAdps9WogYBpjAJATceZLHQ/4jlq45GxTYfZ
	Elbs0QK0p4/jrgwz2Lsci1dPlxC1V2pplro3da9zIIt+gjJB+Ovro9RfyFug1JfP1sV9
	ya50lGRYIRXsJ9uAfSYC1qacJfW6YVnsAuH6QiPueJyKQWseLf/3OZuQ0mp9UveWdC9d
	nEjGkMZY6RwxeAUxYpvi3vtDEiV994GvGU5c4wyPI4DhGLmiE6oPwYwhHefApKaIbHaq
	Zyo9bAX6kQxzDGK0uO+FT628BJC853sKLtx6QVZmIGa9Xw3a3EqnqD1RuzNWMIvWdWxl
	GL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gbvvJBDmZRuj6aEKFq6AKuOZ1V/21jDfyRwlMWgHLAA=;
	b=UTY8BJFWSh10xlGd5uhDedFLP9Jys7njgShLo5wf6TnGhBOQlL4O4wDL+NaaPdd6J1
	+eLnV2+HXQBvbBV2nXiTd74RojUKLFrL0kY2quyMucIwX8bjAc47aFlX8LhdtEgsGWde
	hthzD41eVZDfZGH7ZOypAfQMZZVQPx+YzEcQQHsqzlVVIz0LAfzzay2YbLpFKLNrPOn/
	8uiL53rWGRsVIHC+MKMz0NcFhnMkJz4O507fwgg5tWc7twRorztbitIZLFRGyQOGsgPN
	e7ilmTot7OPr92Xxck4T6/QsNAo33tpNoJlUI65liaYAC3Q41EkVGykc/Cl7h8XPZaR5
	aK0Q==
X-Gm-Message-State: AD7BkJKkiupdP596KIXoTi20BKy/dgCrvxdSHOgyIJMWoPWtZAkQK0kNCvhqozRdqno6+g==
X-Received: by 10.28.188.5 with SMTP id m5mr339349wmf.35.1458319897554;
	Fri, 18 Mar 2016 09:51:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jv7sm13007228wjb.36.2016.03.18.09.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 09:51:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 17:55:30 +0100
Message-Id: <1458320130-30349-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-xfce] xfce4-clipman-plugin: Add PACKAGECONFIG for qrencode
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
X-List-Received-Date: Fri, 18 Mar 2016 16:51:39 -0000

* fixes:
  WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
index aee4a3d..a07f3cc 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
@@ -13,5 +13,6 @@ SRC_URI[sha256sum] = "23043f99c3e5257d1f3d68b5ee5125e3469c15620d098e22c625038619
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[unique] = "--enable-unique,--disable-unique,libunique"
+PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.7.3


