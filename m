Return-Path: <ricardo@foundries.io>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03D7479E1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 21:36:09 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id b22-v6so362544qtr.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Nov 2018 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zIP37phIdZ7x+WO7VwAc68GZ+ZX+qvrjTTd1iOwOt50=;
	b=cGQDPM+utAQDjVQkLGinG276W++dDiefgSwxNA24HXQdIj69IHl5l7u0nqN+ZCwMwG
	7AJYF2XsiibMlBg7NiZsb6B8SWecKDlhSCE4DyoUztqJdiCyVSX9zKI5kJHiO2bEO/8u
	Qi/1nWXUTtuVOzdDWqzlFZw0ZInsBCBqaq9mF7JH+kJLJrKTsISDTTvGDg3S6mj2bpgV
	g/QCvPqeoLI9LnYZCJRe6X4uedUdLmj5f+xn8wqIUHESBLRf36itnk3VEDxgYmOkNUOK
	X7g6vZT4OC7sOLPc8i4OjayN7rKQOWI60/pCjsJYmFpz+HAeTw4/Qgi2pIdlDTfxXwpY
	mb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zIP37phIdZ7x+WO7VwAc68GZ+ZX+qvrjTTd1iOwOt50=;
	b=srnyDV2wqe3lRgXZM7qsT1qGaXmIryzFIdqqZKKv+pV3wOTjIojJOvX9F0KcbV5WP4
	QXWhGGCh+ybIfFvckvhpeBJhdm2QRbLWjO2CexlmpjL3MHxEKG0NOy/V/4a11ltW2w3o
	C1BS58IDsbx6QSgbu7PAoyNUPIXN04DpnT6XGD2/b6Fenl93v18rfOC6GCWVy+1fsQKU
	N5U98a0bUC2JmTyxRyssQc7f73V8e3wBKIjXzbfGDeCic9r7lejsqkIcjscXfGcSDN4S
	93cZ0cn8EQOfsZj3opHjPyRJ11Gntbgpo7MSe1+cTftqtmdB1YgBpq7SC+vvGkkXZrt/
	Rnaw==
X-Gm-Message-State: AGRZ1gKWQqg7xHyYFS8O/Ol9ZylBEf+GjWR6Vk85QYDZfZ+9Tz0iR67B
	EjmuHtXbq1/nE79UUGL4DQ7EjhK+gQ==
X-Google-Smtp-Source: AJdET5eesH88rhFVh4Kp7dsDdwU6HCIy4O4mA5uI7AkENXjwwQtdxhnn0RBUlgEu1w+B7f9vRm2+LA==
X-Received: by 2002:aed:3b25:: with SMTP id p34mr12396295qte.310.1541453770497;
	Mon, 05 Nov 2018 13:36:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:bade:8237:a8d3:c29:6abd:4548])
	by smtp.gmail.com with ESMTPSA id
	67-v6sm15501477qtf.72.2018.11.05.13.36.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 13:36:09 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Nov 2018 19:36:06 -0200
Message-Id: <20181105213606.24451-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH] modemmanager: set udev base dir to ${nonarch_base_libdir}/udev
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
X-List-Received-Date: Mon, 05 Nov 2018 21:36:10 -0000

Fixes QA issue when building modemmanager with usrmerge:
  /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../recipes-connectivity/modemmanager/modemmanager_1.8.2.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
index 82e3178bd..dec4b6797 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
@@ -30,6 +30,10 @@ PACKAGECONFIG[mbim] = "--with-mbim,--with-mbim=no,libmbim"
 # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
 PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 
+EXTRA_OECONF = " \
+    --with-udev-base-dir=${nonarch_base_libdir}/udev \
+"
+
 FILES_${PN} += " \
     ${datadir}/icons \
     ${datadir}/polkit-1 \
-- 
2.17.1


