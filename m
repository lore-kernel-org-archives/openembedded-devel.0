Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6B177E638
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2019 01:58:34 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id v24so7514137ljg.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 18:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vuaRvGLys4FAxXRxvDTw7t7eRPuuS9X7xJChCHXxz04=;
	b=r/P481cgYgHNlkGlmOWiT6e4LHCdQ4yEg9QS2BwjkpyO+U2kCQ/RzXoQLoNwxPnaNG
	fOQa2Ia+KZHxX8AxQTFHmjR31p0Pqkozf87f1dWkS7zxEyNdc0wL8qd0BoYMX2XyCJ0t
	eXPSpAK7ZUQOYe3BcLtBKjbvMFGR5mAASp1NQuTl7Kp56stz/lu7463YDYIhzmK+kPnZ
	Hcl3IdhgLtEZ+nC9jfPmTsXSRMYCyw1iSZIgeNZlO71HVDWz4+jWHZCADFOmBFV9DzNp
	l8KZkDhT8DUOnrVsDlLrb17U4SpE3Hh/Hf18xn0eyLQE0qUshX3Er9vjly39TEI5bhrm
	Ig4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vuaRvGLys4FAxXRxvDTw7t7eRPuuS9X7xJChCHXxz04=;
	b=V8xy/WXdjkBNyC6qC/dqy3eumzu+CxvYxYZ9+U7MnOyoU941Jz2iAv9PTjiYN/ItXc
	tBlkhJjqJBDc8TwrVNVusAdQd7SpT92AnS8ftIZwVmSvU4Na5v/Nf+Zq4C2YGzLV3P+f
	Ve26hSiTBdfPqxb4x+TApVu0QO2+DkTZxRRSuM6qdNox2zVCE17cg3FA6nKvEN4GKkWn
	1z1smBZ9cqyOHjkHKnck3EBw/ZctmeXdOVcYU+v/kgmzFzFHUYs9luhV2U2wsAzN6dl8
	aaIqqUP+pxshG2aFdG5uXLdC6GzE3K4vDSRgmYDcX1dP6nLmYn01XTYh5mQrTxvuRpi6
	haYw==
X-Gm-Message-State: APjAAAUYVIcPhmGWAEHHegqHaazbV4pMGb3DrUQiQSqnxtfwjclRulX2
	7FefdGnald+d5XL7OQtzrrfXOMTWIeg=
X-Google-Smtp-Source: APXvYqw1w3Z3bi95uLGV8wi51lGt/IfJH6LJjExzNhJAzSV1ppTx6CLyFe3Jxup6nhTGCaMev9anYA==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr2527486ljg.216.1561168714723; 
	Fri, 21 Jun 2019 18:58:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id k82sm629288ljb.84.2019.06.21.18.58.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 18:58:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2019 03:58:32 +0200
Message-Id: <20190622015832.23508-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] keepalived: update to 2.0.16
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
X-List-Received-Date: Sat, 22 Jun 2019 01:58:35 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../keepalived/{keepalived_2.0.15.bb => keepalived_2.0.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.0.15.bb => keepalived_2.0.16.bb} (92%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.0.15.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.0.16.bb
similarity index 92%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.0.15.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.0.16.bb
index 9a20e02db..5257c5cfe 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.0.15.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.0.16.bb
@@ -11,8 +11,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-SRC_URI[md5sum] = "68413d76fc23191ddd66246d498e19b5"
-SRC_URI[sha256sum] = "933ee01bc6346aa573453b998f87510d3cce4aba4537c9642b24e6dbfba5c6f4"
+SRC_URI[md5sum] = "03f202eace2ad392c61ced15bb710e24"
+SRC_URI[sha256sum] = "f0c7dc86147a286913c1c2c918f557735016285d25779d4d2fce5732fcb888df"
 
 DEPENDS = "libnfnetlink openssl"
 
-- 
2.17.1


