Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E34D772B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 18:33:52 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o16so18523563wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ntawQLqaEMIMZysGC7f3K3gAXxWej3sjM9sLzHhbe3M=;
	b=Zs5Hctj4RmZab056OFLYUJJA5Fku20Fu7J91f99COvCqGtgzMgEYbyV5yl90x+/oZe
	UWd5bUWs0TQaR+Ezvu0QIEH0k8t3g987jB8I9WQ7lb5UeyKU1oM52A4qBzr/DDbkdrkv
	3JFQXN49JKD8xr2HBRf/W9fFB41rQcJ5zyOGoHELzdClNcZFE/vGOsR2DdZhlDjoe0RB
	HaRlB7NrSRrWDvAU2ywrsj3cnvpbCjlYDnAX1aYsuBNgS4zqm3fr9jmfOl0Tpon2+N8F
	xZor3o/3JZmif4VGawY/xngcEcReR8dQOdnuJVlN3LFVrv1wkEDkb4RQ05bi6wDO/qkk
	TEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ntawQLqaEMIMZysGC7f3K3gAXxWej3sjM9sLzHhbe3M=;
	b=NS8IyYpElLE2SaZBwIyw5CoBxjRJCSytTB3L/y7DSBqtxMLkwQyPOmdJUJCbypVfEk
	1gWee+OzUsPANfaABUCt5ibvAcr25n5fWkgZxSuxXtxsa13ptH4xoULXKyQtbArVt5yJ
	B9zWkz0JVEcw6snwTfNuo7reOYuqwqjpUcaFFYvyAvyyLYyZ7o1reP03VXFLhMzU7LY0
	Isj9QdNQ2t4hmbDrVWLKpgiYftn4SE8Omgclw0YhNFmApTAxCgFR4ujAO8ZQ2BE7Lz3C
	IpB5JEgUxABVNjQRkO4Q6NTEmh4YcZkuQqqMSkF2FelHzGIaHxxwoz5aDFFFpaUTs5P+
	zBVg==
X-Gm-Message-State: AMke39nRmhekkoMUM58tdYcBAaA3srxbJ7vqdOReALRyQ2rxBOJ6wjyMBlTgFYOmd/ai7g==
X-Received: by 10.223.164.207 with SMTP id h15mr12283008wrb.142.1486838032392; 
	Sat, 11 Feb 2017 10:33:52 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o42sm7225268wrb.18.2017.02.11.10.33.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 10:33:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 19:33:47 +0100
Message-Id: <20170211183350.4889-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCHv2][meta-oe 1/4] glibmm: add dependency on glib-2.0-native
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
X-List-Received-Date: Sat, 11 Feb 2017 18:33:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
index 9479de9..9cf8220 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
+DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
 inherit autotools pkgconfig
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-- 
2.10.2


