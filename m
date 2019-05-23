Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B58C27E407
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j187so4506989wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YtdIaC5ayUdxPNND4oCdXTfuXoMF4likPFnWNG3OHiI=;
	b=sDZd5MS0OoS9M32S9iz/DT5ByFRGfEwk7kioOMna3sa/Ayj1qeu24Fw+ccJPkZoSuG
	pjgJCp3LIpjymLrQQn2zZk+hiEgmKToymcRQnHjQPJELCKGQD277VQrhuwokbgWQ+iw/
	mGl9BpR2phhF0hvnN3m6XuSAuWpwKV6qmJozWXEFC6FcgtNYmrsTfB6p/y2NrRkRmBfF
	kEfJJxCopu9rDSkJkHGhFmLzSmCqVpdcvg9mKhNShrcq1IMOEa/f3+ONv9RPnMkgJwXz
	LTr6LNph1dcMKUPGr2AGelRhP9GUF4Xl6OnS2zA95KTuWD0hf9ere+iym6/tUSgX4nfa
	eBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YtdIaC5ayUdxPNND4oCdXTfuXoMF4likPFnWNG3OHiI=;
	b=eFcpc3pFo3ngFOefXhgLa/upV8Fo5sDCSNPknfgO1MwLVrHxJ0wkreDvW+TqfWNvzv
	m8BUtCqZlNbbCaeDccQRiV81jB51mjobtt9bLp0/rOuvynBAxA3A9sWNudfl0Dl0zqd3
	J8JyBU8a6qiqSvtNoXDTagi6LkmzRNdjRpjPhLM9OiaD1mUGB6C5I4XENucqmr2PyjgA
	DteVyZmwcx26anNJaYWxh6TgULwM/W9cBY8zRCsT7ImTbyTuKyF1sbvlC0uMQCLulVAp
	/6TcV9M8eVRCnaFKOvmis3yduBThmWlzm5lmJ0jc8R1hrWH2igIaguPOmGzkp8oy0fPs
	NC2A==
X-Gm-Message-State: APjAAAX5HK+jXVyZ03BYPt7AABuxHjoplkhXXW4uKlT+eH2bCPxvNayJ
	zHgLz+qfv2nJodW0Sb0YKYAtC4+cyI0=
X-Google-Smtp-Source: APXvYqx6Ay7FYscoWeKlWdBRsHHsOm8l2py4rEtF2iEA/zEGWEmfZZSxurS7JagQiE5ldt68/jndkA==
X-Received: by 2002:a1c:cb82:: with SMTP id
	b124mr10599656wmg.107.1558594151152; 
	Wed, 22 May 2019 23:49:11 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:22 +0200
Message-Id: <20190523064859.24336-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/41] yelp-xsl: initial add 3.32.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a dependecy for upcoming yelp-tools.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/yelp/yelp-xsl_3.32.1.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.32.1.bb

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.32.1.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.32.1.bb
new file mode 100644
index 000000000..8c60d6168
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.32.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "XSL stylesheets for the yelp help browser"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=3e2bad3c5e3990988f9fa1bc5785b147 \
+    file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
+    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+"
+
+inherit gnomebase
+
+DEPENDS += "libxml2 itstool-native intltool-native"
+
+SRC_URI[archive.md5sum] = "e5b800a872b50243570552402b56f0d6"
+SRC_URI[archive.sha256sum] = "cac31bc150545d6aa0de15dce04560cbf591008d17a783a1d1d9cdd47b147f04"
+
+RDEPENDS_${PN} += "libxml2 itstool intltool"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


