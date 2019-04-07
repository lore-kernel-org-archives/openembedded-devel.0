Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C97C7D3B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 14:32:33 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id l20so1877802edv.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wQ2MIsXcdLM2g1xJxfU+YSfj3wP1IU1ZwP0GsPmGYoU=;
	b=JqLdivngs8sX1FxKpx49kx1nTpq8u6WlFc7x5X9XflCvifdPJfl1rRd0r3MtFiwv28
	MClx5lZ6p0dHi15lTiQRz56BBSXajikJyvk922zTBlY0ntJjaKauvnAGnU+XznLi/ML/
	X8aWVPcK2yxS4Ez3Dh/y9C/5gax+sijpm81HtLh5TI1XVg266ff2mqa9mBqeFqypipwz
	ZMLDCNkgIl0G+DveLVM8gl5KO0oYXDMNHID1SVkhG7v3GH7BhQNe6dXSC381DcU7G7ix
	NWiucYUCyq5Q2X+cc2V/YwxoafpfAEJWK9hqnwO51zXAbzvXe9RycLiZAYPgYgehvR0r
	yiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wQ2MIsXcdLM2g1xJxfU+YSfj3wP1IU1ZwP0GsPmGYoU=;
	b=aL4sPcRTIhY+WS0yxkLb30tg2o7FBz4WgbUEol1dJrKiIpP3HI2AeGi83Fd7glWmfH
	7Ngyg61e4SEJ8srOv0DNrBjVCx7qGXQ0MOY1VSHy/D1d+FeamRkf/za7DOrfq3uI3oH9
	x0ysAQwTl1k/fCNYT/PqVwkjj9eFiy2ENG3Yj4N+GG8U2H4GxpA00kdBSPb1tR9nPBxf
	j0OFeRalwubrOwElR/3f6tTtXCWukVlNFq5bNAoQf99pyoymm+/Jc0ixHzq2IS5Tbiwk
	vajDps6aUj9rO5BNhuHu3oZSxJABIONgNg5rNmLIzAneaANALYTDVddr2JDEI8FT24Mh
	qgag==
X-Gm-Message-State: APjAAAUoal9YoaVCBfJCIoTuTdcf7pS+zJHOwNHnkOIG0HhfvM4EKqcc
	8SKwcbzQ6FWbgf18BmzFvZDFBUM4LrM=
X-Google-Smtp-Source: APXvYqyQ7rMieB0sXi5h7jM9V6uGtqAWI3fzhgsEd7/XrX4QEplHlXYOv9dtPYjFNs1mnQdH677ygg==
X-Received: by 2002:a17:906:1d0f:: with SMTP id
	n15mr2541233ejh.83.1554647554436; 
	Sun, 07 Apr 2019 07:32:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	h11sm1971487eds.44.2019.04.07.07.32.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 07:32:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 16:32:31 +0200
Message-Id: <20190407143231.27505-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] keepalived: update to 2.0.15
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
X-List-Received-Date: Sun, 07 Apr 2019 14:32:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../keepalived/{keepalived_1.4.2.bb => keepalived_2.0.15.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_1.4.2.bb => keepalived_2.0.15.bb} (92%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.0.15.bb
similarity index 92%
rename from meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.0.15.bb
index 31c50ff6b..9a20e02db 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.0.15.bb
@@ -11,8 +11,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-SRC_URI[md5sum] = "610af6e04071f02d3469191de7499f4e"
-SRC_URI[sha256sum] = "4e2d7cc01a6ee29a3955f5c622d47704ba7d9dd758189f15e9def016a2d1faa3"
+SRC_URI[md5sum] = "68413d76fc23191ddd66246d498e19b5"
+SRC_URI[sha256sum] = "933ee01bc6346aa573453b998f87510d3cce4aba4537c9642b24e6dbfba5c6f4"
 
 DEPENDS = "libnfnetlink openssl"
 
-- 
2.17.1


