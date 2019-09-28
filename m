Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id BAD367DD6C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:43:21 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id u184so4813941qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=sqvoxcElM7p5V00/O2E3G/gU7AX4Yug8nnEF7m89KIk=;
	b=ZtHAhTnpTEkqOmGUQRnt+ERroBqmuHtbCPPT8CBCqn4GDsgmyJ7DRxLfzcvC/h7DDy
	8jsLYBF1D8NXCy2hraf2D+n7NKIfZxGcNEEFMotZi3frZvE2l9JBBEjTsOf7XFKt4hLv
	8+XT3yAKETqOGMFwNgxyrjPXbg3QUGLQMo1RNgsDUyLgLo/6+IcTk1JIVIyCxzz/DIzi
	VLSykouczCkoZbohGgkEMKcmvsr0XzGFAgWTewlxWCJZ49e+9FH4bUI2ky7UtYKebhtc
	Idf4ByUXh2LNyfJEj2dyIrqJiWMhAjE3p8dbadJ3ohBJFcSy7ljiskVgCdjy2GkpHOLW
	X9DQ==
X-Gm-Message-State: APjAAAX2vdlTJ6jQk9Tx5+oP07Zqs/UGnMI2G0rOUNFwP+sUg5UshK7O
	MH2Aoz4THer4QxLQkSogjeS9HuyQ7Dc=
X-Google-Smtp-Source: APXvYqxE6h2d3FFLX34MK3cUCp9/8+Cogqf53DUal3GtIPp6CZrJ5kxqpxL/+mYMnHZO8uDcxuY9Yg==
X-Received: by 2002:a37:a310:: with SMTP id m16mr11934643qke.123.1569710602203;
	Sat, 28 Sep 2019 15:43:22 -0700 (PDT)
Received: from localhost ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id 16sm3122576qky.93.2019.09.28.15.43.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:43:21 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:43:14 -0300
Message-Id: <20190928224318.4127069-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 1/5] networkmanager: Fix ADSL plugin packaging
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
X-List-Received-Date: Sat, 28 Sep 2019 22:43:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../networkmanager/networkmanager_1.18.2.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
index b760a40c3..1c93f0115 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
@@ -92,7 +92,7 @@ FILES_libnmutil += "${libdir}/libnm-util.so.*"
 FILES_libnmglib += "${libdir}/libnm-glib.so.*"
 FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
 
-FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
+FILES_${PN}-adsl = "${libdir}/NetworkManager/${PV}/libnm-device-plugin-adsl.so"
 
 FILES_${PN} += " \
     ${libexecdir} \
-- 
2.23.0


