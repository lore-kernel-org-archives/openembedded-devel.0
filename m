Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id DEBA772EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id 63-v6so7356864wra.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MgghhKP8JG4f0ths72Jk3MsqmBaB+L2uxErpyJz5cgw=;
	b=g03vQOhrkuDSGmphVEHXoNFa/FcJM2/NB+aL45ywf8pAPR0axbf77VT44p/bItdmVK
	BrIlTJpoGyy7A24Vb/koXN3MghXSsSro0X+LyYy7OX2NdFDLQmDjqNs7M6S/v86/d+hV
	/9pn6kC+ftX1bH6vlbqqH+kO3K62o/qDyibEpaOm5CpqkXDQdssBZ6wTr33rAtXaF2lD
	CmugzwoUGhCNI8NcQjODt4s3vhU5j9I2klmvGTKBs+u900psNl1kFUDcpgrGnbiWM4dz
	byOimzWqhNd6jufBegM2XZjKAwyZFxttDDKSKc6FznuA8qWV4MmnOL21d1YxKzsQ1HPL
	tdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MgghhKP8JG4f0ths72Jk3MsqmBaB+L2uxErpyJz5cgw=;
	b=cFF0HE9q6tY23VKG6/+qJgE5pk9hhbV45M8NC95QE1AklNwOuWSxSuwDHBTHQpRHVh
	bW7+ljFB2SZMcoq31gn1HqBvczKGX3O94W5mZXFBpdPQNTnS0/OvXvRgv3c9RCNDZvGt
	P0q1sDCe0dQvLvMK37pSnQEGd8u71uHCIWVdV1pMVBYy5lrDQZo6gzvx7or2hEwy7pL7
	z3UJu0Z0cGyZGYUTbVF7sJ+/ujkd3wgx+Hd7Rv6ORtl2bCXDLuzypjRB1tWxsfAkBiv4
	AVGIZvbBvyj3TW/zrlm62ZWlklifYvl0CC8F9EXiJ4SKm2UPIgxijRsFhp8E1XOpEvEq
	m3cQ==
X-Gm-Message-State: ABuFfojgBn/iCSlHDUF5xEWGS2RgvsFSdbDV0D50Q0SKke6ed/oAuui0
	8d/IC8563pZ5zC/nZsHX45cEP+aa
X-Google-Smtp-Source: ACcGV61KUha6t1enSfuARt7+QsQ310gyoRIeXfo479lyqKvL4koyHHUph3dZhwxlk5NSkjSgaGGMow==
X-Received: by 2002:a5d:5601:: with SMTP id
	l1-v6mr2455739wrv.209.1538594718264; 
	Wed, 03 Oct 2018 12:25:18 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:51 +0200
Message-Id: <20181003192455.24921-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] xfce4-whiskermenu-plugin: upgrade 2.2.1 -> 2.3.0
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.2.1.bb => xfce4-whiskermenu-plugin_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.2.1.bb => xfce4-whiskermenu-plugin_2.3.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.0.bb
index c21cc94bc..24a32fc0a 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "8d202b984e6bdf9c96fc8b0701f881cc"
-SRC_URI[sha256sum] = "b5f8efcc94cb26e4394ae599ac5955d745f3c11c39605036709ede5454f302b9"
+SRC_URI[md5sum] = "d2383c3eb1b54adf5a206973bd20f159"
+SRC_URI[sha256sum] = "7e569bb0dff7e3db3d964e23323f54c6de7249741c6a0e33a0fa501d83040b16"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.14.4


