Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B8BE67F29D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:14 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k2so3534770wrq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=z3+FpwZMPPRXFIB6YqK2iNjG7PU6l6RriFAxyO/5FMk=;
	b=tuyCwRNj5gWd0pZS5XjcxByecXBaRCZ8CtNuNnLkF6qT8LoGzpZlT8kg3jx8wx00IU
	2vkBCkqhTaMzPOF7J0M73sePF4l1esUj4mw/Aa4d1aIw57hUSluUg/xvbT5b3SheMtE8
	FqUPcS1LGXupgG2e0IDlPdmOEJtkyMVX1e1ltEwPIkUDUHYSxAOzx+a0MnUMHD4CWLid
	ZsYYCueH0iYDnAAQVqR38CD1dsmWThC6frl1GZ0Kz+4FzW9sD+exNf8LPuDD1dO7h1kL
	V1H9GfTOl3OMnnO9f5bx2iu3C/whdPsXgXfZ7sCmtHjNdjzNhurjmoGHAT3PkNlEz7oy
	0uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z3+FpwZMPPRXFIB6YqK2iNjG7PU6l6RriFAxyO/5FMk=;
	b=teQjrfPLoTksy65r+zJMO2hJnUeuGEhg71MEOOkxBD8wlTCE9dmJPJSzRyTaxBFB2/
	QlvbOXiCMnKhAhrCN5GtXc9+eGK3fF48Bm1Sc87EK+mvmApU6p9aWooY+e68ITicLToo
	csKnDkC4IBQKCPJq1BuQsZykLSWmmxNNODV2xdxQdkcauCy8K70M3uOGw5++vnuGZtyt
	qjyBbZEhIgP3H5PeGe/CtIkpPMrNUan4+LHXf+taGQNP/t/U31EC111V1aFJE0bsa1Y6
	1CtdgK6E9h2o/ueH6zJ57OPUwMaY4oK0Sc22pigXqp2LwGpbnD2kSHM9oUQbz59DIduv
	VFGw==
X-Gm-Message-State: APjAAAVWF7JKUzQ6P2Dgaj9NqtXqv7MBRQBbufGBiFnNXL/GhpvVuIwt
	mzcHwiY+AYNzD8K3T4NQoERBUqKz
X-Google-Smtp-Source: APXvYqwsqG+j1iDBSbkDzb4AJJehe8Y+i21C66eeHLg2BRIVKK5z96mGkYYEtZbREMGt6llpF0y3fQ==
X-Received: by 2002:a5d:63d0:: with SMTP id c16mr7337507wrw.22.1565906175167; 
	Thu, 15 Aug 2019 14:56:15 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:53 +0200
Message-Id: <20190815215605.19600-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] xfce4-whiskermenu-plugin: upgrade 2.3.2 -> 2.3.3
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Small bugfix release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.3.2.bb => xfce4-whiskermenu-plugin_2.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.2.bb => xfce4-whiskermenu-plugin_2.3.3.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
index 230a24faf..a05f0dc6f 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "e9aa6c33463bd564c47e1943c0fc7ac3"
-SRC_URI[sha256sum] = "f1bf6be37f7778a486b16ef115d4c05120cc12c87e4af3af9c5001276bdcb7cc"
+SRC_URI[md5sum] = "21f1e1d8d4a030f23d358d6c5ac50f2a"
+SRC_URI[sha256sum] = "e0c6cc4fc1e685bc9601ec217a803d5489ca3276f4008bf056600471c6ac1848"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.0


