Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5967478E00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:27:59 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id s9-v6so5334567wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KFkGA76ewHB8YsateJBkj+u7ce84TTQT8gXH5cy7JDE=;
	b=cw3iVUreg6cKdlV2AIJ0jVyPZlgNw9utQihiRbOtbif18cTB1xJvOdrHzlRq09fqJc
	TFmge3KHWHKmf0YfaFxR9tzY6Nh3Nd4mNT6f0lcuzD4u2cBEd/8xu//c6e2VrdBrMJhi
	t1C/E0maBcSW9hPEzQLHt8C8spE+NDzQrgsBuycQnqGHDdjEeUWFn5dfrBAUGGcNi/fh
	PfhWd+iI9u4Y81c/0vow/JfJS0tYDdJQX9FKxce8pJnl7UbXK341YBja/eSNy5pXnxv3
	GEX9pC4PHPDa1N2BobUO67WcS4ng7WXgYmjsSuHi9mjvRv7mYGwq4P68uXVmUjfCazEg
	gl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KFkGA76ewHB8YsateJBkj+u7ce84TTQT8gXH5cy7JDE=;
	b=Vcb9Q6J5mQN0VXXcjjEDOA/Zhacw4pUE94Fnfzzw3PLvqdmO/9E7/OSm02aNG/fDKc
	+Xvf/MN/k9HgRJTWGwbThszk/tUzeHJbnOaxeomx3bMnIgQxaaWW4MDDlGdir+S5y3xT
	qHo8VXu3INFrn/yrvXeUG/XMYUfXiCUlz76whZY+aaI6MeHnqLv9xB46mGoypIOXbg3l
	Bfmp/ljcxSbGWu7/xKEZHe3OocKp85nre1NzrkEMmo9u8xWTORoZ+BE2VHv1OumbbQW4
	mfIzULGlzQ8wLq6QXfRoW4kWxXnC2bG44fpeswFf2kgw6Pl47VJtdXGv33BIZfRdALzU
	PH+Q==
X-Gm-Message-State: AOUpUlHigUW8XWpZye4yxgc7zRNdmmyv+jZVW6Mm0k9KXeCGX9/QTU1+
	NGH+pyM8lxRj566/GDW2CV9TEyT2
X-Google-Smtp-Source: AA+uWPytACctlJJyNtvw+4l0/gk5wC5vlFHq5ZsRrJZigws2N8NO5teb5LGokIq4fobdtOU1j6Z5KA==
X-Received: by 2002:a1c:ea17:: with SMTP id
	i23-v6mr17231266wmh.29.1534444079827; 
	Thu, 16 Aug 2018 11:27:59 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.27.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:27:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:36 +0200
Message-Id: <20180816182748.2400-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/16] xfce4-whiskermenu-plugin: upgrade 2.2.0 -> 2.2.1
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
X-List-Received-Date: Thu, 16 Aug 2018 18:27:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.2.0.bb => xfce4-whiskermenu-plugin_2.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.2.0.bb => xfce4-whiskermenu-plugin_2.2.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.0.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.0.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.1.bb
index 34f622ba6..c21cc94bc 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "2eda14e43e37222035be619327c604cb"
-SRC_URI[sha256sum] = "8f68492a38cb2d148867162adff947dd37fed162b4ef4f31910660229ef00ef1"
+SRC_URI[md5sum] = "8d202b984e6bdf9c96fc8b0701f881cc"
+SRC_URI[sha256sum] = "b5f8efcc94cb26e4394ae599ac5955d745f3c11c39605036709ede5454f302b9"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.14.4


